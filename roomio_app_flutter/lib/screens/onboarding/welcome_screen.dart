import 'package:flutter/material.dart';
import '../landing/roomio_landing_page.dart';

/// The entry landing page for unauthenticated visitors.
/// Delivers a modern property-tech startup experience with interactive
/// compatibility simulation, curated rooms, and responsive motion.
class WelcomeScreen extends StatelessWidget {
  final VoidCallback onGetStarted;
  final VoidCallback onSignIn;

  const WelcomeScreen({
    super.key,
    required this.onGetStarted,
    required this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return RoomioLandingPage(
      onGetStarted: onGetStarted,
      onSignIn: onSignIn,
    );
  }
}
