/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:roomio_app_client/src/protocol/protocol.dart' as _icvivhec;
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class PropertyListing
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  PropertyListing._({
    this.id,
    required this.ownerUserId,
    required this.title,
    required this.description,
    required this.propertyType,
    this.roomType,
    this.listingPurpose,
    this.monthlyRent,
    this.securityDeposit,
    this.purchasePrice,
    this.propertySizeSqFt,
    this.tenure,
    this.furnishingStatus,
    required this.city,
    required this.neighborhood,
    required this.approximateAddress,
    required this.totalBedrooms,
    required this.totalBathrooms,
    this.availableFrom,
    required this.imageUrls,
    required this.amenities,
    this.houseRules,
    this.publisherRole,
    this.agencyName,
    this.contactPhone,
    this.contactEmail,
    this.verificationStatus,
    required this.isActive,
    required this.createdAt,
  });

  factory PropertyListing({
    int? id,
    required String ownerUserId,
    required String title,
    required String description,
    required String propertyType,
    String? roomType,
    String? listingPurpose,
    int? monthlyRent,
    int? securityDeposit,
    int? purchasePrice,
    int? propertySizeSqFt,
    String? tenure,
    String? furnishingStatus,
    required String city,
    required String neighborhood,
    required String approximateAddress,
    required int totalBedrooms,
    required int totalBathrooms,
    DateTime? availableFrom,
    required List<String> imageUrls,
    required List<String> amenities,
    List<String>? houseRules,
    String? publisherRole,
    String? agencyName,
    String? contactPhone,
    String? contactEmail,
    String? verificationStatus,
    required bool isActive,
    required DateTime createdAt,
  }) = _PropertyListingImpl;

  factory PropertyListing.fromJson(Map<String, dynamic> jsonSerialization) {
    return PropertyListing(
      id: jsonSerialization['id'] as int?,
      ownerUserId: jsonSerialization['ownerUserId'] as String,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      propertyType: jsonSerialization['propertyType'] as String,
      roomType: jsonSerialization['roomType'] as String?,
      listingPurpose: jsonSerialization['listingPurpose'] as String?,
      monthlyRent: jsonSerialization['monthlyRent'] as int?,
      securityDeposit: jsonSerialization['securityDeposit'] as int?,
      purchasePrice: jsonSerialization['purchasePrice'] as int?,
      propertySizeSqFt: jsonSerialization['propertySizeSqFt'] as int?,
      tenure: jsonSerialization['tenure'] as String?,
      furnishingStatus: jsonSerialization['furnishingStatus'] as String?,
      city: jsonSerialization['city'] as String,
      neighborhood: jsonSerialization['neighborhood'] as String,
      approximateAddress: jsonSerialization['approximateAddress'] as String,
      totalBedrooms: jsonSerialization['totalBedrooms'] as int,
      totalBathrooms: jsonSerialization['totalBathrooms'] as int,
      availableFrom: jsonSerialization['availableFrom'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['availableFrom'],
            ),
      imageUrls: _icvivhec.Protocol().deserialize<List<String>>(
        jsonSerialization['imageUrls'],
      ),
      amenities: _icvivhec.Protocol().deserialize<List<String>>(
        jsonSerialization['amenities'],
      ),
      houseRules: jsonSerialization['houseRules'] == null
          ? null
          : _icvivhec.Protocol().deserialize<List<String>>(
              jsonSerialization['houseRules'],
            ),
      publisherRole: jsonSerialization['publisherRole'] as String?,
      agencyName: jsonSerialization['agencyName'] as String?,
      contactPhone: jsonSerialization['contactPhone'] as String?,
      contactEmail: jsonSerialization['contactEmail'] as String?,
      verificationStatus: jsonSerialization['verificationStatus'] as String?,
      isActive: _isc.BoolJsonExtension.fromJson(jsonSerialization['isActive']),
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String ownerUserId;

  String title;

  String description;

  String propertyType;

  String? roomType;

  String? listingPurpose;

  int? monthlyRent;

  int? securityDeposit;

  int? purchasePrice;

  int? propertySizeSqFt;

  String? tenure;

  String? furnishingStatus;

  String city;

  String neighborhood;

  String approximateAddress;

  int totalBedrooms;

  int totalBathrooms;

  DateTime? availableFrom;

  List<String> imageUrls;

  List<String> amenities;

  List<String>? houseRules;

  String? publisherRole;

  String? agencyName;

  String? contactPhone;

  String? contactEmail;

  String? verificationStatus;

  bool isActive;

  DateTime createdAt;

  /// Returns a shallow copy of this [PropertyListing]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  PropertyListing copyWith({
    int? id,
    String? ownerUserId,
    String? title,
    String? description,
    String? propertyType,
    String? roomType,
    String? listingPurpose,
    int? monthlyRent,
    int? securityDeposit,
    int? purchasePrice,
    int? propertySizeSqFt,
    String? tenure,
    String? furnishingStatus,
    String? city,
    String? neighborhood,
    String? approximateAddress,
    int? totalBedrooms,
    int? totalBathrooms,
    DateTime? availableFrom = const _isc.$UndefinedDateTime(),
    List<String>? imageUrls,
    List<String>? amenities,
    List<String>? houseRules = const _isc.$UndefinedList<String>(),
    String? publisherRole,
    String? agencyName,
    String? contactPhone,
    String? contactEmail,
    String? verificationStatus,
    bool? isActive,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PropertyListing',
      if (id != null) 'id': id,
      'ownerUserId': ownerUserId,
      'title': title,
      'description': description,
      'propertyType': propertyType,
      if (roomType != null) 'roomType': roomType,
      if (listingPurpose != null) 'listingPurpose': listingPurpose,
      if (monthlyRent != null) 'monthlyRent': monthlyRent,
      if (securityDeposit != null) 'securityDeposit': securityDeposit,
      if (purchasePrice != null) 'purchasePrice': purchasePrice,
      if (propertySizeSqFt != null) 'propertySizeSqFt': propertySizeSqFt,
      if (tenure != null) 'tenure': tenure,
      if (furnishingStatus != null) 'furnishingStatus': furnishingStatus,
      'city': city,
      'neighborhood': neighborhood,
      'approximateAddress': approximateAddress,
      'totalBedrooms': totalBedrooms,
      'totalBathrooms': totalBathrooms,
      if (availableFrom != null) 'availableFrom': availableFrom?.toJson(),
      'imageUrls': imageUrls.toJson(),
      'amenities': amenities.toJson(),
      if (houseRules != null) 'houseRules': houseRules?.toJson(),
      if (publisherRole != null) 'publisherRole': publisherRole,
      if (agencyName != null) 'agencyName': agencyName,
      if (contactPhone != null) 'contactPhone': contactPhone,
      if (contactEmail != null) 'contactEmail': contactEmail,
      if (verificationStatus != null) 'verificationStatus': verificationStatus,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PropertyListing',
      if (id != null) 'id': id,
      'ownerUserId': ownerUserId,
      'title': title,
      'description': description,
      'propertyType': propertyType,
      if (roomType != null) 'roomType': roomType,
      if (listingPurpose != null) 'listingPurpose': listingPurpose,
      if (monthlyRent != null) 'monthlyRent': monthlyRent,
      if (securityDeposit != null) 'securityDeposit': securityDeposit,
      if (purchasePrice != null) 'purchasePrice': purchasePrice,
      if (propertySizeSqFt != null) 'propertySizeSqFt': propertySizeSqFt,
      if (tenure != null) 'tenure': tenure,
      if (furnishingStatus != null) 'furnishingStatus': furnishingStatus,
      'city': city,
      'neighborhood': neighborhood,
      'approximateAddress': approximateAddress,
      'totalBedrooms': totalBedrooms,
      'totalBathrooms': totalBathrooms,
      if (availableFrom != null) 'availableFrom': availableFrom?.toJson(),
      'imageUrls': imageUrls.toJson(),
      'amenities': amenities.toJson(),
      if (houseRules != null) 'houseRules': houseRules?.toJson(),
      if (publisherRole != null) 'publisherRole': publisherRole,
      if (agencyName != null) 'agencyName': agencyName,
      if (contactPhone != null) 'contactPhone': contactPhone,
      if (contactEmail != null) 'contactEmail': contactEmail,
      if (verificationStatus != null) 'verificationStatus': verificationStatus,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PropertyListingImpl extends PropertyListing {
  _PropertyListingImpl({
    int? id,
    required String ownerUserId,
    required String title,
    required String description,
    required String propertyType,
    String? roomType,
    String? listingPurpose,
    int? monthlyRent,
    int? securityDeposit,
    int? purchasePrice,
    int? propertySizeSqFt,
    String? tenure,
    String? furnishingStatus,
    required String city,
    required String neighborhood,
    required String approximateAddress,
    required int totalBedrooms,
    required int totalBathrooms,
    DateTime? availableFrom,
    required List<String> imageUrls,
    required List<String> amenities,
    List<String>? houseRules,
    String? publisherRole,
    String? agencyName,
    String? contactPhone,
    String? contactEmail,
    String? verificationStatus,
    required bool isActive,
    required DateTime createdAt,
  }) : super._(
         id: id,
         ownerUserId: ownerUserId,
         title: title,
         description: description,
         propertyType: propertyType,
         roomType: roomType,
         listingPurpose: listingPurpose,
         monthlyRent: monthlyRent,
         securityDeposit: securityDeposit,
         purchasePrice: purchasePrice,
         propertySizeSqFt: propertySizeSqFt,
         tenure: tenure,
         furnishingStatus: furnishingStatus,
         city: city,
         neighborhood: neighborhood,
         approximateAddress: approximateAddress,
         totalBedrooms: totalBedrooms,
         totalBathrooms: totalBathrooms,
         availableFrom: availableFrom,
         imageUrls: imageUrls,
         amenities: amenities,
         houseRules: houseRules,
         publisherRole: publisherRole,
         agencyName: agencyName,
         contactPhone: contactPhone,
         contactEmail: contactEmail,
         verificationStatus: verificationStatus,
         isActive: isActive,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [PropertyListing]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  PropertyListing copyWith({
    Object? id = _Undefined,
    String? ownerUserId,
    String? title,
    String? description,
    String? propertyType,
    Object? roomType = _Undefined,
    Object? listingPurpose = _Undefined,
    Object? monthlyRent = _Undefined,
    Object? securityDeposit = _Undefined,
    Object? purchasePrice = _Undefined,
    Object? propertySizeSqFt = _Undefined,
    Object? tenure = _Undefined,
    Object? furnishingStatus = _Undefined,
    String? city,
    String? neighborhood,
    String? approximateAddress,
    int? totalBedrooms,
    int? totalBathrooms,
    DateTime? availableFrom = const _isc.$UndefinedDateTime(),
    List<String>? imageUrls,
    List<String>? amenities,
    List<String>? houseRules = const _isc.$UndefinedList<String>(),
    Object? publisherRole = _Undefined,
    Object? agencyName = _Undefined,
    Object? contactPhone = _Undefined,
    Object? contactEmail = _Undefined,
    Object? verificationStatus = _Undefined,
    bool? isActive,
    DateTime? createdAt,
  }) {
    return PropertyListing(
      id: id is int? ? id : this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      title: title ?? this.title,
      description: description ?? this.description,
      propertyType: propertyType ?? this.propertyType,
      roomType: roomType is String? ? roomType : this.roomType,
      listingPurpose: listingPurpose is String?
          ? listingPurpose
          : this.listingPurpose,
      monthlyRent: monthlyRent is int? ? monthlyRent : this.monthlyRent,
      securityDeposit: securityDeposit is int?
          ? securityDeposit
          : this.securityDeposit,
      purchasePrice: purchasePrice is int? ? purchasePrice : this.purchasePrice,
      propertySizeSqFt: propertySizeSqFt is int?
          ? propertySizeSqFt
          : this.propertySizeSqFt,
      tenure: tenure is String? ? tenure : this.tenure,
      furnishingStatus: furnishingStatus is String?
          ? furnishingStatus
          : this.furnishingStatus,
      city: city ?? this.city,
      neighborhood: neighborhood ?? this.neighborhood,
      approximateAddress: approximateAddress ?? this.approximateAddress,
      totalBedrooms: totalBedrooms ?? this.totalBedrooms,
      totalBathrooms: totalBathrooms ?? this.totalBathrooms,
      availableFrom: availableFrom is _isc.UndefinedSentinel
          ? this.availableFrom
          : availableFrom,
      imageUrls: imageUrls ?? this.imageUrls.map((e0) => e0).toList(),
      amenities: amenities ?? this.amenities.map((e0) => e0).toList(),
      houseRules: houseRules is _isc.UndefinedSentinel
          ? this.houseRules?.map((e0) => e0).toList()
          : houseRules,
      publisherRole: publisherRole is String?
          ? publisherRole
          : this.publisherRole,
      agencyName: agencyName is String? ? agencyName : this.agencyName,
      contactPhone: contactPhone is String? ? contactPhone : this.contactPhone,
      contactEmail: contactEmail is String? ? contactEmail : this.contactEmail,
      verificationStatus: verificationStatus is String?
          ? verificationStatus
          : this.verificationStatus,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
