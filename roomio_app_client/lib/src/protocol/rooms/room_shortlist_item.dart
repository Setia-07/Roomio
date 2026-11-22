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
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class RoomShortlistItem
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  RoomShortlistItem._({
    this.id,
    required this.roomId,
    required this.listingId,
    required this.addedByUserId,
    required this.addedByName,
    required this.addedAt,
  });

  factory RoomShortlistItem({
    int? id,
    required int roomId,
    required int listingId,
    required String addedByUserId,
    required String addedByName,
    required DateTime addedAt,
  }) = _RoomShortlistItemImpl;

  factory RoomShortlistItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return RoomShortlistItem(
      id: jsonSerialization['id'] as int?,
      roomId: jsonSerialization['roomId'] as int,
      listingId: jsonSerialization['listingId'] as int,
      addedByUserId: jsonSerialization['addedByUserId'] as String,
      addedByName: jsonSerialization['addedByName'] as String,
      addedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['addedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int roomId;

  int listingId;

  String addedByUserId;

  String addedByName;

  DateTime addedAt;

  /// Returns a shallow copy of this [RoomShortlistItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  RoomShortlistItem copyWith({
    int? id,
    int? roomId,
    int? listingId,
    String? addedByUserId,
    String? addedByName,
    DateTime? addedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RoomShortlistItem',
      if (id != null) 'id': id,
      'roomId': roomId,
      'listingId': listingId,
      'addedByUserId': addedByUserId,
      'addedByName': addedByName,
      'addedAt': addedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RoomShortlistItem',
      if (id != null) 'id': id,
      'roomId': roomId,
      'listingId': listingId,
      'addedByUserId': addedByUserId,
      'addedByName': addedByName,
      'addedAt': addedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RoomShortlistItemImpl extends RoomShortlistItem {
  _RoomShortlistItemImpl({
    int? id,
    required int roomId,
    required int listingId,
    required String addedByUserId,
    required String addedByName,
    required DateTime addedAt,
  }) : super._(
         id: id,
         roomId: roomId,
         listingId: listingId,
         addedByUserId: addedByUserId,
         addedByName: addedByName,
         addedAt: addedAt,
       );

  /// Returns a shallow copy of this [RoomShortlistItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  RoomShortlistItem copyWith({
    Object? id = _Undefined,
    int? roomId,
    int? listingId,
    String? addedByUserId,
    String? addedByName,
    DateTime? addedAt,
  }) {
    return RoomShortlistItem(
      id: id is int? ? id : this.id,
      roomId: roomId ?? this.roomId,
      listingId: listingId ?? this.listingId,
      addedByUserId: addedByUserId ?? this.addedByUserId,
      addedByName: addedByName ?? this.addedByName,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}
