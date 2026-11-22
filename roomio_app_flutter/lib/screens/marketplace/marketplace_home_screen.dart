import 'package:flutter/material.dart';
import 'package:roomio_app_client/roomio_app_client.dart';
import '../../client.dart';
import '../../theme/roomio_theme.dart';
import '../matching/flatmate_discovery_screen.dart';
import '../properties/property_detail_screen.dart';
import '../properties/property_discovery_screen.dart';
import '../rooms/matching_rooms_list_screen.dart';
import '../saved/saved_properties_screen.dart';
import '../seller/seller_dashboard_screen.dart';

class MarketplaceHomeScreen extends StatefulWidget {
  final VoidCallback? onOpenPreferences;

  const MarketplaceHomeScreen({
    super.key,
    this.onOpenPreferences,
  });

  @override
  State<MarketplaceHomeScreen> createState() => _MarketplaceHomeScreenState();
}

class _MarketplaceHomeScreenState extends State<MarketplaceHomeScreen> {
  List<PropertyListing> _featuredListings = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFeaturedListings();
  }

  Future<void> _loadFeaturedListings() async {
    try {
      final results = await client.listing.searchListings(
        limit: 6,
        offset: 0,
      );
      if (!mounted) return;
      setState(() {
        _featuredListings = results;
        _isLoading = false;
      });
    } catch (_) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: RefreshIndicator(
        color: RoomioColors.primary,
        onRefresh: _loadFeaturedListings,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            // Welcome Hero Card
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [RoomioColors.navy, RoomioColors.navyLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: RoomioColors.navy.withValues(alpha: 0.18),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: RoomioColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.home_work_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Roomio Marketplace',
                        style: RoomioTypography.titleLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'What would you like to do today? Discover compatible flatmates, rent an apartment, buy residential property, or list with verified landlord tools.',
                    style: RoomioTypography.bodyMedium.copyWith(
                      color: Colors.white.withValues(alpha: 0.85),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // The 4 Major Services Header
            Text(
              'Explore Services',
              style: RoomioTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w700,
                color: isDark ? Colors.white : RoomioColors.navy,
              ),
            ),
            const SizedBox(height: 12),

            // 4 Major Service Grid
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 500;
                return GridView.count(
                  crossAxisCount: isWide ? 4 : 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: isWide ? 1.1 : 1.05,
                  children: [
                    // 1. Find Flatmates
                    _buildServiceCard(
                      icon: Icons.people_rounded,
                      title: 'Find Flatmates',
                      subtitle: 'Compare lifestyle habits and match',
                      color: RoomioColors.primary,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FlatmateDiscoveryScreen(
                              onOpenPreferences: widget.onOpenPreferences,
                            ),
                          ),
                        );
                      },
                    ),

                    // 2. Rent Property
                    _buildServiceCard(
                      icon: Icons.key_rounded,
                      title: 'Rent Property',
                      subtitle: 'Flats, houses & private rooms',
                      color: RoomioColors.mint,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PropertyDiscoveryScreen(
                              initialPurpose: 'rent',
                            ),
                          ),
                        );
                      },
                    ),

                    // 3. Buy Property
                    _buildServiceCard(
                      icon: Icons.sell_rounded,
                      title: 'Buy Property',
                      subtitle: 'Residential homes & guide prices',
                      color: RoomioColors.navy,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PropertyDiscoveryScreen(
                              initialPurpose: 'sale',
                            ),
                          ),
                        );
                      },
                    ),

                    // 4. Sell or List Property
                    _buildServiceCard(
                      icon: Icons.add_home_work_rounded,
                      title: 'Sell or List',
                      subtitle: 'Publish for rent or sale with verification',
                      color: RoomioColors.amber,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SellerDashboardScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 24),

            // Quick Access Strip
            Row(
              children: [
                Expanded(
                  child: _buildQuickActionButton(
                    icon: Icons.groups_rounded,
                    label: 'Team Up Rooms',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MatchingRoomsListScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildQuickActionButton(
                    icon: Icons.bookmark_rounded,
                    label: 'Saved Properties',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SavedPropertiesScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Featured Listings Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured Properties',
                  style: RoomioTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PropertyDiscoveryScreen(),
                      ),
                    );
                  },
                  child: const Text('See All'),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Featured Horizontal Cards
            if (_isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (_featuredListings.isNotEmpty)
              SizedBox(
                height: 230,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _featuredListings.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 14),
                  itemBuilder: (ctx, idx) {
                    final item = _featuredListings[idx];
                    final isSale = item.listingPurpose == 'sale';

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PropertyDetailScreen(listing: item),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: 220,
                        decoration: BoxDecoration(
                          color: isDark
                              ? RoomioColors.surfaceDark
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: RoomioColors.borderLight),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                              child: Container(
                                height: 110,
                                width: double.infinity,
                                color: RoomioColors.primaryContainer,
                                child: item.imageUrls.isNotEmpty
                                    ? Image.network(
                                        item.imageUrls.first,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const Icon(
                                                  Icons.apartment_rounded,
                                                  color: RoomioColors.primary,
                                                ),
                                      )
                                    : const Icon(
                                        Icons.apartment_rounded,
                                        color: RoomioColors.primary,
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    isSale
                                        ? '£${_formatCurrency(item.purchasePrice ?? 0)}'
                                        : '£${_formatCurrency(item.monthlyRent ?? 0)} / mo',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: isSale
                                          ? RoomioColors.navy
                                          : RoomioColors.primary,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    item.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${item.neighborhood}, ${item.city}',
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: RoomioColors.textSecondaryLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: RoomioColors.navy,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                color: RoomioColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        decoration: BoxDecoration(
          color: RoomioColors.primaryContainer.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: RoomioColors.primary.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: RoomioColors.primary),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: RoomioColors.navy,
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
