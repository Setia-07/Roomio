import 'package:serverpod/serverpod.dart';
import '../common/sample_data_seeder.dart';
import '../generated/protocol.dart';

class ListingEndpoint extends Endpoint {
  /// Creates a new property or room listing.
  Future<PropertyListing> createListing(
    Session session,
    PropertyListing listing,
  ) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    if (listing.title.trim().isEmpty) {
      throw RoomioException(
        message: 'Listing title cannot be empty',
        code: 400,
      );
    }
    final isSale = listing.listingPurpose == 'sale';
    if (isSale) {
      if (listing.purchasePrice == null || listing.purchasePrice! <= 0) {
        throw RoomioException(
          message: 'Sale price must be greater than 0',
          code: 400,
        );
      }
    } else {
      if (listing.monthlyRent == null || listing.monthlyRent! <= 0) {
        throw RoomioException(
          message: 'Monthly rent must be greater than 0',
          code: 400,
        );
      }
    }
    if (listing.city.trim().isEmpty) {
      throw RoomioException(message: 'City cannot be empty', code: 400);
    }

    final newListing = listing.copyWith(
      ownerUserId: authInfo.userIdentifier,
      title: listing.title.trim(),
      description: listing.description.trim(),
      city: listing.city.trim(),
      neighborhood: listing.neighborhood.trim(),
      listingPurpose: listing.listingPurpose ?? 'rent',
      verificationStatus: listing.verificationStatus ?? 'verified',
      isActive: true,
      createdAt: DateTime.now(),
    );

    return await PropertyListing.db.insertRow(session, newListing);
  }

  /// Updates an existing property listing. Only the owner can modify.
  Future<PropertyListing> updateListing(
    Session session,
    PropertyListing listing,
  ) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    if (listing.id == null) {
      throw RoomioException(message: 'Listing ID required', code: 400);
    }

    final existing = await PropertyListing.db.findById(session, listing.id!);
    if (existing == null) {
      throw RoomioException(message: 'Listing not found', code: 404);
    }

    if (existing.ownerUserId != authInfo.userIdentifier) {
      throw RoomioException(
        message: 'Unauthorized: You do not own this listing',
        code: 403,
      );
    }

    final updated = existing.copyWith(
      title: listing.title.trim(),
      description: listing.description.trim(),
      propertyType: listing.propertyType,
      roomType: listing.roomType,
      listingPurpose: listing.listingPurpose ?? existing.listingPurpose,
      monthlyRent: listing.monthlyRent,
      securityDeposit: listing.securityDeposit,
      purchasePrice: listing.purchasePrice,
      propertySizeSqFt: listing.propertySizeSqFt,
      tenure: listing.tenure,
      furnishingStatus: listing.furnishingStatus,
      city: listing.city.trim(),
      neighborhood: listing.neighborhood.trim(),
      approximateAddress: listing.approximateAddress.trim(),
      totalBedrooms: listing.totalBedrooms,
      totalBathrooms: listing.totalBathrooms,
      availableFrom: listing.availableFrom,
      imageUrls: listing.imageUrls,
      amenities: listing.amenities,
      houseRules: listing.houseRules,
      publisherRole: listing.publisherRole ?? existing.publisherRole,
      agencyName: listing.agencyName ?? existing.agencyName,
      contactPhone: listing.contactPhone ?? existing.contactPhone,
      contactEmail: listing.contactEmail ?? existing.contactEmail,
      verificationStatus:
          listing.verificationStatus ?? existing.verificationStatus,
      isActive: listing.isActive,
    );

    return await PropertyListing.db.updateRow(session, updated);
  }

  /// Deletes or deactivates a listing. Only the owner can delete.
  Future<bool> deleteListing(Session session, int listingId) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final existing = await PropertyListing.db.findById(session, listingId);
    if (existing == null) {
      throw RoomioException(message: 'Listing not found', code: 404);
    }

    if (existing.ownerUserId != authInfo.userIdentifier) {
      throw RoomioException(
        message: 'Unauthorized: You do not own this listing',
        code: 403,
      );
    }

    await PropertyListing.db.deleteRow(session, existing);
    return true;
  }

  /// Searches and filters property listings with pagination.
  Future<List<PropertyListing>> searchListings(
    Session session, {
    String? city,
    String? listingPurpose, // 'rent' or 'sale'
    int? maxRent,
    int? minPrice,
    int? maxPrice,
    String? propertyType,
    String? roomType,
    int? minBedrooms,
    int limit = 20,
    int offset = 0,
  }) async {
    await SampleDataSeeder.seedPropertiesIfEmpty(session);

    return await PropertyListing.db.find(
      session,
      where: (t) {
        var expression = t.isActive.equals(true);
        if (city != null && city.trim().isNotEmpty) {
          expression = expression & t.city.ilike(city.trim());
        }
        if (listingPurpose != null && listingPurpose.isNotEmpty) {
          expression = expression & t.listingPurpose.equals(listingPurpose);
        }
        if (maxRent != null && maxRent > 0) {
          expression = expression & (t.monthlyRent <= maxRent);
        }
        if (minPrice != null && minPrice > 0) {
          expression = expression & (t.purchasePrice >= minPrice);
        }
        if (maxPrice != null && maxPrice > 0) {
          expression = expression & (t.purchasePrice <= maxPrice);
        }
        if (propertyType != null && propertyType.isNotEmpty) {
          expression = expression & t.propertyType.equals(propertyType);
        }
        if (roomType != null && roomType.isNotEmpty) {
          expression = expression & t.roomType.equals(roomType);
        }
        if (minBedrooms != null && minBedrooms > 0) {
          expression = expression & (t.totalBedrooms >= minBedrooms);
        }
        return expression;
      },
      limit: limit.clamp(1, 100),
      offset: offset.clamp(0, 10000),
      orderBy: (t) => t.createdAt.desc(),
    );
  }

  /// Gets all listings created by the authenticated user.
  Future<List<PropertyListing>> getMyListings(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    return await PropertyListing.db.find(
      session,
      where: (t) => t.ownerUserId.equals(authInfo.userIdentifier),
      orderBy: (t) => t.createdAt.desc(),
    );
  }

  /// Gets listing details by ID. Only active listings are publicly visible.
  Future<PropertyListing?> getListingDetails(
    Session session,
    int listingId,
  ) async {
    final listing = await PropertyListing.db.findById(session, listingId);
    if (listing == null) return null;

    if (!listing.isActive) {
      final authInfo = session.authenticated;
      if (authInfo == null || authInfo.userIdentifier != listing.ownerUserId) {
        return null;
      }
    }
    return listing;
  }
}
