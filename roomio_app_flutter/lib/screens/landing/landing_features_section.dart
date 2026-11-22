import 'package:flutter/material.dart';
import '../../theme/roomio_theme.dart';
import '../../widgets/roomio_button.dart';

class LandingFeaturesSection extends StatefulWidget {
  final VoidCallback onOpenPreferences;
  final VoidCallback onExploreRooms;

  const LandingFeaturesSection({
    super.key,
    required this.onOpenPreferences,
    required this.onExploreRooms,
  });

  @override
  State<LandingFeaturesSection> createState() => _LandingFeaturesSectionState();
}

class _LandingFeaturesSectionState extends State<LandingFeaturesSection> {
  // Interactive compatibility simulator state
  double _cleanlinessScore = 0.9;
  double _sleepHabitsScore = 0.85;
  double _guestFrequencyScore = 0.95;
  double _workRoutineScore = 0.90;

  int get _overallCompatibility {
    final avg = (_cleanlinessScore +
            _sleepHabitsScore +
            _guestFrequencyScore +
            _workRoutineScore) /
        4.0;
    return (avg * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 1024;
    final isTablet = size.width >= 700 && size.width < 1024;

    return Container(
      width: double.infinity,
      color: RoomioColors.backgroundLight,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : (isTablet ? 32 : 20),
        vertical: isDesktop ? 96 : 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            children: [
              // Section Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: RoomioColors.navy.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'REAL ROOMIO CAPABILITIES',
                  style: RoomioTypography.labelBold.copyWith(
                    color: RoomioColors.navy,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Built for Harmony, Engineered for Speed',
                textAlign: TextAlign.center,
                style: RoomioTypography.displayMedium.copyWith(
                  fontSize: isDesktop ? 38 : 28,
                  fontWeight: FontWeight.w800,
                  color: RoomioColors.navy,
                ),
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Text(
                  'Say goodbye to awkward roommate conflicts. Roomio pairs scientific compatibility with direct, verified landlord rooms.',
                  textAlign: TextAlign.center,
                  style: RoomioTypography.bodyLarge.copyWith(
                    color: RoomioColors.textSecondaryLight,
                  ),
                ),
              ),
              const SizedBox(height: 64),

              // Feature 1: The Interactive Compatibility Engine
              _buildCompatibilityFeature(isDesktop: isDesktop),
              const SizedBox(height: 80),

              // Feature 2: Team Up Virtual Rooms
              _buildTeamUpFeature(isDesktop: isDesktop),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompatibilityFeature({required bool isDesktop}) {
    final visual = Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: RoomioColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: RoomioColors.navy.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header of simulator
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: RoomioColors.mintContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.insights_rounded,
                      color: RoomioColors.mint,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Compatibility Breakdown',
                        style: RoomioTypography.titleMedium.copyWith(
                          fontWeight: FontWeight.w700,
                          color: RoomioColors.navy,
                        ),
                      ),
                      Text(
                        'Live Algorithm Simulation',
                        style: RoomioTypography.labelSmall.copyWith(
                          color: RoomioColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Big Score Dial
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: _overallCompatibility >= 80
                      ? RoomioColors.mintContainer
                      : RoomioColors.amberContainer,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _overallCompatibility >= 80
                        ? RoomioColors.mint
                        : RoomioColors.amber,
                  ),
                ),
                child: Text(
                  '$_overallCompatibility% Match',
                  style: RoomioTypography.titleMedium.copyWith(
                    color: _overallCompatibility >= 80
                        ? RoomioColors.mint
                        : RoomioColors.amber,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),

          // Interactive sliders to demonstrate actual Roomio matching
          _buildSimulatorSlider(
            label: 'Cleanliness & Chores',
            value: _cleanlinessScore,
            onChanged: (v) => setState(() => _cleanlinessScore = v),
            icon: Icons.cleaning_services_outlined,
          ),
          _buildSimulatorSlider(
            label: 'Sleep Schedule (Early bird vs Night owl)',
            value: _sleepHabitsScore,
            onChanged: (v) => setState(() => _sleepHabitsScore = v),
            icon: Icons.bedtime_outlined,
          ),
          _buildSimulatorSlider(
            label: 'Social & Guest Policy',
            value: _guestFrequencyScore,
            onChanged: (v) => setState(() => _guestFrequencyScore = v),
            icon: Icons.celebration_outlined,
          ),
          _buildSimulatorSlider(
            label: 'Work From Home Routines',
            value: _workRoutineScore,
            onChanged: (v) => setState(() => _workRoutineScore = v),
            icon: Icons.laptop_chromebook_outlined,
          ),

          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: RoomioColors.backgroundLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.auto_awesome_rounded,
                  size: 16,
                  color: RoomioColors.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Roomio matches 14 nuanced lifestyle metrics before recommending prospective flatmates.',
                    style: RoomioTypography.labelSmall.copyWith(
                      color: RoomioColors.navy,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: RoomioColors.mintContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'INTELLIGENT COMPATIBILITY',
            style: RoomioTypography.labelBold.copyWith(
              color: RoomioColors.mint,
              fontSize: 11,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Eliminate Roommate Drama Before Moving In',
          style: RoomioTypography.displayMedium.copyWith(
            fontSize: isDesktop ? 32 : 24,
            fontWeight: FontWeight.w800,
            color: RoomioColors.navy,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Most room disputes aren\'t about rent—they are about mismatched sleeping patterns, dishes left in the sink, or differing guest policies.',
          style: RoomioTypography.bodyLarge.copyWith(
            color: RoomioColors.textSecondaryLight,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Our weighted compatibility algorithm highlights your strong alignments and transparently flags potential friction points up-front.',
          style: RoomioTypography.bodyMedium.copyWith(
            color: RoomioColors.textSecondaryLight,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 28),
        _buildBulletPoint(
          'Detailed lifestyle profiles covering noise, cleanliness, and diet.',
        ),
        _buildBulletPoint(
          'Color-coded match badge: Mint (High), Amber (Medium), Rose (Divergent).',
        ),
        _buildBulletPoint(
          'Direct messaging with verified flatmates only.',
        ),
        const SizedBox(height: 32),
        RoomioButton(
          text: 'Set Your Lifestyle Profile',
          onPressed: widget.onOpenPreferences,
          variant: RoomioButtonVariant.primary,
          icon: Icons.tune_rounded,
          width: 260,
        ),
      ],
    );

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 6, child: details),
          const SizedBox(width: 56),
          Expanded(flex: 6, child: visual),
        ],
      );
    } else {
      return Column(
        children: [
          details,
          const SizedBox(height: 40),
          visual,
        ],
      );
    }
  }

  Widget _buildSimulatorSlider({
    required String label,
    required double value,
    required ValueChanged<double> onChanged,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 15, color: RoomioColors.navy),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: RoomioTypography.labelBold.copyWith(
                    color: RoomioColors.navy,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                '${(value * 100).round()}%',
                style: RoomioTypography.labelBold.copyWith(
                  color: RoomioColors.primary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              activeTrackColor: RoomioColors.primary,
              inactiveTrackColor: RoomioColors.borderLight,
              thumbColor: RoomioColors.primary,
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
            ),
            child: Slider(
              value: value,
              min: 0.5,
              max: 1.0,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamUpFeature({required bool isDesktop}) {
    final visual = ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Stack(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1543269865-cbf427effbad?auto=format&fit=crop&w=900&q=80',
            height: 420,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 420,
              color: RoomioColors.navyLight,
              child: const Center(
                child: Icon(Icons.group_work_rounded,
                    color: Colors.white54, size: 48),
              ),
            ),
          ),
          Container(
            height: 420,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  RoomioColors.navy.withValues(alpha: 0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 24,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: RoomioColors.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.groups_rounded,
                      color: RoomioColors.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Team Up Room: Manchester Central',
                          style: RoomioTypography.titleMedium.copyWith(
                            fontWeight: FontWeight.w700,
                            color: RoomioColors.navy,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Max Budget: £2,400/mo • 3 Bedrooms • Moving Sept',
                          style: RoomioTypography.labelSmall.copyWith(
                            color: RoomioColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: RoomioColors.mintContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Ready to Lease',
                      style: RoomioTypography.labelBold.copyWith(
                        color: RoomioColors.mint,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: RoomioColors.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'TEAM UP COLLABORATION',
            style: RoomioTypography.labelBold.copyWith(
              color: RoomioColors.primary,
              fontSize: 11,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Pool Budgets & Rent Entire Apartments Together',
          style: RoomioTypography.displayMedium.copyWith(
            fontSize: isDesktop ? 32 : 24,
            fontWeight: FontWeight.w800,
            color: RoomioColors.navy,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Single room rentals often cost 30-40% more per person than leasing a multi-bedroom apartment with partners.',
          style: RoomioTypography.bodyLarge.copyWith(
            color: RoomioColors.textSecondaryLight,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'With Roomio\'s proprietary "Team Up" rooms, you can connect with compatible prospective roommates first, pool your collective budget, and tour high-end multi-bedroom properties together.',
          style: RoomioTypography.bodyMedium.copyWith(
            color: RoomioColors.textSecondaryLight,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 28),
        _buildBulletPoint(
          'Shared search queue where everyone votes on prospective listings.',
        ),
        _buildBulletPoint(
          'Split rent calculations based on bedroom sizes and en-suite bathrooms.',
        ),
        _buildBulletPoint(
          'Single application submission directly to landlords.',
        ),
        const SizedBox(height: 32),
        RoomioButton(
          text: 'Explore Properties',
          onPressed: widget.onExploreRooms,
          variant: RoomioButtonVariant.secondary,
          icon: Icons.apartment_rounded,
          width: 240,
        ),
      ],
    );

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 6, child: visual),
          const SizedBox(width: 56),
          Expanded(flex: 6, child: details),
        ],
      );
    } else {
      return Column(
        children: [
          visual,
          const SizedBox(height: 40),
          details,
        ],
      );
    }
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 3),
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: RoomioColors.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              color: RoomioColors.primary,
              size: 14,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: RoomioTypography.bodyMedium.copyWith(
                color: RoomioColors.navy,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
