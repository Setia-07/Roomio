import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../theme/roomio_theme.dart';
import 'landing_image_widget.dart';

class LandingHeroSection extends StatefulWidget {
  final VoidCallback onFindRoom;
  final VoidCallback onExploreRoomies;

  const LandingHeroSection({
    super.key,
    required this.onFindRoom,
    required this.onExploreRoomies,
  });

  @override
  State<LandingHeroSection> createState() => _LandingHeroSectionState();
}

class _LandingHeroSectionState extends State<LandingHeroSection>
    with TickerProviderStateMixin {
  late final AnimationController _entranceController;
  late final AnimationController _floatingController;

  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _entranceController,
      curve: Curves.easeOutCubic,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _entranceController,
      curve: Curves.easeOutCubic,
    ));

    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _entranceController.forward();
  }

  @override
  void dispose() {
    _entranceController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 1024;
    final isTablet = size.width >= 700 && size.width < 1024;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            RoomioColors.primaryContainer.withValues(alpha: 0.35),
            Colors.white,
            RoomioColors.backgroundLight,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 48 : (isTablet ? 32 : 20),
              vertical: isDesktop ? 64 : 36,
            ),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(flex: 11, child: _buildHeroText(isDesktop: true)),
                          const SizedBox(width: 48),
                          Expanded(flex: 12, child: _buildHeroVisual(isDesktop: true)),
                        ],
                      )
                    : Column(
                        children: [
                          _buildHeroText(isDesktop: false),
                          const SizedBox(height: 48),
                          _buildHeroVisual(isDesktop: false),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroText({required bool isDesktop}) {
    return Column(
      crossAxisAlignment:
          isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        // Category pill tag
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: RoomioColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: RoomioColors.primary.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: RoomioColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Next-Gen Shared Living Platform',
                style: RoomioTypography.labelBold.copyWith(
                  color: RoomioColors.primary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Main Headline
        RichText(
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          text: TextSpan(
            style: RoomioTypography.displayLarge.copyWith(
              fontSize: isDesktop ? 52 : 36,
              height: 1.15,
              fontWeight: FontWeight.w800,
              color: RoomioColors.navy,
            ),
            children: [
              const TextSpan(text: 'Find your '),
              TextSpan(
                text: 'vibe,',
                style: TextStyle(
                  color: RoomioColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: RoomioColors.primary.withValues(alpha: 0.3),
                  decorationThickness: 3,
                ),
              ),
              const TextSpan(text: '\nnot just an empty room.'),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Subtitle
        Text(
          'Roomio matches you with compatible roommates based on lifestyle habits, work routines, and personal standards before unlocking verified boutique homes.',
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          style: RoomioTypography.bodyLarge.copyWith(
            fontSize: isDesktop ? 18 : 16,
            color: RoomioColors.textSecondaryLight,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 36),

        // Call to actions
        Wrap(
          spacing: 16,
          runSpacing: 14,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            _AnimatedCtaButton(
              text: 'Find Your Room',
              icon: Icons.search_rounded,
              isPrimary: true,
              onPressed: widget.onFindRoom,
            ),
            _AnimatedCtaButton(
              text: 'Explore Roomies',
              icon: Icons.people_outline_rounded,
              isPrimary: false,
              onPressed: widget.onExploreRoomies,
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Trust mini stats bar
        Wrap(
          spacing: 24,
          runSpacing: 12,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            _buildTrustBadge(
              icon: Icons.verified_user_outlined,
              label: '100% Verified Profiles',
            ),
            _buildTrustBadge(
              icon: Icons.tune_rounded,
              label: 'Intelligent Match Engine',
            ),
            _buildTrustBadge(
              icon: Icons.handshake_outlined,
              label: 'Collaborative Team-Ups',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTrustBadge({required IconData icon, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: RoomioColors.mint),
        const SizedBox(width: 6),
        Text(
          label,
          style: RoomioTypography.labelSmall.copyWith(
            color: RoomioColors.navy,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildHeroVisual({required bool isDesktop}) {
    return AnimatedBuilder(
      animation: _floatingController,
      builder: (context, child) {
        final floatOffset = math.sin(_floatingController.value * 2 * math.pi) * 6;
        final floatOffsetAlt =
            math.cos(_floatingController.value * 2 * math.pi) * 8;

        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // Background ambient blur sphere
            Positioned(
              right: -20,
              top: -20,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: RoomioColors.primary.withValues(alpha: 0.12),
                ),
              ),
            ),

            // Main Featured Hero Photo
            Container(
              constraints: BoxConstraints(
                maxHeight: isDesktop ? 480 : 360,
                maxWidth: isDesktop ? 580 : 460,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: RoomioColors.navy.withValues(alpha: 0.14),
                    blurRadius: 36,
                    offset: const Offset(0, 16),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Stack(
                  children: [
                    const LandingImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?auto=format&fit=crop&w=1200&q=80',
                      height: 480,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    // Subtle bottom gradient
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.55),
                            ],
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    // City Tag on hero
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.92),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.location_on_rounded,
                              size: 14,
                              color: RoomioColors.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Canary Wharf, London',
                              style: RoomioTypography.labelBold.copyWith(
                                color: RoomioColors.navy,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Floating Card 1: Sample Flatmate Compatibility Badge (Top Left)
            Positioned(
              left: isDesktop ? -24 : 8,
              top: (isDesktop ? 36 : 20) + floatOffset,
              child: _buildRoommateMatchCard(),
            ),

            // Floating Card 2: Sample Room Price & Live Team-up (Bottom Right)
            Positioned(
              right: isDesktop ? -20 : 8,
              bottom: (isDesktop ? 24 : 16) + floatOffsetAlt,
              child: _buildListingFloatCard(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRoommateMatchCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: RoomioColors.navy.withValues(alpha: 0.12),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: RoomioColors.borderLight),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Roommate Avatar
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: const LandingImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&q=80',
              width: 44,
              height: 44,
              fit: BoxFit.cover,
              fallbackIcon: Icons.person_rounded,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'Maya S., 24',
                    style: RoomioTypography.titleMedium.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: RoomioColors.navy,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.check_circle_rounded,
                    size: 13,
                    color: RoomioColors.mint,
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                'Quiet • Non-smoker • Early bird',
                style: RoomioTypography.labelSmall.copyWith(
                  color: RoomioColors.textSecondaryLight,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          // Compatibility Pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: RoomioColors.mintContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: RoomioColors.mint.withValues(alpha: 0.4)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.favorite_rounded,
                  size: 11,
                  color: RoomioColors.mint,
                ),
                const SizedBox(width: 3),
                Text(
                  '96% Match',
                  style: RoomioTypography.labelBold.copyWith(
                    color: RoomioColors.mint,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListingFloatCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: RoomioColors.navy,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: RoomioColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.group_work_rounded,
              color: Colors.white,
              size: 16,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Team-Up Room Active',
                style: RoomioTypography.titleMedium.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '3 flatmates browsing together',
                style: RoomioTypography.labelSmall.copyWith(
                  color: Colors.white70,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnimatedCtaButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onPressed;

  const _AnimatedCtaButton({
    required this.text,
    required this.icon,
    required this.isPrimary,
    required this.onPressed,
  });

  @override
  State<_AnimatedCtaButton> createState() => _AnimatedCtaButtonState();
}

class _AnimatedCtaButtonState extends State<_AnimatedCtaButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bg = widget.isPrimary ? RoomioColors.primary : Colors.white;
    final fg = widget.isPrimary ? Colors.white : RoomioColors.navy;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.diagonal3Values(
          _isHovered ? 1.03 : 1.0,
          _isHovered ? 1.03 : 1.0,
          1.0,
        ),
        decoration: BoxDecoration(
          color: _isHovered && widget.isPrimary
              ? RoomioColors.primaryHover
              : bg,
          borderRadius: BorderRadius.circular(14),
          border: widget.isPrimary
              ? null
              : Border.all(color: RoomioColors.borderLight, width: 1.5),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: widget.isPrimary
                    ? RoomioColors.primary.withValues(alpha: 0.35)
                    : RoomioColors.navy.withValues(alpha: 0.08),
                blurRadius: 18,
                offset: const Offset(0, 8),
              )
            else
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(14),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(widget.icon, size: 19, color: fg),
                  const SizedBox(width: 8),
                  Text(
                    widget.text,
                    style: RoomioTypography.titleMedium.copyWith(
                      color: fg,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
