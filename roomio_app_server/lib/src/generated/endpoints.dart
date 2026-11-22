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
import 'package:roomio_app_server/src/generated/listings/property_listing.dart'
    as _i5uhefog;
import 'package:roomio_app_server/src/generated/profiles/lifestyle_profile.dart'
    as _ismhqhpa;
import 'package:roomio_app_server/src/generated/profiles/user_profile.dart'
    as _ib40eu7a;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import '../auth/email_idp_endpoint.dart' as _iuc1hd5t;
import '../auth/jwt_refresh_endpoint.dart' as _inwq3ztq;
import '../greetings/greeting_endpoint.dart' as _il624ik7;
import '../listings/listing_endpoint.dart' as _i9qx1xff;
import '../matching/matching_endpoint.dart' as _il1cwagu;
import '../notifications/notification_endpoint.dart' as _ibyw8x7k;
import '../profiles/profile_endpoint.dart' as _i675f437;
import '../rooms/room_endpoint.dart' as _idkvzxf4;
import '../safety/safety_endpoint.dart' as _imnkjuqx;
import '../saved/saved_endpoint.dart' as _ic3t7lnp;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    initializeOwnEndpoints(server);
    modules['serverpod_auth_idp'] = _iais.Endpoints()
      ..initializeOwnEndpoints(server);
    modules['serverpod_auth_core'] = _iacs.Endpoints()
      ..initializeOwnEndpoints(server);
  }

  @override
  void initializeOwnEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'emailIdp': _iuc1hd5t.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _inwq3ztq.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'greeting': _il624ik7.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'listing': _i9qx1xff.ListingEndpoint()
        ..initialize(
          server,
          'listing',
          null,
        ),
      'matching': _il1cwagu.MatchingEndpoint()
        ..initialize(
          server,
          'matching',
          null,
        ),
      'notification': _ibyw8x7k.NotificationEndpoint()
        ..initialize(
          server,
          'notification',
          null,
        ),
      'profile': _i675f437.ProfileEndpoint()
        ..initialize(
          server,
          'profile',
          null,
        ),
      'room': _idkvzxf4.RoomEndpoint()
        ..initialize(
          server,
          'room',
          null,
        ),
      'safety': _imnkjuqx.SafetyEndpoint()
        ..initialize(
          server,
          'safety',
          null,
        ),
      'saved': _ic3t7lnp.SavedEndpoint()
        ..initialize(
          server,
          'saved',
          null,
        ),
    };
    connectors['emailIdp'] = _is.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'startOtpLogin': _is.MethodConnector(
          name: 'startOtpLogin',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startOtpLogin(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyOtpLoginCode': _is.MethodConnector(
          name: 'verifyOtpLoginCode',
          params: {
            'otpLoginRequestId': _is.ParameterDescription(
              name: 'otpLoginRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyOtpLoginCode(
                    session,
                    otpLoginRequestId: params['otpLoginRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishOtpLogin': _is.MethodConnector(
          name: 'finishOtpLogin',
          params: {
            'otpLoginToken': _is.ParameterDescription(
              name: 'otpLoginToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishOtpLogin(
                    session,
                    otpLoginToken: params['otpLoginToken'],
                  ),
        ),
        'finishOtpRegistration': _is.MethodConnector(
          name: 'finishOtpRegistration',
          params: {
            'otpLoginToken': _is.ParameterDescription(
              name: 'otpLoginToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishOtpRegistration(
                    session,
                    otpLoginToken: params['otpLoginToken'],
                    password: params['password'],
                  ),
        ),
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint).login(
                    session,
                    email: params['email'],
                    password: params['password'],
                  ),
        ),
        'startRegistration': _is.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _is.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _is.ParameterDescription(
              name: 'accountRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _is.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _is.ParameterDescription(
              name: 'registrationToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _is.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _is.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _is.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _is.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _is.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newPassword': _is.ParameterDescription(
              name: 'newPassword',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _is.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _is.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _is.ParameterDescription(
              name: 'refreshToken',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['jwtRefresh'] as _inwq3ztq.JwtRefreshEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['greeting'] = _is.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _is.MethodConnector(
          name: 'hello',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['greeting'] as _il624ik7.GreetingEndpoint).hello(
                    session,
                    params['name'],
                  ),
        ),
      },
    );
    connectors['listing'] = _is.EndpointConnector(
      name: 'listing',
      endpoint: endpoints['listing']!,
      methodConnectors: {
        'createListing': _is.MethodConnector(
          name: 'createListing',
          params: {
            'listing': _is.ParameterDescription(
              name: 'listing',
              type: _is.getType<_i5uhefog.PropertyListing>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['listing'] as _i9qx1xff.ListingEndpoint)
                  .createListing(
                    session,
                    params['listing'],
                  ),
        ),
        'updateListing': _is.MethodConnector(
          name: 'updateListing',
          params: {
            'listing': _is.ParameterDescription(
              name: 'listing',
              type: _is.getType<_i5uhefog.PropertyListing>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['listing'] as _i9qx1xff.ListingEndpoint)
                  .updateListing(
                    session,
                    params['listing'],
                  ),
        ),
        'deleteListing': _is.MethodConnector(
          name: 'deleteListing',
          params: {
            'listingId': _is.ParameterDescription(
              name: 'listingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['listing'] as _i9qx1xff.ListingEndpoint)
                  .deleteListing(
                    session,
                    params['listingId'],
                  ),
        ),
        'searchListings': _is.MethodConnector(
          name: 'searchListings',
          params: {
            'city': _is.ParameterDescription(
              name: 'city',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'listingPurpose': _is.ParameterDescription(
              name: 'listingPurpose',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'maxRent': _is.ParameterDescription(
              name: 'maxRent',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'minPrice': _is.ParameterDescription(
              name: 'minPrice',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'maxPrice': _is.ParameterDescription(
              name: 'maxPrice',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'propertyType': _is.ParameterDescription(
              name: 'propertyType',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'roomType': _is.ParameterDescription(
              name: 'roomType',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'minBedrooms': _is.ParameterDescription(
              name: 'minBedrooms',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'limit': _is.ParameterDescription(
              name: 'limit',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'offset': _is.ParameterDescription(
              name: 'offset',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['listing'] as _i9qx1xff.ListingEndpoint)
                  .searchListings(
                    session,
                    city: params['city'],
                    listingPurpose: params['listingPurpose'],
                    maxRent: params['maxRent'],
                    minPrice: params['minPrice'],
                    maxPrice: params['maxPrice'],
                    propertyType: params['propertyType'],
                    roomType: params['roomType'],
                    minBedrooms: params['minBedrooms'],
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
        'getMyListings': _is.MethodConnector(
          name: 'getMyListings',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['listing'] as _i9qx1xff.ListingEndpoint)
                  .getMyListings(session),
        ),
        'getListingDetails': _is.MethodConnector(
          name: 'getListingDetails',
          params: {
            'listingId': _is.ParameterDescription(
              name: 'listingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['listing'] as _i9qx1xff.ListingEndpoint)
                  .getListingDetails(
                    session,
                    params['listingId'],
                  ),
        ),
      },
    );
    connectors['matching'] = _is.EndpointConnector(
      name: 'matching',
      endpoint: endpoints['matching']!,
      methodConnectors: {
        'findFlatmates': _is.MethodConnector(
          name: 'findFlatmates',
          params: {
            'city': _is.ParameterDescription(
              name: 'city',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'limit': _is.ParameterDescription(
              name: 'limit',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'offset': _is.ParameterDescription(
              name: 'offset',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['matching'] as _il1cwagu.MatchingEndpoint)
                  .findFlatmates(
                    session,
                    city: params['city'],
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
        'getCompatibility': _is.MethodConnector(
          name: 'getCompatibility',
          params: {
            'targetUserId': _is.ParameterDescription(
              name: 'targetUserId',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['matching'] as _il1cwagu.MatchingEndpoint)
                  .getCompatibility(
                    session,
                    params['targetUserId'],
                  ),
        ),
      },
    );
    connectors['notification'] = _is.EndpointConnector(
      name: 'notification',
      endpoint: endpoints['notification']!,
      methodConnectors: {
        'getMyNotifications': _is.MethodConnector(
          name: 'getMyNotifications',
          params: {
            'limit': _is.ParameterDescription(
              name: 'limit',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'offset': _is.ParameterDescription(
              name: 'offset',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notification'] as _ibyw8x7k.NotificationEndpoint)
                      .getMyNotifications(
                        session,
                        limit: params['limit'],
                        offset: params['offset'],
                      ),
        ),
        'markAsRead': _is.MethodConnector(
          name: 'markAsRead',
          params: {
            'notificationId': _is.ParameterDescription(
              name: 'notificationId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notification'] as _ibyw8x7k.NotificationEndpoint)
                      .markAsRead(
                        session,
                        params['notificationId'],
                      ),
        ),
        'markAllAsRead': _is.MethodConnector(
          name: 'markAllAsRead',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notification'] as _ibyw8x7k.NotificationEndpoint)
                      .markAllAsRead(session),
        ),
        'getUnreadCount': _is.MethodConnector(
          name: 'getUnreadCount',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notification'] as _ibyw8x7k.NotificationEndpoint)
                      .getUnreadCount(session),
        ),
      },
    );
    connectors['profile'] = _is.EndpointConnector(
      name: 'profile',
      endpoint: endpoints['profile']!,
      methodConnectors: {
        'saveUserProfile': _is.MethodConnector(
          name: 'saveUserProfile',
          params: {
            'profile': _is.ParameterDescription(
              name: 'profile',
              type: _is.getType<_ib40eu7a.UserProfile>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i675f437.ProfileEndpoint)
                  .saveUserProfile(
                    session,
                    params['profile'],
                  ),
        ),
        'getMyUserProfile': _is.MethodConnector(
          name: 'getMyUserProfile',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i675f437.ProfileEndpoint)
                  .getMyUserProfile(session),
        ),
        'getUserProfile': _is.MethodConnector(
          name: 'getUserProfile',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i675f437.ProfileEndpoint)
                  .getUserProfile(
                    session,
                    params['userId'],
                  ),
        ),
        'saveLifestyleProfile': _is.MethodConnector(
          name: 'saveLifestyleProfile',
          params: {
            'profile': _is.ParameterDescription(
              name: 'profile',
              type: _is.getType<_ismhqhpa.LifestyleProfile>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i675f437.ProfileEndpoint)
                  .saveLifestyleProfile(
                    session,
                    params['profile'],
                  ),
        ),
        'getMyLifestyleProfile': _is.MethodConnector(
          name: 'getMyLifestyleProfile',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i675f437.ProfileEndpoint)
                  .getMyLifestyleProfile(session),
        ),
        'saveProfile': _is.MethodConnector(
          name: 'saveProfile',
          params: {
            'profile': _is.ParameterDescription(
              name: 'profile',
              type: _is.getType<_ismhqhpa.LifestyleProfile>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i675f437.ProfileEndpoint)
                  .saveProfile(
                    session,
                    params['profile'],
                  ),
        ),
        'getAllProfiles': _is.MethodConnector(
          name: 'getAllProfiles',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i675f437.ProfileEndpoint)
                  .getAllProfiles(session),
        ),
      },
    );
    connectors['room'] = _is.EndpointConnector(
      name: 'room',
      endpoint: endpoints['room']!,
      methodConnectors: {
        'createRoom': _is.MethodConnector(
          name: 'createRoom',
          params: {
            'roomName': _is.ParameterDescription(
              name: 'roomName',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['room'] as _idkvzxf4.RoomEndpoint).createRoom(
                    session,
                    params['roomName'],
                  ),
        ),
        'joinRoomByInviteCode': _is.MethodConnector(
          name: 'joinRoomByInviteCode',
          params: {
            'inviteCode': _is.ParameterDescription(
              name: 'inviteCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['room'] as _idkvzxf4.RoomEndpoint)
                  .joinRoomByInviteCode(
                    session,
                    params['inviteCode'],
                  ),
        ),
        'leaveRoom': _is.MethodConnector(
          name: 'leaveRoom',
          params: {
            'roomId': _is.ParameterDescription(
              name: 'roomId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['room'] as _idkvzxf4.RoomEndpoint).leaveRoom(
                    session,
                    params['roomId'],
                  ),
        ),
        'getMyRooms': _is.MethodConnector(
          name: 'getMyRooms',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['room'] as _idkvzxf4.RoomEndpoint)
                  .getMyRooms(session),
        ),
        'getRoomDetails': _is.MethodConnector(
          name: 'getRoomDetails',
          params: {
            'roomId': _is.ParameterDescription(
              name: 'roomId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['room'] as _idkvzxf4.RoomEndpoint).getRoomDetails(
                    session,
                    params['roomId'],
                  ),
        ),
        'shortlistListing': _is.MethodConnector(
          name: 'shortlistListing',
          params: {
            'roomId': _is.ParameterDescription(
              name: 'roomId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'listingId': _is.ParameterDescription(
              name: 'listingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['room'] as _idkvzxf4.RoomEndpoint)
                  .shortlistListing(
                    session,
                    params['roomId'],
                    params['listingId'],
                  ),
        ),
        'castVote': _is.MethodConnector(
          name: 'castVote',
          params: {
            'shortlistItemId': _is.ParameterDescription(
              name: 'shortlistItemId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'voteType': _is.ParameterDescription(
              name: 'voteType',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['room'] as _idkvzxf4.RoomEndpoint).castVote(
                session,
                params['shortlistItemId'],
                params['voteType'],
              ),
        ),
        'sendRoomMessage': _is.MethodConnector(
          name: 'sendRoomMessage',
          params: {
            'roomId': _is.ParameterDescription(
              name: 'roomId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'message': _is.ParameterDescription(
              name: 'message',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['room'] as _idkvzxf4.RoomEndpoint).sendRoomMessage(
                    session,
                    params['roomId'],
                    params['message'],
                  ),
        ),
        'streamRoomEvents': _is.MethodStreamConnector(
          name: 'streamRoomEvents',
          params: {
            'roomId': _is.ParameterDescription(
              name: 'roomId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _is.MethodStreamReturnType.streamType,
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
                Map<String, Stream> streamParams,
              ) => (endpoints['room'] as _idkvzxf4.RoomEndpoint)
                  .streamRoomEvents(
                    session,
                    params['roomId'],
                  ),
        ),
      },
    );
    connectors['safety'] = _is.EndpointConnector(
      name: 'safety',
      endpoint: endpoints['safety']!,
      methodConnectors: {
        'blockUser': _is.MethodConnector(
          name: 'blockUser',
          params: {
            'targetUserId': _is.ParameterDescription(
              name: 'targetUserId',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['safety'] as _imnkjuqx.SafetyEndpoint).blockUser(
                    session,
                    params['targetUserId'],
                  ),
        ),
        'unblockUser': _is.MethodConnector(
          name: 'unblockUser',
          params: {
            'targetUserId': _is.ParameterDescription(
              name: 'targetUserId',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['safety'] as _imnkjuqx.SafetyEndpoint).unblockUser(
                    session,
                    params['targetUserId'],
                  ),
        ),
        'getBlockedUserIds': _is.MethodConnector(
          name: 'getBlockedUserIds',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['safety'] as _imnkjuqx.SafetyEndpoint)
                  .getBlockedUserIds(session),
        ),
        'reportEntity': _is.MethodConnector(
          name: 'reportEntity',
          params: {
            'targetEntity': _is.ParameterDescription(
              name: 'targetEntity',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'targetId': _is.ParameterDescription(
              name: 'targetId',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'reason': _is.ParameterDescription(
              name: 'reason',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'details': _is.ParameterDescription(
              name: 'details',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['safety'] as _imnkjuqx.SafetyEndpoint)
                  .reportEntity(
                    session,
                    targetEntity: params['targetEntity'],
                    targetId: params['targetId'],
                    reason: params['reason'],
                    details: params['details'],
                  ),
        ),
      },
    );
    connectors['saved'] = _is.EndpointConnector(
      name: 'saved',
      endpoint: endpoints['saved']!,
      methodConnectors: {
        'toggleSaveListing': _is.MethodConnector(
          name: 'toggleSaveListing',
          params: {
            'listingId': _is.ParameterDescription(
              name: 'listingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['saved'] as _ic3t7lnp.SavedEndpoint)
                  .toggleSaveListing(
                    session,
                    params['listingId'],
                  ),
        ),
        'toggleSaveFlatmate': _is.MethodConnector(
          name: 'toggleSaveFlatmate',
          params: {
            'targetUserId': _is.ParameterDescription(
              name: 'targetUserId',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['saved'] as _ic3t7lnp.SavedEndpoint)
                  .toggleSaveFlatmate(
                    session,
                    params['targetUserId'],
                  ),
        ),
        'getMySavedListings': _is.MethodConnector(
          name: 'getMySavedListings',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['saved'] as _ic3t7lnp.SavedEndpoint)
                  .getMySavedListings(session),
        ),
        'getMySavedFlatmates': _is.MethodConnector(
          name: 'getMySavedFlatmates',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['saved'] as _ic3t7lnp.SavedEndpoint)
                  .getMySavedFlatmates(session),
        ),
      },
    );
  }
}
