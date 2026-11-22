import 'package:roomio_app_server/src/generated/protocol.dart';
import 'package:test/test.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Roomio Endpoints Integration Tests', (
    sessionBuilder,
    endpoints,
  ) {
    const userA = 'test_user_a';
    const userB = 'test_user_b';

    final authSessionA = sessionBuilder.copyWith(
      authentication: AuthenticationOverride.authenticationInfo(userA, {}),
    );
    final authSessionB = sessionBuilder.copyWith(
      authentication: AuthenticationOverride.authenticationInfo(userB, {}),
    );

    group('ProfileEndpoint Integration', () {
      test('rejects profile creation when unauthenticated', () async {
        final profile = UserProfile(
          userId: 'anonymous',
          displayName: 'Test',
          age: 25,
          gender: 'other',
          city: 'London',
          isLookingForFlatmates: true,
          isLookingForRoom: true,
          createdAt: DateTime.now(),
        );

        expect(
          () => endpoints.profile.saveUserProfile(sessionBuilder, profile),
          throwsA(isA<RoomioException>().having((e) => e.code, 'code', 401)),
        );
      });

      test('rejects profile when age is under 18', () async {
        final invalidProfile = UserProfile(
          userId: userA,
          displayName: 'Teen',
          age: 16, // Under 18
          gender: 'female',
          city: 'London',
          isLookingForFlatmates: true,
          isLookingForRoom: true,
          createdAt: DateTime.now(),
        );

        expect(
          () => endpoints.profile.saveUserProfile(authSessionA, invalidProfile),
          throwsA(isA<RoomioException>().having((e) => e.code, 'code', 400)),
        );
      });

      test(
        'successfully saves and retrieves authenticated user profile',
        () async {
          final validProfile = UserProfile(
            userId: userA,
            displayName: 'Sarah Connor',
            age: 28,
            gender: 'female',
            city: 'London',
            isLookingForFlatmates: true,
            isLookingForRoom: true,
            createdAt: DateTime.now(),
          );

          final saved = await endpoints.profile.saveUserProfile(
            authSessionA,
            validProfile,
          );
          expect(saved.displayName, equals('Sarah Connor'));
          expect(saved.userId, equals(userA));

          final fetched = await endpoints.profile.getMyUserProfile(
            authSessionA,
          );
          expect(fetched, isNotNull);
          expect(fetched!.displayName, equals('Sarah Connor'));
        },
      );
    });

    group('ListingEndpoint Integration', () {
      test('creates and filters property listings', () async {
        final listing = PropertyListing(
          ownerUserId: userA,
          title: 'Sunny Studio in Camden',
          description: 'Spacious flat close to tube',
          propertyType: 'apartment',
          roomType: 'private_room',
          monthlyRent: 850,
          securityDeposit: 850,
          city: 'London',
          neighborhood: 'Camden',
          approximateAddress: 'Camden High St',
          totalBedrooms: 2,
          totalBathrooms: 1,
          availableFrom: DateTime.now(),
          imageUrls: ['https://example.com/photo.jpg'],
          amenities: ['wifi', 'furnished'],
          houseRules: ['no_smoking'],
          isActive: true,
          createdAt: DateTime.now(),
        );

        final created = await endpoints.listing.createListing(
          authSessionA,
          listing,
        );
        expect(created.id, isNotNull);
        expect(created.ownerUserId, equals(userA));

        // Search with London filter
        final results = await endpoints.listing.searchListings(
          sessionBuilder,
          city: 'London',
          limit: 20,
          offset: 0,
        );
        expect(results.any((l) => l.title == 'Sunny Studio in Camden'), isTrue);

        // Search with wrong city filter
        final emptyResults = await endpoints.listing.searchListings(
          sessionBuilder,
          city: 'Manchester',
          limit: 20,
          offset: 0,
        );
        expect(
          emptyResults.any((l) => l.title == 'Sunny Studio in Camden'),
          isFalse,
        );
      });

      test('prevents non-owner from updating listing', () async {
        final listing = PropertyListing(
          ownerUserId: userA,
          title: 'Original Title',
          description: 'Desc',
          propertyType: 'apartment',
          roomType: 'private_room',
          monthlyRent: 600,
          securityDeposit: 600,
          city: 'Bristol',
          neighborhood: 'Clifton',
          approximateAddress: 'Clifton',
          totalBedrooms: 1,
          totalBathrooms: 1,
          availableFrom: DateTime.now(),
          imageUrls: [],
          amenities: [],
          houseRules: [],
          isActive: true,
          createdAt: DateTime.now(),
        );

        final created = await endpoints.listing.createListing(
          authSessionA,
          listing,
        );

        // User B attempts to modify User A's listing
        final unauthorizedEdit = created.copyWith(title: 'Hacked Title');
        expect(
          () => endpoints.listing.updateListing(authSessionB, unauthorizedEdit),
          throwsA(isA<RoomioException>().having((e) => e.code, 'code', 403)),
        );
      });
    });

    group('SafetyEndpoint Integration', () {
      test('blocks and unblocks a user', () async {
        final blocked = await endpoints.safety.blockUser(authSessionA, userB);
        expect(blocked, isTrue);

        final list = await endpoints.safety.getBlockedUserIds(authSessionA);
        expect(list, contains(userB));

        final unblocked = await endpoints.safety.unblockUser(
          authSessionA,
          userB,
        );
        expect(unblocked, isTrue);

        final afterList = await endpoints.safety.getBlockedUserIds(
          authSessionA,
        );
        expect(afterList, isNot(contains(userB)));
      });

      test('rejects self-blocking', () async {
        expect(
          () => endpoints.safety.blockUser(authSessionA, userA),
          throwsA(isA<RoomioException>().having((e) => e.code, 'code', 400)),
        );
      });
    });
  });
}
