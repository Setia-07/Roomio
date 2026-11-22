import 'package:flutter/material.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import '../../client.dart';
import '../../theme/roomio_theme.dart';

class RoomioAuthScreen extends StatefulWidget {
  final VoidCallback onAuthenticated;
  final VoidCallback? onBack;

  const RoomioAuthScreen({
    super.key,
    required this.onAuthenticated,
    this.onBack,
  });

  @override
  State<RoomioAuthScreen> createState() => _RoomioAuthScreenState();
}

class _RoomioAuthScreenState extends State<RoomioAuthScreen> {
  @override
  void initState() {
    super.initState();
    client.auth.authInfoListenable.addListener(_checkAuthStatus);
    if (client.auth.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onAuthenticated();
      });
    }
  }

  @override
  void dispose() {
    client.auth.authInfoListenable.removeListener(_checkAuthStatus);
    super.dispose();
  }

  void _checkAuthStatus() {
    if (client.auth.isAuthenticated) {
      widget.onAuthenticated();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RoomioColors.backgroundLight,
      appBar: AppBar(
        leading: widget.onBack != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: widget.onBack,
              )
            : null,
        title: const Text('Sign in to Roomio'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: RoomioColors.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.lock_outline_rounded,
                            color: RoomioColors.primary,
                            size: 28,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Welcome Back',
                        textAlign: TextAlign.center,
                        style: RoomioTypography.titleLarge.copyWith(
                          color: RoomioColors.navy,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Enter your email to receive an instant verification code. No password needed.',
                        textAlign: TextAlign.center,
                        style: RoomioTypography.bodyMedium.copyWith(
                          color: RoomioColors.textSecondaryLight,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Serverpod Email OTP Auth Widget
                      SignInWidget(
                        client: client,
                        onAuthenticated: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Successfully authenticated!'),
                              backgroundColor: RoomioColors.mint,
                            ),
                          );
                          widget.onAuthenticated();
                        },
                        onError: (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Authentication error: $error'),
                              backgroundColor: RoomioColors.rose,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),

                      // Privacy Guarantee
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.verified_user_outlined,
                            size: 14,
                            color: RoomioColors.textMutedLight,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Verified community • Your details are protected',
                            style: RoomioTypography.labelSmall.copyWith(
                              color: RoomioColors.textMutedLight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
