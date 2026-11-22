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

abstract class SavedFlatmate
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  SavedFlatmate._({
    this.id,
    required this.userId,
    required this.targetUserId,
    required this.savedAt,
  });

  factory SavedFlatmate({
    int? id,
    required String userId,
    required String targetUserId,
    required DateTime savedAt,
  }) = _SavedFlatmateImpl;

  factory SavedFlatmate.fromJson(Map<String, dynamic> jsonSerialization) {
    return SavedFlatmate(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      targetUserId: jsonSerialization['targetUserId'] as String,
      savedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['savedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String userId;

  String targetUserId;

  DateTime savedAt;

  /// Returns a shallow copy of this [SavedFlatmate]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  SavedFlatmate copyWith({
    int? id,
    String? userId,
    String? targetUserId,
    DateTime? savedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SavedFlatmate',
      if (id != null) 'id': id,
      'userId': userId,
      'targetUserId': targetUserId,
      'savedAt': savedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SavedFlatmate',
      if (id != null) 'id': id,
      'userId': userId,
      'targetUserId': targetUserId,
      'savedAt': savedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SavedFlatmateImpl extends SavedFlatmate {
  _SavedFlatmateImpl({
    int? id,
    required String userId,
    required String targetUserId,
    required DateTime savedAt,
  }) : super._(
         id: id,
         userId: userId,
         targetUserId: targetUserId,
         savedAt: savedAt,
       );

  /// Returns a shallow copy of this [SavedFlatmate]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  SavedFlatmate copyWith({
    Object? id = _Undefined,
    String? userId,
    String? targetUserId,
    DateTime? savedAt,
  }) {
    return SavedFlatmate(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      targetUserId: targetUserId ?? this.targetUserId,
      savedAt: savedAt ?? this.savedAt,
    );
  }
}
