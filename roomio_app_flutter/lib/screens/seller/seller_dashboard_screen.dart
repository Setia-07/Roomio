import 'package:flutter/material.dart';
import 'package:roomio_app_client/roomio_app_client.dart';
import '../../client.dart';
import '../../theme/roomio_theme.dart';
import '../properties/create_property_listing_screen.dart';
import '../properties/property_detail_screen.dart';

class SellerDashboardScreen extends StatefulWidget {
  const SellerDashboardScreen({super.key});

  @override
  State<SellerDashboardScreen> createState() => _SellerDashboardScreenState();
}

class _SellerDashboardScreenState extends State<SellerDashboardScreen> {
  bool _isLoading = true;
  String? _errorMessage;
  List<PropertyListing> _myListings = [];
  String _activeTab = 'all'; // 'all', 'active', 'pending', 'rejected'

  @override
  void initState() {
    super.initState();
    _loadMyListings();
  }

  Future<void> _loadMyListings() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final results = await client.listing.getMyListings();
      if (!mounted) return;
      setState(() {
        _myListings = results;
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

  Future<void> _deleteListing(int listingId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Listing?'),
        content: const Text(
          'Are you sure you want to permanently remove this property listing?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: RoomioColors.rose,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await client.listing.deleteListing(listingId);
        _loadMyListings();
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Listing deleted successfully'),
            backgroundColor: RoomioColors.navy,
          ),
        );
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error deleting listing: $e'),
            backgroundColor: RoomioColors.rose,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final activeCount = _myListings
        .where((l) => l.isActive && (l.verificationStatus != 'rejected'))
        .length;
    final pendingCount = _myListings
        .where((l) => l.verificationStatus == 'pending_verification')
        .length;

    final filteredList = _myListings.where((l) {
      if (_activeTab == 'active') {
        return l.isActive &&
            (l.verificationStatus == 'verified' ||
                l.verificationStatus == null);
      }
      if (_activeTab == 'pending') {
        return l.verificationStatus == 'pending_verification';
      }
      if (_activeTab == 'rejected') {
        return l.verificationStatus == 'rejected';
      }
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller & Agent Hub'),
        actions: [
          IconButton(
            tooltip: 'Refresh',
            icon: const Icon(Icons.refresh_rounded),
            onPressed: _loadMyListings,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: RoomioColors.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_home_rounded),
        label: const Text('Create Listing'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CreatePropertyListingScreen(
                onListingCreated: _loadMyListings,
              ),
            ),
          );
        },
      ),
      body: RefreshIndicator(
        color: RoomioColors.primary,
        onRefresh: _loadMyListings,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // KPI Summary Cards
            Row(
              children: [
                Expanded(
                  child: _buildKpiCard(
                    title: 'Active Listings',
                    value: '$activeCount',
                    icon: Icons.check_circle_outline_rounded,
                    color: RoomioColors.mint,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildKpiCard(
                    title: 'Under Review',
                    value: '$pendingCount',
                    icon: Icons.schedule_rounded,
                    color: RoomioColors.amber,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tab Filters
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTabChip('all', 'All (${_myListings.length})'),
                  _buildTabChip('active', 'Active ($activeCount)'),
                  _buildTabChip('pending', 'Pending ($pendingCount)'),
                  _buildTabChip('rejected', 'Rejected (0)'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Content List
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(60),
                child: Center(
                  child: CircularProgressIndicator(color: RoomioColors.primary),
                ),
              )
            else if (_errorMessage != null)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: RoomioColors.roseContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Error: $_errorMessage',
                  style: const TextStyle(color: RoomioColors.rose),
                ),
              )
            else if (filteredList.isEmpty)
              _buildEmptyState(isDark)
            else
              ...filteredList.map((l) => _buildManagedListingCard(l, isDark)),
          ],
        ),
      ),
    );
  }

  Widget _buildKpiCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: RoomioColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  color: RoomioColors.textSecondaryLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(icon, color: color, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: RoomioColors.navy,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabChip(String key, String label) {
    final isSelected = _activeTab == key;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: RoomioColors.primaryContainer,
        labelStyle: TextStyle(
          color: isSelected ? RoomioColors.primary : RoomioColors.navy,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        ),
        onSelected: (_) => setState(() => _activeTab = key),
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: isDark ? RoomioColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: RoomioColors.borderLight),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.add_business_rounded,
            size: 48,
            color: RoomioColors.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'No listings in this category',
            style: RoomioTypography.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Create your first property listing to reach verified tenants and buyers.',
            textAlign: TextAlign.center,
            style: TextStyle(color: RoomioColors.textSecondaryLight),
          ),
        ],
      ),
    );
  }

  Widget _buildManagedListingCard(PropertyListing listing, bool isDark) {
    final isSale = listing.listingPurpose == 'sale';
    final isVerified = listing.verificationStatus == 'verified';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? RoomioColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: RoomioColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isSale ? RoomioColors.navy : RoomioColors.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  isSale ? 'SALE' : 'RENT',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isVerified
                      ? RoomioColors.mintContainer
                      : RoomioColors.amberContainer,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  isVerified ? 'Active & Verified' : 'Under Review',
                  style: TextStyle(
                    color: isVerified ? RoomioColors.mint : RoomioColors.amber,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert_rounded),
                onSelected: (val) {
                  if (val == 'view') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PropertyDetailScreen(listing: listing),
                      ),
                    );
                  } else if (val == 'delete') {
                    _deleteListing(listing.id!);
                  }
                },
                itemBuilder: (ctx) => [
                  const PopupMenuItem(
                    value: 'view',
                    child: Text('View Details'),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text(
                      'Delete Listing',
                      style: TextStyle(color: RoomioColors.rose),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),

          Text(
            listing.title,
            style: RoomioTypography.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),

          Text(
            '${listing.neighborhood}, ${listing.city} · ${listing.totalBedrooms} Bed · ${listing.totalBathrooms} Bath',
            style: const TextStyle(
              color: RoomioColors.textSecondaryLight,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            isSale
                ? '£${_formatCurrency(listing.purchasePrice ?? 0)}'
                : '£${_formatCurrency(listing.monthlyRent ?? 0)} / month',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: isSale ? RoomioColors.navy : RoomioColors.primary,
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
