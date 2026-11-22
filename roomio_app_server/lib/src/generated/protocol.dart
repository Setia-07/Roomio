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
import 'package:roomio_app_server/src/generated/listings/property_listing.dart'
    as _i5uhefog;
import 'package:roomio_app_server/src/generated/matching/flatmate_card.dart'
    as _imiqlvqt;
import 'package:roomio_app_server/src/generated/notifications/app_notification.dart'
    as _ibvzdbep;
import 'package:roomio_app_server/src/generated/profiles/lifestyle_profile.dart'
    as _ismhqhpa;
import 'package:roomio_app_server/src/generated/profiles/user_profile.dart'
    as _ib40eu7a;
import 'package:roomio_app_server/src/generated/rooms/matching_room.dart'
    as _i6t2kh95;
import 'package:serverpod/protocol.dart' as _isp;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
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

class Protocol extends _is.DatabaseSerializationManager
    implements _is.DatabaseProtocolDeserializationProvider {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  @override
  _is.ProtocolDeserialization get deserializationMetadata =>
      _is.ProtocolDeserialization.cached(
        this,
        types: const [
          _is.getType<_if5vxt6u.RoomioException>,
          _is.getType<_izw8z7ou.Greeting>,
          _is.getType<_ium1kgg4.PropertyListing>,
          _is.getType<_ii1gyr96.CompatibilityReport>,
          _is.getType<_i1j8hfl5.FlatmateCard>,
          _is.getType<_ih0s0cfq.AppNotification>,
          _is.getType<_ix1v43sa.LifestyleProfile>,
          _is.getType<_ii424f86.UserProfile>,
          _is.getType<_ifps11sj.MatchingRoom>,
          _is.getType<_i5m4lxzs.RoomDetailPayload>,
          _is.getType<_i2zch034.RoomEvent>,
          _is.getType<_izcbgdsw.RoomMember>,
          _is.getType<_ipeizfp8.RoomShortlistCard>,
          _is.getType<_iw1bdvc5.RoomShortlistItem>,
          _is.getType<_i84x1fwo.RoomVote>,
          _is.getType<_icsmfj2v.UserBlock>,
          _is.getType<_i1grq7ke.UserReport>,
          _is.getType<_iinmwj78.SavedFlatmate>,
          _is.getType<_irzrsx1s.SavedListing>,
          _is.getType<_if5vxt6u.RoomioException?>,
          _is.getType<_izw8z7ou.Greeting?>,
          _is.getType<_ium1kgg4.PropertyListing?>,
          _is.getType<_ii1gyr96.CompatibilityReport?>,
          _is.getType<_i1j8hfl5.FlatmateCard?>,
          _is.getType<_ih0s0cfq.AppNotification?>,
          _is.getType<_ix1v43sa.LifestyleProfile?>,
          _is.getType<_ii424f86.UserProfile?>,
          _is.getType<_ifps11sj.MatchingRoom?>,
          _is.getType<_i5m4lxzs.RoomDetailPayload?>,
          _is.getType<_i2zch034.RoomEvent?>,
          _is.getType<_izcbgdsw.RoomMember?>,
          _is.getType<_ipeizfp8.RoomShortlistCard?>,
          _is.getType<_iw1bdvc5.RoomShortlistItem?>,
          _is.getType<_i84x1fwo.RoomVote?>,
          _is.getType<_icsmfj2v.UserBlock?>,
          _is.getType<_i1grq7ke.UserReport?>,
          _is.getType<_iinmwj78.SavedFlatmate?>,
          _is.getType<_irzrsx1s.SavedListing?>,
          _is.getType<List<String>>,
          _is.getType<List<String>?>,
          _is.getType<List<_izcbgdsw.RoomMember>>,
          _is.getType<List<_ipeizfp8.RoomShortlistCard>>,
          _is.getType<List<_i5uhefog.PropertyListing>>,
          _is.getType<List<_imiqlvqt.FlatmateCard>>,
          _is.getType<List<_ibvzdbep.AppNotification>>,
          _is.getType<List<_ismhqhpa.LifestyleProfile>>,
          _is.getType<List<_i6t2kh95.MatchingRoom>>,
          _is.getType<List<String>>,
          _is.getType<List<_ib40eu7a.UserProfile>>,
        ],
        modules: const [
          _iais.Protocol.new,
          _iacs.Protocol.new,
          _isp.Protocol.new,
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

  static List<_isp.TableDefinition> get targetTableDefinitions => [
    ..._ownTableDefinitions,
    ..._iais.Protocol().getOwnTableDefinitions(),
    ..._iacs.Protocol().getOwnTableDefinitions(),
    ..._isp.Protocol.targetTableDefinitions,
  ];

  static List<_isp.TableDefinition> get _ownTableDefinitions => [
    _isp.TableDefinition(
      name: 'app_notification',
      dartName: 'AppNotification',
      schema: 'public',
      module: 'roomio_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'recipientUserId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'senderUserId',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'body',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'type',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'relatedEntityId',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'isRead',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'app_notification_recipient_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'recipientUserId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'lifestyle_profile',
      dartName: 'LifestyleProfile',
      schema: 'public',
      module: 'roomio_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'minBudget',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'maxBudget',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'preferredCity',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'sleepSchedule',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'cleanliness',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'foodHabit',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'socialHabit',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'smokingHabit',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'petHabit',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'hardFilterNoSmoking',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'hardFilterPetFriendly',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'hardFilterSameGender',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'lifestyle_user_id_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'matching_room',
      dartName: 'MatchingRoom',
      schema: 'public',
      module: 'roomio_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'creatorUserId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'inviteCode',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'matching_room_code_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'inviteCode',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'property_listing',
      dartName: 'PropertyListing',
      schema: 'public',
      module: 'roomio_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'ownerUserId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'propertyType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'roomType',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'listingPurpose',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'monthlyRent',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'securityDeposit',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'purchasePrice',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'propertySizeSqFt',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'tenure',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'furnishingStatus',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'city',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'neighborhood',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'approximateAddress',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'totalBedrooms',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'totalBathrooms',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'availableFrom',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'imageUrls',
          columnType: _isp.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _isp.ColumnDefinition(
          name: 'amenities',
          columnType: _isp.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _isp.ColumnDefinition(
          name: 'houseRules',
          columnType: _isp.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _isp.ColumnDefinition(
          name: 'publisherRole',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'agencyName',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'contactPhone',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'contactEmail',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'verificationStatus',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'isActive',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'listing_owner_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'ownerUserId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'listing_city_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'city',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'room_member',
      dartName: 'RoomMember',
      schema: 'public',
      module: 'roomio_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'roomId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'userName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'joinedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'room_member_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'roomId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'room_shortlist_item',
      dartName: 'RoomShortlistItem',
      schema: 'public',
      module: 'roomio_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'roomId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'listingId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'addedByUserId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'addedByName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'addedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'room_shortlist_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'roomId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'listingId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'room_vote',
      dartName: 'RoomVote',
      schema: 'public',
      module: 'roomio_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'shortlistItemId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'voteType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'votedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'room_vote_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'shortlistItemId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'saved_flatmate',
      dartName: 'SavedFlatmate',
      schema: 'public',
      module: 'roomio_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'targetUserId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'savedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'saved_flatmate_user_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'targetUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'saved_listing',
      dartName: 'SavedListing',
      schema: 'public',
      module: 'roomio_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'listingId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'savedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'saved_listing_user_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'listingId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'user_block',
      dartName: 'UserBlock',
      schema: 'public',
      module: 'roomio_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'blockerUserId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'blockedUserId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'user_block_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'blockerUserId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'blockedUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'user_profile',
      dartName: 'UserProfile',
      schema: 'public',
      module: 'roomio_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'displayName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'bio',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'age',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'gender',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'occupation',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'city',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'avatarUrl',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'isLookingForFlatmates',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'isLookingForRoom',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'user_profile_user_id_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'user_profile_city_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'city',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'user_report',
      dartName: 'UserReport',
      schema: 'public',
      module: 'roomio_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'reporterUserId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'targetEntity',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'targetId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'reason',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'details',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
  ];

  static String? getClassNameFromObjectJson(dynamic data) =>
      _is.ProtocolDeserialization.readClassName(data);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    final rawDataClassName = _is.ProtocolDeserialization.readClassName(data);
    final dataClassName = rawDataClassName;
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _is.DeserializationClassNameNotFoundException catch (_) {
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
    if (t == _is.getType<_if5vxt6u.RoomioException?>()) {
      return (data != null ? _if5vxt6u.RoomioException.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ium1kgg4.PropertyListing?>()) {
      return (data != null ? _ium1kgg4.PropertyListing.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ii1gyr96.CompatibilityReport?>()) {
      return (data != null
              ? _ii1gyr96.CompatibilityReport.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_i1j8hfl5.FlatmateCard?>()) {
      return (data != null ? _i1j8hfl5.FlatmateCard.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ih0s0cfq.AppNotification?>()) {
      return (data != null ? _ih0s0cfq.AppNotification.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ix1v43sa.LifestyleProfile?>()) {
      return (data != null ? _ix1v43sa.LifestyleProfile.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ii424f86.UserProfile?>()) {
      return (data != null ? _ii424f86.UserProfile.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ifps11sj.MatchingRoom?>()) {
      return (data != null ? _ifps11sj.MatchingRoom.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i5m4lxzs.RoomDetailPayload?>()) {
      return (data != null ? _i5m4lxzs.RoomDetailPayload.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_i2zch034.RoomEvent?>()) {
      return (data != null ? _i2zch034.RoomEvent.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_izcbgdsw.RoomMember?>()) {
      return (data != null ? _izcbgdsw.RoomMember.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ipeizfp8.RoomShortlistCard?>()) {
      return (data != null ? _ipeizfp8.RoomShortlistCard.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iw1bdvc5.RoomShortlistItem?>()) {
      return (data != null ? _iw1bdvc5.RoomShortlistItem.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_i84x1fwo.RoomVote?>()) {
      return (data != null ? _i84x1fwo.RoomVote.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_icsmfj2v.UserBlock?>()) {
      return (data != null ? _icsmfj2v.UserBlock.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i1grq7ke.UserReport?>()) {
      return (data != null ? _i1grq7ke.UserReport.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iinmwj78.SavedFlatmate?>()) {
      return (data != null ? _iinmwj78.SavedFlatmate.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_irzrsx1s.SavedListing?>()) {
      return (data != null ? _irzrsx1s.SavedListing.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _is.getType<List<String>?>()) {
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
    if (t == List<_i5uhefog.PropertyListing>) {
      return (data as List)
              .map((e) => deserialize<_i5uhefog.PropertyListing>(e))
              .toList()
          as T;
    }
    if (t == List<_imiqlvqt.FlatmateCard>) {
      return (data as List)
              .map((e) => deserialize<_imiqlvqt.FlatmateCard>(e))
              .toList()
          as T;
    }
    if (t == List<_ibvzdbep.AppNotification>) {
      return (data as List)
              .map((e) => deserialize<_ibvzdbep.AppNotification>(e))
              .toList()
          as T;
    }
    if (t == List<_ismhqhpa.LifestyleProfile>) {
      return (data as List)
              .map((e) => deserialize<_ismhqhpa.LifestyleProfile>(e))
              .toList()
          as T;
    }
    if (t == List<_i6t2kh95.MatchingRoom>) {
      return (data as List)
              .map((e) => deserialize<_i6t2kh95.MatchingRoom>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_ib40eu7a.UserProfile>) {
      return (data as List)
              .map((e) => deserialize<_ib40eu7a.UserProfile>(e))
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
      } on _is.DeserializationTypeNotFoundException catch (_) {}
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
    className = _iais.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacs.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    className = _isp.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
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
      return _iais.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(19),
      });
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      return _iacs.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(20),
      });
    }
    if (dataClassName.startsWith('serverpod.')) {
      return _isp.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(10),
      });
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iais.Protocol().registerHostProtocol('roomio_app', this);
    _iacs.Protocol().registerHostProtocol('roomio_app', this);
  }

  @override
  _is.Table? getTableForType(Type t) {
    {
      var table = _iais.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _iacs.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _isp.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _ium1kgg4.PropertyListing:
        return _ium1kgg4.PropertyListing.t;
      case _ih0s0cfq.AppNotification:
        return _ih0s0cfq.AppNotification.t;
      case _ix1v43sa.LifestyleProfile:
        return _ix1v43sa.LifestyleProfile.t;
      case _ii424f86.UserProfile:
        return _ii424f86.UserProfile.t;
      case _ifps11sj.MatchingRoom:
        return _ifps11sj.MatchingRoom.t;
      case _izcbgdsw.RoomMember:
        return _izcbgdsw.RoomMember.t;
      case _iw1bdvc5.RoomShortlistItem:
        return _iw1bdvc5.RoomShortlistItem.t;
      case _i84x1fwo.RoomVote:
        return _i84x1fwo.RoomVote.t;
      case _icsmfj2v.UserBlock:
        return _icsmfj2v.UserBlock.t;
      case _i1grq7ke.UserReport:
        return _i1grq7ke.UserReport.t;
      case _iinmwj78.SavedFlatmate:
        return _iinmwj78.SavedFlatmate.t;
      case _irzrsx1s.SavedListing:
        return _irzrsx1s.SavedListing.t;
    }
    return null;
  }

  @override
  List<_isp.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  List<_isp.TableDefinition> getOwnTableDefinitions() => _ownTableDefinitions;

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
      return _iais.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacs.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
