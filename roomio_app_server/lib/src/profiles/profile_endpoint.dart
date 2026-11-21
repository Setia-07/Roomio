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
}