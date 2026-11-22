import 'package:flutter/material.dart';
import '../../theme/roomio_theme.dart';
import '../../widgets/roomio_button.dart';

class OnboardingSlide {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accentColor;

  const OnboardingSlide({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
  });
}

class WelcomeScreen extends StatefulWidget {
  final VoidCallback onGetStarted;
  final VoidCallback onSignIn;

  const WelcomeScreen({
    super.key,
    required this.onGetStarted,
    required this.onSignIn,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingSlide> _slides = const [
    OnboardingSlide(
      title: 'Find Your Vibe, Not Just a Room',
      subtitle:
          'Match with flatmates who share your sleep schedule, cleanliness standards, and lifestyle habits.',
      icon: Icons.people_outline_rounded,
      accentColor: RoomioColors.primary,
    ),
    OnboardingSlide(
      title: 'Team Up Before You Rent',
      subtitle:
          'Find compatible flatmates first, then browse and unlock shared apartments together in real-time.',
      icon: Icons.home_work_outlined,
      accentColor: RoomioColors.navy,
    ),
    OnboardingSlide(
      title: 'Transparent Compatibility',
      subtitle:
          'No guessing games. Our weighted compatibility score shows exactly where you align and where you differ.',
      icon: Icons.pie_chart_outline_rounded,
      accentColor: RoomioColors.mint,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RoomioColors.backgroundLight,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  // App Brand Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: RoomioColors.primaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.home_rounded,
                          color: RoomioColors.primary,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Roomio',
                        style: RoomioTypography.displayMedium.copyWith(
                          color: RoomioColors.navy,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Carousel Slides
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() => _currentPage = index);
                      },
                      itemCount: _slides.length,
                      itemBuilder: (context, index) {
                        final slide = _slides[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: slide.accentColor.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  slide.icon,
                                  size: 56,
                                  color: slide.accentColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 36),
                            Text(
                              slide.title,
                              textAlign: TextAlign.center,
                              style: RoomioTypography.displayMedium.copyWith(
                                color: RoomioColors.navy,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              slide.subtitle,
                              textAlign: TextAlign.center,
                              style: RoomioTypography.bodyLarge.copyWith(
                                color: RoomioColors.textSecondaryLight,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  // Page Indicator Dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_slides.length, (index) {
                      final isActive = index == _currentPage;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: isActive ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: isActive
                              ? RoomioColors.primary
                              : RoomioColors.borderLight,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 36),

                  // Action Buttons
                  RoomioButton(
                    text: 'Get Started',
                    onPressed: widget.onGetStarted,
                    variant: RoomioButtonVariant.primary,
                  ),
                  const SizedBox(height: 12),
                  RoomioButton(
                    text: 'I already have an account',
                    onPressed: widget.onSignIn,
                    variant: RoomioButtonVariant.ghost,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
