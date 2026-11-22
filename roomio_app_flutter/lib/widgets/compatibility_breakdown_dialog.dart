import 'package:flutter/material.dart';
import 'package:roomio_app_client/roomio_app_client.dart';
import '../theme/roomio_theme.dart';
import 'compatibility_badge.dart';
import 'roomio_button.dart';

class CompatibilityBreakdownDialog extends StatelessWidget {
  final CompatibilityReport report;
  final UserProfile profile;
  final VoidCallback? onConnect;

  const CompatibilityBreakdownDialog({
    super.key,
    required this.report,
    required this.profile,
    this.onConnect,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: RoomioColors.surfaceLight,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520, maxHeight: 700),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Compatibility with ${profile.displayName}',
                          style: RoomioTypography.titleLarge.copyWith(
                            color: RoomioColors.navy,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${profile.city} • ${profile.occupation ?? "Flatmate Seeker"}',
                          style: RoomioTypography.bodyMedium.copyWith(
                            color: RoomioColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CompatibilityBadge(
                    score: report.overallScore,
                    size: CompatibilityBadgeSize.large,
                    showLabel: false,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Guidance Disclaimer Banner
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: RoomioColors.amberContainer.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: RoomioColors.amber.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      color: RoomioColors.amber,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        report.guidanceDisclaimer ??
                            'Compatibility score is guidance based on self-reported preferences, not a guarantee.',
                        style: RoomioTypography.labelSmall.copyWith(
                          color: const Color(0xFF92400E),
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Scrollable Dimension Breakdown & Alignments
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Dimension bars
                      Text(
                        'Lifestyle Dimension Breakdown',
                        style: RoomioTypography.labelBold.copyWith(
                          color: RoomioColors.navy,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _DimensionBar(
                        label: 'Budget Overlap (25%)',
                        score: report.budgetScore,
                        icon: Icons.payments_outlined,
                      ),
                      _DimensionBar(
                        label: 'Location Match (20%)',
                        score: report.locationScore,
                        icon: Icons.location_on_outlined,
                      ),
                      _DimensionBar(
                        label: 'Cleanliness Standards (20%)',
                        score: report.cleanlinessScore,
                        icon: Icons.cleaning_services_outlined,
                      ),
                      _DimensionBar(
                        label: 'Sleep Schedule (15%)',
                        score: report.sleepScore,
                        icon: Icons.bedtime_outlined,
                      ),
                      _DimensionBar(
                        label: 'Social Atmosphere (10%)',
                        score: report.socialScore,
                        icon: Icons.celebration_outlined,
                      ),
                      _DimensionBar(
                        label: 'Kitchen & Food Habits (10%)',
                        score: report.foodScore,
                        icon: Icons.restaurant_outlined,
                      ),
                      const SizedBox(height: 20),

                      // Reasons / Alignments
                      if (report.alignments.isNotEmpty) ...[
                        Text(
                          'Why You Align',
                          style: RoomioTypography.labelBold.copyWith(
                            color: RoomioColors.mint,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...report.alignments.map(
                          (a) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.check_circle_rounded,
                                  color: RoomioColors.mint,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    a,
                                    style: RoomioTypography.bodyMedium.copyWith(
                                      color: RoomioColors.textPrimaryLight,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],

                      // Potential Differences / Conflicts
                      if (report.differences.isNotEmpty) ...[
                        Text(
                          'Potential Lifestyle Differences',
                          style: RoomioTypography.labelBold.copyWith(
                            color: RoomioColors.amber,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...report.differences.map(
                          (d) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.warning_amber_rounded,
                                  color: RoomioColors.amber,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    d,
                                    style: RoomioTypography.bodyMedium.copyWith(
                                      color: RoomioColors.textPrimaryLight,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: RoomioButton(
                      text: 'Close',
                      variant: RoomioButtonVariant.outline,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  if (onConnect != null) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: RoomioButton(
                        text: 'Connect',
                        icon: Icons.chat_bubble_outline_rounded,
                        variant: RoomioButtonVariant.primary,
                        onPressed: () {
                          Navigator.of(context).pop();
                          onConnect!();
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DimensionBar extends StatelessWidget {
  final String label;
  final double score;
  final IconData icon;

  const _DimensionBar({
    required this.label,
    required this.score,
    required this.icon,
  });

  Color get _color {
    if (score >= 80) return RoomioColors.mint;
    if (score >= 60) return RoomioColors.amber;
    return RoomioColors.rose;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: RoomioColors.textSecondaryLight),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: RoomioTypography.bodyMedium.copyWith(
                    fontSize: 12,
                    color: RoomioColors.textSecondaryLight,
                  ),
                ),
              ),
              Text(
                '${score.round()}%',
                style: RoomioTypography.labelBold.copyWith(
                  fontSize: 12,
                  color: _color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: (score / 100).clamp(0.0, 1.0),
              minHeight: 6,
              backgroundColor: RoomioColors.borderLight,
              valueColor: AlwaysStoppedAnimation<Color>(_color),
            ),
          ),
        ],
      ),
    );
  }
}
