import 'dart:async';
import 'dart:math';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class RoomEndpoint extends Endpoint {
  static const _chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
  final _rnd = Random.secure();

  String _generateInviteCode() {
    return String.fromCharCodes(
      Iterable.generate(
        6,
        (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
      ),
    );
  }

  /// Creates a collaborative Team Up room.
  Future<MatchingRoom> createRoom(Session session, String roomName) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    if (roomName.trim().isEmpty) {
      throw RoomioException(message: 'Room name cannot be empty', code: 400);
    }

    final userId = authInfo.userIdentifier;
    final inviteCode = _generateInviteCode();

    final room = await MatchingRoom.db.insertRow(
      session,
      MatchingRoom(
        creatorUserId: userId,
        name: roomName.trim(),
        inviteCode: inviteCode,
        createdAt: DateTime.now(),
      ),
    );

    final userProfile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
    final userName = userProfile?.displayName ?? 'Host';

    await RoomMember.db.insertRow(
      session,
      RoomMember(
        roomId: room.id!,
        userId: userId,
        userName: userName,
        joinedAt: DateTime.now(),
      ),
    );

    return room;
  }

  /// Joins an existing matching room by invite code.
  Future<MatchingRoom> joinRoomByInviteCode(
    Session session,
    String inviteCode,
  ) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final normalizedCode = inviteCode.trim().toUpperCase();
    final room = await MatchingRoom.db.findFirstRow(
      session,
      where: (t) => t.inviteCode.equals(normalizedCode),
    );

    if (room == null) {
      throw RoomioException(
        message: 'Room not found with that code',
        code: 404,
      );
    }

    final userId = authInfo.userIdentifier;
    final existingMember = await RoomMember.db.findFirstRow(
      session,
      where: (t) => t.roomId.equals(room.id!) & t.userId.equals(userId),
    );

    if (existingMember == null) {
      final userProfile = await UserProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(userId),
      );
      final userName = userProfile?.displayName ?? 'Roommate';

      await RoomMember.db.insertRow(
        session,
        RoomMember(
          roomId: room.id!,
          userId: userId,
          userName: userName,
          joinedAt: DateTime.now(),
        ),
      );

      unawaited(
        session.messages.postMessage(
          'room_${room.id}',
          RoomEvent(
            roomId: room.id!,
            eventType: 'member_joined',
            senderUserId: userId,
            senderName: userName,
            message: '$userName joined the room',
            timestamp: DateTime.now(),
          ),
        ),
      );
    }

    return room;
  }

  /// Leaves a matching room.
  Future<bool> leaveRoom(Session session, int roomId) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final userId = authInfo.userIdentifier;
    final membership = await RoomMember.db.findFirstRow(
      session,
      where: (t) => t.roomId.equals(roomId) & t.userId.equals(userId),
    );

    if (membership == null) return false;

    await RoomMember.db.deleteRow(session, membership);

    unawaited(
      session.messages.postMessage(
        'room_$roomId',
        RoomEvent(
          roomId: roomId,
          eventType: 'member_left',
          senderUserId: userId,
          senderName: membership.userName,
          message: '${membership.userName} left the room',
          timestamp: DateTime.now(),
        ),
      ),
    );

    return true;
  }

  /// Gets all rooms that the current user belongs to.
  Future<List<MatchingRoom>> getMyRooms(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final memberships = await RoomMember.db.find(
      session,
      where: (t) => t.userId.equals(authInfo.userIdentifier),
    );

    if (memberships.isEmpty) return [];

    final roomIds = memberships.map((m) => m.roomId).toSet();
    return await MatchingRoom.db.find(
      session,
      where: (t) => t.id.inSet(roomIds),
      orderBy: (t) => t.createdAt.desc(),
    );
  }

  /// Gets full room details, participants, and shortlisted cards with vote tallies.
  Future<RoomDetailPayload> getRoomDetails(Session session, int roomId) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final userId = authInfo.userIdentifier;

    // Verify membership
    final isMember = await RoomMember.db.findFirstRow(
      session,
      where: (t) => t.roomId.equals(roomId) & t.userId.equals(userId),
    );
    if (isMember == null) {
      throw RoomioException(
        message: 'Unauthorized: You are not a member of this room',
        code: 403,
      );
    }

    final room = await MatchingRoom.db.findById(session, roomId);
    if (room == null) {
      throw RoomioException(message: 'Room not found', code: 404);
    }

    final members = await RoomMember.db.find(
      session,
      where: (t) => t.roomId.equals(roomId),
      orderBy: (t) => t.joinedAt,
    );

    final shortlistItems = await RoomShortlistItem.db.find(
      session,
      where: (t) => t.roomId.equals(roomId),
      orderBy: (t) => t.addedAt.desc(),
    );

    final cards = <RoomShortlistCard>[];
    for (final item in shortlistItems) {
      final listing = await PropertyListing.db.findById(
        session,
        item.listingId,
      );
      if (listing == null) continue;

      final votes = await RoomVote.db.find(
        session,
        where: (t) => t.shortlistItemId.equals(item.id!),
      );

      int likes = 0;
      int passes = 0;
      int superlikes = 0;
      String? userVote;

      for (final v in votes) {
        if (v.voteType == 'like') likes++;
        if (v.voteType == 'pass') passes++;
        if (v.voteType == 'superlike') superlikes++;
        if (v.userId == userId) userVote = v.voteType;
      }

      cards.add(
        RoomShortlistCard(
          shortlistItem: item,
          listing: listing,
          likes: likes,
          passes: passes,
          superlikes: superlikes,
          currentUserVote: userVote,
        ),
      );
    }

    return RoomDetailPayload(
      room: room,
      members: members,
      shortlist: cards,
    );
  }

  /// Shortlists a property listing in the collaborative room.
  Future<RoomShortlistItem> shortlistListing(
    Session session,
    int roomId,
    int listingId,
  ) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final userId = authInfo.userIdentifier;

    final isMember = await RoomMember.db.findFirstRow(
      session,
      where: (t) => t.roomId.equals(roomId) & t.userId.equals(userId),
    );
    if (isMember == null) {
      throw RoomioException(
        message: 'Unauthorized: You are not a member of this room',
        code: 403,
      );
    }

    // Verify property listing exists and is active
    final listing = await PropertyListing.db.findById(session, listingId);
    if (listing == null || !listing.isActive) {
      throw RoomioException(
        message: 'Listing not found or no longer active',
        code: 404,
      );
    }

    final userProfile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
    final userName = userProfile?.displayName ?? 'Roommate';

    final existing = await RoomShortlistItem.db.findFirstRow(
      session,
      where: (t) => t.roomId.equals(roomId) & t.listingId.equals(listingId),
    );

    if (existing != null) {
      return existing;
    }

    final item = await RoomShortlistItem.db.insertRow(
      session,
      RoomShortlistItem(
        roomId: roomId,
        listingId: listingId,
        addedByUserId: userId,
        addedByName: userName,
        addedAt: DateTime.now(),
      ),
    );

    unawaited(
      session.messages.postMessage(
        'room_$roomId',
        RoomEvent(
          roomId: roomId,
          eventType: 'item_shortlisted',
          senderUserId: userId,
          senderName: userName,
          message: '$userName shortlisted a listing',
          timestamp: DateTime.now(),
        ),
      ),
    );

    return item;
  }

  /// Casts a vote on a shortlisted listing.
  Future<RoomVote> castVote(
    Session session,
    int shortlistItemId,
    String voteType,
  ) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final normalizedVote = voteType.trim().toLowerCase();
    const validVotes = {'like', 'pass', 'superlike'};
    if (!validVotes.contains(normalizedVote)) {
      throw RoomioException(
        message: 'Invalid vote type. Must be like, pass, or superlike',
        code: 400,
      );
    }

    final userId = authInfo.userIdentifier;
    final item = await RoomShortlistItem.db.findById(session, shortlistItemId);
    if (item == null) {
      throw RoomioException(message: 'Shortlist item not found', code: 404);
    }

    // Verify user is in the room
    final isMember = await RoomMember.db.findFirstRow(
      session,
      where: (t) => t.roomId.equals(item.roomId) & t.userId.equals(userId),
    );
    if (isMember == null) {
      throw RoomioException(
        message: 'Unauthorized: You are not a member of this room',
        code: 403,
      );
    }

    final existingVote = await RoomVote.db.findFirstRow(
      session,
      where: (t) =>
          t.shortlistItemId.equals(shortlistItemId) & t.userId.equals(userId),
    );

    RoomVote vote;
    if (existingVote != null) {
      final updated = existingVote.copyWith(
        voteType: normalizedVote,
        votedAt: DateTime.now(),
      );
      vote = await RoomVote.db.updateRow(session, updated);
    } else {
      vote = await RoomVote.db.insertRow(
        session,
        RoomVote(
          shortlistItemId: shortlistItemId,
          userId: userId,
          voteType: normalizedVote,
          votedAt: DateTime.now(),
        ),
      );
    }

    unawaited(
      session.messages.postMessage(
        'room_${item.roomId}',
        RoomEvent(
          roomId: item.roomId,
          eventType: 'vote_cast',
          senderUserId: userId,
          senderName: isMember.userName,
          message: '${isMember.userName} voted $normalizedVote',
          timestamp: DateTime.now(),
        ),
      ),
    );

    return vote;
  }

  /// Sends a live chat or reaction message to the room stream.
  Future<void> sendRoomMessage(
    Session session,
    int roomId,
    String message,
  ) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final userId = authInfo.userIdentifier;
    final isMember = await RoomMember.db.findFirstRow(
      session,
      where: (t) => t.roomId.equals(roomId) & t.userId.equals(userId),
    );
    if (isMember == null) {
      throw RoomioException(
        message: 'Unauthorized: You are not a member of this room',
        code: 403,
      );
    }

    final userProfile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
    final userName = userProfile?.displayName ?? isMember.userName;

    unawaited(
      session.messages.postMessage(
        'room_$roomId',
        RoomEvent(
          roomId: roomId,
          eventType: 'reaction',
          senderUserId: userId,
          senderName: userName,
          message: message,
          timestamp: DateTime.now(),
        ),
      ),
    );
  }

  /// Subscribes to the live event stream for a room.
  Stream<RoomEvent> streamRoomEvents(Session session, int roomId) async* {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final userId = authInfo.userIdentifier;
    final isMember = await RoomMember.db.findFirstRow(
      session,
      where: (t) => t.roomId.equals(roomId) & t.userId.equals(userId),
    );
    if (isMember == null) {
      throw RoomioException(
        message: 'Unauthorized: You are not a member of this room',
        code: 403,
      );
    }

    final stream = session.messages.createStream<RoomEvent>('room_$roomId');
    await for (final event in stream) {
      yield event;
    }
  }
}
