import '../generated/protocol.dart';

/// Configurable weights for Roomio's matching engine.
class CompatibilityWeights {
  final double budget;
  final double location;
  final double cleanliness;
  final double sleepSchedule;
  final double socialLifestyle;
  final double foodHabits;

  const CompatibilityWeights({
    this.budget = 25.0,
    this.location = 20.0,
    this.cleanliness = 20.0,
    this.sleepSchedule = 15.0,
    this.socialLifestyle = 10.0,
    this.foodHabits = 10.0,
  });

  double get total =>
      budget +
      location +
      cleanliness +
      sleepSchedule +
      socialLifestyle +
      foodHabits;
}

class CompatibilityCalculator {
  static const String defaultDisclaimer =
      'Compatibility score is guidance based on self-reported lifestyle habits, not a guarantee of flatmate harmony.';

  /// Calculates the compatibility report between a seeker and a candidate.
  static CompatibilityReport calculate({
    required LifestyleProfile seeker,
    required LifestyleProfile candidate,
    UserProfile? seekerProfile,
    UserProfile? candidateProfile,
    CompatibilityWeights weights = const CompatibilityWeights(),
  }) {
    final alignments = <String>[];
    final differences = <String>[];

    // 1. HARD FILTERS (Non-negotiables evaluated first)
    // Smoking rule
    if (seeker.hardFilterNoSmoking && candidate.smokingHabit != 'non_smoker') {
      return _failedReport(
        candidate.userId,
        candidate.name,
        'Non-negotiable conflict: You require a non-smoking flatmate',
      );
    }
    if (candidate.hardFilterNoSmoking && seeker.smokingHabit != 'non_smoker') {
      return _failedReport(
        candidate.userId,
        candidate.name,
        'Non-negotiable conflict: Candidate requires a non-smoking flatmate',
      );
    }

    // Pet rule
    if (seeker.hardFilterPetFriendly && candidate.petHabit == 'no_pets') {
      return _failedReport(
        candidate.userId,
        candidate.name,
        'Non-negotiable conflict: Pet friendliness requirement mismatch',
      );
    }
    if (candidate.hardFilterPetFriendly && seeker.petHabit == 'no_pets') {
      return _failedReport(
        candidate.userId,
        candidate.name,
        'Non-negotiable conflict: Candidate requires a pet-friendly flatmate',
      );
    }

    // Same Gender rule
    if (seekerProfile != null && candidateProfile != null) {
      if (seeker.hardFilterSameGender &&
          seekerProfile.gender.toLowerCase() !=
              candidateProfile.gender.toLowerCase()) {
        return _failedReport(
          candidate.userId,
          candidate.name,
          'Non-negotiable conflict: Requires same-gender flatmate',
        );
      }
      if (candidate.hardFilterSameGender &&
          seekerProfile.gender.toLowerCase() !=
              candidateProfile.gender.toLowerCase()) {
        return _failedReport(
          candidate.userId,
          candidate.name,
          'Non-negotiable conflict: Candidate requires same-gender flatmate',
        );
      }
    }

    // 2. WEIGHTED DIMENSIONS (Handle missing preferences without inventing compatibility)
    final weightScale = weights.total > 0 ? (100.0 / weights.total) : 1.0;

    // A. Budget (Weight: default 25%)
    final (budgetScore, budgetAlignment, budgetDifference) = _evalBudget(
      seeker,
      candidate,
    );
    if (budgetAlignment != null) alignments.add(budgetAlignment);
    if (budgetDifference != null) differences.add(budgetDifference);

    // B. Location (Weight: default 20%)
    final (locationScore, locationAlignment, locationDifference) =
        _evalLocation(seeker, candidate);
    if (locationAlignment != null) alignments.add(locationAlignment);
    if (locationDifference != null) differences.add(locationDifference);

    // C. Cleanliness (Weight: default 20%)
    final (cleanlinessScore, cleanlinessAlignment, cleanlinessDifference) =
        _evalCleanliness(seeker, candidate);
    if (cleanlinessAlignment != null) alignments.add(cleanlinessAlignment);
    if (cleanlinessDifference != null) differences.add(cleanlinessDifference);

    // D. Sleep Schedule (Weight: default 15%)
    final (sleepScore, sleepAlignment, sleepDifference) = _evalSleep(
      seeker,
      candidate,
    );
    if (sleepAlignment != null) alignments.add(sleepAlignment);
    if (sleepDifference != null) differences.add(sleepDifference);

    // E. Social Lifestyle (Weight: default 10%)
    final (socialScore, socialAlignment, socialDifference) = _evalSocial(
      seeker,
      candidate,
    );
    if (socialAlignment != null) alignments.add(socialAlignment);
    if (socialDifference != null) differences.add(socialDifference);

    // F. Food Habits (Weight: default 10%)
    final (foodScore, foodAlignment, foodDifference) = _evalFood(
      seeker,
      candidate,
    );
    if (foodAlignment != null) alignments.add(foodAlignment);
    if (foodDifference != null) differences.add(foodDifference);

    // Compute composite weighted score normalized to 0 - 100
    final rawOverallScore =
        (budgetScore * weights.budget) +
        (locationScore * weights.location) +
        (cleanlinessScore * weights.cleanliness) +
        (sleepScore * weights.sleepSchedule) +
        (socialScore * weights.socialLifestyle) +
        (foodScore * weights.foodHabits);

    final finalOverallScore = (rawOverallScore * weightScale).clamp(0.0, 100.0);

    return CompatibilityReport(
      targetUserId: candidate.userId,
      targetName: candidate.name,
      overallScore: double.parse(finalOverallScore.toStringAsFixed(1)),
      budgetScore: double.parse((budgetScore * 100).toStringAsFixed(1)),
      locationScore: double.parse((locationScore * 100).toStringAsFixed(1)),
      cleanlinessScore: double.parse(
        (cleanlinessScore * 100).toStringAsFixed(1),
      ),
      sleepScore: double.parse((sleepScore * 100).toStringAsFixed(1)),
      socialScore: double.parse((socialScore * 100).toStringAsFixed(1)),
      foodScore: double.parse((foodScore * 100).toStringAsFixed(1)),
      passedHardFilters: true,
      hardFilterFailureReason: null,
      alignments: alignments,
      differences: differences,
      guidanceDisclaimer: defaultDisclaimer,
    );
  }

