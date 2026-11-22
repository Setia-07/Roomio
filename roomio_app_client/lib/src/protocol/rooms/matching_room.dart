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

abstract class MatchingRoom
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  MatchingRoom._({
    this.id,
    required this.creatorUserId,
    required this.name,
    required this.inviteCode,
    required this.createdAt,
  });

  factory MatchingRoom({
    int? id,
    required String creatorUserId,
    required String name,
    required String inviteCode,
    required DateTime createdAt,
  }) = _MatchingRoomImpl;

  factory MatchingRoom.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchingRoom(
      id: jsonSerialization['id'] as int?,
      creatorUserId: jsonSerialization['creatorUserId'] as String,
      name: jsonSerialization['name'] as String,
      inviteCode: jsonSerialization['inviteCode'] as String,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String creatorUserId;

  String name;

  String inviteCode;

  DateTime createdAt;

  /// Returns a shallow copy of this [MatchingRoom]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  MatchingRoom copyWith({
    int? id,
    String? creatorUserId,
    String? name,
    String? inviteCode,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchingRoom',
      if (id != null) 'id': id,
      'creatorUserId': creatorUserId,
      'name': name,
      'inviteCode': inviteCode,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchingRoom',
      if (id != null) 'id': id,
      'creatorUserId': creatorUserId,
      'name': name,
      'inviteCode': inviteCode,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchingRoomImpl extends MatchingRoom {
  _MatchingRoomImpl({
    int? id,
    required String creatorUserId,
    required String name,
    required String inviteCode,
    required DateTime createdAt,
  }) : super._(
         id: id,
         creatorUserId: creatorUserId,
         name: name,
         inviteCode: inviteCode,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [MatchingRoom]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  MatchingRoom copyWith({
    Object? id = _Undefined,
    String? creatorUserId,
    String? name,
    String? inviteCode,
    DateTime? createdAt,
  }) {
    return MatchingRoom(
      id: id is int? ? id : this.id,
      creatorUserId: creatorUserId ?? this.creatorUserId,
      name: name ?? this.name,
      inviteCode: inviteCode ?? this.inviteCode,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
