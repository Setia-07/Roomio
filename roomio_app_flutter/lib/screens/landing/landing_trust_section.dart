import 'package:flutter/material.dart';
import '../../theme/roomio_theme.dart';
import 'landing_image_widget.dart';

class LandingTrustSection extends StatelessWidget {
  final VoidCallback onGetStarted;

  const LandingTrustSection({super.key, required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 1024;
    final isTablet = size.width >= 700 && size.width < 1024;

    final pillars = [
      _TrustPillar(
        icon: Icons.shield_outlined,
        title: 'Government Deposit Protection',
        description:
            'All tenant deposits are registered with official Tenancy Deposit Schemes (TDS/DPS), ensuring maximum legal security.',
      ),
      _TrustPillar(
        icon: Icons.verified_outlined,
        title: 'Landlord & Identity Verification',
        description:
            'Both property hosts and flatmates undergo identity verification and property deed checks before listings go live.',
      ),
      _TrustPillar(
        icon: Icons.lock_outline_rounded,
        title: 'End-to-End In-App Chat',
        description:
            'Communicate securely without sharing your personal phone number until you feel comfortable and ready to view.',
      ),
      _TrustPillar(
        icon: Icons.money_off_rounded,
        title: 'Zero Hidden Tenant Fees',
        description:
            'Roomio complies strictly with the Tenant Fees Act. Clear, transparent monthly pricing with zero surprise charges.',
      ),
    ];

    final testimonials = [
      _TestimonialData(
        quote:
            'Matching on sleep habits and cleanliness changed everything for me. Moving to London was daunting, but I found two amazing flatmates in Shoreditch through Roomio.',
        name: 'Sophie Davies',
        role: 'Junior Software Engineer, London',
        avatarUrl:
            'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=150&q=80',
        compatibilityScore: 98,
      ),
      _TestimonialData(
        quote:
            'The Team Up feature is brilliant. Instead of renting individual rooms, three of us banded together and leased a luxury apartment in Manchester for £250 less each.',
        name: 'Marcus Chen',
        role: 'Architectural Designer, Manchester',
        avatarUrl:
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&q=80',
        compatibilityScore: 94,
      ),
    ];

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
              // Section Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: RoomioColors.mintContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'TRUST & SAFETY FIRST',
                  style: RoomioTypography.labelBold.copyWith(
                    color: RoomioColors.mint,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Built On Trust, Certified For Safety',
                textAlign: TextAlign.center,
                style: RoomioTypography.displayMedium.copyWith(
                  fontSize: isDesktop ? 38 : 28,
                  fontWeight: FontWeight.w800,
                  color: RoomioColors.navy,
                ),
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 620),
                child: Text(
                  'Shared living requires trust above all else. That is why safety, verified landlords, and tenant rights are built into Roomio\'s foundation.',
                  textAlign: TextAlign.center,
                  style: RoomioTypography.bodyLarge.copyWith(
                    color: RoomioColors.textSecondaryLight,
                  ),
                ),
              ),
              const SizedBox(height: 56),

              // Pillars Grid (4 columns on desktop, 2 on tablet, 1 on mobile)
              LayoutBuilder(
                builder: (context, constraints) {
                  int cols = constraints.maxWidth >= 980
                      ? 4
                      : (constraints.maxWidth >= 600 ? 2 : 1);
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: cols,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: isDesktop ? 0.95 : 1.2,
                    ),
                    itemCount: pillars.length,
                    itemBuilder: (context, i) {
                      final p = pillars[i];
                      return Container(
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: RoomioColors.borderLight),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: RoomioColors.primaryContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                p.icon,
                                color: RoomioColors.primary,
                                size: 22,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              p.title,
                              style: RoomioTypography.titleMedium.copyWith(
                                color: RoomioColors.navy,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              p.description,
                              style: RoomioTypography.bodyMedium.copyWith(
                                color: RoomioColors.textSecondaryLight,
                                height: 1.5,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 72),

              // Community Stories
              Text(
                'Stories From Real Flatmates',
                textAlign: TextAlign.center,
                style: RoomioTypography.displayMedium.copyWith(
                  fontSize: isDesktop ? 30 : 24,
                  fontWeight: FontWeight.w700,
                  color: RoomioColors.navy,
                ),
              ),
              const SizedBox(height: 36),

              // Testimonial Cards
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: testimonials.map((t) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: _TestimonialCard(testimonial: t),
                      ),
                    );
                  }).toList(),
                )
              else
                Column(
                  children: testimonials.map((t) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: _TestimonialCard(testimonial: t),
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

class _TrustPillar {
  final IconData icon;
  final String title;
  final String description;

  const _TrustPillar({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class _TestimonialData {
  final String quote;
  final String name;
  final String role;
  final String avatarUrl;
  final int compatibilityScore;

  const _TestimonialData({
    required this.quote,
    required this.name,
    required this.role,
    required this.avatarUrl,
    required this.compatibilityScore,
  });
}

class _TestimonialCard extends StatelessWidget {
  final _TestimonialData testimonial;

  const _TestimonialCard({required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: RoomioColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: RoomioColors.navy.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Stars rating
              Row(
                children: List.generate(5, (index) {
                  return const Icon(
                    Icons.star_rounded,
                    color: RoomioColors.amber,
                    size: 20,
                  );
                }),
              ),
              // Match score badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: RoomioColors.mintContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${testimonial.compatibilityScore}% Compatibility',
                  style: RoomioTypography.labelBold.copyWith(
                    color: RoomioColors.mint,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            '"${testimonial.quote}"',
            style: RoomioTypography.bodyLarge.copyWith(
              color: RoomioColors.navy,
              height: 1.6,
              fontStyle: FontStyle.italic,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: LandingImage(
                  imageUrl: testimonial.avatarUrl,
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                  fallbackIcon: Icons.person_rounded,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testimonial.name,
                    style: RoomioTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.w700,
                      color: RoomioColors.navy,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    testimonial.role,
                    style: RoomioTypography.labelSmall.copyWith(
                      color: RoomioColors.textSecondaryLight,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
