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

abstract class AppNotification
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  AppNotification._({
    this.id,
    required this.recipientUserId,
    this.senderUserId,
    required this.title,
    required this.body,
    required this.type,
    this.relatedEntityId,
    required this.isRead,
    required this.createdAt,
  });

  factory AppNotification({
    int? id,
    required String recipientUserId,
    String? senderUserId,
    required String title,
    required String body,
    required String type,
    int? relatedEntityId,
    required bool isRead,
    required DateTime createdAt,
  }) = _AppNotificationImpl;

  factory AppNotification.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppNotification(
      id: jsonSerialization['id'] as int?,
      recipientUserId: jsonSerialization['recipientUserId'] as String,
      senderUserId: jsonSerialization['senderUserId'] as String?,
      title: jsonSerialization['title'] as String,
      body: jsonSerialization['body'] as String,
      type: jsonSerialization['type'] as String,
      relatedEntityId: jsonSerialization['relatedEntityId'] as int?,
      isRead: _isc.BoolJsonExtension.fromJson(jsonSerialization['isRead']),
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String recipientUserId;

  String? senderUserId;

  String title;

  String body;

  String type;

  int? relatedEntityId;

  bool isRead;

  DateTime createdAt;

  /// Returns a shallow copy of this [AppNotification]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  AppNotification copyWith({
    int? id,
    String? recipientUserId,
    String? senderUserId,
    String? title,
    String? body,
    String? type,
    int? relatedEntityId,
    bool? isRead,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppNotification',
      if (id != null) 'id': id,
      'recipientUserId': recipientUserId,
      if (senderUserId != null) 'senderUserId': senderUserId,
      'title': title,
      'body': body,
      'type': type,
      if (relatedEntityId != null) 'relatedEntityId': relatedEntityId,
      'isRead': isRead,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AppNotification',
      if (id != null) 'id': id,
      'recipientUserId': recipientUserId,
      if (senderUserId != null) 'senderUserId': senderUserId,
      'title': title,
      'body': body,
      'type': type,
      if (relatedEntityId != null) 'relatedEntityId': relatedEntityId,
      'isRead': isRead,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppNotificationImpl extends AppNotification {
  _AppNotificationImpl({
    int? id,
    required String recipientUserId,
    String? senderUserId,
    required String title,
    required String body,
    required String type,
    int? relatedEntityId,
    required bool isRead,
    required DateTime createdAt,
  }) : super._(
         id: id,
         recipientUserId: recipientUserId,
         senderUserId: senderUserId,
         title: title,
         body: body,
         type: type,
         relatedEntityId: relatedEntityId,
         isRead: isRead,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [AppNotification]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  AppNotification copyWith({
    Object? id = _Undefined,
    String? recipientUserId,
    Object? senderUserId = _Undefined,
    String? title,
    String? body,
    String? type,
    Object? relatedEntityId = _Undefined,
    bool? isRead,
    DateTime? createdAt,
  }) {
    return AppNotification(
      id: id is int? ? id : this.id,
      recipientUserId: recipientUserId ?? this.recipientUserId,
      senderUserId: senderUserId is String? ? senderUserId : this.senderUserId,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      relatedEntityId: relatedEntityId is int?
          ? relatedEntityId
          : this.relatedEntityId,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
