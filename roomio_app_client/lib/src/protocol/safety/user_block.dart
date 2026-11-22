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

abstract class UserBlock
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  UserBlock._({
    this.id,
    required this.blockerUserId,
    required this.blockedUserId,
    required this.createdAt,
  });

  factory UserBlock({
    int? id,
    required String blockerUserId,
    required String blockedUserId,
    required DateTime createdAt,
  }) = _UserBlockImpl;

  factory UserBlock.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserBlock(
      id: jsonSerialization['id'] as int?,
      blockerUserId: jsonSerialization['blockerUserId'] as String,
      blockedUserId: jsonSerialization['blockedUserId'] as String,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String blockerUserId;

  String blockedUserId;

  DateTime createdAt;

  /// Returns a shallow copy of this [UserBlock]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  UserBlock copyWith({
    int? id,
    String? blockerUserId,
    String? blockedUserId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserBlock',
      if (id != null) 'id': id,
      'blockerUserId': blockerUserId,
      'blockedUserId': blockedUserId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserBlock',
      if (id != null) 'id': id,
      'blockerUserId': blockerUserId,
      'blockedUserId': blockedUserId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserBlockImpl extends UserBlock {
  _UserBlockImpl({
    int? id,
    required String blockerUserId,
    required String blockedUserId,
    required DateTime createdAt,
  }) : super._(
         id: id,
         blockerUserId: blockerUserId,
         blockedUserId: blockedUserId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [UserBlock]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  UserBlock copyWith({
    Object? id = _Undefined,
    String? blockerUserId,
    String? blockedUserId,
    DateTime? createdAt,
  }) {
    return UserBlock(
      id: id is int? ? id : this.id,
      blockerUserId: blockerUserId ?? this.blockerUserId,
      blockedUserId: blockedUserId ?? this.blockedUserId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
