import 'package:flutter/material.dart';
import '../theme/roomio_theme.dart';

enum CompatibilityBadgeSize { small, medium, large }

class CompatibilityBadge extends StatelessWidget {
  final double score; // 0.0 to 100.0
  final CompatibilityBadgeSize size;
  final bool showLabel;

  const CompatibilityBadge({
    super.key,
    required this.score,
    this.size = CompatibilityBadgeSize.medium,
    this.showLabel = true,
  });

  Color get _badgeColor {
    if (score >= 80.0) return RoomioColors.mint;
    if (score >= 60.0) return RoomioColors.amber;
    return RoomioColors.rose;
  }

  Color get _badgeContainerColor {
    if (score >= 80.0) return RoomioColors.mintContainer;
    if (score >= 60.0) return RoomioColors.amberContainer;
    return RoomioColors.roseContainer;
  }

  double get _dimension {
    switch (size) {
      case CompatibilityBadgeSize.small:
        return 32;
      case CompatibilityBadgeSize.medium:
        return 44;
      case CompatibilityBadgeSize.large:
        return 64;
    }
  }

  double get _fontSize {
    switch (size) {
      case CompatibilityBadgeSize.small:
        return 11;
      case CompatibilityBadgeSize.medium:
        return 13;
      case CompatibilityBadgeSize.large:
        return 18;
    }
  }

  @override
  Widget build(BuildContext context) {
    final dimension = _dimension;
    final intScore = score.round();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: dimension,
              height: dimension,
              child: CircularProgressIndicator(
                value: (score / 100.0).clamp(0.0, 1.0),
                strokeWidth: size == CompatibilityBadgeSize.large ? 4.5 : 3.0,
                backgroundColor: _badgeContainerColor,
                valueColor: AlwaysStoppedAnimation<Color>(_badgeColor),
              ),
            ),
            Text(
              '$intScore%',
              style: RoomioTypography.labelBold.copyWith(
                fontSize: _fontSize,
                color: _badgeColor,
              ),
            ),
          ],
        ),
        if (showLabel && size != CompatibilityBadgeSize.small) ...[
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Match',
                style: RoomioTypography.labelSmall.copyWith(
                  color: RoomioColors.textSecondaryLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                score >= 80.0
                    ? 'High Vibe'
                    : (score >= 60.0 ? 'Good Fit' : 'Low Overlap'),
                style: RoomioTypography.labelBold.copyWith(
                  color: _badgeColor,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
