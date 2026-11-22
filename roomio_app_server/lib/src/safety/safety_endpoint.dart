import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class SafetyEndpoint extends Endpoint {
  /// Blocks a user, preventing them from appearing in discovery or contacting the user.
  Future<bool> blockUser(Session session, String targetUserId) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final currentUserId = authInfo.userIdentifier;
    if (currentUserId == targetUserId) {
      throw RoomioException(message: 'Cannot block yourself', code: 400);
    }

    final existing = await UserBlock.db.findFirstRow(
      session,
      where: (t) =>
          t.blockerUserId.equals(currentUserId) &
          t.blockedUserId.equals(targetUserId),
    );

    if (existing == null) {
      await UserBlock.db.insertRow(
        session,
        UserBlock(
          blockerUserId: currentUserId,
          blockedUserId: targetUserId,
          createdAt: DateTime.now(),
        ),
      );
    }
    return true;
  }

  /// Unblocks a user.
  Future<bool> unblockUser(Session session, String targetUserId) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final currentUserId = authInfo.userIdentifier;
    final existing = await UserBlock.db.findFirstRow(
      session,
      where: (t) =>
          t.blockerUserId.equals(currentUserId) &
          t.blockedUserId.equals(targetUserId),
    );

    if (existing != null) {
      await UserBlock.db.deleteRow(session, existing);
      return true;
    }
    return false;
  }

  /// Gets the list of user IDs blocked by current user.
  Future<List<String>> getBlockedUserIds(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final blocks = await UserBlock.db.find(
      session,
      where: (t) => t.blockerUserId.equals(authInfo.userIdentifier),
    );

    return blocks.map((b) => b.blockedUserId).toList();
  }

  /// Submits a moderation report for a user or listing.
  Future<bool> reportEntity(
    Session session, {
    required String targetEntity, // 'user' or 'listing'
    required String targetId,
    required String reason,
    String? details,
  }) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    if (reason.trim().isEmpty) {
      throw RoomioException(message: 'Reason cannot be empty', code: 400);
    }

    await UserReport.db.insertRow(
      session,
      UserReport(
        reporterUserId: authInfo.userIdentifier,
        targetEntity: targetEntity,
        targetId: targetId,
        reason: reason.trim(),
        details: details?.trim(),
        createdAt: DateTime.now(),
      ),
    );

    return true;
  }
}
