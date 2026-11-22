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

abstract class UserReport
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  UserReport._({
    this.id,
    required this.reporterUserId,
    required this.targetEntity,
    required this.targetId,
    required this.reason,
    this.details,
    required this.createdAt,
  });

  factory UserReport({
    int? id,
    required String reporterUserId,
    required String targetEntity,
    required String targetId,
    required String reason,
    String? details,
    required DateTime createdAt,
  }) = _UserReportImpl;

  factory UserReport.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserReport(
      id: jsonSerialization['id'] as int?,
      reporterUserId: jsonSerialization['reporterUserId'] as String,
      targetEntity: jsonSerialization['targetEntity'] as String,
      targetId: jsonSerialization['targetId'] as String,
      reason: jsonSerialization['reason'] as String,
      details: jsonSerialization['details'] as String?,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String reporterUserId;

  String targetEntity;

  String targetId;

  String reason;

  String? details;

  DateTime createdAt;

  /// Returns a shallow copy of this [UserReport]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  UserReport copyWith({
    int? id,
    String? reporterUserId,
    String? targetEntity,
    String? targetId,
    String? reason,
    String? details,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserReport',
      if (id != null) 'id': id,
      'reporterUserId': reporterUserId,
      'targetEntity': targetEntity,
      'targetId': targetId,
      'reason': reason,
      if (details != null) 'details': details,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserReport',
      if (id != null) 'id': id,
      'reporterUserId': reporterUserId,
      'targetEntity': targetEntity,
      'targetId': targetId,
      'reason': reason,
      if (details != null) 'details': details,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserReportImpl extends UserReport {
  _UserReportImpl({
    int? id,
    required String reporterUserId,
    required String targetEntity,
    required String targetId,
    required String reason,
    String? details,
    required DateTime createdAt,
  }) : super._(
         id: id,
         reporterUserId: reporterUserId,
         targetEntity: targetEntity,
         targetId: targetId,
         reason: reason,
         details: details,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [UserReport]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  UserReport copyWith({
    Object? id = _Undefined,
    String? reporterUserId,
    String? targetEntity,
    String? targetId,
    String? reason,
    Object? details = _Undefined,
    DateTime? createdAt,
  }) {
    return UserReport(
      id: id is int? ? id : this.id,
      reporterUserId: reporterUserId ?? this.reporterUserId,
      targetEntity: targetEntity ?? this.targetEntity,
      targetId: targetId ?? this.targetId,
      reason: reason ?? this.reason,
      details: details is String? ? details : this.details,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
