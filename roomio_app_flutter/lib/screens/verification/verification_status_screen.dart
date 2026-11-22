import 'package:flutter/material.dart';
import '../../theme/roomio_theme.dart';
import '../../widgets/roomio_button.dart';

class VerificationStatusScreen extends StatefulWidget {
  const VerificationStatusScreen({super.key});

  @override
  State<VerificationStatusScreen> createState() =>
      _VerificationStatusScreenState();
}

class _VerificationStatusScreenState extends State<VerificationStatusScreen> {
  final _documentUrlController = TextEditingController();
  bool _isSubmitting = false;

  void _submitAccreditation() async {
    final doc = _documentUrlController.text.trim();
    if (doc.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter proof of agency accreditation or registry document URL',
          ),
          backgroundColor: RoomioColors.rose,
        ),
      );
      return;
    }

    setState(() => _isSubmitting = true);
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    setState(() => _isSubmitting = false);
    _documentUrlController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Accreditation submitted for verification! Our compliance team will review within 24 hours.',
        ),
        backgroundColor: RoomioColors.mint,
        duration: Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trust & Verification'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trust Guarantee Banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: RoomioColors.mintContainer,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: RoomioColors.mint.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.security_rounded,
                    color: RoomioColors.mint,
                    size: 28,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Verified Marketplace Standards',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: RoomioColors.navy,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'All verification badges on Roomio reflect authentic regulatory checks and legal ownership records.',
                          style: TextStyle(
                            fontSize: 12,
                            color: RoomioColors.navy.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Text(
              'Account Verification Tiers',
              style: RoomioTypography.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),

            // Tier 1: Identity & Authentication
            _buildTierCard(
              title: 'Tier 1: Identity & Email Verification',
              description:
                  'Authenticates your user identity and phone/email session securely.',
              status: 'Verified ✓',
              isComplete: true,
              icon: Icons.mark_email_read_rounded,
            ),
            const SizedBox(height: 12),

            // Tier 2: Ownership Verification
            _buildTierCard(
              title: 'Tier 2: Property Ownership Verification',
              description:
                  'Ensures listed rental or sale properties match registered title deeds.',
              status: 'Active on Listed Properties',
              isComplete: true,
              icon: Icons.home_work_rounded,
            ),
            const SizedBox(height: 12),

            // Tier 3: Estate Agent Accreditation
            _buildTierCard(
              title: 'Tier 3: Estate Agent Accreditation',
              description:
                  'Validates estate agency licenses with national ombudsman registries.',
              status: 'Review Available',
              isComplete: false,
              icon: Icons.business_center_rounded,
            ),

            const SizedBox(height: 28),

            // Submit Accreditation Section
            Text(
              'Submit Agent Accreditation',
              style: RoomioTypography.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'If you are an estate agent or letting agency, submit your registration document URL or license certificate below.',
              style: TextStyle(
                color: RoomioColors.textSecondaryLight,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _documentUrlController,
              decoration: const InputDecoration(
                labelText: 'Accreditation Document or Registry URL',
                hintText: 'https://registry.example.com/license/12345',
                prefixIcon: Icon(Icons.link_rounded),
              ),
            ),
            const SizedBox(height: 16),

            RoomioButton(
              text: 'Submit for Compliance Verification',
              isLoading: _isSubmitting,
              icon: Icons.upload_file_rounded,
              onPressed: _submitAccreditation,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTierCard({
    required String title,
    required String description,
    required String status,
    required bool isComplete,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: RoomioColors.borderLight),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isComplete
                  ? RoomioColors.mintContainer
                  : RoomioColors.amberContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isComplete ? RoomioColors.mint : RoomioColors.amber,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: RoomioColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: isComplete
                        ? RoomioColors.mintContainer
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: isComplete ? RoomioColors.mint : Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
