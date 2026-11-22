import 'package:roomio_app_server/src/generated/protocol.dart';
import 'package:roomio_app_server/src/matching/compatibility_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('Roomio Compatibility Matching Engine Tests', () {
    test(
      'Calculates high compatibility (~86-95%) with clear reasons for aligned flatmates',
      () {
        final seeker = LifestyleProfile(
          userId: 'user_alex',
          name: 'Alex',
          minBudget: 1200,
          maxBudget: 1800,
          preferredCity: 'London',
          sleepSchedule: 'early_bird',
          cleanliness: 'meticulous',
          foodHabit: 'vegetarian',
          socialHabit: 'moderate',
          smokingHabit: 'non_smoker',
          petHabit: 'no_pets',
          hardFilterNoSmoking: false,
          hardFilterPetFriendly: false,
          hardFilterSameGender: false,
        );

        final candidate = LifestyleProfile(
          userId: 'user_sam',
          name: 'Sam',
          minBudget: 1300,
          maxBudget: 1900,
          preferredCity: 'London',
          sleepSchedule: 'early_bird',
          cleanliness: 'meticulous',
          foodHabit: 'vegetarian',
          socialHabit: 'quiet', // Minor social difference
          smokingHabit: 'non_smoker',
          petHabit: 'no_pets',
          hardFilterNoSmoking: false,
          hardFilterPetFriendly: false,
          hardFilterSameGender: false,
        );

        final report = CompatibilityCalculator.calculate(
          seeker: seeker,
          candidate: candidate,
        );

        expect(report.passedHardFilters, isTrue);
        expect(report.overallScore, inInclusiveRange(85.0, 96.0));
        expect(report.guidanceDisclaimer, contains('guidance'));

        // Check alignments (Reasons)
        expect(report.alignments.any((r) => r.contains('budget')), isTrue);
        expect(report.alignments.any((r) => r.contains('cleanliness')), isTrue);
        expect(report.alignments.any((r) => r.contains('sleep')), isTrue);
        expect(report.alignments.any((r) => r.contains('London')), isTrue);

        // Check differences (Potential conflicts)
        expect(report.differences.any((d) => d.contains('social')), isTrue);
      },
    );

    test('Honors custom configurable weights', () {
      final seeker = LifestyleProfile(
        userId: 'user_1',
        name: 'Seeker',
        minBudget: 1000,
        maxBudget: 1500,
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
        userId: 'user_2',
        name: 'Candidate',
        minBudget: 1000,
        maxBudget: 1500,
        preferredCity: 'Manchester',
        sleepSchedule: 'night_owl', // Mismatch
        cleanliness: 'relaxed', // Mismatch
        foodHabit: 'vegan',
        socialHabit: 'social_hub', // Mismatch
        smokingHabit: 'non_smoker',
        petHabit: 'no_pets',
        hardFilterNoSmoking: false,
        hardFilterPetFriendly: false,
        hardFilterSameGender: false,
      );

      // Test with custom weights focusing 80% on budget & location
      const budgetFocusedWeights = CompatibilityWeights(
        budget: 50.0,
        location: 50.0,
        cleanliness: 0.0,
        sleepSchedule: 0.0,
        socialLifestyle: 0.0,
        foodHabits: 0.0,
      );

      final report = CompatibilityCalculator.calculate(
        seeker: seeker,
        candidate: candidate,
        weights: budgetFocusedWeights,
      );

      expect(report.overallScore, equals(100.0));
    });

    test(
      'Handles missing preferences gracefully without inventing compatibility',
      () {
        final seeker = LifestyleProfile(
          userId: 'user_1',
          name: 'Seeker',
          minBudget: 1000,
          maxBudget: 1500,
          preferredCity: 'London',
          sleepSchedule: '', // Missing
          cleanliness: '', // Missing
          foodHabit: '', // Missing
          socialHabit: '', // Missing
          smokingHabit: 'non_smoker',
          petHabit: 'no_pets',
          hardFilterNoSmoking: false,
          hardFilterPetFriendly: false,
          hardFilterSameGender: false,
        );

        final candidate = LifestyleProfile(
          userId: 'user_2',
          name: 'Candidate',
          minBudget: 1000,
          maxBudget: 1500,
          preferredCity: 'London',
          sleepSchedule: '', // Missing
          cleanliness: '', // Missing
          foodHabit: '', // Missing
          socialHabit: '', // Missing
          smokingHabit: 'non_smoker',
          petHabit: 'no_pets',
          hardFilterNoSmoking: false,
          hardFilterPetFriendly: false,
          hardFilterSameGender: false,
        );

        final report = CompatibilityCalculator.calculate(
          seeker: seeker,
          candidate: candidate,
        );

        // Only budget (25%) and location (20%) should receive points!
        // Total score should be ~45%, NOT inflated to 100%
        expect(report.overallScore, inInclusiveRange(40.0, 46.0));
        expect(report.sleepScore, equals(0.0));
        expect(report.cleanlinessScore, equals(0.0));
        expect(
          report.differences.any((d) => d.contains('not specified')),
          isTrue,
        );
      },
    );

    test(
      'Rejects non-negotiable hard filter violations immediately with 0% score',
      () {
        final seeker = LifestyleProfile(
          userId: 'user_1',
          name: 'Seeker',
          minBudget: 1000,
          maxBudget: 1500,
          preferredCity: 'London',
          sleepSchedule: 'early_bird',
          cleanliness: 'meticulous',
          foodHabit: 'vegan',
          socialHabit: 'quiet',
          smokingHabit: 'non_smoker',
          petHabit: 'no_pets',
          hardFilterNoSmoking: true, // Non-negotiable
          hardFilterPetFriendly: false,
          hardFilterSameGender: false,
        );

        final smokerCandidate = LifestyleProfile(
          userId: 'user_3',
          name: 'Smoker Candidate',
          minBudget: 1000,
          maxBudget: 1500,
          preferredCity: 'London',
          sleepSchedule: 'early_bird',
          cleanliness: 'meticulous',
          foodHabit: 'vegan',
          socialHabit: 'quiet',
          smokingHabit: 'smoker', // Violates non-negotiable
          petHabit: 'no_pets',
          hardFilterNoSmoking: false,
          hardFilterPetFriendly: false,
          hardFilterSameGender: false,
        );

        final report = CompatibilityCalculator.calculate(
          seeker: seeker,
          candidate: smokerCandidate,
        );

        expect(report.passedHardFilters, isFalse);
        expect(report.overallScore, equals(0.0));
        expect(report.hardFilterFailureReason, contains('non-smoking'));
      },
    );
  });
}
