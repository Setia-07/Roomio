import 'package:roomio_app_server/src/generated/protocol.dart';
import 'package:roomio_app_server/src/matching/compatibility_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('Compatibility Engine Edge Cases & Quality Audit', () {
    test('Identical profiles yield 100% compatibility', () {
      final profile = LifestyleProfile(
        userId: 'u1',
        name: 'Jordan',
        minBudget: 1000,
        maxBudget: 1500,
        preferredCity: 'Bristol',
        sleepSchedule: 'night_owl',
        cleanliness: 'moderate',
        foodHabit: 'omnivore',
        socialHabit: 'social',
        smokingHabit: 'non_smoker',
        petHabit: 'cats',
        hardFilterNoSmoking: false,
        hardFilterPetFriendly: false,
        hardFilterSameGender: false,
      );

      final report = CompatibilityCalculator.calculate(
        seeker: profile,
        candidate: profile,
      );

      expect(report.passedHardFilters, isTrue);
      expect(report.overallScore, equals(100.0));
      expect(report.alignments, isNotEmpty);
      expect(report.differences, isEmpty);
      expect(report.guidanceDisclaimer, contains('not a guarantee'));
    });

    test('Completely divergent lifestyles yield low score (< 40%)', () {
      final seeker = LifestyleProfile(
        userId: 'u1',
        name: 'Early Riser',
        minBudget: 500,
        maxBudget: 800,
        preferredCity: 'Manchester',
        sleepSchedule: 'early_bird',
        cleanliness: 'meticulous',
        foodHabit: 'vegan',
        socialHabit: 'quiet',
        smokingHabit: 'non_smoker',
        petHabit: 'no_pets',
        hardFilterNoSmoking: false,
        hardFilterPetFriendly: false,
        hardFilterSameGender: false,
      );

      final candidate = LifestyleProfile(
        userId: 'u2',
        name: 'Night Owl Party',
        minBudget: 2500,
        maxBudget: 3500,
        preferredCity: 'London',
        sleepSchedule: 'night_owl',
        cleanliness: 'relaxed',
        foodHabit: 'omnivore',
        socialHabit: 'party_host',
        smokingHabit: 'social_smoker',
        petHabit: 'dogs',
        hardFilterNoSmoking: false,
        hardFilterPetFriendly: false,
        hardFilterSameGender: false,
      );

      final report = CompatibilityCalculator.calculate(
        seeker: seeker,
        candidate: candidate,
      );

      expect(report.passedHardFilters, isTrue);
      expect(report.overallScore, lessThan(40.0));
      expect(report.differences.length, greaterThanOrEqualTo(4));
    });

    test(
      'Pet friendly hard filter blocks candidates with no pets preference',
      () {
        final seeker = LifestyleProfile(
          userId: 'u1',
          name: 'Pet Lover',
          minBudget: 1000,
          maxBudget: 1500,
          preferredCity: 'London',
          sleepSchedule: 'flexible',
          cleanliness: 'moderate',
          foodHabit: 'omnivore',
          socialHabit: 'moderate',
          smokingHabit: 'non_smoker',
          petHabit: 'dogs',
          hardFilterNoSmoking: false,
          hardFilterPetFriendly: true, // Non-negotiable
          hardFilterSameGender: false,
        );

        final candidate = LifestyleProfile(
          userId: 'u2',
          name: 'Allergic Flatmate',
          minBudget: 1000,
          maxBudget: 1500,
          preferredCity: 'London',
          sleepSchedule: 'flexible',
          cleanliness: 'moderate',
          foodHabit: 'omnivore',
          socialHabit: 'moderate',
          smokingHabit: 'non_smoker',
          petHabit: 'no_pets', // Conflict
          hardFilterNoSmoking: false,
          hardFilterPetFriendly: false,
          hardFilterSameGender: false,
        );

        final report = CompatibilityCalculator.calculate(
          seeker: seeker,
          candidate: candidate,
        );

        expect(report.passedHardFilters, isFalse);
        expect(report.overallScore, equals(0.0));
        expect(report.hardFilterFailureReason, contains('Pet friendliness'));
      },
    );

    test('Same gender hard filter blocks opposite gender profiles', () {
      final seekerProfile = UserProfile(
        userId: 'u1',
        displayName: 'Alice',
        age: 24,
        gender: 'female',
        city: 'London',
        isLookingForFlatmates: true,
        isLookingForRoom: true,
        createdAt: DateTime.now(),
      );

      final candidateProfile = UserProfile(
        userId: 'u2',
        displayName: 'Bob',
        age: 26,
        gender: 'male',
        city: 'London',
        isLookingForFlatmates: true,
        isLookingForRoom: true,
        createdAt: DateTime.now(),
      );

      final seekerLifestyle = LifestyleProfile(
        userId: 'u1',
        name: 'Alice',
        minBudget: 1000,
        maxBudget: 1500,
        preferredCity: 'London',
        sleepSchedule: 'flexible',
        cleanliness: 'moderate',
        foodHabit: 'omnivore',
        socialHabit: 'moderate',
        smokingHabit: 'non_smoker',
        petHabit: 'no_pets',
        hardFilterNoSmoking: false,
        hardFilterPetFriendly: false,
        hardFilterSameGender: true, // Enforce same-gender
      );

      final candidateLifestyle = LifestyleProfile(
        userId: 'u2',
        name: 'Bob',
        minBudget: 1000,
        maxBudget: 1500,
        preferredCity: 'London',
        sleepSchedule: 'flexible',
        cleanliness: 'moderate',
        foodHabit: 'omnivore',
        socialHabit: 'moderate',
        smokingHabit: 'non_smoker',
        petHabit: 'no_pets',
        hardFilterNoSmoking: false,
        hardFilterPetFriendly: false,
        hardFilterSameGender: false,
      );

      final report = CompatibilityCalculator.calculate(
        seeker: seekerLifestyle,
        candidate: candidateLifestyle,
        seekerProfile: seekerProfile,
        candidateProfile: candidateProfile,
      );

      expect(report.passedHardFilters, isFalse);
      expect(report.overallScore, equals(0.0));
      expect(report.hardFilterFailureReason, contains('same-gender'));
    });
  });
}
