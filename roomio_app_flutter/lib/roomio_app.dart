import 'package:flutter/material.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'client.dart';
import 'screens/auth/roomio_auth_screen.dart';
import 'screens/marketplace/marketplace_home_screen.dart';
import 'screens/matching/flatmate_discovery_screen.dart';
import 'screens/onboarding/welcome_screen.dart';
import 'screens/profile/profile_setup_screen.dart';
import 'screens/properties/property_discovery_screen.dart';
import 'screens/rooms/matching_rooms_list_screen.dart';
import 'screens/saved/saved_properties_screen.dart';
import 'screens/seller/seller_dashboard_screen.dart';
import 'theme/roomio_theme.dart';

enum AppFlowState { onboarding, auth, profileSetup, mainHub }

class RoomioApp extends StatefulWidget {
  const RoomioApp({super.key});

  @override
  State<RoomioApp> createState() => _RoomioAppState();
}

class _RoomioAppState extends State<RoomioApp> {
  AppFlowState _flowState = AppFlowState.onboarding;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    client.auth.authInfoListenable.addListener(_handleAuthChange);
    if (client.auth.isAuthenticated) {
      _checkProfileAndNavigate();
    }
  }

  @override
  void dispose() {
    client.auth.authInfoListenable.removeListener(_handleAuthChange);
    super.dispose();
  }

  void _handleAuthChange() {
    if (client.auth.isAuthenticated) {
      _checkProfileAndNavigate();
    } else {
      setState(() => _flowState = AppFlowState.onboarding);
    }
  }

  Future<void> _checkProfileAndNavigate() async {
    try {
      final profile = await client.profile.getMyUserProfile();
      if (!mounted) return;
      if (profile == null) {
        setState(() => _flowState = AppFlowState.profileSetup);
      } else {
        setState(() => _flowState = AppFlowState.mainHub);
      }
    } catch (_) {
      if (mounted) {
        setState(() => _flowState = AppFlowState.mainHub);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roomio',
      debugShowCheckedModeBanner: false,
      theme: RoomioTheme.lightTheme,
      darkTheme: RoomioTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: _buildCurrentScreen(),
    );
  }

  Widget _buildCurrentScreen() {
    switch (_flowState) {
      case AppFlowState.onboarding:
        return WelcomeScreen(
          onGetStarted: () {
            setState(() => _flowState = AppFlowState.auth);
          },
          onSignIn: () {
            setState(() => _flowState = AppFlowState.auth);
          },
        );
      case AppFlowState.auth:
        return RoomioAuthScreen(
          onAuthenticated: () {
            _checkProfileAndNavigate();
          },
          onBack: () {
            setState(() => _flowState = AppFlowState.onboarding);
          },
        );
      case AppFlowState.profileSetup:
        return ProfileSetupScreen(
          onCompleted: () {
            setState(() => _flowState = AppFlowState.mainHub);
          },
        );
      case AppFlowState.mainHub:
        return Builder(
          builder: (builderContext) => Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: RoomioColors.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.home_work_rounded,
                      color: RoomioColors.primary,
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
              actions: [
                IconButton(
                  tooltip: 'Saved Properties',
                  icon: const Icon(Icons.bookmark_outline_rounded),
                  onPressed: () {
                    Navigator.push(
                      builderContext,
                      MaterialPageRoute(
                        builder: (_) => const SavedPropertiesScreen(),
                      ),
                    );
                  },
                ),
                IconButton(
                  tooltip: 'Profile & Lifestyle',
                  icon: const Icon(Icons.tune_rounded),
                  onPressed: () {
                    Navigator.push(
                      builderContext,
                      MaterialPageRoute(
                        builder: (_) => ProfileSetupScreen(
                          isEditing: true,
                          onCompleted: () => Navigator.pop(builderContext),
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  tooltip: 'Sign Out',
                  icon: const Icon(Icons.logout_rounded),
                  onPressed: () async {
                    await client.auth.signOutDevice();
                    setState(() => _flowState = AppFlowState.onboarding);
                  },
                ),
              ],
            ),
            body: IndexedStack(
              index: _selectedTabIndex,
              children: [
                MarketplaceHomeScreen(
                  onOpenPreferences: () {
                    Navigator.push(
                      builderContext,
                      MaterialPageRoute(
                        builder: (_) => ProfileSetupScreen(
                          isEditing: true,
                          onCompleted: () => Navigator.pop(builderContext),
                        ),
                      ),
                    );
                  },
                ),
                const PropertyDiscoveryScreen(),
                FlatmateDiscoveryScreen(
                  onOpenPreferences: () {
                    Navigator.push(
                      builderContext,
                      MaterialPageRoute(
                        builder: (_) => ProfileSetupScreen(
                          isEditing: true,
                          onCompleted: () => Navigator.pop(builderContext),
                        ),
                      ),
                    );
                  },
                ),
                const MatchingRoomsListScreen(),
                const SellerDashboardScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedTabIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: RoomioColors.primary,
              unselectedItemColor: RoomioColors.textSecondaryLight,
              onTap: (index) {
                setState(() => _selectedTabIndex = index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home_rounded),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.apartment_outlined),
                  activeIcon: Icon(Icons.apartment_rounded),
                  label: 'Properties',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people_outline_rounded),
                  activeIcon: Icon(Icons.people_rounded),
                  label: 'Flatmates',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.groups_outlined),
                  activeIcon: Icon(Icons.groups_rounded),
                  label: 'Team Up',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.storefront_outlined),
                  activeIcon: Icon(Icons.storefront_rounded),
                  label: 'Seller Hub',
                ),
              ],
            ),
          ),
        );
    }
  }
}
