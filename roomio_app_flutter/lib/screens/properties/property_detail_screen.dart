import 'package:flutter/material.dart';
import 'package:roomio_app_client/roomio_app_client.dart';
import '../../client.dart';
import '../../theme/roomio_theme.dart';
import '../../widgets/roomio_button.dart';

class PropertyDetailScreen extends StatefulWidget {
  final PropertyListing listing;
  final bool isSaved;
  final VoidCallback? onToggleSave;

  const PropertyDetailScreen({
    super.key,
    required this.listing,
    this.isSaved = false,
    this.onToggleSave,
  });

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  late bool _isSaved;
  int _activePhotoIndex = 0;

  @override
  void initState() {
    super.initState();
    _isSaved = widget.isSaved;
  }

  void _handleToggleSave() async {
    try {
      final updated = await client.saved.toggleSaveListing(widget.listing.id!);
      setState(() => _isSaved = updated);
      widget.onToggleSave?.call();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            updated
                ? 'Property saved to shortlists!'
                : 'Removed from shortlists',
          ),
          backgroundColor: RoomioColors.navy,
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update bookmark: $e'),
          backgroundColor: RoomioColors.rose,
        ),
      );
    }
  }

  void _openContactModal() {
    final nameController = TextEditingController();
    final messageController = TextEditingController(
      text: widget.listing.listingPurpose == 'sale'
          ? 'Hi, I would like to arrange a viewing for this property.'
          : 'Hi, I am interested in renting this property and would love to schedule a viewing.',
    );
    String inquiryType = 'viewing_request';
    bool isSubmitting = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: RoomioColors.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.mail_outline_rounded,
                          color: RoomioColors.primary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact Seller / Agent',
                              style: RoomioTypography.titleMedium.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.listing.publisherRole == 'authorized_agent'
                                  ? (widget.listing.agencyName ??
                                        'Accredited Estate Agent')
                                  : 'Private Property Owner',
                              style: const TextStyle(
                                fontSize: 12,
                                color: RoomioColors.textSecondaryLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Inquiry Type
                  DropdownButtonFormField<String>(
                    value: inquiryType,
                    decoration: const InputDecoration(
                      labelText: 'Inquiry Purpose',
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'viewing_request',
                        child: Text('Schedule a Property Viewing 📅'),
                      ),
                      DropdownMenuItem(
                        value: 'price_offer',
                        child: Text('Price Negotiation / Offer 💷'),
                      ),
                      DropdownMenuItem(
                        value: 'question',
                        child: Text('General Questions & Lease Terms 💬'),
                      ),
                    ],
                    onChanged: (val) {
                      if (val != null) {
                        setModalState(() => inquiryType = val);
                      }
                    },
                  ),
                  const SizedBox(height: 12),

                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Your Contact Name',
                      hintText: 'e.g. Jordan Smith',
                      prefixIcon: Icon(Icons.person_outline_rounded),
                    ),
                  ),
                  const SizedBox(height: 12),

                  TextField(
                    controller: messageController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Message to Seller / Agent',
                      prefixIcon: Icon(Icons.chat_bubble_outline_rounded),
                    ),
                  ),
                  const SizedBox(height: 20),

                  RoomioButton(
                    text: 'Send Direct Inquiry',
                    isLoading: isSubmitting,
                    onPressed: () async {
                      setModalState(() => isSubmitting = true);
                      await Future.delayed(const Duration(milliseconds: 600));
                      if (!ctx.mounted) return;
                      Navigator.pop(ctx);
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Inquiry sent successfully! The seller will contact you shortly.',
                          ),
                          backgroundColor: RoomioColors.mint,
                          duration: Duration(seconds: 3),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final item = widget.listing;
    final isSale = item.listingPurpose == 'sale';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Image Carousel
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            leading: CircleAvatar(
              backgroundColor: Colors.white.withValues(alpha: 0.85),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: RoomioColors.navy,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.white.withValues(alpha: 0.85),
                child: IconButton(
                  icon: Icon(
                    _isSaved
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_border_rounded,
                    color: _isSaved ? RoomioColors.primary : RoomioColors.navy,
                  ),
                  onPressed: _handleToggleSave,
                ),
              ),
              const SizedBox(width: 12),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  if (item.imageUrls.isNotEmpty)
                    PageView.builder(
                      itemCount: item.imageUrls.length,
                      onPageChanged: (i) =>
                          setState(() => _activePhotoIndex = i),
                      itemBuilder: (ctx, idx) {
                        return Image.network(
                          item.imageUrls[idx],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: RoomioColors.primaryContainer,
                                child: const Icon(
                                  Icons.apartment_rounded,
                                  size: 64,
                                  color: RoomioColors.primary,
                                ),
                              ),
                        );
                      },
                    )
                  else
                    Container(
                      color: RoomioColors.primaryContainer,
                      child: const Icon(
                        Icons.apartment_rounded,
                        size: 64,
                        color: RoomioColors.primary,
                      ),
                    ),
                  // Gradient overlay
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.4),
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.6),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  // Purpose pill
                  Positioned(
                    top: 50,
                    left: 64,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isSale
                            ? RoomioColors.navy
                            : RoomioColors.primary,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        isSale ? 'FOR SALE' : 'FOR RENT',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  // Photo indicator
                  if (item.imageUrls.length > 1)
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${_activePhotoIndex + 1} / ${item.imageUrls.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Content Body
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price Header
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        isSale
                            ? '£${_formatCurrency(item.purchasePrice ?? 0)}'
                            : '£${_formatCurrency(item.monthlyRent ?? 0)}',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: isSale
                              ? RoomioColors.navy
                              : RoomioColors.primary,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        isSale ? 'Guide Price' : '/ month',
                        style: RoomioTypography.bodyMedium.copyWith(
                          color: RoomioColors.textSecondaryLight,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  if (!isSale && item.securityDeposit != null)
                    Text(
                      'Deposit: £${_formatCurrency(item.securityDeposit!)}',
                      style: TextStyle(
                        fontSize: 13,
                        color: RoomioColors.textSecondaryLight,
                      ),
                    ),
                  const SizedBox(height: 12),

                  // Title & Location
                  Text(
                    item.title,
                    style: RoomioTypography.titleLarge.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.place_outlined,
                        size: 16,
                        color: RoomioColors.primary,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${item.neighborhood}, ${item.city} · ${item.approximateAddress}',
                          style: RoomioTypography.bodyMedium.copyWith(
                            color: RoomioColors.textSecondaryLight,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 32),

                  // Key Specifications Grid
                  _buildSpecificationsGrid(item, isSale),

                  const Divider(height: 32),

                  // Seller / Publisher Information Card
                  _buildSellerCard(item, isDark),

                  const SizedBox(height: 24),

                  // Description
                  Text(
                    'About this property',
                    style: RoomioTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description,
                    style: RoomioTypography.bodyMedium.copyWith(height: 1.6),
                  ),

                  const SizedBox(height: 24),

                  // Amenities
                  Text(
                    'Amenities & Features',
                    style: RoomioTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: item.amenities.map((amenity) {
                      return Chip(
                        avatar: const Icon(
                          Icons.check_circle_rounded,
                          size: 16,
                          color: RoomioColors.mint,
                        ),
                        label: Text(amenity),
                        backgroundColor: RoomioColors.backgroundLight,
                        side: const BorderSide(color: RoomioColors.borderLight),
                      );
                    }).toList(),
                  ),

                  // House rules if rental
                  if (!isSale && (item.houseRules?.isNotEmpty ?? false)) ...[
                    const SizedBox(height: 24),
                    Text(
                      'House Rules',
                      style: RoomioTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: item.houseRules!.map((rule) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.shield_outlined,
                                size: 16,
                                color: RoomioColors.primary,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  rule,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? RoomioColors.surfaceDark : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              Expanded(
                child: RoomioButton(
                  text: 'Contact Seller',
                  icon: Icons.chat_bubble_outline_rounded,
                  onPressed: _openContactModal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpecificationsGrid(PropertyListing item, bool isSale) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            _buildSpecChip(Icons.bed_rounded, '${item.totalBedrooms} Bedrooms'),
            _buildSpecChip(
              Icons.bathtub_outlined,
              '${item.totalBathrooms} Bathrooms',
            ),
            if (item.propertySizeSqFt != null)
              _buildSpecChip(
                Icons.square_foot_rounded,
                '${item.propertySizeSqFt} sq ft',
              ),
            _buildSpecChip(
              Icons.home_work_outlined,
              item.propertyType.replaceAll('_', ' ').toUpperCase(),
            ),
            if (isSale && item.tenure != null)
              _buildSpecChip(
                Icons.verified_outlined,
                item.tenure!.replaceAll('_', ' ').toUpperCase(),
              ),
            if (!isSale && item.furnishingStatus != null)
              _buildSpecChip(
                Icons.chair_outlined,
                item.furnishingStatus!.toUpperCase(),
              ),
          ],
        );
      },
    );
  }

  Widget _buildSpecChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: RoomioColors.backgroundLight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: RoomioColors.borderLight),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: RoomioColors.navy),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: RoomioColors.navy,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSellerCard(PropertyListing item, bool isDark) {
    final isAgent = item.publisherRole == 'authorized_agent';
    final isVerified = item.verificationStatus == 'verified';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? RoomioColors.surfaceDark
            : RoomioColors.primaryContainer.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isVerified
              ? RoomioColors.mint.withValues(alpha: 0.3)
              : RoomioColors.borderLight,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: isAgent ? RoomioColors.navy : RoomioColors.primary,
            child: Icon(
              isAgent ? Icons.business_rounded : Icons.person_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isAgent
                      ? (item.agencyName ?? 'Accredited Agent')
                      : 'Property Owner',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  isAgent
                      ? 'Authorized Estate Agent'
                      : 'Verified Private Landlord',
                  style: const TextStyle(
                    fontSize: 12,
                    color: RoomioColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
          // Verified Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isVerified ? RoomioColors.mintContainer : Colors.grey[200],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isVerified ? Icons.verified_rounded : Icons.schedule_rounded,
                  size: 13,
                  color: isVerified ? RoomioColors.mint : Colors.grey[600],
                ),
                const SizedBox(width: 4),
                Text(
                  isVerified ? 'Verified' : 'Pending',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: isVerified ? RoomioColors.mint : Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatCurrency(int amount) {
    return amount.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
