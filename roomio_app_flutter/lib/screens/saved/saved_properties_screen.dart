import 'package:flutter/material.dart';
import 'package:roomio_app_client/roomio_app_client.dart';
import '../../client.dart';
import '../../theme/roomio_theme.dart';
import '../properties/property_detail_screen.dart';

class SavedPropertiesScreen extends StatefulWidget {
  const SavedPropertiesScreen({super.key});

  @override
  State<SavedPropertiesScreen> createState() => _SavedPropertiesScreenState();
}

class _SavedPropertiesScreenState extends State<SavedPropertiesScreen> {
  bool _isLoading = true;
  String? _errorMessage;
  List<PropertyListing> _savedListings = [];
  String _filterPurpose = 'all'; // 'all', 'rent', 'sale'

  @override
  void initState() {
    super.initState();
    _loadSaved();
  }

  Future<void> _loadSaved() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final results = await client.saved.getMySavedListings();
      if (!mounted) return;
      setState(() {
        _savedListings = results;
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

  Future<void> _removeBookmark(int listingId) async {
    try {
      await client.saved.toggleSaveListing(listingId);
      _loadSaved();
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final filtered = _savedListings.where((l) {
      if (_filterPurpose == 'rent') return l.listingPurpose != 'sale';
      if (_filterPurpose == 'sale') return l.listingPurpose == 'sale';
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Properties'),
      ),
      body: RefreshIndicator(
        color: RoomioColors.primary,
        onRefresh: _loadSaved,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Filter Chips
            Row(
              children: [
                _buildFilterChip('all', 'All (${_savedListings.length})'),
                const SizedBox(width: 8),
                _buildFilterChip('rent', 'Rentals'),
                const SizedBox(width: 8),
                _buildFilterChip('sale', 'For Sale'),
              ],
            ),
            const SizedBox(height: 16),

            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(60),
                child: Center(
                  child: CircularProgressIndicator(color: RoomioColors.primary),
                ),
              )
            else if (_errorMessage != null)
              Center(child: Text('Error: $_errorMessage'))
            else if (filtered.isEmpty)
              _buildEmptyState(isDark)
            else
              ...filtered.map((item) => _buildSavedCard(item, isDark)),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String key, String label) {
    final isSelected = _filterPurpose == key;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: RoomioColors.primaryContainer,
      labelStyle: TextStyle(
        color: isSelected ? RoomioColors.primary : RoomioColors.navy,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
      ),
      onSelected: (_) => setState(() => _filterPurpose = key),
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
            Icons.bookmark_border_rounded,
            size: 48,
            color: RoomioColors.primary,
          ),
          const SizedBox(height: 16),
          Text('No saved properties yet', style: RoomioTypography.titleMedium),
          const SizedBox(height: 8),
          Text(
            'Explore flats and homes and tap the bookmark icon to save your favorites here.',
            textAlign: TextAlign.center,
            style: TextStyle(color: RoomioColors.textSecondaryLight),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedCard(PropertyListing listing, bool isDark) {
    final isSale = listing.listingPurpose == 'sale';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDark ? RoomioColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: RoomioColors.borderLight),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 64,
            height: 64,
            color: RoomioColors.primaryContainer,
            child: listing.imageUrls.isNotEmpty
                ? Image.network(
                    listing.imageUrls.first,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
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
        title: Text(
          listing.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              '${listing.neighborhood}, ${listing.city}',
              style: const TextStyle(
                fontSize: 12,
                color: RoomioColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              isSale
                  ? '£${_formatCurrency(listing.purchasePrice ?? 0)}'
                  : '£${_formatCurrency(listing.monthlyRent ?? 0)} / mo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSale ? RoomioColors.navy : RoomioColors.primary,
                fontSize: 13,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.bookmark_rounded, color: RoomioColors.primary),
          tooltip: 'Remove',
          onPressed: () => _removeBookmark(listing.id!),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PropertyDetailScreen(
                listing: listing,
                isSaved: true,
                onToggleSave: _loadSaved,
              ),
            ),
          );
        },
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
