import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ProfileEndpoint extends Endpoint {
  /// Saves or updates the authenticated user's UserProfile.
  Future<UserProfile> saveUserProfile(
    Session session,
    UserProfile profile,
  ) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(
        message: 'Authentication required',
        code: 401,
      );
    }

    if (profile.displayName.trim().isEmpty) {
      throw RoomioException(message: 'Display name cannot be empty', code: 400);
    }
    if (profile.age < 18 || profile.age > 100) {
      throw RoomioException(
        message: 'Age must be between 18 and 100',
        code: 400,
      );
    }
    if (profile.city.trim().isEmpty) {
      throw RoomioException(message: 'City cannot be empty', code: 400);
    }

    final userId = authInfo.userIdentifier;
    final existing = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (existing != null) {
      final updated = existing.copyWith(
        displayName: profile.displayName.trim(),
        bio: profile.bio?.trim(),
        age: profile.age,
        gender: profile.gender,
        occupation: profile.occupation?.trim(),
        city: profile.city.trim(),
        avatarUrl: profile.avatarUrl,
        isLookingForFlatmates: profile.isLookingForFlatmates,
        isLookingForRoom: profile.isLookingForRoom,
      );
      return await UserProfile.db.updateRow(session, updated);
    } else {
      final newProfile = profile.copyWith(
        userId: userId,
        displayName: profile.displayName.trim(),
        bio: profile.bio?.trim(),
        city: profile.city.trim(),
        createdAt: DateTime.now(),
      );
      return await UserProfile.db.insertRow(session, newProfile);
    }
  }

  /// Gets the currently authenticated user's UserProfile.
  Future<UserProfile?> getMyUserProfile(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) return null;

    return await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(authInfo.userIdentifier),
    );
  }

  /// Gets another user's public profile by their user ID.
  Future<UserProfile?> getUserProfile(Session session, String userId) async {
    final authInfo = session.authenticated;
    if (authInfo != null) {
      final currentUserId = authInfo.userIdentifier;
      final isBlocked = await UserBlock.db.findFirstRow(
        session,
        where: (t) =>
            (t.blockerUserId.equals(currentUserId) &
                t.blockedUserId.equals(userId)) |
            (t.blockerUserId.equals(userId) &
                t.blockedUserId.equals(currentUserId)),
      );
      if (isBlocked != null) return null;
    }

    return await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
  }

  /// Saves or updates the authenticated user's LifestyleProfile.
  Future<LifestyleProfile> saveLifestyleProfile(
    Session session,
    LifestyleProfile profile,
  ) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    if (profile.minBudget > profile.maxBudget) {
      throw RoomioException(
        message: 'Minimum budget cannot exceed maximum budget',
        code: 400,
      );
    }
    if (profile.minBudget < 0) {
      throw RoomioException(message: 'Budget cannot be negative', code: 400);
    }

    final userId = authInfo.userIdentifier;
    final existing = await LifestyleProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (existing != null) {
      final updated = existing.copyWith(
        name: profile.name.trim(),
        minBudget: profile.minBudget,
        maxBudget: profile.maxBudget,
        preferredCity: profile.preferredCity.trim(),
        sleepSchedule: profile.sleepSchedule,
        cleanliness: profile.cleanliness,
        foodHabit: profile.foodHabit,
        socialHabit: profile.socialHabit,
        smokingHabit: profile.smokingHabit,
        petHabit: profile.petHabit,
        hardFilterNoSmoking: profile.hardFilterNoSmoking,
        hardFilterPetFriendly: profile.hardFilterPetFriendly,
        hardFilterSameGender: profile.hardFilterSameGender,
      );
      return await LifestyleProfile.db.updateRow(session, updated);
    } else {
      final newProfile = profile.copyWith(
        userId: userId,
        name: profile.name.trim(),
        preferredCity: profile.preferredCity.trim(),
      );
      return await LifestyleProfile.db.insertRow(session, newProfile);
    }
  }

  /// Gets the currently authenticated user's LifestyleProfile.
  Future<LifestyleProfile?> getMyLifestyleProfile(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) return null;

    return await LifestyleProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(authInfo.userIdentifier),
    );
  }

  /// Backwards-compatible legacy method.
  Future<LifestyleProfile> saveProfile(
    Session session,
    LifestyleProfile profile,
  ) async {
    return await saveLifestyleProfile(session, profile);
  }

  /// Backwards-compatible legacy method.
  Future<List<LifestyleProfile>> getAllProfiles(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }
    return await LifestyleProfile.db.find(session);
  }
}
