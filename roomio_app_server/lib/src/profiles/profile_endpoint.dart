import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ProfileEndpoint extends Endpoint {
  Future<LifestyleProfile> saveProfile(
    Session session,
    LifestyleProfile profile,
  ) async {
    return await LifestyleProfile.db.insertRow(session, profile);
  }

  Future<List<LifestyleProfile>> getAllProfiles(Session session) async {
    return await LifestyleProfile.db.find(session);
  }

  Future<List<MatchResult>> getRoomMatches(
    Session session,
    int myProfileId,
    String roomCode,
  ) async {
    final myProfile = await LifestyleProfile.db.findById(session, myProfileId);
    if (myProfile == null) return [];

    final roomProfiles = await LifestyleProfile.db.find(
      session,
      where: (t) => t.roomCode.equals(roomCode.toUpperCase()),
    );

    final results = <MatchResult>[];

    for (final other in roomProfiles) {
      if (other.id == myProfile.id) continue;

      int score = 0;
      final reasons = <String>[];

      if (myProfile.sleepSchedule == other.sleepSchedule) {
        score += 25;
        reasons.add('Same sleep schedule: ${other.sleepSchedule} (+25%)');
      } else if (myProfile.sleepSchedule == 'Flexible' ||
          other.sleepSchedule == 'Flexible') {
        score += 15;
        reasons.add('Flexible sleep schedule (+15%)');
      }

      if (myProfile.cleanliness == other.cleanliness) {
        score += 25;
        reasons.add('Same cleanliness: ${other.cleanliness} (+25%)');
      } else {
        score += 10;
        reasons.add('Moderate cleanliness alignment (+10%)');
      }

      if (myProfile.noiseLevel == other.noiseLevel) {
        score += 20;
        reasons.add('Same noise preference: ${other.noiseLevel} (+20%)');
      }

      final diff = (myProfile.budget - other.budget).abs();
      if (diff <= 2000) {
        score += 30;
        reasons.add('Budget within ₹2,000 (+30%)');
      } else if (diff <= 5000) {
        score += 15;
        reasons.add('Budget within ₹5,000 (+15%)');
      }

      results.add(MatchResult(
        otherProfile: other,
        score: score,
        reasons: reasons,
      ));
    }

    results.sort((a, b) => b.score.compareTo(a.score));
    return results;
  }
}