import 'package:flutter/material.dart';
import 'package:roomio_app_client/roomio_app_client.dart';
import '../theme/roomio_theme.dart';
import 'compatibility_badge.dart';
import 'compatibility_breakdown_dialog.dart';

class FlatmateCardWidget extends StatelessWidget {
  final FlatmateCard card;
  final VoidCallback? onConnect;
  final VoidCallback? onBookmark;
  final bool isBookmarked;

  const FlatmateCardWidget({
    super.key,
    required this.card,
    this.onConnect,
    this.onBookmark,
    this.isBookmarked = false,
  });

  @override
  Widget build(BuildContext context) {
    final profile = card.profile;
    final lifestyle = card.lifestyle;
    final report = card.compatibility;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: RoomioColors.borderLight, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: Avatar, Info, and Match Badge
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: RoomioColors.primaryContainer,
                  backgroundImage: profile.avatarUrl != null
                      ? NetworkImage(profile.avatarUrl!)
                      : null,
                  child: profile.avatarUrl == null
                      ? Text(
                          profile.displayName.isNotEmpty
                              ? profile.displayName[0].toUpperCase()
                              : '?',
                          style: RoomioTypography.titleLarge.copyWith(
                            color: RoomioColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${profile.displayName}, ${profile.age}',
                              style: RoomioTypography.titleMedium.copyWith(
                                color: RoomioColors.navy,
                                fontWeight: FontWeight.w700,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: RoomioColors.mintContainer,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'Verified',
                              style: RoomioTypography.labelSmall.copyWith(
                                color: RoomioColors.mint,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${profile.city} • ${profile.occupation ?? "Looking for Flatmates"}',
                        style: RoomioTypography.bodyMedium.copyWith(
                          color: RoomioColors.textSecondaryLight,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Budget: \$${lifestyle.minBudget} - \$${lifestyle.maxBudget}/mo',
                        style: RoomioTypography.labelBold.copyWith(
                          color: RoomioColors.navy,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                // Compatibility Match Ring
                InkWell(
                  onTap: () => _showBreakdown(context),
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: CompatibilityBadge(
                      score: report.overallScore,
                      size: CompatibilityBadgeSize.medium,
                      showLabel: true,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Bio preview if present
            if (profile.bio != null && profile.bio!.isNotEmpty) ...[
              Text(
                profile.bio!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: RoomioTypography.bodyMedium.copyWith(
                  color: RoomioColors.textPrimaryLight,
                  fontSize: 13.5,
                ),
              ),
              const SizedBox(height: 12),
            ],

            // Top Alignments / Reasons Preview
            if (report.alignments.isNotEmpty) ...[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: RoomioColors.mintContainer.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: report.alignments.take(2).map((a) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle_rounded,
                            size: 14,
                            color: RoomioColors.mint,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              a,
                              style: RoomioTypography.bodyMedium.copyWith(
                                color: const Color(0xFF065F46),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
            ],

            // Potential Differences Highlight
            if (report.differences.isNotEmpty) ...[
              Row(
                children: [
                  const Icon(
                    Icons.info_outline_rounded,
                    size: 13,
                    color: RoomioColors.amber,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Potential difference: ${report.differences.first}',
                      style: RoomioTypography.bodyMedium.copyWith(
                        color: RoomioColors.textSecondaryLight,
                        fontSize: 11.5,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],

            // Card Action Buttons
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () => _showBreakdown(context),
                  icon: const Icon(Icons.analytics_outlined, size: 16),
                  label: const Text('Breakdown'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: RoomioColors.navy,
                    side: const BorderSide(color: RoomioColors.borderLight),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onConnect,
                    icon: const Icon(Icons.send_rounded, size: 16),
                    label: const Text('Connect'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: RoomioColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
                if (onBookmark != null) ...[
                  const SizedBox(width: 8),
                  IconButton(
                    icon: Icon(
                      isBookmarked
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_border_rounded,
                      color: isBookmarked
                          ? RoomioColors.primary
                          : RoomioColors.textMutedLight,
                    ),
                    onPressed: onBookmark,
                    tooltip: 'Save Profile',
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showBreakdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CompatibilityBreakdownDialog(
        report: card.compatibility,
        profile: card.profile,
        onConnect: onConnect,
      ),
    );
  }
}
