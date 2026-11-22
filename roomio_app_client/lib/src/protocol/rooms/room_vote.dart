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

abstract class RoomVote
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  RoomVote._({
    this.id,
    required this.shortlistItemId,
    required this.userId,
    required this.voteType,
    required this.votedAt,
  });

  factory RoomVote({
    int? id,
    required int shortlistItemId,
    required String userId,
    required String voteType,
    required DateTime votedAt,
  }) = _RoomVoteImpl;

  factory RoomVote.fromJson(Map<String, dynamic> jsonSerialization) {
    return RoomVote(
      id: jsonSerialization['id'] as int?,
      shortlistItemId: jsonSerialization['shortlistItemId'] as int,
      userId: jsonSerialization['userId'] as String,
      voteType: jsonSerialization['voteType'] as String,
      votedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['votedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int shortlistItemId;

  String userId;

  String voteType;

  DateTime votedAt;

  /// Returns a shallow copy of this [RoomVote]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  RoomVote copyWith({
    int? id,
    int? shortlistItemId,
    String? userId,
    String? voteType,
    DateTime? votedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RoomVote',
      if (id != null) 'id': id,
      'shortlistItemId': shortlistItemId,
      'userId': userId,
      'voteType': voteType,
      'votedAt': votedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RoomVote',
      if (id != null) 'id': id,
      'shortlistItemId': shortlistItemId,
      'userId': userId,
      'voteType': voteType,
      'votedAt': votedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RoomVoteImpl extends RoomVote {
  _RoomVoteImpl({
    int? id,
    required int shortlistItemId,
    required String userId,
    required String voteType,
    required DateTime votedAt,
  }) : super._(
         id: id,
         shortlistItemId: shortlistItemId,
         userId: userId,
         voteType: voteType,
         votedAt: votedAt,
       );

  /// Returns a shallow copy of this [RoomVote]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  RoomVote copyWith({
    Object? id = _Undefined,
    int? shortlistItemId,
    String? userId,
    String? voteType,
    DateTime? votedAt,
  }) {
    return RoomVote(
      id: id is int? ? id : this.id,
      shortlistItemId: shortlistItemId ?? this.shortlistItemId,
      userId: userId ?? this.userId,
      voteType: voteType ?? this.voteType,
      votedAt: votedAt ?? this.votedAt,
    );
  }
}
