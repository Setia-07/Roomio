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
import '../listings/property_listing.dart' as _i0n0kwj1;
import '../rooms/room_shortlist_item.dart' as _i9znnswe;

abstract class RoomShortlistCard
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  RoomShortlistCard._({
    required this.shortlistItem,
    required this.listing,
    required this.likes,
    required this.passes,
    required this.superlikes,
    this.currentUserVote,
  });

  factory RoomShortlistCard({
    required _i9znnswe.RoomShortlistItem shortlistItem,
    required _i0n0kwj1.PropertyListing listing,
    required int likes,
    required int passes,
    required int superlikes,
    String? currentUserVote,
  }) = _RoomShortlistCardImpl;

  factory RoomShortlistCard.fromJson(Map<String, dynamic> jsonSerialization) {
    return RoomShortlistCard(
      shortlistItem: _icvivhec.Protocol()
          .deserialize<_i9znnswe.RoomShortlistItem>(
            jsonSerialization['shortlistItem'],
          ),
      listing: _icvivhec.Protocol().deserialize<_i0n0kwj1.PropertyListing>(
        jsonSerialization['listing'],
      ),
      likes: jsonSerialization['likes'] as int,
      passes: jsonSerialization['passes'] as int,
      superlikes: jsonSerialization['superlikes'] as int,
      currentUserVote: jsonSerialization['currentUserVote'] as String?,
    );
  }

  _i9znnswe.RoomShortlistItem shortlistItem;

  _i0n0kwj1.PropertyListing listing;

  int likes;

  int passes;

  int superlikes;

  String? currentUserVote;

  /// Returns a shallow copy of this [RoomShortlistCard]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  RoomShortlistCard copyWith({
    _i9znnswe.RoomShortlistItem? shortlistItem,
    _i0n0kwj1.PropertyListing? listing,
    int? likes,
    int? passes,
    int? superlikes,
    String? currentUserVote,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RoomShortlistCard',
      'shortlistItem': shortlistItem.toJson(),
      'listing': listing.toJson(),
      'likes': likes,
      'passes': passes,
      'superlikes': superlikes,
      if (currentUserVote != null) 'currentUserVote': currentUserVote,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RoomShortlistCard',
      'shortlistItem': shortlistItem.toJsonForProtocol(),
      'listing': listing.toJsonForProtocol(),
      'likes': likes,
      'passes': passes,
      'superlikes': superlikes,
      if (currentUserVote != null) 'currentUserVote': currentUserVote,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RoomShortlistCardImpl extends RoomShortlistCard {
  _RoomShortlistCardImpl({
    required _i9znnswe.RoomShortlistItem shortlistItem,
    required _i0n0kwj1.PropertyListing listing,
    required int likes,
    required int passes,
    required int superlikes,
    String? currentUserVote,
  }) : super._(
         shortlistItem: shortlistItem,
         listing: listing,
         likes: likes,
         passes: passes,
         superlikes: superlikes,
         currentUserVote: currentUserVote,
       );

  /// Returns a shallow copy of this [RoomShortlistCard]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  RoomShortlistCard copyWith({
    _i9znnswe.RoomShortlistItem? shortlistItem,
    _i0n0kwj1.PropertyListing? listing,
    int? likes,
    int? passes,
    int? superlikes,
    Object? currentUserVote = _Undefined,
  }) {
    return RoomShortlistCard(
      shortlistItem: shortlistItem ?? this.shortlistItem.copyWith(),
      listing: listing ?? this.listing.copyWith(),
      likes: likes ?? this.likes,
      passes: passes ?? this.passes,
      superlikes: superlikes ?? this.superlikes,
      currentUserVote: currentUserVote is String?
          ? currentUserVote
          : this.currentUserVote,
    );
  }
}
