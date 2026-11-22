import 'package:flutter/material.dart';
import '../../theme/roomio_theme.dart';
import 'landing_image_widget.dart';

class LandingHowItWorks extends StatelessWidget {
  final VoidCallback onGetStarted;

  const LandingHowItWorks({super.key, required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 1024;
    final isTablet = size.width >= 700 && size.width < 1024;

    final steps = [
      _StepData(
        stepNumber: '01',
        title: 'Discover Verified Rooms',
        description:
            'Explore modern apartments and boutique shared homes across top UK cities with transparent rent, bills included tags, and authentic photos.',
        icon: Icons.search_rounded,
        imageUrl:
            'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=600&q=80',
        badgeColor: RoomioColors.primary,
      ),
      _StepData(
        stepNumber: '02',
        title: 'Match on Daily Habits',
        description:
            'Our compatibility engine compares cleanliness standards, sleep schedules, work patterns, and socializing habits so you avoid roommate surprises.',
        icon: Icons.tune_rounded,
        imageUrl:
            'https://images.unsplash.com/photo-1543269865-cbf427effbad?auto=format&fit=crop&w=600&q=80',
        badgeColor: RoomioColors.mint,
      ),
      _StepData(
        stepNumber: '03',
        title: 'Team Up & Connect',
        description:
            'Join collaborative Team Up rooms to pool budgets with prospective housemates, view properties together, and lock down leases seamlessly.',
        icon: Icons.handshake_rounded,
        imageUrl:
            'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?auto=format&fit=crop&w=600&q=80',
        badgeColor: RoomioColors.navy,
      ),
    ];

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : (isTablet ? 32 : 20),
        vertical: isDesktop ? 96 : 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            children: [
              // Section Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: RoomioColors.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'SIMPLE 3-STEP PROCESS',
                  style: RoomioTypography.labelBold.copyWith(
                    color: RoomioColors.primary,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'How Roomio Works',
                textAlign: TextAlign.center,
                style: RoomioTypography.displayMedium.copyWith(
                  fontSize: isDesktop ? 40 : 30,
                  fontWeight: FontWeight.w800,
                  color: RoomioColors.navy,
                ),
              ),
              const SizedBox(height: 14),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 620),
                child: Text(
                  'Renting with flatmates used to be a gamble. Roomio turns shared living into an intentional, enjoyable, and transparent experience.',
                  textAlign: TextAlign.center,
                  style: RoomioTypography.bodyLarge.copyWith(
                    color: RoomioColors.textSecondaryLight,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 56),

              // Steps Layout (Row on Desktop, Column on Mobile/Tablet)
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: steps.map((step) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: _StepCard(step: step),
                      ),
                    );
                  }).toList(),
                )
              else
                Column(
                  children: steps.map((step) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: _StepCard(step: step),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StepData {
  final String stepNumber;
  final String title;
  final String description;
  final IconData icon;
  final String imageUrl;
  final Color badgeColor;

  const _StepData({
    required this.stepNumber,
    required this.title,
    required this.description,
    required this.icon,
    required this.imageUrl,
    required this.badgeColor,
  });
}

class _StepCard extends StatefulWidget {
  final _StepData step;

  const _StepCard({required this.step});

  @override
  State<_StepCard> createState() => _StepCardState();
}

class _StepCardState extends State<_StepCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0.0, _isHovered ? -8.0 : 0.0, 0.0),
        decoration: BoxDecoration(
          color: RoomioColors.backgroundLight,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _isHovered
                ? widget.step.badgeColor.withValues(alpha: 0.5)
                : RoomioColors.borderLight,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? widget.step.badgeColor.withValues(alpha: 0.12)
                  : Colors.black.withValues(alpha: 0.03),
              blurRadius: _isHovered ? 24 : 10,
              offset: Offset(0, _isHovered ? 12 : 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image with Step Badge
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
                  child: LandingImage(
                    imageUrl: widget.step.imageUrl,
                    height: 190,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 14,
                  left: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: widget.step.badgeColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(widget.step.icon, size: 14, color: Colors.white),
                        const SizedBox(width: 5),
                        Text(
                          'STEP ${widget.step.stepNumber}',
                          style: RoomioTypography.labelBold.copyWith(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Text content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.step.title,
                    style: RoomioTypography.titleLarge.copyWith(
                      color: RoomioColors.navy,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.step.description,
                    style: RoomioTypography.bodyMedium.copyWith(
                      color: RoomioColors.textSecondaryLight,
                      height: 1.6,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
