import 'package:flutter/material.dart';
import '../../theme/roomio_theme.dart';
import '../../widgets/roomio_button.dart';

class LandingNavbar extends StatelessWidget {
  final VoidCallback onSignIn;
  final VoidCallback onGetStarted;
  final VoidCallback onHowItWorksTap;
  final VoidCallback onFeaturesTap;
  final VoidCallback onListingsTap;
  final VoidCallback onSafetyTap;

  const LandingNavbar({
    super.key,
    required this.onSignIn,
    required this.onGetStarted,
    required this.onHowItWorksTap,
    required this.onFeaturesTap,
    required this.onListingsTap,
    required this.onSafetyTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 900;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.94),
        border: const Border(
          bottom: BorderSide(color: RoomioColors.borderLight, width: 1),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Brand Logo
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {},
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
                            Icons.home_work_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Roomio',
                          style: RoomioTypography.titleLarge.copyWith(
                            fontWeight: FontWeight.w800,
                            color: RoomioColors.navy,
                            fontSize: 22,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Desktop Navigation Links
                if (isDesktop)
                  Row(
                    children: [
                      _NavLink(title: 'How It Works', onTap: onHowItWorksTap),
                      const SizedBox(width: 24),
                      _NavLink(title: 'Compatibility', onTap: onFeaturesTap),
                      const SizedBox(width: 24),
                      _NavLink(title: 'Featured Rooms', onTap: onListingsTap),
                      const SizedBox(width: 24),
                      _NavLink(title: 'Safety & Trust', onTap: onSafetyTap),
                    ],
                  ),

                // Actions
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: onSignIn,
                      style: TextButton.styleFrom(
                        foregroundColor: RoomioColors.navy,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        textStyle: RoomioTypography.titleMedium.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: const Text('Sign In'),
                    ),
                    const SizedBox(width: 8),
                    RoomioButton(
                      text: 'Find a Room',
                      onPressed: onGetStarted,
                      variant: RoomioButtonVariant.primary,
                      height: 42,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavLink({required this.title, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          style: RoomioTypography.titleMedium.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: _isHovered ? RoomioColors.primary : RoomioColors.navy,
          ),
          child: Text(widget.title),
        ),
      ),
    );
  }
}
