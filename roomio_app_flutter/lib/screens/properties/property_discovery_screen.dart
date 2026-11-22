import 'package:flutter/material.dart';
import 'package:roomio_app_client/roomio_app_client.dart';
import '../../client.dart';
import '../../theme/roomio_theme.dart';
import 'property_detail_screen.dart';

class PropertyDiscoveryScreen extends StatefulWidget {
  final String? initialPurpose; // 'rent' or 'sale' or null

  const PropertyDiscoveryScreen({
    super.key,
    this.initialPurpose,
  });

  @override
  State<PropertyDiscoveryScreen> createState() =>
      _PropertyDiscoveryScreenState();
}

class _PropertyDiscoveryScreenState extends State<PropertyDiscoveryScreen> {
  bool _isLoading = true;
  String? _errorMessage;
  List<PropertyListing> _listings = [];
  final Set<int> _savedListingIds = {};

  // Filters
  String _selectedPurpose = 'all'; // 'all', 'rent', 'sale'
  String _selectedCity = 'All';
  String _selectedType = 'All';
  int? _minBedrooms;
  RangeValues _rentRange = const RangeValues(500, 3000);
  RangeValues _saleRange = const RangeValues(150000, 1000000);
  final _searchController = TextEditingController();

  final List<String> _cities = ['All', 'London', 'Bristol', 'Manchester'];
  final List<String> _propertyTypes = [
    'All',
    'apartment',
    'house',
    'studio',
    'penthouse',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.initialPurpose != null) {
      _selectedPurpose = widget.initialPurpose!;
    }
    _loadListings();
  }

  Future<void> _loadListings() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final cityFilter = _selectedCity == 'All' ? null : _selectedCity;
      final purposeFilter = _selectedPurpose == 'all' ? null : _selectedPurpose;
      final typeFilter = _selectedType == 'All' ? null : _selectedType;

      int? maxRent;
      int? minPrice;
      int? maxPrice;

      if (_selectedPurpose == 'rent') {
        maxRent = _rentRange.end.round();
      } else if (_selectedPurpose == 'sale') {
        minPrice = _saleRange.start.round();
        maxPrice = _saleRange.end.round();
      }

      final results = await client.listing.searchListings(
        city: cityFilter,
        listingPurpose: purposeFilter,
        maxRent: maxRent,
        minPrice: minPrice,
        maxPrice: maxPrice,
        propertyType: typeFilter,
        minBedrooms: _minBedrooms,
        limit: 40,
        offset: 0,
      );

      if (!mounted) return;
      setState(() {
        _listings = results;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleSave(int listingId) async {
    try {
      final isSaved = await client.saved.toggleSaveListing(listingId);
      if (!mounted) return;
      setState(() {
        if (isSaved) {
          _savedListingIds.add(listingId);
        } else {
          _savedListingIds.remove(listingId);
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isSaved
                ? 'Listing saved to your shortlists!'
                : 'Removed from shortlists',
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: RoomioColors.navy,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not update saved listing: $e'),
          backgroundColor: RoomioColors.rose,
        ),
      );
    }
  }

  void _openFilterDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setFilterState) {
          final isSale = _selectedPurpose == 'sale';

          return Container(
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.tune_rounded,
                        color: RoomioColors.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Property Filters',
                        style: RoomioTypography.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          setFilterState(() {
                            _selectedType = 'All';
                            _minBedrooms = null;
                            _rentRange = const RangeValues(500, 3000);
                            _saleRange = const RangeValues(150000, 1000000);
                          });
                        },
                        child: const Text('Reset'),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      // Property Type
                      Text('Property Type', style: RoomioTypography.labelBold),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: _propertyTypes.map((type) {
                          final isSelected = _selectedType == type;
                          return ChoiceChip(
                            label: Text(
                              type.replaceAll('_', ' ').toUpperCase(),
                            ),
                            selected: isSelected,
                            selectedColor: RoomioColors.primaryContainer,
                            onSelected: (_) {
                              setFilterState(() => _selectedType = type);
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),

                      // Bedrooms
                      Text(
                        'Minimum Bedrooms',
                        style: RoomioTypography.labelBold,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: [null, 1, 2, 3, 4].map((beds) {
                          final label = beds == null ? 'Any' : '$beds+ Bed';
                          final isSelected = _minBedrooms == beds;
                          return ChoiceChip(
                            label: Text(label),
                            selected: isSelected,
                            onSelected: (_) {
                              setFilterState(() => _minBedrooms = beds);
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),

                      // Price Slider (Rent vs Sale)
                      if (!isSale) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Monthly Rent Budget',
                              style: RoomioTypography.labelBold,
                            ),
                            Text(
                              '£${_rentRange.start.round()} - £${_rentRange.end.round()}/mo',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: RoomioColors.primary,
                              ),
                            ),
                          ],
                        ),
                        RangeSlider(
                          values: _rentRange,
                          min: 400,
                          max: 3500,
                          divisions: 31,
                          activeColor: RoomioColors.primary,
                          onChanged: (val) =>
                              setFilterState(() => _rentRange = val),
                        ),
                      ] else ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Purchase Price Range',
                              style: RoomioTypography.labelBold,
                            ),
                            Text(
                              '£${_formatCurrency(_saleRange.start.round())} - £${_formatCurrency(_saleRange.end.round())}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: RoomioColors.navy,
                              ),
                            ),
                          ],
                        ),
                        RangeSlider(
                          values: _saleRange,
                          min: 100000,
                          max: 2000000,
                          divisions: 38,
                          activeColor: RoomioColors.navy,
                          onChanged: (val) =>
                              setFilterState(() => _saleRange = val),
                        ),
                      ],
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: RoomioColors.primary,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      Navigator.pop(ctx);
                      _loadListings();
                    },
                    child: const Text('Apply Filters'),
                  ),
                ),
              ],
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

    return Scaffold(
      body: RefreshIndicator(
        color: RoomioColors.primary,
        onRefresh: _loadListings,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Top Purpose Selector Pills: All | Rent | Buy
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isDark
                    ? RoomioColors.surfaceDark
                    : RoomioColors.backgroundLight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: RoomioColors.borderLight),
              ),
              child: Row(
                children: [
                  _buildPurposeTab('all', 'All Properties'),
                  _buildPurposeTab('rent', 'For Rent 🔑'),
                  _buildPurposeTab('sale', 'For Sale 🏷️'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Search Bar & Filter Button
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search neighborhood or street...',
                      prefixIcon: const Icon(Icons.search_rounded),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: RoomioColors.borderLight),
                      ),
                    ),
                    onSubmitted: (_) => _loadListings(),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton.filledTonal(
                  icon: const Icon(Icons.tune_rounded),
                  style: IconButton.styleFrom(
                    backgroundColor: RoomioColors.primaryContainer,
                    foregroundColor: RoomioColors.primary,
                  ),
                  onPressed: _openFilterDialog,
                ),
              ],
            ),
            const SizedBox(height: 14),

            // City Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _cities.map((city) {
                  final isSelected = _selectedCity == city;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(city),
                      selected: isSelected,
                      selectedColor: RoomioColors.primaryContainer,
                      labelStyle: TextStyle(
                        color: isSelected
                            ? RoomioColors.primary
                            : RoomioColors.navy,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w500,
                        fontSize: 13,
                      ),
                      side: BorderSide(
                        color: isSelected
                            ? RoomioColors.primary
                            : RoomioColors.borderLight,
                      ),
                      onSelected: (_) {
                        setState(() => _selectedCity = city);
                        _loadListings();
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),

            // Content State
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(60),
                child: Center(
                  child: CircularProgressIndicator(color: RoomioColors.primary),
                ),
              )
            else if (_errorMessage != null)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: RoomioColors.roseContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.error_outline_rounded,
                      size: 40,
                      color: RoomioColors.rose,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Failed to load properties',
                      style: RoomioTypography.titleMedium.copyWith(
                        color: RoomioColors.rose,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _errorMessage!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: RoomioColors.rose,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _loadListings,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              )
            else if (_listings.isEmpty)
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: isDark ? RoomioColors.surfaceDark : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: RoomioColors.borderLight),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.apartment_rounded,
                      size: 48,
                      color: RoomioColors.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No properties found',
                      style: RoomioTypography.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Try adjusting your search criteria or switching between Rent and Sale.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: RoomioColors.textSecondaryLight),
                    ),
                  ],
                ),
              )
            else
              ..._listings.map((item) => _buildListingCard(item, isDark)),
          ],
        ),
      ),
    );
  }

  Widget _buildPurposeTab(String purpose, String title) {
    final isSelected = _selectedPurpose == purpose;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() => _selectedPurpose = purpose);
          _loadListings();
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? RoomioColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : RoomioColors.textSecondaryLight,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListingCard(PropertyListing listing, bool isDark) {
    final isSaved = _savedListingIds.contains(listing.id);
    final isSale = listing.listingPurpose == 'sale';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDark ? RoomioColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isDark ? RoomioColors.borderDark : RoomioColors.borderLight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PropertyDetailScreen(
                listing: listing,
                isSaved: isSaved,
                onToggleSave: () => _toggleSave(listing.id!),
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(17),
              ),
              child: SizedBox(
                height: 165,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (listing.imageUrls.isNotEmpty)
                      Image.network(
                        listing.imageUrls.first,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: RoomioColors.primaryContainer,
                          child: const Icon(
                            Icons.apartment_rounded,
                            size: 48,
                            color: RoomioColors.primary,
                          ),
                        ),
                      )
                    else
                      Container(
                        color: RoomioColors.primaryContainer,
                        child: const Icon(
                          Icons.apartment_rounded,
                          size: 48,
                          color: RoomioColors.primary,
                        ),
                      ),
                    // Price pill
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isSale
                              ? RoomioColors.navy
                              : RoomioColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          isSale
                              ? '£${_formatCurrency(listing.purchasePrice ?? 0)}'
                              : '£${_formatCurrency(listing.monthlyRent ?? 0)} / mo',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    // Purpose tag
                    Positioned(
                      bottom: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.65),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          isSale ? 'SALE' : 'RENT',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                    // Bookmark button
                    Positioned(
                      top: 10,
                      right: 10,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white.withValues(alpha: 0.9),
                        child: IconButton(
                          iconSize: 18,
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            isSaved
                                ? Icons.bookmark_rounded
                                : Icons.bookmark_border_rounded,
                            color: isSaved
                                ? RoomioColors.primary
                                : RoomioColors.navy,
                          ),
                          onPressed: () => _toggleSave(listing.id!),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Details
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listing.title,
                    style: RoomioTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: RoomioColors.textSecondaryLight,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${listing.neighborhood}, ${listing.city}',
                        style: RoomioTypography.bodyMedium.copyWith(
                          color: RoomioColors.textSecondaryLight,
                          fontSize: 13,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${listing.totalBedrooms} Bed · ${listing.totalBathrooms} Bath',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: RoomioColors.navy,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
