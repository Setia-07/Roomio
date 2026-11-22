/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:roomio_app_client/src/protocol/listings/property_listing.dart'
    as _i26f0rzm;
import 'package:roomio_app_client/src/protocol/matching/flatmate_card.dart'
    as _inwyof3t;
import 'package:roomio_app_client/src/protocol/notifications/app_notification.dart'
    as _iiblsauw;
import 'package:roomio_app_client/src/protocol/profiles/lifestyle_profile.dart'
    as _ipqw7y5c;
import 'package:roomio_app_client/src/protocol/profiles/user_profile.dart'
    as _i62dlp37;
import 'package:roomio_app_client/src/protocol/rooms/matching_room.dart'
    as _ik6glzyj;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'common/roomio_exception.dart' as _if5vxt6u;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'listings/property_listing.dart' as _ium1kgg4;
import 'matching/compatibility_report.dart' as _ii1gyr96;
import 'matching/flatmate_card.dart' as _i1j8hfl5;
import 'notifications/app_notification.dart' as _ih0s0cfq;
import 'profiles/lifestyle_profile.dart' as _ix1v43sa;
import 'profiles/user_profile.dart' as _ii424f86;
import 'rooms/matching_room.dart' as _ifps11sj;
import 'rooms/room_detail_payload.dart' as _i5m4lxzs;
import 'rooms/room_event.dart' as _i2zch034;
import 'rooms/room_member.dart' as _izcbgdsw;
import 'rooms/room_shortlist_card.dart' as _ipeizfp8;
import 'rooms/room_shortlist_item.dart' as _iw1bdvc5;
import 'rooms/room_vote.dart' as _i84x1fwo;
import 'safety/user_block.dart' as _icsmfj2v;
import 'safety/user_report.dart' as _i1grq7ke;
import 'saved/saved_flatmate.dart' as _iinmwj78;
import 'saved/saved_listing.dart' as _irzrsx1s;
export 'common/roomio_exception.dart';
export 'greetings/greeting.dart';
export 'listings/property_listing.dart';
export 'matching/compatibility_report.dart';
export 'matching/flatmate_card.dart';
export 'notifications/app_notification.dart';
export 'profiles/lifestyle_profile.dart';
export 'profiles/user_profile.dart';
export 'rooms/matching_room.dart';
export 'rooms/room_detail_payload.dart';
export 'rooms/room_event.dart';
export 'rooms/room_member.dart';
export 'rooms/room_shortlist_card.dart';
export 'rooms/room_shortlist_item.dart';
export 'rooms/room_vote.dart';
export 'safety/user_block.dart';
export 'safety/user_report.dart';
export 'saved/saved_flatmate.dart';
export 'saved/saved_listing.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager
    implements _isc.ProtocolDeserializationProvider {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  @override
  _isc.ProtocolDeserialization get deserializationMetadata =>
      _isc.ProtocolDeserialization.cached(
        this,
        types: const [
          _isc.getType<_if5vxt6u.RoomioException>,
          _isc.getType<_izw8z7ou.Greeting>,
          _isc.getType<_ium1kgg4.PropertyListing>,
          _isc.getType<_ii1gyr96.CompatibilityReport>,
          _isc.getType<_i1j8hfl5.FlatmateCard>,
          _isc.getType<_ih0s0cfq.AppNotification>,
          _isc.getType<_ix1v43sa.LifestyleProfile>,
          _isc.getType<_ii424f86.UserProfile>,
          _isc.getType<_ifps11sj.MatchingRoom>,
          _isc.getType<_i5m4lxzs.RoomDetailPayload>,
          _isc.getType<_i2zch034.RoomEvent>,
          _isc.getType<_izcbgdsw.RoomMember>,
          _isc.getType<_ipeizfp8.RoomShortlistCard>,
          _isc.getType<_iw1bdvc5.RoomShortlistItem>,
          _isc.getType<_i84x1fwo.RoomVote>,
          _isc.getType<_icsmfj2v.UserBlock>,
          _isc.getType<_i1grq7ke.UserReport>,
          _isc.getType<_iinmwj78.SavedFlatmate>,
          _isc.getType<_irzrsx1s.SavedListing>,
          _isc.getType<_if5vxt6u.RoomioException?>,
          _isc.getType<_izw8z7ou.Greeting?>,
          _isc.getType<_ium1kgg4.PropertyListing?>,
          _isc.getType<_ii1gyr96.CompatibilityReport?>,
          _isc.getType<_i1j8hfl5.FlatmateCard?>,
          _isc.getType<_ih0s0cfq.AppNotification?>,
          _isc.getType<_ix1v43sa.LifestyleProfile?>,
          _isc.getType<_ii424f86.UserProfile?>,
          _isc.getType<_ifps11sj.MatchingRoom?>,
          _isc.getType<_i5m4lxzs.RoomDetailPayload?>,
          _isc.getType<_i2zch034.RoomEvent?>,
          _isc.getType<_izcbgdsw.RoomMember?>,
          _isc.getType<_ipeizfp8.RoomShortlistCard?>,
          _isc.getType<_iw1bdvc5.RoomShortlistItem?>,
          _isc.getType<_i84x1fwo.RoomVote?>,
          _isc.getType<_icsmfj2v.UserBlock?>,
          _isc.getType<_i1grq7ke.UserReport?>,
          _isc.getType<_iinmwj78.SavedFlatmate?>,
          _isc.getType<_irzrsx1s.SavedListing?>,
          _isc.getType<List<String>>,
          _isc.getType<List<String>?>,
          _isc.getType<List<_izcbgdsw.RoomMember>>,
          _isc.getType<List<_ipeizfp8.RoomShortlistCard>>,
          _isc.getType<List<_i26f0rzm.PropertyListing>>,
          _isc.getType<List<_inwyof3t.FlatmateCard>>,
          _isc.getType<List<_iiblsauw.AppNotification>>,
          _isc.getType<List<_ipqw7y5c.LifestyleProfile>>,
          _isc.getType<List<_ik6glzyj.MatchingRoom>>,
          _isc.getType<List<String>>,
          _isc.getType<List<_i62dlp37.UserProfile>>,
        ],
        modules: const [
          _iaic.Protocol.new,
          _iacc.Protocol.new,
        ],
        classNames: const [
          'RoomioException',
          'Greeting',
          'PropertyListing',
          'CompatibilityReport',
          'FlatmateCard',
          'AppNotification',
          'LifestyleProfile',
          'UserProfile',
          'MatchingRoom',
          'RoomDetailPayload',
          'RoomEvent',
          'RoomMember',
          'RoomShortlistCard',
          'RoomShortlistItem',
          'RoomVote',
          'UserBlock',
          'UserReport',
          'SavedFlatmate',
          'SavedListing',
        ],
      );

  static String? getClassNameFromObjectJson(dynamic data) =>
      _isc.ProtocolDeserialization.readClassName(data);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    final rawDataClassName = _isc.ProtocolDeserialization.readClassName(data);
    final dataClassName = rawDataClassName;
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _if5vxt6u.RoomioException) {
      return _if5vxt6u.RoomioException.fromJson(data) as T;
    }
    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _ium1kgg4.PropertyListing) {
      return _ium1kgg4.PropertyListing.fromJson(data) as T;
    }
    if (t == _ii1gyr96.CompatibilityReport) {
      return _ii1gyr96.CompatibilityReport.fromJson(data) as T;
    }
    if (t == _i1j8hfl5.FlatmateCard) {
      return _i1j8hfl5.FlatmateCard.fromJson(data) as T;
    }
    if (t == _ih0s0cfq.AppNotification) {
      return _ih0s0cfq.AppNotification.fromJson(data) as T;
    }
    if (t == _ix1v43sa.LifestyleProfile) {
      return _ix1v43sa.LifestyleProfile.fromJson(data) as T;
    }
    if (t == _ii424f86.UserProfile) {
      return _ii424f86.UserProfile.fromJson(data) as T;
    }
    if (t == _ifps11sj.MatchingRoom) {
      return _ifps11sj.MatchingRoom.fromJson(data) as T;
    }
    if (t == _i5m4lxzs.RoomDetailPayload) {
      return _i5m4lxzs.RoomDetailPayload.fromJson(data) as T;
    }
    if (t == _i2zch034.RoomEvent) {
      return _i2zch034.RoomEvent.fromJson(data) as T;
    }
    if (t == _izcbgdsw.RoomMember) {
      return _izcbgdsw.RoomMember.fromJson(data) as T;
    }
    if (t == _ipeizfp8.RoomShortlistCard) {
      return _ipeizfp8.RoomShortlistCard.fromJson(data) as T;
    }
    if (t == _iw1bdvc5.RoomShortlistItem) {
      return _iw1bdvc5.RoomShortlistItem.fromJson(data) as T;
    }
    if (t == _i84x1fwo.RoomVote) {
      return _i84x1fwo.RoomVote.fromJson(data) as T;
    }
    if (t == _icsmfj2v.UserBlock) {
      return _icsmfj2v.UserBlock.fromJson(data) as T;
    }
    if (t == _i1grq7ke.UserReport) {
      return _i1grq7ke.UserReport.fromJson(data) as T;
    }
    if (t == _iinmwj78.SavedFlatmate) {
      return _iinmwj78.SavedFlatmate.fromJson(data) as T;
    }
    if (t == _irzrsx1s.SavedListing) {
      return _irzrsx1s.SavedListing.fromJson(data) as T;
    }
    if (t == _isc.getType<_if5vxt6u.RoomioException?>()) {
      return (data != null ? _if5vxt6u.RoomioException.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ium1kgg4.PropertyListing?>()) {
      return (data != null ? _ium1kgg4.PropertyListing.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ii1gyr96.CompatibilityReport?>()) {
      return (data != null
              ? _ii1gyr96.CompatibilityReport.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_i1j8hfl5.FlatmateCard?>()) {
      return (data != null ? _i1j8hfl5.FlatmateCard.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ih0s0cfq.AppNotification?>()) {
      return (data != null ? _ih0s0cfq.AppNotification.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ix1v43sa.LifestyleProfile?>()) {
      return (data != null ? _ix1v43sa.LifestyleProfile.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ii424f86.UserProfile?>()) {
      return (data != null ? _ii424f86.UserProfile.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ifps11sj.MatchingRoom?>()) {
      return (data != null ? _ifps11sj.MatchingRoom.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i5m4lxzs.RoomDetailPayload?>()) {
      return (data != null ? _i5m4lxzs.RoomDetailPayload.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i2zch034.RoomEvent?>()) {
      return (data != null ? _i2zch034.RoomEvent.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_izcbgdsw.RoomMember?>()) {
      return (data != null ? _izcbgdsw.RoomMember.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ipeizfp8.RoomShortlistCard?>()) {
      return (data != null ? _ipeizfp8.RoomShortlistCard.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iw1bdvc5.RoomShortlistItem?>()) {
      return (data != null ? _iw1bdvc5.RoomShortlistItem.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i84x1fwo.RoomVote?>()) {
      return (data != null ? _i84x1fwo.RoomVote.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_icsmfj2v.UserBlock?>()) {
      return (data != null ? _icsmfj2v.UserBlock.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i1grq7ke.UserReport?>()) {
      return (data != null ? _i1grq7ke.UserReport.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iinmwj78.SavedFlatmate?>()) {
      return (data != null ? _iinmwj78.SavedFlatmate.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_irzrsx1s.SavedListing?>()) {
      return (data != null ? _irzrsx1s.SavedListing.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _isc.getType<List<String>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<String>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_izcbgdsw.RoomMember>) {
      return (data as List)
              .map((e) => deserialize<_izcbgdsw.RoomMember>(e))
              .toList()
          as T;
    }
    if (t == List<_ipeizfp8.RoomShortlistCard>) {
      return (data as List)
              .map((e) => deserialize<_ipeizfp8.RoomShortlistCard>(e))
              .toList()
          as T;
    }
    if (t == List<_i26f0rzm.PropertyListing>) {
      return (data as List)
              .map((e) => deserialize<_i26f0rzm.PropertyListing>(e))
              .toList()
          as T;
    }
    if (t == List<_inwyof3t.FlatmateCard>) {
      return (data as List)
              .map((e) => deserialize<_inwyof3t.FlatmateCard>(e))
              .toList()
          as T;
    }
    if (t == List<_iiblsauw.AppNotification>) {
      return (data as List)
              .map((e) => deserialize<_iiblsauw.AppNotification>(e))
              .toList()
          as T;
    }
    if (t == List<_ipqw7y5c.LifestyleProfile>) {
      return (data as List)
              .map((e) => deserialize<_ipqw7y5c.LifestyleProfile>(e))
              .toList()
          as T;
    }
    if (t == List<_ik6glzyj.MatchingRoom>) {
      return (data as List)
              .map((e) => deserialize<_ik6glzyj.MatchingRoom>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i62dlp37.UserProfile>) {
      return (data as List)
              .map((e) => deserialize<_i62dlp37.UserProfile>(e))
              .toList()
          as T;
    }
    final modules = deserializationMetadata.modulesForDeserialization(
      t,
      className: rawDataClassName,
    );
    for (final module in modules) {
      try {
        return module.deserialize<T>(data, t);
      } on _isc.DeserializationTypeNotFoundException catch (_) {}
    }

    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _if5vxt6u.RoomioException => 'RoomioException',
      _izw8z7ou.Greeting => 'Greeting',
      _ium1kgg4.PropertyListing => 'PropertyListing',
      _ii1gyr96.CompatibilityReport => 'CompatibilityReport',
      _i1j8hfl5.FlatmateCard => 'FlatmateCard',
      _ih0s0cfq.AppNotification => 'AppNotification',
      _ix1v43sa.LifestyleProfile => 'LifestyleProfile',
      _ii424f86.UserProfile => 'UserProfile',
      _ifps11sj.MatchingRoom => 'MatchingRoom',
      _i5m4lxzs.RoomDetailPayload => 'RoomDetailPayload',
      _i2zch034.RoomEvent => 'RoomEvent',
      _izcbgdsw.RoomMember => 'RoomMember',
      _ipeizfp8.RoomShortlistCard => 'RoomShortlistCard',
      _iw1bdvc5.RoomShortlistItem => 'RoomShortlistItem',
      _i84x1fwo.RoomVote => 'RoomVote',
      _icsmfj2v.UserBlock => 'UserBlock',
      _i1grq7ke.UserReport => 'UserReport',
      _iinmwj78.SavedFlatmate => 'SavedFlatmate',
      _irzrsx1s.SavedListing => 'SavedListing',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('roomio_app.', '');
    }

    switch (data) {
      case _if5vxt6u.RoomioException():
        return 'RoomioException';
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _ium1kgg4.PropertyListing():
        return 'PropertyListing';
      case _ii1gyr96.CompatibilityReport():
        return 'CompatibilityReport';
      case _i1j8hfl5.FlatmateCard():
        return 'FlatmateCard';
      case _ih0s0cfq.AppNotification():
        return 'AppNotification';
      case _ix1v43sa.LifestyleProfile():
        return 'LifestyleProfile';
      case _ii424f86.UserProfile():
        return 'UserProfile';
      case _ifps11sj.MatchingRoom():
        return 'MatchingRoom';
      case _i5m4lxzs.RoomDetailPayload():
        return 'RoomDetailPayload';
      case _i2zch034.RoomEvent():
        return 'RoomEvent';
      case _izcbgdsw.RoomMember():
        return 'RoomMember';
      case _ipeizfp8.RoomShortlistCard():
        return 'RoomShortlistCard';
      case _iw1bdvc5.RoomShortlistItem():
        return 'RoomShortlistItem';
      case _i84x1fwo.RoomVote():
        return 'RoomVote';
      case _icsmfj2v.UserBlock():
        return 'UserBlock';
      case _i1grq7ke.UserReport():
        return 'UserReport';
      case _iinmwj78.SavedFlatmate():
        return 'SavedFlatmate';
      case _irzrsx1s.SavedListing():
        return 'SavedListing';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'RoomioException') {
      return deserialize<_if5vxt6u.RoomioException>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'PropertyListing') {
      return deserialize<_ium1kgg4.PropertyListing>(data['data']);
    }
    if (dataClassName == 'CompatibilityReport') {
      return deserialize<_ii1gyr96.CompatibilityReport>(data['data']);
    }
    if (dataClassName == 'FlatmateCard') {
      return deserialize<_i1j8hfl5.FlatmateCard>(data['data']);
    }
    if (dataClassName == 'AppNotification') {
      return deserialize<_ih0s0cfq.AppNotification>(data['data']);
    }
    if (dataClassName == 'LifestyleProfile') {
      return deserialize<_ix1v43sa.LifestyleProfile>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_ii424f86.UserProfile>(data['data']);
    }
    if (dataClassName == 'MatchingRoom') {
      return deserialize<_ifps11sj.MatchingRoom>(data['data']);
    }
    if (dataClassName == 'RoomDetailPayload') {
      return deserialize<_i5m4lxzs.RoomDetailPayload>(data['data']);
    }
    if (dataClassName == 'RoomEvent') {
      return deserialize<_i2zch034.RoomEvent>(data['data']);
    }
    if (dataClassName == 'RoomMember') {
      return deserialize<_izcbgdsw.RoomMember>(data['data']);
    }
    if (dataClassName == 'RoomShortlistCard') {
      return deserialize<_ipeizfp8.RoomShortlistCard>(data['data']);
    }
    if (dataClassName == 'RoomShortlistItem') {
      return deserialize<_iw1bdvc5.RoomShortlistItem>(data['data']);
    }
    if (dataClassName == 'RoomVote') {
      return deserialize<_i84x1fwo.RoomVote>(data['data']);
    }
    if (dataClassName == 'UserBlock') {
      return deserialize<_icsmfj2v.UserBlock>(data['data']);
    }
    if (dataClassName == 'UserReport') {
      return deserialize<_i1grq7ke.UserReport>(data['data']);
    }
    if (dataClassName == 'SavedFlatmate') {
      return deserialize<_iinmwj78.SavedFlatmate>(data['data']);
    }
    if (dataClassName == 'SavedListing') {
      return deserialize<_irzrsx1s.SavedListing>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      return _iaic.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(19),
      });
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      return _iacc.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(20),
      });
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('roomio_app', this);
    _iacc.Protocol().registerHostProtocol('roomio_app', this);
  }

  @override
  String getModuleName() => 'roomio_app';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
