import 'package:flutter/material.dart';
import '../../theme/roomio_theme.dart';
import 'landing_image_widget.dart';

class LandingPropertyPreview extends StatefulWidget {
  final VoidCallback onSelectProperty;

  const LandingPropertyPreview({
    super.key,
    required this.onSelectProperty,
  });

  @override
  State<LandingPropertyPreview> createState() => _LandingPropertyPreviewState();
}

class _LandingPropertyPreviewState extends State<LandingPropertyPreview> {
  String _selectedCity = 'All';

  final List<String> _cities = ['All', 'London', 'Manchester', 'Bristol', 'Birmingham'];

  final List<_PropertyCardData> _properties = const [
    _PropertyCardData(
      title: 'Canary Wharf Panoramic Duplex',
      city: 'London',
      neighborhood: 'Canary Wharf',
      monthlyRent: 950,
      bedrooms: 3,
      bathrooms: 2,
      propertyType: 'Apartment',
      imageUrl:
          'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?auto=format&fit=crop&w=700&q=80',
      amenities: ['Fast WiFi', 'En-suite', 'Balcony', 'Concierge'],
      isVerified: true,
      billsIncluded: true,
    ),
    _PropertyCardData(
      title: 'Ancoats Industrial Loft Studio',
      city: 'Manchester',
      neighborhood: 'Ancoats Urban Village',
      monthlyRent: 780,
      bedrooms: 2,
      bathrooms: 1,
      propertyType: 'Loft',
      imageUrl:
          'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?auto=format&fit=crop&w=700&q=80',
      amenities: ['Exposed Brick', 'Furnished', 'Pet Friendly', 'Tram Link'],
      isVerified: true,
      billsIncluded: false,
    ),
    _PropertyCardData(
      title: 'Clifton Georgian Shared Terrace',
      city: 'Bristol',
      neighborhood: 'Clifton Village',
      monthlyRent: 720,
      bedrooms: 4,
      bathrooms: 2,
      propertyType: 'House',
      imageUrl:
          'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=700&q=80',
      amenities: ['Garden Access', 'Bicycle Storage', 'Period Fireplace'],
      isVerified: true,
      billsIncluded: true,
    ),
    _PropertyCardData(
      title: 'Jewellery Quarter Modern Living',
      city: 'Birmingham',
      neighborhood: 'Jewellery Quarter',
      monthlyRent: 680,
      bedrooms: 3,
      bathrooms: 2,
      propertyType: 'Apartment',
      imageUrl:
          'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?auto=format&fit=crop&w=700&q=80',
      amenities: ['Co-working Space', 'Gym Access', 'Dishwasher'],
      isVerified: true,
      billsIncluded: true,
    ),
    _PropertyCardData(
      title: 'Shoreditch Creative Quarter Room',
      city: 'London',
      neighborhood: 'Shoreditch',
      monthlyRent: 890,
      bedrooms: 3,
      bathrooms: 1,
      propertyType: 'Apartment',
      imageUrl:
          'https://images.unsplash.com/photo-1554995207-c18c203602cb?auto=format&fit=crop&w=700&q=80',
      amenities: ['Rooftop Terrace', 'Ultra-fast Fibre', 'Wood Floors'],
      isVerified: true,
      billsIncluded: true,
    ),
    _PropertyCardData(
      title: 'Didsbury Green Suburb Villa',
      city: 'Manchester',
      neighborhood: 'West Didsbury',
      monthlyRent: 650,
      bedrooms: 4,
      bathrooms: 2,
      propertyType: 'House',
      imageUrl:
          'https://images.unsplash.com/photo-1493809842364-78817add7ffb?auto=format&fit=crop&w=700&q=80',
      amenities: ['Private Garden', 'Free Parking', 'Quiet Area'],
      isVerified: true,
      billsIncluded: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 1024;
    final isTablet = size.width >= 700 && size.width < 1024;

    final filtered = _selectedCity == 'All'
        ? _properties
        : _properties.where((p) => p.city == _selectedCity).toList();

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : (isTablet ? 32 : 20),
        vertical: isDesktop ? 96 : 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: RoomioColors.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'FEATURED SPACES',
                  style: RoomioTypography.labelBold.copyWith(
                    color: RoomioColors.primary,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Explore Verified Rooms & Apartments',
                textAlign: TextAlign.center,
                style: RoomioTypography.displayMedium.copyWith(
                  fontSize: isDesktop ? 40 : 30,
                  fontWeight: FontWeight.w800,
                  color: RoomioColors.navy,
                ),
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'All listings pass rigorous landlord verification, photographic checks, and deposit security standards.',
                  textAlign: TextAlign.center,
                  style: RoomioTypography.bodyLarge.copyWith(
                    color: RoomioColors.textSecondaryLight,
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // City Filter Pills
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _cities.map((city) {
                    final isSelected = _selectedCity == city;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ChoiceChip(
                        label: Text(city),
                        selected: isSelected,
                        onSelected: (_) {
                          setState(() => _selectedCity = city);
                        },
                        selectedColor: RoomioColors.navy,
                        backgroundColor: RoomioColors.backgroundLight,
                        labelStyle: RoomioTypography.labelBold.copyWith(
                          color: isSelected ? Colors.white : RoomioColors.navy,
                          fontSize: 13,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: isSelected
                                ? RoomioColors.navy
                                : RoomioColors.borderLight,
                          ),
                        ),
                        showCheckmark: false,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 48),

              // Property Grid (3 columns on desktop, 2 on tablet, 1 on mobile)
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 1;
                  if (constraints.maxWidth >= 980) {
                    crossAxisCount = 3;
                  } else if (constraints.maxWidth >= 640) {
                    crossAxisCount = 2;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: isDesktop ? 0.82 : 0.88,
                    ),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      return _PropertyCard(
                        data: filtered[index],
                        onTap: widget.onSelectProperty,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PropertyCardData {
  final String title;
  final String city;
  final String neighborhood;
  final int monthlyRent;
  final int bedrooms;
  final int bathrooms;
  final String propertyType;
  final String imageUrl;
  final List<String> amenities;
  final bool isVerified;
  final bool billsIncluded;

  const _PropertyCardData({
    required this.title,
    required this.city,
    required this.neighborhood,
    required this.monthlyRent,
    required this.bedrooms,
    required this.bathrooms,
    required this.propertyType,
    required this.imageUrl,
    required this.amenities,
    required this.isVerified,
    required this.billsIncluded,
  });
}

class _PropertyCard extends StatefulWidget {
  final _PropertyCardData data;
  final VoidCallback onTap;

  const _PropertyCard({required this.data, required this.onTap});

  @override
  State<_PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<_PropertyCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0.0, _isHovered ? -6.0 : 0.0, 0.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _isHovered
                  ? RoomioColors.primary.withValues(alpha: 0.4)
                  : RoomioColors.borderLight,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? RoomioColors.navy.withValues(alpha: 0.12)
                    : Colors.black.withValues(alpha: 0.03),
                blurRadius: _isHovered ? 20 : 8,
                offset: Offset(0, _isHovered ? 10 : 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Photo with badges
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(19)),
                    child: LandingImage(
                      imageUrl: widget.data.imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Price Tag
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: RoomioColors.navy.withValues(alpha: 0.92),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '£${widget.data.monthlyRent}',
                              style: RoomioTypography.titleMedium.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: ' /mo',
                              style: RoomioTypography.labelSmall.copyWith(
                                color: Colors.white70,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Verified Badge
                  if (widget.data.isVerified)
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.94),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.verified_rounded,
                              size: 13,
                              color: RoomioColors.mint,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Verified',
                              style: RoomioTypography.labelBold.copyWith(
                                color: RoomioColors.navy,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),

              // Property Details
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 13,
                                color: RoomioColors.primary,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  '${widget.data.neighborhood}, ${widget.data.city}',
                                  style: RoomioTypography.labelBold.copyWith(
                                    color: RoomioColors.primary,
                                    fontSize: 11,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widget.data.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: RoomioTypography.titleMedium.copyWith(
                              fontWeight: FontWeight.w700,
                              color: RoomioColors.navy,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Specs: Beds, Baths, Bills
                          Row(
                            children: [
                              _buildSpecItem(
                                icon: Icons.bed_outlined,
                                text: '${widget.data.bedrooms} Bed',
                              ),
                              const SizedBox(width: 12),
                              _buildSpecItem(
                                icon: Icons.bathtub_outlined,
                                text: '${widget.data.bathrooms} Bath',
                              ),
                              const SizedBox(width: 12),
                              _buildSpecItem(
                                icon: Icons.receipt_long_outlined,
                                text: widget.data.billsIncluded
                                    ? 'Bills Inc.'
                                    : 'Excl. Bills',
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Amenities tags
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: widget.data.amenities.take(3).map((amenity) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 3),
                            decoration: BoxDecoration(
                              color: RoomioColors.backgroundLight,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              amenity,
                              style: RoomioTypography.labelSmall.copyWith(
                                color: RoomioColors.textSecondaryLight,
                                fontSize: 10,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpecItem({required IconData icon, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: RoomioColors.textSecondaryLight),
        const SizedBox(width: 4),
        Text(
          text,
          style: RoomioTypography.labelSmall.copyWith(
            color: RoomioColors.textSecondaryLight,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
