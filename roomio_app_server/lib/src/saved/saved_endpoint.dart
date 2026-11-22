import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class SavedEndpoint extends Endpoint {
  /// Toggles saving or bookmarking a property listing. Returns true if saved, false if removed.
  Future<bool> toggleSaveListing(Session session, int listingId) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final listing = await PropertyListing.db.findById(session, listingId);
    if (listing == null) {
      throw RoomioException(message: 'Listing not found', code: 404);
    }

    final userId = authInfo.userIdentifier;
    final existing = await SavedListing.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.listingId.equals(listingId),
    );

    if (existing != null) {
      await SavedListing.db.deleteRow(session, existing);
      return false;
    } else {
      await SavedListing.db.insertRow(
        session,
        SavedListing(
          userId: userId,
          listingId: listingId,
          savedAt: DateTime.now(),
        ),
      );
      return true;
    }
  }

  /// Toggles saving or bookmarking a potential flatmate profile.
  Future<bool> toggleSaveFlatmate(Session session, String targetUserId) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final userId = authInfo.userIdentifier;
    if (userId == targetUserId) {
      throw RoomioException(
        message: 'Cannot bookmark your own profile',
        code: 400,
      );
    }

    final targetProfile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(targetUserId),
    );
    if (targetProfile == null) {
      throw RoomioException(message: 'User profile not found', code: 404);
    }

    final existing = await SavedFlatmate.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.targetUserId.equals(targetUserId),
    );

    if (existing != null) {
      await SavedFlatmate.db.deleteRow(session, existing);
      return false;
    } else {
      await SavedFlatmate.db.insertRow(
        session,
        SavedFlatmate(
          userId: userId,
          targetUserId: targetUserId,
          savedAt: DateTime.now(),
        ),
      );
      return true;
    }
  }

  /// Gets all property listings bookmarked by the current user.
  Future<List<PropertyListing>> getMySavedListings(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final saved = await SavedListing.db.find(
      session,
      where: (t) => t.userId.equals(authInfo.userIdentifier),
      orderBy: (t) => t.savedAt.desc(),
    );

    if (saved.isEmpty) return [];

    final listingIds = saved.map((s) => s.listingId).toSet();
    return await PropertyListing.db.find(
      session,
      where: (t) => t.id.inSet(listingIds),
    );
  }

  /// Gets all flatmates saved by the current user.
  Future<List<UserProfile>> getMySavedFlatmates(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final saved = await SavedFlatmate.db.find(
      session,
      where: (t) => t.userId.equals(authInfo.userIdentifier),
      orderBy: (t) => t.savedAt.desc(),
    );

    if (saved.isEmpty) return [];

    final userIds = saved.map((s) => s.targetUserId).toSet();
    return await UserProfile.db.find(
      session,
      where: (t) => t.userId.inSet(userIds),
    );
  }
}
