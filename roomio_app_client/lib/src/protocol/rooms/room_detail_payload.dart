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
import '../rooms/matching_room.dart' as _iimbyo3g;
import '../rooms/room_member.dart' as _iho9nprj;
import '../rooms/room_shortlist_card.dart' as _ih75az26;

abstract class RoomDetailPayload
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  RoomDetailPayload._({
    required this.room,
    required this.members,
    required this.shortlist,
  });

  factory RoomDetailPayload({
    required _iimbyo3g.MatchingRoom room,
    required List<_iho9nprj.RoomMember> members,
    required List<_ih75az26.RoomShortlistCard> shortlist,
  }) = _RoomDetailPayloadImpl;

  factory RoomDetailPayload.fromJson(Map<String, dynamic> jsonSerialization) {
    return RoomDetailPayload(
      room: _icvivhec.Protocol().deserialize<_iimbyo3g.MatchingRoom>(
        jsonSerialization['room'],
      ),
      members: _icvivhec.Protocol().deserialize<List<_iho9nprj.RoomMember>>(
        jsonSerialization['members'],
      ),
      shortlist: _icvivhec.Protocol()
          .deserialize<List<_ih75az26.RoomShortlistCard>>(
            jsonSerialization['shortlist'],
          ),
    );
  }

  _iimbyo3g.MatchingRoom room;

  List<_iho9nprj.RoomMember> members;

  List<_ih75az26.RoomShortlistCard> shortlist;

  /// Returns a shallow copy of this [RoomDetailPayload]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  RoomDetailPayload copyWith({
    _iimbyo3g.MatchingRoom? room,
    List<_iho9nprj.RoomMember>? members,
    List<_ih75az26.RoomShortlistCard>? shortlist,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RoomDetailPayload',
      'room': room.toJson(),
      'members': members.toJson(valueToJson: (v) => v.toJson()),
      'shortlist': shortlist.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RoomDetailPayload',
      'room': room.toJsonForProtocol(),
      'members': members.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'shortlist': shortlist.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _RoomDetailPayloadImpl extends RoomDetailPayload {
  _RoomDetailPayloadImpl({
    required _iimbyo3g.MatchingRoom room,
    required List<_iho9nprj.RoomMember> members,
    required List<_ih75az26.RoomShortlistCard> shortlist,
  }) : super._(
         room: room,
         members: members,
         shortlist: shortlist,
       );

  /// Returns a shallow copy of this [RoomDetailPayload]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  RoomDetailPayload copyWith({
    _iimbyo3g.MatchingRoom? room,
    List<_iho9nprj.RoomMember>? members,
    List<_ih75az26.RoomShortlistCard>? shortlist,
  }) {
    return RoomDetailPayload(
      room: room ?? this.room.copyWith(),
      members: members ?? this.members.map((e0) => e0.copyWith()).toList(),
      shortlist:
          shortlist ?? this.shortlist.map((e0) => e0.copyWith()).toList(),
    );
  }
}