  // --- Dimension Evaluators ---

  static (double, String?, String?) _evalBudget(
    LifestyleProfile a,
    LifestyleProfile b,
  ) {
    if (a.maxBudget <= 0 || b.maxBudget <= 0) {
      return (0.0, null, 'Budget preferences incomplete');
    }

    final overlapMin = a.minBudget > b.minBudget ? a.minBudget : b.minBudget;
    final overlapMax = a.maxBudget < b.maxBudget ? a.maxBudget : b.maxBudget;

    if (overlapMax < overlapMin) {
      final gap = overlapMin - overlapMax;
      final avg = (a.maxBudget + b.maxBudget) / 2.0;
      final distanceRatio = (gap / avg).clamp(0.0, 1.0);
      final score = (1.0 - distanceRatio) * 0.4;
      return (
        score,
        null,
        'Budgets do not overlap (Gap: \$${gap.round()})',
      );
    }

    final unionMin = a.minBudget < b.minBudget ? a.minBudget : b.minBudget;
    final unionMax = a.maxBudget > b.maxBudget ? a.maxBudget : b.maxBudget;
    final unionRange = unionMax - unionMin;
    final overlapRange = overlapMax - overlapMin;

    final score = unionRange == 0
        ? 1.0
        : (overlapRange / unionRange).clamp(0.0, 1.0);

    if (score >= 0.75) {
      return (
        score,
        'Strong budget overlap (\$$overlapMin - \$$overlapMax)',
        null,
      );
    } else {
      return (
        score,
        'Partial budget overlap (\$$overlapMin - \$$overlapMax)',
        null,
      );
    }
  }

  static (double, String?, String?) _evalLocation(
    LifestyleProfile a,
    LifestyleProfile b,
  ) {
    if (a.preferredCity.trim().isEmpty || b.preferredCity.trim().isEmpty) {
      return (0.0, null, 'Location preference not specified');
    }

    if (a.preferredCity.trim().toLowerCase() ==
        b.preferredCity.trim().toLowerCase()) {
      return (
        1.0,
        'Both seeking accommodation in ${a.preferredCity.trim()}',
        null,
      );
    }

    return (
      0.1,
      null,
      'Different target cities (${a.preferredCity.trim()} vs ${b.preferredCity.trim()})',
    );
  }

  static (double, String?, String?) _evalCleanliness(
    LifestyleProfile a,
    LifestyleProfile b,
  ) {
    if (a.cleanliness.trim().isEmpty || b.cleanliness.trim().isEmpty) {
      return (0.0, null, 'Cleanliness preference not specified');
    }

    if (a.cleanliness == b.cleanliness) {
      return (
        1.0,
        'Matching cleanliness standard (${_formatCleanliness(a.cleanliness)})',
        null,
      );
    }

    const order = ['relaxed', 'moderate', 'meticulous'];
    final idxA = order.indexOf(a.cleanliness);
    final idxB = order.indexOf(b.cleanliness);

    if (idxA == -1 || idxB == -1) {
      return (0.4, null, 'Cleanliness standard differs');
    }

    final diff = (idxA - idxB).abs();
    if (diff == 1) {
      return (
        0.6,
        null,
        'Slightly different cleanliness tolerance (${_formatCleanliness(a.cleanliness)} vs ${_formatCleanliness(b.cleanliness)})',
      );
    }

    return (
      0.1,
      null,
      'Opposing cleanliness habits (${_formatCleanliness(a.cleanliness)} vs ${_formatCleanliness(b.cleanliness)})',
    );
  }

