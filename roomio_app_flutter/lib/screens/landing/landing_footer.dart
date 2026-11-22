import 'package:flutter/material.dart';
import '../../theme/roomio_theme.dart';

class LandingFooter extends StatelessWidget {
  final VoidCallback onGetStarted;
  final VoidCallback onSignIn;

  const LandingFooter({
    super.key,
    required this.onGetStarted,
    required this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 900;

    return Container(
      width: double.infinity,
      color: RoomioColors.navy,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : 24,
        vertical: isDesktop ? 72 : 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            children: [
              // CTA Banner before links
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isDesktop ? 48 : 28),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      RoomioColors.primary,
                      Color(0xFFFF7A59),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: isDesktop
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ready to find your ideal home and roommate?',
                                  style: RoomioTypography.displayMedium.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 28,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Create your free lifestyle profile in 2 minutes and unlock verified properties.',
                                  style: RoomioTypography.bodyLarge.copyWith(
                                    color: Colors.white.withValues(alpha: 0.9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 32),
                          ElevatedButton(
                            onPressed: onGetStarted,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: RoomioColors.navy,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 28, vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Get Started Free',
                              style: RoomioTypography.titleMedium.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ready to find your ideal home and roommate?',
                            style: RoomioTypography.displayMedium.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Create your free lifestyle profile in 2 minutes and unlock verified properties.',
                            style: RoomioTypography.bodyMedium.copyWith(
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: onGetStarted,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: RoomioColors.navy,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text('Get Started Free'),
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 64),

              // Columns
              Wrap(
                spacing: 48,
                runSpacing: 36,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  // Col 1: Brand & Bio
                  SizedBox(
                    width: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'The intelligent shared living platform. Matching compatible roommates and providing verified homes across the UK.',
                          style: RoomioTypography.bodyMedium.copyWith(
                            color: Colors.white70,
                            height: 1.6,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Backed by Serverpod & Flutter technology.',
                          style: RoomioTypography.labelSmall.copyWith(
                            color: Colors.white38,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Col 2: Top Cities
                  SizedBox(
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Top UK Cities',
                          style: RoomioTypography.labelBold.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 14),
                        _FooterLink(text: 'London Rooms', onTap: onGetStarted),
                        _FooterLink(text: 'Manchester Flats', onTap: onGetStarted),
                        _FooterLink(text: 'Bristol Shared Homes', onTap: onGetStarted),
                        _FooterLink(text: 'Birmingham Living', onTap: onGetStarted),
                      ],
                    ),
                  ),

                  // Col 3: Product & Solutions
                  SizedBox(
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Platform Features',
                          style: RoomioTypography.labelBold.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 14),
                        _FooterLink(
                            text: 'Compatibility Engine', onTap: onGetStarted),
                        _FooterLink(text: 'Team Up Rooms', onTap: onGetStarted),
                        _FooterLink(text: 'Landlord Dashboard', onTap: onSignIn),
                        _FooterLink(
                            text: 'Deposit Protection', onTap: onGetStarted),
                      ],
                    ),
                  ),

                  // Col 4: Safety & Support
                  SizedBox(
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trust & Legal',
                          style: RoomioTypography.labelBold.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 14),
                        _FooterLink(text: 'TDS Scheme Compliance', onTap: () {}),
                        _FooterLink(text: 'Tenant Safety Standards', onTap: () {}),
                        _FooterLink(text: 'Privacy Policy', onTap: () {}),
                        _FooterLink(text: 'Terms of Service', onTap: () {}),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 56),
              const Divider(color: Colors.white12),
              const SizedBox(height: 24),

              // Bottom row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '© ${DateTime.now().year} Roomio Technologies Ltd. All rights reserved.',
                    style: RoomioTypography.labelSmall.copyWith(
                      color: Colors.white54,
                    ),
                  ),
                  Row(
                    children: [
                      _buildSocialIcon(Icons.share_rounded),
                      const SizedBox(width: 12),
                      _buildSocialIcon(Icons.public_rounded),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white70, size: 16),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _FooterLink({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: RoomioTypography.bodyMedium.copyWith(
              color: Colors.white70,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
