import 'package:flutter/material.dart';
import 'package:roomio_app_client/roomio_app_client.dart';
import '../../client.dart';
import '../../theme/roomio_theme.dart';
import '../../widgets/flatmate_card_widget.dart';
import '../../widgets/roomio_button.dart';

class FlatmateDiscoveryScreen extends StatefulWidget {
  final VoidCallback? onOpenPreferences;

  const FlatmateDiscoveryScreen({
    super.key,
    this.onOpenPreferences,
  });

  @override
  State<FlatmateDiscoveryScreen> createState() =>
      _FlatmateDiscoveryScreenState();
}

class _FlatmateDiscoveryScreenState extends State<FlatmateDiscoveryScreen> {
  bool _isLoading = true;
  String? _errorMessage;
  List<FlatmateCard> _cards = [];
  final Set<String> _bookmarkedUserIds = {};
  String _selectedCity = 'All';

  final List<String> _cities = [
    'All',
    'London',
    'Manchester',
    'Bristol',
    'Birmingham',
  ];

  @override
  void initState() {
    super.initState();
    _loadFlatmates();
  }

  Future<void> _loadFlatmates() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final cityFilter = _selectedCity == 'All' ? null : _selectedCity;
      final results = await client.matching.findFlatmates(
        city: cityFilter,
        limit: 30,
        offset: 0,
      );

      setState(() {
        _cards = results;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleBookmark(String targetUserId) async {
    try {
      final isSaved = await client.saved.toggleSaveFlatmate(targetUserId);
      if (!mounted) return;
      setState(() {
        if (isSaved) {
          _bookmarkedUserIds.add(targetUserId);
        } else {
          _bookmarkedUserIds.remove(targetUserId);
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isSaved
                ? 'Flatmate saved to your shortlists!'
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
          content: Text('Failed to update bookmark: $e'),
          backgroundColor: RoomioColors.rose,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RoomioColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar / Search Header
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Discover Flatmates',
                            style: RoomioTypography.displayMedium.copyWith(
                              fontSize: 22,
                              color: RoomioColors.navy,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Matched by your weighted lifestyle habits',
                            style: RoomioTypography.bodyMedium.copyWith(
                              color: RoomioColors.textSecondaryLight,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: _loadFlatmates,
                        tooltip: 'Refresh Matches',
                        icon: const Icon(
                          Icons.refresh_rounded,
                          color: RoomioColors.navy,
                        ),
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
                          child: FilterChip(
                            selected: isSelected,
                            label: Text(city),
                            labelStyle: RoomioTypography.labelBold.copyWith(
                              fontSize: 12,
                              color: isSelected
                                  ? Colors.white
                                  : RoomioColors.textSecondaryLight,
                            ),
                            selectedColor: RoomioColors.primary,
                            backgroundColor: RoomioColors.backgroundLight,
                            side: BorderSide(
                              color: isSelected
                                  ? RoomioColors.primary
                                  : RoomioColors.borderLight,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            showCheckmark: false,
                            onSelected: (_) {
                              setState(() => _selectedCity = city);
                              _loadFlatmates();
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: RoomioColors.borderLight),

            // Content Area (Handling 4 UX States)
            Expanded(
              child: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    // 1. Loading State
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(RoomioColors.primary),
            ),
            SizedBox(height: 16),
            Text(
              'Finding compatible flatmates...',
              style: TextStyle(color: RoomioColors.textSecondaryLight),
            ),
          ],
        ),
      );
    }

    // 2. Error State
    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: RoomioColors.roseContainer,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.error_outline_rounded,
                  color: RoomioColors.rose,
                  size: 40,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Could not load flatmates',
                style: RoomioTypography.titleLarge.copyWith(
                  color: RoomioColors.navy,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _errorMessage!,
                textAlign: TextAlign.center,
                style: RoomioTypography.bodyMedium.copyWith(
                  color: RoomioColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 20),
              RoomioButton(
                text: 'Try Again',
                width: 140,
                onPressed: _loadFlatmates,
              ),
            ],
          ),
        ),
      );
    }

    // 3. Empty State
    if (_cards.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: RoomioColors.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.people_alt_outlined,
                  color: RoomioColors.primary,
                  size: 44,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'No Matching Flatmates Found',
                textAlign: TextAlign.center,
                style: RoomioTypography.titleLarge.copyWith(
                  color: RoomioColors.navy,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'No candidate flatmates match your non-negotiables in $_selectedCity right now. Try adjusting your preferences or switching cities.',
                textAlign: TextAlign.center,
                style: RoomioTypography.bodyMedium.copyWith(
                  color: RoomioColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 24),
              if (widget.onOpenPreferences != null)
                RoomioButton(
                  text: 'Edit Lifestyle Preferences',
                  variant: RoomioButtonVariant.outline,
                  width: 240,
                  onPressed: widget.onOpenPreferences,
                ),
            ],
          ),
        ),
      );
    }

    // 4. Success State (Ranked List of Compatibility Cards)
    return RefreshIndicator(
      onRefresh: _loadFlatmates,
      color: RoomioColors.primary,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          final card = _cards[index];
          final targetUserId = card.profile.userId;

          return FlatmateCardWidget(
            card: card,
            isBookmarked: _bookmarkedUserIds.contains(targetUserId),
            onBookmark: () => _toggleBookmark(targetUserId),
            onConnect: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Connection request sent to ${card.profile.displayName}!',
                  ),
                  backgroundColor: RoomioColors.mint,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