  static (double, String?, String?) _evalSleep(
    LifestyleProfile a,
    LifestyleProfile b,
  ) {
    if (a.sleepSchedule.trim().isEmpty || b.sleepSchedule.trim().isEmpty) {
      return (0.0, null, 'Sleep schedule preference not specified');
    }

    if (a.sleepSchedule == b.sleepSchedule) {
      return (
        1.0,
        'Matching sleep routine (${_formatSleep(a.sleepSchedule)})',
        null,
      );
    }

    if (a.sleepSchedule == 'flexible' || b.sleepSchedule == 'flexible') {
      return (0.85, 'Compatible sleep flexibility', null);
    }

    return (
      0.25,
      null,
      'Different sleep routines (${_formatSleep(a.sleepSchedule)} vs ${_formatSleep(b.sleepSchedule)})',
    );
  }

  static (double, String?, String?) _evalSocial(
    LifestyleProfile a,
    LifestyleProfile b,
  ) {
    if (a.socialHabit.trim().isEmpty || b.socialHabit.trim().isEmpty) {
      return (0.0, null, 'Social lifestyle not specified');
    }

    if (a.socialHabit == b.socialHabit) {
      return (
        1.0,
        'Similar home social vibe (${_formatSocial(a.socialHabit)})',
        null,
      );
    }

    const order = ['quiet', 'moderate', 'social_hub'];
    final idxA = order.indexOf(a.socialHabit);
    final idxB = order.indexOf(b.socialHabit);

    if (idxA == -1 || idxB == -1) {
      return (0.4, null, 'Different social lifestyle preferences');
    }

    final diff = (idxA - idxB).abs();
    if (diff == 1) {
      return (
        0.6,
        null,
        'Minor social style difference (${_formatSocial(a.socialHabit)} vs ${_formatSocial(b.socialHabit)})',
      );
    }

    return (
      0.15,
      null,
      'Opposing social styles at home (${_formatSocial(a.socialHabit)} vs ${_formatSocial(b.socialHabit)})',
    );
  }

  static (double, String?, String?) _evalFood(
    LifestyleProfile a,
    LifestyleProfile b,
  ) {
    if (a.foodHabit.trim().isEmpty || b.foodHabit.trim().isEmpty) {
      return (0.0, null, 'Food and kitchen habits not specified');
    }

    if (a.foodHabit == b.foodHabit) {
      return (
        1.0,
        'Matching kitchen & food lifestyle (${_formatFood(a.foodHabit)})',
        null,
      );
    }

    if (a.foodHabit == 'flexible' || b.foodHabit == 'flexible') {
      return (0.9, 'Flexible kitchen sharing compatibility', null);
    }

    if ((a.foodHabit == 'vegetarian' && b.foodHabit == 'vegan') ||
        (a.foodHabit == 'vegan' && b.foodHabit == 'vegetarian')) {
      return (0.85, 'Both follow plant-based diets', null);
    }

    return (
      0.4,
      null,
      'Different kitchen habits (${_formatFood(a.foodHabit)} vs ${_formatFood(b.foodHabit)})',
    );
  }

  static String _formatCleanliness(String val) {
    switch (val) {
      case 'meticulous':
        return 'Meticulous / Very Tidy';
      case 'moderate':
        return 'Moderate / Neat';
      case 'relaxed':
        return 'Relaxed / Casual';
      default:
        return val;
    }
  }

  static String _formatSleep(String val) {
    switch (val) {
      case 'early_bird':
        return 'Early Bird';
      case 'night_owl':
        return 'Night Owl';
      case 'flexible':
        return 'Flexible';
      default:
        return val;
    }
  }

  static String _formatSocial(String val) {
    switch (val) {
      case 'quiet':
        return 'Quiet & Calm Sanctuary';
      case 'moderate':
        return 'Occasional Dinners';
      case 'social_hub':
        return 'Lively Social Hub';
      default:
        return val;
    }
  }

  static String _formatFood(String val) {
    switch (val) {
      case 'vegetarian':
        return 'Vegetarian';
      case 'vegan':
        return 'Vegan';
      case 'non_veg':
        return 'Non-Vegetarian';
      case 'flexible':
        return 'Flexible';
      default:
        return val;
    }
  }

  static CompatibilityReport _failedReport(
    String targetUserId,
    String targetName,
    String reason,
  ) {
    return CompatibilityReport(
      targetUserId: targetUserId,
      targetName: targetName,
      overallScore: 0.0,
      budgetScore: 0.0,
      locationScore: 0.0,
      cleanlinessScore: 0.0,
      sleepScore: 0.0,
      socialScore: 0.0,
      foodScore: 0.0,
      passedHardFilters: false,
      hardFilterFailureReason: reason,
      alignments: [],
      differences: [reason],
      guidanceDisclaimer: defaultDisclaimer,
    );
  }
}
