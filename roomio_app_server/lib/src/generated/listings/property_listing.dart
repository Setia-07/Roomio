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
import 'dart:async' as _ida;
import 'package:roomio_app_server/src/generated/protocol.dart' as _ivuzlq4e;
import 'package:serverpod/serverpod.dart' as _is;

abstract class PropertyListing
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['availableFrom'],
            ),
      imageUrls: _ivuzlq4e.Protocol().deserialize<List<String>>(
        jsonSerialization['imageUrls'],
      ),
      amenities: _ivuzlq4e.Protocol().deserialize<List<String>>(
        jsonSerialization['amenities'],
      ),
      houseRules: jsonSerialization['houseRules'] == null
          ? null
          : _ivuzlq4e.Protocol().deserialize<List<String>>(
              jsonSerialization['houseRules'],
            ),
      publisherRole: jsonSerialization['publisherRole'] as String?,
      agencyName: jsonSerialization['agencyName'] as String?,
      contactPhone: jsonSerialization['contactPhone'] as String?,
      contactEmail: jsonSerialization['contactEmail'] as String?,
      verificationStatus: jsonSerialization['verificationStatus'] as String?,
      isActive: _is.BoolJsonExtension.fromJson(jsonSerialization['isActive']),
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = PropertyListingTable();

  static const db = PropertyListingRepository._();

  @override
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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [PropertyListing]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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
    DateTime? availableFrom = const _is.$UndefinedDateTime(),
    List<String>? imageUrls,
    List<String>? amenities,
    List<String>? houseRules = const _is.$UndefinedList<String>(),
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

  static PropertyListingInclude include() {
    return PropertyListingInclude._();
  }

  static PropertyListingIncludeList includeList({
    _is.WhereExpressionBuilder<PropertyListingTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PropertyListingTable>? orderBy,
    _is.OrderByListBuilder<PropertyListingTable>? orderByList,
    PropertyListingInclude? include,
  }) {
    return PropertyListingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PropertyListing.t),
      orderByList: orderByList?.call(PropertyListing.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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
    DateTime? availableFrom = const _is.$UndefinedDateTime(),
    List<String>? imageUrls,
    List<String>? amenities,
    List<String>? houseRules = const _is.$UndefinedList<String>(),
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
      availableFrom: availableFrom is _is.UndefinedSentinel
          ? this.availableFrom
          : availableFrom,
      imageUrls: imageUrls ?? this.imageUrls.map((e0) => e0).toList(),
      amenities: amenities ?? this.amenities.map((e0) => e0).toList(),
      houseRules: houseRules is _is.UndefinedSentinel
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

class PropertyListingUpdateTable extends _is.UpdateTable<PropertyListingTable> {
  PropertyListingUpdateTable(super.table);

  _is.ColumnValue<String, String> ownerUserId(String value) => _is.ColumnValue(
    table.ownerUserId,
    value,
  );

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
    table.title,
    value,
  );

  _is.ColumnValue<String, String> description(String value) => _is.ColumnValue(
    table.description,
    value,
  );

  _is.ColumnValue<String, String> propertyType(String value) => _is.ColumnValue(
    table.propertyType,
    value,
  );

  _is.ColumnValue<String, String> roomType(String? value) => _is.ColumnValue(
    table.roomType,
    value,
  );

  _is.ColumnValue<String, String> listingPurpose(String? value) =>
      _is.ColumnValue(
        table.listingPurpose,
        value,
      );

  _is.ColumnValue<int, int> monthlyRent(int? value) => _is.ColumnValue(
    table.monthlyRent,
    value,
  );

  _is.ColumnValue<int, int> securityDeposit(int? value) => _is.ColumnValue(
    table.securityDeposit,
    value,
  );

  _is.ColumnValue<int, int> purchasePrice(int? value) => _is.ColumnValue(
    table.purchasePrice,
    value,
  );

  _is.ColumnValue<int, int> propertySizeSqFt(int? value) => _is.ColumnValue(
    table.propertySizeSqFt,
    value,
  );

  _is.ColumnValue<String, String> tenure(String? value) => _is.ColumnValue(
    table.tenure,
    value,
  );

  _is.ColumnValue<String, String> furnishingStatus(String? value) =>
      _is.ColumnValue(
        table.furnishingStatus,
        value,
      );

  _is.ColumnValue<String, String> city(String value) => _is.ColumnValue(
    table.city,
    value,
  );

  _is.ColumnValue<String, String> neighborhood(String value) => _is.ColumnValue(
    table.neighborhood,
    value,
  );

  _is.ColumnValue<String, String> approximateAddress(String value) =>
      _is.ColumnValue(
        table.approximateAddress,
        value,
      );

  _is.ColumnValue<int, int> totalBedrooms(int value) => _is.ColumnValue(
    table.totalBedrooms,
    value,
  );

  _is.ColumnValue<int, int> totalBathrooms(int value) => _is.ColumnValue(
    table.totalBathrooms,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> availableFrom(DateTime? value) =>
      _is.ColumnValue(
        table.availableFrom,
        value,
      );

  _is.ColumnValue<List<String>, List<String>> imageUrls(List<String> value) =>
      _is.ColumnValue(
        table.imageUrls,
        value,
      );

  _is.ColumnValue<List<String>, List<String>> amenities(List<String> value) =>
      _is.ColumnValue(
        table.amenities,
        value,
      );

  _is.ColumnValue<List<String>, List<String>> houseRules(List<String>? value) =>
      _is.ColumnValue(
        table.houseRules,
        value,
      );

  _is.ColumnValue<String, String> publisherRole(String? value) =>
      _is.ColumnValue(
        table.publisherRole,
        value,
      );

  _is.ColumnValue<String, String> agencyName(String? value) => _is.ColumnValue(
    table.agencyName,
    value,
  );

  _is.ColumnValue<String, String> contactPhone(String? value) =>
      _is.ColumnValue(
        table.contactPhone,
        value,
      );

  _is.ColumnValue<String, String> contactEmail(String? value) =>
      _is.ColumnValue(
        table.contactEmail,
        value,
      );

  _is.ColumnValue<String, String> verificationStatus(String? value) =>
      _is.ColumnValue(
        table.verificationStatus,
        value,
      );

  _is.ColumnValue<bool, bool> isActive(bool value) => _is.ColumnValue(
    table.isActive,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class PropertyListingTable extends _is.Table<int?> {
  PropertyListingTable({super.tableRelation})
    : super(tableName: 'property_listing') {
    updateTable = PropertyListingUpdateTable(this);
    ownerUserId = _is.ColumnString(
      'ownerUserId',
      this,
    );
    title = _is.ColumnString(
      'title',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    propertyType = _is.ColumnString(
      'propertyType',
      this,
    );
    roomType = _is.ColumnString(
      'roomType',
      this,
    );
    listingPurpose = _is.ColumnString(
      'listingPurpose',
      this,
    );
    monthlyRent = _is.ColumnInt(
      'monthlyRent',
      this,
    );
    securityDeposit = _is.ColumnInt(
      'securityDeposit',
      this,
    );
    purchasePrice = _is.ColumnInt(
      'purchasePrice',
      this,
    );
    propertySizeSqFt = _is.ColumnInt(
      'propertySizeSqFt',
      this,
    );
    tenure = _is.ColumnString(
      'tenure',
      this,
    );
    furnishingStatus = _is.ColumnString(
      'furnishingStatus',
      this,
    );
    city = _is.ColumnString(
      'city',
      this,
    );
    neighborhood = _is.ColumnString(
      'neighborhood',
      this,
    );
    approximateAddress = _is.ColumnString(
      'approximateAddress',
      this,
    );
    totalBedrooms = _is.ColumnInt(
      'totalBedrooms',
      this,
    );
    totalBathrooms = _is.ColumnInt(
      'totalBathrooms',
      this,
    );
    availableFrom = _is.ColumnDateTime(
      'availableFrom',
      this,
    );
    imageUrls = _is.ColumnSerializable<List<String>>(
      'imageUrls',
      this,
    );
    amenities = _is.ColumnSerializable<List<String>>(
      'amenities',
      this,
    );
    houseRules = _is.ColumnSerializable<List<String>>(
      'houseRules',
      this,
    );
    publisherRole = _is.ColumnString(
      'publisherRole',
      this,
    );
    agencyName = _is.ColumnString(
      'agencyName',
      this,
    );
    contactPhone = _is.ColumnString(
      'contactPhone',
      this,
    );
    contactEmail = _is.ColumnString(
      'contactEmail',
      this,
    );
    verificationStatus = _is.ColumnString(
      'verificationStatus',
      this,
    );
    isActive = _is.ColumnBool(
      'isActive',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final PropertyListingUpdateTable updateTable;

  late final _is.ColumnString ownerUserId;

  late final _is.ColumnString title;

  late final _is.ColumnString description;

  late final _is.ColumnString propertyType;

  late final _is.ColumnString roomType;

  late final _is.ColumnString listingPurpose;

  late final _is.ColumnInt monthlyRent;

  late final _is.ColumnInt securityDeposit;

  late final _is.ColumnInt purchasePrice;

  late final _is.ColumnInt propertySizeSqFt;

  late final _is.ColumnString tenure;

  late final _is.ColumnString furnishingStatus;

  late final _is.ColumnString city;

  late final _is.ColumnString neighborhood;

  late final _is.ColumnString approximateAddress;

  late final _is.ColumnInt totalBedrooms;

  late final _is.ColumnInt totalBathrooms;

  late final _is.ColumnDateTime availableFrom;

  late final _is.ColumnSerializable<List<String>> imageUrls;

  late final _is.ColumnSerializable<List<String>> amenities;

  late final _is.ColumnSerializable<List<String>> houseRules;

  late final _is.ColumnString publisherRole;

  late final _is.ColumnString agencyName;

  late final _is.ColumnString contactPhone;

  late final _is.ColumnString contactEmail;

  late final _is.ColumnString verificationStatus;

  late final _is.ColumnBool isActive;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    ownerUserId,
    title,
    description,
    propertyType,
    roomType,
    listingPurpose,
    monthlyRent,
    securityDeposit,
    purchasePrice,
    propertySizeSqFt,
    tenure,
    furnishingStatus,
    city,
    neighborhood,
    approximateAddress,
    totalBedrooms,
    totalBathrooms,
    availableFrom,
    imageUrls,
    amenities,
    houseRules,
    publisherRole,
    agencyName,
    contactPhone,
    contactEmail,
    verificationStatus,
    isActive,
    createdAt,
  ];
}

class PropertyListingInclude extends _is.IncludeObject {
  PropertyListingInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => PropertyListing.t;
}

class PropertyListingIncludeList extends _is.IncludeList {
  PropertyListingIncludeList._({
    _is.WhereExpressionBuilder<PropertyListingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PropertyListing.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => PropertyListing.t;
}

class PropertyListingRepository {
  const PropertyListingRepository._();

  /// Returns a list of [PropertyListing]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<PropertyListing>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PropertyListingTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PropertyListingTable>? orderBy,
    _is.OrderByListBuilder<PropertyListingTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<PropertyListing>(
      where: where?.call(PropertyListing.t),
      orderBy: orderBy?.call(PropertyListing.t),
      orderByList: orderByList?.call(PropertyListing.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [PropertyListing]s matching the given query parameters every time the
  /// source tables are modified.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// Use [throttle] to specify the minimum interval between queries. It can
  /// also be set to `null`, in which case the stream will only be throttled
  /// when its subscription is paused.
  ///
  /// Source tables are collected from the queried table, [where], [orderBy],
  /// [orderByList], and the [include] graph. [alsoTriggerOnTables] is added
  /// to that set. Pass [Table] instances such as `PropertyListing.t`.
  ///
  /// Raw [Expression] SQL is not inspected. Tables referenced only in raw
  /// SQL must be passed via [alsoTriggerOnTables].
  ///
  /// The stream always reads committed state and never joins an ambient
  /// [Transaction]. Emissions for a write fire after that write commits.
  ///
  /// Currently only supported on SQLite. Calling this method on PostgreSQL
  /// throws an [UnsupportedError].
  ///
  /// ```dart
  /// var subscription = Persons.db.watch(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// ).listen((persons) {
  ///   // Handle the latest matching rows.
  /// });
  /// ```
  _ida.Stream<List<PropertyListing>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PropertyListingTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PropertyListingTable>? orderBy,
    _is.OrderByListBuilder<PropertyListingTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<PropertyListing>(
      where: where?.call(PropertyListing.t),
      orderBy: orderBy?.call(PropertyListing.t),
      orderByList: orderByList?.call(PropertyListing.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [PropertyListing] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<PropertyListing?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PropertyListingTable>? where,
    int? offset,
    _is.OrderByBuilder<PropertyListingTable>? orderBy,
    _is.OrderByListBuilder<PropertyListingTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<PropertyListing>(
      where: where?.call(PropertyListing.t),
      orderBy: orderBy?.call(PropertyListing.t),
      orderByList: orderByList?.call(PropertyListing.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [PropertyListing] by its [id] or null if no such row exists.
  Future<PropertyListing?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<PropertyListing>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [PropertyListing]s in the list and returns the inserted rows.
  ///
  /// The returned [PropertyListing]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PropertyListing>> insert(
    _is.DatabaseSession session,
    List<PropertyListing> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<PropertyListing>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [PropertyListing] and returns the inserted row.
  ///
  /// The returned [PropertyListing] will have its `id` field set.
  Future<PropertyListing> insertRow(
    _is.DatabaseSession session,
    PropertyListing row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<PropertyListing>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [PropertyListing]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [PropertyListing]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PropertyListing>> upsert(
    _is.DatabaseSession session,
    List<PropertyListing> rows, {
    required _is.ColumnSelections<PropertyListingTable> conflictColumns,
    _is.ColumnSelections<PropertyListingTable>? updateColumns,
    _is.WhereExpressionBuilder<PropertyListingTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<PropertyListing>(
      rows,
      conflictColumns: conflictColumns(PropertyListing.t),
      updateColumns: updateColumns?.call(PropertyListing.t),
      updateWhere: updateWhere?.call(PropertyListing.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [PropertyListing] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [PropertyListing] will have its `id` field set.
  Future<PropertyListing?> upsertRow(
    _is.DatabaseSession session,
    PropertyListing row, {
    required _is.ColumnSelections<PropertyListingTable> conflictColumns,
    _is.ColumnSelections<PropertyListingTable>? updateColumns,
    _is.WhereExpressionBuilder<PropertyListingTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<PropertyListing>(
      row,
      conflictColumns: conflictColumns(PropertyListing.t),
      updateColumns: updateColumns?.call(PropertyListing.t),
      updateWhere: updateWhere?.call(PropertyListing.t),
      transaction: transaction,
    );
  }

  /// Updates all [PropertyListing]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PropertyListing>> update(
    _is.DatabaseSession session,
    List<PropertyListing> rows, {
    _is.ColumnSelections<PropertyListingTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<PropertyListing>(
      rows,
      columns: columns?.call(PropertyListing.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [PropertyListing]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PropertyListing> updateRow(
    _is.DatabaseSession session,
    PropertyListing row, {
    _is.ColumnSelections<PropertyListingTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<PropertyListing>(
      row,
      columns: columns?.call(PropertyListing.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PropertyListing] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PropertyListing?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<PropertyListingUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<PropertyListing>(
      id,
      columnValues: columnValues(PropertyListing.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PropertyListing]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PropertyListing>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<PropertyListingUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<PropertyListingTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PropertyListingTable>? orderBy,
    _is.OrderByListBuilder<PropertyListingTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<PropertyListing>(
      columnValues: columnValues(PropertyListing.t.updateTable),
      where: where(PropertyListing.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PropertyListing.t),
      orderByList: orderByList?.call(PropertyListing.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [PropertyListing]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PropertyListing>> delete(
    _is.DatabaseSession session,
    List<PropertyListing> rows, {
    _is.OrderByBuilder<PropertyListingTable>? orderBy,
    _is.OrderByListBuilder<PropertyListingTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<PropertyListing>(
      rows,
      orderBy: orderBy?.call(PropertyListing.t),
      orderByList: orderByList?.call(PropertyListing.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [PropertyListing].
  Future<PropertyListing> deleteRow(
    _is.DatabaseSession session,
    PropertyListing row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PropertyListing>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PropertyListing>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<PropertyListingTable> where,
    _is.OrderByBuilder<PropertyListingTable>? orderBy,
    _is.OrderByListBuilder<PropertyListingTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<PropertyListing>(
      where: where(PropertyListing.t),
      orderBy: orderBy?.call(PropertyListing.t),
      orderByList: orderByList?.call(PropertyListing.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PropertyListingTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<PropertyListing>(
      where: where?.call(PropertyListing.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [PropertyListing] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<PropertyListingTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<PropertyListing>(
      where: where(PropertyListing.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
