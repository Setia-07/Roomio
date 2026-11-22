import 'package:flutter/material.dart';
import '../../theme/roomio_theme.dart';
import '../../widgets/roomio_button.dart';
import '../verification/verification_status_screen.dart';

class SellerProfileScreen extends StatefulWidget {
  const SellerProfileScreen({super.key});

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  final _agencyController = TextEditingController(
    text: 'Prime London Lettings',
  );
  final _phoneController = TextEditingController(text: '+44 20 7946 0912');
  final _emailController = TextEditingController(text: 'info@primelondon.com');
  final _licenseController = TextEditingController(text: 'TPO-REG-88231');
  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller & Agent Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trust & Verification Banner
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const VerificationStatusScreen(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [RoomioColors.navy, RoomioColors.navyLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: RoomioColors.mint.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.verified_user_rounded,
                        color: RoomioColors.mint,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Trust & Verification Center',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Identity Verified · View accreditation status',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white70,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Agency & Contact Details',
              style: RoomioTypography.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'These details appear on your property listings for prospective buyers and tenants.',
              style: TextStyle(
                color: RoomioColors.textSecondaryLight,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 18),

            TextField(
              controller: _agencyController,
              decoration: const InputDecoration(
                labelText: 'Business / Agency Name',
                prefixIcon: Icon(Icons.business_rounded),
              ),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _licenseController,
              decoration: const InputDecoration(
                labelText: 'Estate Agency / Landlord License No.',
                prefixIcon: Icon(Icons.badge_outlined),
              ),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Public Office Telephone',
                prefixIcon: Icon(Icons.phone_outlined),
              ),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Public Inquiries Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: 24),

            RoomioButton(
              text: 'Save Seller Profile',
              isLoading: _isSaving,
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                setState(() => _isSaving = true);
                await Future.delayed(const Duration(milliseconds: 500));
                if (!mounted) return;
                setState(() => _isSaving = false);
                messenger.showSnackBar(
                  const SnackBar(
                    content: Text('Seller profile updated!'),
                    backgroundColor: RoomioColors.mint,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
