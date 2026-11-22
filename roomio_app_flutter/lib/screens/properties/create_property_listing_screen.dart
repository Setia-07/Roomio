import 'package:flutter/material.dart';
import 'package:roomio_app_client/roomio_app_client.dart';
import '../../client.dart';
import '../../theme/roomio_theme.dart';
import '../../widgets/roomio_button.dart';

class CreatePropertyListingScreen extends StatefulWidget {
  final VoidCallback? onListingCreated;

  const CreatePropertyListingScreen({
    super.key,
    this.onListingCreated,
  });

  @override
  State<CreatePropertyListingScreen> createState() =>
      _CreatePropertyListingScreenState();
}

class _CreatePropertyListingScreenState
    extends State<CreatePropertyListingScreen> {
  int _currentStep = 0;
  bool _isLoading = false;

  // Step 1: Purpose & Category
  String _listingPurpose = 'rent'; // 'rent' or 'sale'
  String _propertyType = 'apartment';
  String _roomType = 'entire_place';

  // Step 2: Location & Address
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedCity = 'London';
  final _neighborhoodController = TextEditingController();
  final _addressController = TextEditingController();

  // Step 3: Pricing & Specs
  final _rentPriceController = TextEditingController();
  final _depositController = TextEditingController();
  final _salePriceController = TextEditingController();
  final _sqFtController = TextEditingController();
  int _bedrooms = 2;
  int _bathrooms = 1;
  String _tenure = 'freehold';
  String _furnishingStatus = 'furnished';

  // Step 4: Photographs & Amenities
  final _imageUrlController = TextEditingController();
  final List<String> _imageUrls = [];
  final List<String> _selectedAmenities = ['High-speed WiFi'];

  // Step 5: Ownership & Authorisation
  String _publisherRole = 'owner'; // 'owner' or 'authorized_agent'
  final _agencyNameController = TextEditingController();
  final _licenseNumberController = TextEditingController();
  final _contactPhoneController = TextEditingController();
  final _contactEmailController = TextEditingController();
  bool _hasDeclaredAuthorization = false;

  final List<String> _cities = [
    'London',
    'Bristol',
    'Manchester',
    'Birmingham',
  ];
  final List<String> _availableAmenities = [
    'High-speed WiFi',
    'Dishwasher',
    'Washing Machine',
    'Private Balcony',
    'Resident Gym',
    'Concierge',
    'Garden',
    'Parking',
    'Lift',
    'Pet Friendly',
  ];

  Future<void> _submitListing() async {
    final title = _titleController.text.trim();
    if (title.isEmpty) {
      _showError('Please enter a listing title');
      return;
    }
    if (_neighborhoodController.text.trim().isEmpty) {
      _showError('Please enter the neighborhood or district');
      return;
    }
    if (!_hasDeclaredAuthorization) {
      _showError('Please confirm the ownership/authorization declaration');
      return;
    }

    final isSale = _listingPurpose == 'sale';
    int? rent;
    int? deposit;
    int? salePrice;

    if (isSale) {
      salePrice = int.tryParse(
        _salePriceController.text.trim().replaceAll(',', ''),
      );
      if (salePrice == null || salePrice <= 0) {
        _showError('Please enter a valid purchase price');
        return;
      }
    } else {
      rent = int.tryParse(_rentPriceController.text.trim().replaceAll(',', ''));
      deposit =
          int.tryParse(_depositController.text.trim().replaceAll(',', '')) ??
          rent;
      if (rent == null || rent <= 0) {
        _showError('Please enter a valid monthly rent');
        return;
      }
    }

    setState(() => _isLoading = true);

    try {
      final listing = PropertyListing(
        ownerUserId: '', // Set authoritatively by server
        title: title,
        description: _descriptionController.text.trim().isEmpty
            ? 'Spacious and bright property in $_selectedCity.'
            : _descriptionController.text.trim(),
        propertyType: _propertyType,
        roomType: isSale ? null : _roomType,
        listingPurpose: _listingPurpose,
        monthlyRent: rent,
        securityDeposit: deposit,
        purchasePrice: salePrice,
        propertySizeSqFt: int.tryParse(_sqFtController.text.trim()),
        tenure: isSale ? _tenure : null,
        furnishingStatus: isSale ? null : _furnishingStatus,
        city: _selectedCity,
        neighborhood: _neighborhoodController.text.trim(),
        approximateAddress: _addressController.text.trim().isEmpty
            ? '$_selectedCity, UK'
            : _addressController.text.trim(),
        totalBedrooms: _bedrooms,
        totalBathrooms: _bathrooms,
        imageUrls: _imageUrls.isNotEmpty
            ? _imageUrls
            : [
                'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?auto=format&fit=crop&w=800&q=80',
              ],
        amenities: _selectedAmenities,
        publisherRole: _publisherRole,
        agencyName: _publisherRole == 'authorized_agent'
            ? (_licenseNumberController.text.trim().isNotEmpty
                  ? '${_agencyNameController.text.trim()} (Lic #${_licenseNumberController.text.trim()})'
                  : _agencyNameController.text.trim())
            : null,
        contactPhone: _contactPhoneController.text.trim(),
        contactEmail: _contactEmailController.text.trim(),
        verificationStatus: 'verified',
        isActive: true,
        createdAt: DateTime.now(),
      );

      await client.listing.createListing(listing);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Property listing published successfully!'),
          backgroundColor: RoomioColors.mint,
        ),
      );

      widget.onListingCreated?.call();
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      _showError('Failed to publish listing: $e');
    }
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: RoomioColors.rose),
    );
  }

  void _addPhotoUrl() {
    final url = _imageUrlController.text.trim();
    if (url.isNotEmpty && url.startsWith('http')) {
      setState(() {
        _imageUrls.add(url);
        _imageUrlController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Property Listing'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              color: RoomioColors.primaryContainer.withValues(alpha: 0.4),
              child: Row(
                children: [
                  _buildStepPill(0, 'Purpose'),
                  const Expanded(
                    child: Divider(thickness: 2, indent: 8, endIndent: 8),
                  ),
                  _buildStepPill(1, 'Location'),
                  const Expanded(
                    child: Divider(thickness: 2, indent: 8, endIndent: 8),
                  ),
                  _buildStepPill(2, 'Pricing'),
                  const Expanded(
                    child: Divider(thickness: 2, indent: 8, endIndent: 8),
                  ),
                  _buildStepPill(3, 'Authorisation'),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 560),
                    child: _buildCurrentStepView(),
                  ),
                ),
              ),
            ),

            // Navigation bar
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    if (_currentStep > 0)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => setState(() => _currentStep--),
                          child: const Text('Back'),
                        ),
                      ),
                    if (_currentStep > 0) const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: RoomioButton(
                        text: _currentStep == 3
                            ? 'Publish Listing'
                            : 'Next Step',
                        isLoading: _isLoading,
                        onPressed: () {
                          if (_currentStep < 3) {
                            setState(() => _currentStep++);
                          } else {
                            _submitListing();
                          }
                        },
                      ),
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

  Widget _buildStepPill(int step, String label) {
    final isSelected = _currentStep == step;
    final isDone = _currentStep > step;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: isSelected || isDone
              ? RoomioColors.primary
              : Colors.grey[300],
          child: Text(
            '${step + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected
                ? RoomioColors.navy
                : RoomioColors.textSecondaryLight,
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentStepView() {
    switch (_currentStep) {
      case 0:
        return _buildStepPurpose();
      case 1:
        return _buildStepLocation();
      case 2:
        return _buildStepPricingAndSpecs();
      case 3:
        return _buildStepAuthorisation();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildStepPurpose() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What type of listing are you creating?',
          style: RoomioTypography.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Select whether this property is offered for rent or for sale.',
          style: TextStyle(color: RoomioColors.textSecondaryLight),
        ),
        const SizedBox(height: 24),

        // Purpose Selector (Rent vs Sale)
        Row(
          children: [
            Expanded(
              child: _buildChoiceCard(
                icon: Icons.key_rounded,
                title: 'For Rent',
                description: 'Monthly rent, tenancy, shared flat or room',
                isSelected: _listingPurpose == 'rent',
                onTap: () => setState(() => _listingPurpose = 'rent'),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _buildChoiceCard(
                icon: Icons.sell_rounded,
                title: 'For Sale',
                description:
                    'Outright residential purchase, freehold/leasehold',
                isSelected: _listingPurpose == 'sale',
                onTap: () => setState(() => _listingPurpose = 'sale'),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),
        Text('Property Category', style: RoomioTypography.labelBold),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: ['apartment', 'house', 'studio', 'penthouse'].map((type) {
            final isSelected = _propertyType == type;
            return ChoiceChip(
              label: Text(type.toUpperCase()),
              selected: isSelected,
              selectedColor: RoomioColors.primaryContainer,
              onSelected: (_) => setState(() => _propertyType = type),
            );
          }).toList(),
        ),

        if (_listingPurpose == 'rent') ...[
          const SizedBox(height: 24),
          Text('Room / Space Type', style: RoomioTypography.labelBold),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children:
                [
                  ('entire_place', 'Entire Place 🏠'),
                  ('private_room', 'Private Room 🛏️'),
                  ('shared_room', 'Shared Room 👥'),
                ].map((tuple) {
                  final isSelected = _roomType == tuple.$1;
                  return ChoiceChip(
                    label: Text(tuple.$2),
                    selected: isSelected,
                    selectedColor: RoomioColors.primaryContainer,
                    onSelected: (_) => setState(() => _roomType = tuple.$1),
                  );
                }).toList(),
          ),
        ],
      ],
    );
  }

  Widget _buildStepLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Where is your property located?',
          style: RoomioTypography.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        TextField(
          controller: _titleController,
          decoration: const InputDecoration(
            labelText: 'Listing Title *',
            hintText: 'e.g. Modern 2-Bed Flat with Garden in Camden',
            prefixIcon: Icon(Icons.title_rounded),
          ),
        ),
        const SizedBox(height: 16),

        DropdownButtonFormField<String>(
          value: _selectedCity,
          decoration: const InputDecoration(
            labelText: 'City *',
            prefixIcon: Icon(Icons.location_city_rounded),
          ),
          items: _cities
              .map((c) => DropdownMenuItem(value: c, child: Text(c)))
              .toList(),
          onChanged: (val) {
            if (val != null) setState(() => _selectedCity = val);
          },
        ),
        const SizedBox(height: 16),

        TextField(
          controller: _neighborhoodController,
          decoration: const InputDecoration(
            labelText: 'Neighborhood / District *',
            hintText: 'e.g. Camden, Shoreditch, Clifton',
            prefixIcon: Icon(Icons.map_outlined),
          ),
        ),
        const SizedBox(height: 16),

        TextField(
          controller: _addressController,
          decoration: const InputDecoration(
            labelText: 'Street or Landmark (Approximate)',
            hintText: 'e.g. Camden High Street',
            prefixIcon: Icon(Icons.place_outlined),
          ),
        ),
        const SizedBox(height: 16),

        TextField(
          controller: _descriptionController,
          maxLines: 4,
          decoration: const InputDecoration(
            labelText: 'Property Description',
            hintText:
                'Describe living areas, transport links, natural light, and nearby amenities.',
            prefixIcon: Icon(Icons.description_outlined),
          ),
        ),
      ],
    );
  }

  Widget _buildStepPricingAndSpecs() {
    final isSale = _listingPurpose == 'sale';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pricing & Specifications',
          style: RoomioTypography.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        if (isSale) ...[
          TextField(
            controller: _salePriceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Asking / Guide Price (£) *',
              hintText: 'e.g. 550000',
              prefixIcon: Icon(Icons.currency_pound_rounded),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _tenure,
            decoration: const InputDecoration(labelText: 'Tenure'),
            items: const [
              DropdownMenuItem(value: 'freehold', child: Text('Freehold')),
              DropdownMenuItem(value: 'leasehold', child: Text('Leasehold')),
              DropdownMenuItem(
                value: 'share_of_freehold',
                child: Text('Share of Freehold'),
              ),
            ],
            onChanged: (val) => setState(() => _tenure = val!),
          ),
        ] else ...[
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _rentPriceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Monthly Rent (£) *',
                    hintText: '1450',
                    prefixIcon: Icon(Icons.currency_pound_rounded),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _depositController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Deposit (£)',
                    hintText: '1450',
                    prefixIcon: Icon(Icons.shield_outlined),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _furnishingStatus,
            decoration: const InputDecoration(labelText: 'Furnishing Status'),
            items: const [
              DropdownMenuItem(value: 'furnished', child: Text('Furnished')),
              DropdownMenuItem(
                value: 'unfurnished',
                child: Text('Unfurnished'),
              ),
              DropdownMenuItem(
                value: 'part_furnished',
                child: Text('Part Furnished'),
              ),
            ],
            onChanged: (val) => setState(() => _furnishingStatus = val!),
          ),
        ],

        const SizedBox(height: 20),

        // Bedrooms & Bathrooms
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bedrooms', style: RoomioTypography.labelBold),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<int>(
                    value: _bedrooms,
                    items: [1, 2, 3, 4, 5]
                        .map(
                          (b) =>
                              DropdownMenuItem(value: b, child: Text('$b Bed')),
                        )
                        .toList(),
                    onChanged: (v) => setState(() => _bedrooms = v!),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bathrooms', style: RoomioTypography.labelBold),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<int>(
                    value: _bathrooms,
                    items: [1, 2, 3, 4]
                        .map(
                          (b) => DropdownMenuItem(
                            value: b,
                            child: Text('$b Bath'),
                          ),
                        )
                        .toList(),
                    onChanged: (v) => setState(() => _bathrooms = v!),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        TextField(
          controller: _sqFtController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Floor Area (Sq Ft)',
            hintText: 'e.g. 750',
            prefixIcon: Icon(Icons.square_foot_rounded),
          ),
        ),

        const SizedBox(height: 24),

        // Amenities selection
        Text('Select Amenities', style: RoomioTypography.labelBold),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _availableAmenities.map((amenity) {
            final isSelected = _selectedAmenities.contains(amenity);
            return FilterChip(
              label: Text(amenity),
              selected: isSelected,
              selectedColor: RoomioColors.primaryContainer,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedAmenities.add(amenity);
                  } else {
                    _selectedAmenities.remove(amenity);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStepAuthorisation() {
    final isAgent = _publisherRole == 'authorized_agent';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ownership & Authorisation',
          style: RoomioTypography.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Roomio requires proof of ownership or estate agency accreditation to maintain platform trust.',
          style: TextStyle(color: RoomioColors.textSecondaryLight),
        ),
        const SizedBox(height: 20),

        // Publisher Role
        Row(
          children: [
            Expanded(
              child: ChoiceChip(
                label: const Text('I am the Owner 👤'),
                selected: _publisherRole == 'owner',
                selectedColor: RoomioColors.primaryContainer,
                onSelected: (_) => setState(() => _publisherRole = 'owner'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ChoiceChip(
                label: const Text('Authorized Agent 🏢'),
                selected: _publisherRole == 'authorized_agent',
                selectedColor: RoomioColors.primaryContainer,
                onSelected: (_) =>
                    setState(() => _publisherRole = 'authorized_agent'),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        if (isAgent) ...[
          TextField(
            controller: _agencyNameController,
            decoration: const InputDecoration(
              labelText: 'Agency / Firm Name *',
              hintText: 'e.g. Knight & Sterling Real Estate',
              prefixIcon: Icon(Icons.business_rounded),
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: _licenseNumberController,
            decoration: const InputDecoration(
              labelText: 'Agent License / Registration No.',
              hintText: 'e.g. TPO-104928',
              prefixIcon: Icon(Icons.badge_outlined),
            ),
          ),
          const SizedBox(height: 14),
        ],

        TextField(
          controller: _contactPhoneController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            labelText: 'Contact Telephone',
            hintText: '+44 20 7946 0912',
            prefixIcon: Icon(Icons.phone_outlined),
          ),
        ),
        const SizedBox(height: 14),

        TextField(
          controller: _contactEmailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Direct Contact Email',
            hintText: 'agent@realty.com',
            prefixIcon: Icon(Icons.email_outlined),
          ),
        ),
        const SizedBox(height: 24),

        // Photo URL input
        Text('Add Photograph URLs', style: RoomioTypography.labelBold),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _imageUrlController,
                decoration: const InputDecoration(
                  labelText: 'Image URL (https://...)',
                  prefixIcon: Icon(Icons.photo_camera_back_outlined),
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filled(
              icon: const Icon(Icons.add),
              onPressed: _addPhotoUrl,
            ),
          ],
        ),
        if (_imageUrls.isNotEmpty) ...[
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: _imageUrls.map((url) {
              return Chip(
                avatar: const Icon(Icons.image, size: 14),
                label: Text('${_imageUrls.indexOf(url) + 1}. Photo'),
                onDeleted: () => setState(() => _imageUrls.remove(url)),
              );
            }).toList(),
          ),
        ],

        const SizedBox(height: 24),

        // Legal Declaration Checkbox
        CheckboxListTile(
          value: _hasDeclaredAuthorization,
          activeColor: RoomioColors.primary,
          contentPadding: EdgeInsets.zero,
          title: const Text(
            'Legal Ownership & Marketing Declaration',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          subtitle: const Text(
            'I confirm that I am the legal owner or duly instructed estate agent authorized to market this property on Roomio.',
            style: TextStyle(fontSize: 12),
          ),
          onChanged: (val) =>
              setState(() => _hasDeclaredAuthorization = val ?? false),
        ),
      ],
    );
  }

  Widget _buildChoiceCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? RoomioColors.primaryContainer : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? RoomioColors.primary : RoomioColors.borderLight,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: isSelected ? RoomioColors.primary : RoomioColors.navy,
              size: 28,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isSelected ? RoomioColors.primary : RoomioColors.navy,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                color: RoomioColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
