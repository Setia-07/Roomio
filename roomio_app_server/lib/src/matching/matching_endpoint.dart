import 'package:serverpod/serverpod.dart';
import '../common/sample_data_seeder.dart';
import '../generated/protocol.dart';
import 'compatibility_calculator.dart';

class MatchingEndpoint extends Endpoint {
  /// Finds and ranks compatible flatmates for the current user.
  Future<List<FlatmateCard>> findFlatmates(
    Session session, {
    String? city,
    int limit = 20,
    int offset = 0,
  }) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final currentUserId = authInfo.userIdentifier;

    // 1. Fetch current user's lifestyle profile
    final myLifestyle = await LifestyleProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(currentUserId),
    );
    if (myLifestyle == null) {
      return [];
    }

    final myProfile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(currentUserId),
    );

    // 2. Fetch blocked users to exclude
    final blockedRecords = await UserBlock.db.find(
      session,
      where: (t) =>
          t.blockerUserId.equals(currentUserId) |
          t.blockedUserId.equals(currentUserId),
    );
    final excludedUserIds = <String>{currentUserId};
    for (final b in blockedRecords) {
      excludedUserIds.add(b.blockerUserId);
      excludedUserIds.add(b.blockedUserId);
    }

    // 3. Find candidate lifestyle profiles
    await SampleDataSeeder.seedFlatmatesIfEmpty(session);

    final candidates = await LifestyleProfile.db.find(
      session,
      where: (t) {
        var expression = t.userId.notInSet(excludedUserIds);
        if (city != null && city.trim().isNotEmpty) {
          expression = expression & t.preferredCity.ilike(city.trim());
        }
        return expression;
      },
      limit: 100,
    );

    // 4. Calculate compatibility for each candidate
    final cards = <FlatmateCard>[];
    for (final candidateLifestyle in candidates) {
      final candidateProfile = await UserProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(candidateLifestyle.userId),
      );

      if (candidateProfile == null) continue;

      final report = CompatibilityCalculator.calculate(
        seeker: myLifestyle,
        candidate: candidateLifestyle,
        seekerProfile: myProfile,
        candidateProfile: candidateProfile,
      );

      if (report.passedHardFilters) {
        cards.add(
          FlatmateCard(
            profile: candidateProfile,
            lifestyle: candidateLifestyle,
            compatibility: report,
          ),
        );
      }
    }

    // 5. Sort by overall compatibility score descending
    cards.sort(
      (a, b) =>
          b.compatibility.overallScore.compareTo(a.compatibility.overallScore),
    );

    // 6. Apply pagination
    final startIndex = offset.clamp(0, cards.length);
    final endIndex = (startIndex + limit).clamp(0, cards.length);
    return cards.sublist(startIndex, endIndex);
  }

  /// Calculates a detailed compatibility report for a specific candidate.
  Future<CompatibilityReport?> getCompatibility(
    Session session,
    String targetUserId,
  ) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final currentUserId = authInfo.userIdentifier;
    final myLifestyle = await LifestyleProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(currentUserId),
    );
    final targetLifestyle = await LifestyleProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(targetUserId),
    );

    if (myLifestyle == null || targetLifestyle == null) return null;

    final myProfile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(currentUserId),
    );
    final targetProfile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(targetUserId),
    );

    return CompatibilityCalculator.calculate(
      seeker: myLifestyle,
      candidate: targetLifestyle,
      seekerProfile: myProfile,
      candidateProfile: targetProfile,
    );
  }
}
