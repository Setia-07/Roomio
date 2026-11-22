import 'package:flutter/material.dart';
import '../../theme/roomio_theme.dart';
import 'landing_features_section.dart';
import 'landing_footer.dart';
import 'landing_hero_section.dart';
import 'landing_how_it_works.dart';
import 'landing_navbar.dart';
import 'landing_property_preview.dart';
import 'landing_trust_section.dart';

class RoomioLandingPage extends StatefulWidget {
  final VoidCallback onGetStarted;
  final VoidCallback onSignIn;

  const RoomioLandingPage({
    super.key,
    required this.onGetStarted,
    required this.onSignIn,
  });

  @override
  State<RoomioLandingPage> createState() => _RoomioLandingPageState();
}

class _RoomioLandingPageState extends State<RoomioLandingPage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _howItWorksKey = GlobalKey();
  final GlobalKey _featuresKey = GlobalKey();
  final GlobalKey _listingsKey = GlobalKey();
  final GlobalKey _safetyKey = GlobalKey();

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: _buildMobileDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Responsive Sticky Navigation Bar
            LandingNavbar(
              onSignIn: widget.onSignIn,
              onGetStarted: widget.onGetStarted,
              onHowItWorksTap: () => _scrollToKey(_howItWorksKey),
              onFeaturesTap: () => _scrollToKey(_featuresKey),
              onListingsTap: () => _scrollToKey(_listingsKey),
              onSafetyTap: () => _scrollToKey(_safetyKey),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    // 1. Hero Section
                    LandingHeroSection(
                      onFindRoom: widget.onGetStarted,
                      onExploreRoomies: () => _scrollToKey(_featuresKey),
                    ),

                    // 2. How It Works
                    Container(
                      key: _howItWorksKey,
                      child: LandingHowItWorks(
                        onGetStarted: widget.onGetStarted,
                      ),
                    ),

                    // 3. Features Showcase & Interactive Simulator
                    Container(
                      key: _featuresKey,
                      child: LandingFeaturesSection(
                        onOpenPreferences: widget.onGetStarted,
                        onExploreRooms: () => _scrollToKey(_listingsKey),
                      ),
                    ),

                    // 4. Featured Properties Grid
                    Container(
                      key: _listingsKey,
                      child: LandingPropertyPreview(
                        onSelectProperty: widget.onGetStarted,
                      ),
                    ),

                    // 5. Trust, Safety & Genuine Testimonials
                    Container(
                      key: _safetyKey,
                      child: LandingTrustSection(
                        onGetStarted: widget.onGetStarted,
                      ),
                    ),

                    // 6. Comprehensive Footer
                    LandingFooter(
                      onGetStarted: widget.onGetStarted,
                      onSignIn: widget.onSignIn,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: RoomioColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.home_work_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Roomio',
                        style: RoomioTypography.titleLarge.copyWith(
                          fontWeight: FontWeight.w800,
                          color: RoomioColors.navy,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.help_outline_rounded,
                    color: RoomioColors.primary),
                title: Text('How It Works', style: RoomioTypography.titleMedium),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToKey(_howItWorksKey);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.tune_rounded,
                    color: RoomioColors.primary),
                title: Text('Compatibility', style: RoomioTypography.titleMedium),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToKey(_featuresKey);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.apartment_rounded,
                    color: RoomioColors.primary),
                title: Text('Explore Rooms', style: RoomioTypography.titleMedium),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToKey(_listingsKey);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.shield_outlined,
                    color: RoomioColors.primary),
                title: Text('Trust & Safety', style: RoomioTypography.titleMedium),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToKey(_safetyKey);
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  widget.onSignIn();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: RoomioColors.backgroundLight,
                  foregroundColor: RoomioColors.navy,
                  minimumSize: const Size.fromHeight(48),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: RoomioColors.borderLight),
                  ),
                ),
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  widget.onGetStarted();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: RoomioColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(48),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Find a Room'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
