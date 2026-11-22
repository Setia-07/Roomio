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
import 'dart:async' as _ida;
import 'package:http/http.dart' as _i85jenna;
import 'package:roomio_app_client/src/protocol/greetings/greeting.dart'
    as _i7yul85h;
import 'package:roomio_app_client/src/protocol/listings/property_listing.dart'
    as _i26f0rzm;
import 'package:roomio_app_client/src/protocol/matching/compatibility_report.dart'
    as _ir50854f;
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
import 'package:roomio_app_client/src/protocol/rooms/room_detail_payload.dart'
    as _ir6z5of8;
import 'package:roomio_app_client/src/protocol/rooms/room_event.dart'
    as _i4tsludg;
import 'package:roomio_app_client/src/protocol/rooms/room_shortlist_item.dart'
    as _idi6gxc6;
import 'package:roomio_app_client/src/protocol/rooms/room_vote.dart'
    as _i0hxpk0k;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'protocol.dart' as _il2as5qe;

/// By extending [EmailOtpIdpBaseEndpoint], the email identity provider
/// endpoints, including the passwordless sign-in with one-time passwords, are
/// made available on the server and enable the corresponding sign-in widget on
/// the client.
///
/// Extend [EmailIdpBaseEndpoint] instead for the password based sign-in only.
/// {@category Endpoint}
class EndpointEmailIdp extends _iaic.EndpointEmailOtpIdpBase {
  EndpointEmailIdp(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Starts a passwordless login by sending a one-time password to [email].
  ///
  /// The code is sent whether or not an account is registered for the email.
  /// If none is, verifying the code lets the user create a new account.
  ///
  /// Always returns a login request ID, which must be passed to
  /// [verifyOtpLoginCode] together with the one-time password.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the email is
  ///   not valid.
  /// - [EmailAccountRequestExceptionReason.tooManyAttempts] if too many
  ///   one-time passwords have been requested for the email.
  @override
  _ida.Future<_isc.UuidValue> startOtpLogin({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startOtpLogin',
        {'email': email},
      );

  /// Verifies a one-time password and returns a token to complete the login.
  ///
  /// If [EmailAccountOtpVerificationResult.accountExists] is `true`, pass the
  /// token to [finishOtpLogin] to sign in. Otherwise, have the user accept the
  /// terms (and optionally set a password if
  /// [EmailAccountOtpVerificationResult.allowPassword] is `true`) and pass it
  /// to [finishOtpRegistration] to create the account.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the login request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts to verify the code.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists for
  ///   the given [otpLoginRequestId] or [verificationCode] is invalid.
  @override
  _ida.Future<_iaic.EmailAccountOtpVerificationResult> verifyOtpLoginCode({
    required _isc.UuidValue otpLoginRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<_iaic.EmailAccountOtpVerificationResult>(
    'emailIdp',
    'verifyOtpLoginCode',
    {
      'otpLoginRequestId': otpLoginRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a passwordless login for an existing account and returns a new
  /// session.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the login request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [otpLoginToken] is
  ///   invalid or no account exists for the email.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<_iacc.AuthSuccess> finishOtpLogin({
    required String otpLoginToken,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'finishOtpLogin',
    {'otpLoginToken': otpLoginToken},
  );

  /// Completes a passwordless login for an email without an account, by
  /// creating a new auth user with a profile and attaching the verified email
  /// to it.
  ///
  /// Must only be called after the user accepted the terms. The [password] is
  /// optional, and may only be set if
  /// [EmailAccountOtpVerificationResult.allowPassword] was `true`.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the login request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if a password is
  ///   given but not allowed, or it does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [otpLoginToken] is
  ///   invalid or an account already exists for the email.
  ///
  /// Returns a session for the newly created user.
  @override
  _ida.Future<_iacc.AuthSuccess> finishOtpRegistration({
    required String otpLoginToken,
    String? password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'finishOtpRegistration',
    {
      'otpLoginToken': otpLoginToken,
      'password': password,
    },
  );

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<_iacc.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _ida.Future<_isc.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _ida.Future<String> verifyRegistrationCode({
    required _isc.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _ida.Future<_iacc.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _ida.Future<_isc.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _ida.Future<String> verifyPasswordResetCode({
    required _isc.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _ida.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _iacc.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// If [refreshToken] is omitted, cookie-mode web clients fall back to the
  /// configured HttpOnly refresh cookie. When neither source is present this
  /// throws [RefreshTokenNotFoundException], the same public "no usable refresh
  /// credential" exception used for unknown refresh tokens.
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _ida.Future<_iacc.AuthSuccess> refreshAccessToken({String? refreshToken}) =>
      caller.callServerEndpoint<_iacc.AuthSuccess>(
        'jwtRefresh',
        'refreshAccessToken',
        {'refreshToken': refreshToken},
        authenticated: false,
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _isc.EndpointRef {
  EndpointGreeting(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _ida.Future<_i7yul85h.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i7yul85h.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointListing extends _isc.EndpointRef {
  EndpointListing(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'listing';

  /// Creates a new property or room listing.
  _ida.Future<_i26f0rzm.PropertyListing> createListing(
    _i26f0rzm.PropertyListing listing,
  ) => caller.callServerEndpoint<_i26f0rzm.PropertyListing>(
    'listing',
    'createListing',
    {'listing': listing},
  );

  /// Updates an existing property listing. Only the owner can modify.
  _ida.Future<_i26f0rzm.PropertyListing> updateListing(
    _i26f0rzm.PropertyListing listing,
  ) => caller.callServerEndpoint<_i26f0rzm.PropertyListing>(
    'listing',
    'updateListing',
    {'listing': listing},
  );

  /// Deletes or deactivates a listing. Only the owner can delete.
  _ida.Future<bool> deleteListing(int listingId) =>
      caller.callServerEndpoint<bool>(
        'listing',
        'deleteListing',
        {'listingId': listingId},
      );

  /// Searches and filters property listings with pagination.
  _ida.Future<List<_i26f0rzm.PropertyListing>> searchListings({
    String? city,
    String? listingPurpose,
    int? maxRent,
    int? minPrice,
    int? maxPrice,
    String? propertyType,
    String? roomType,
    int? minBedrooms,
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i26f0rzm.PropertyListing>>(
    'listing',
    'searchListings',
    {
      'city': city,
      'listingPurpose': listingPurpose,
      'maxRent': maxRent,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'propertyType': propertyType,
      'roomType': roomType,
      'minBedrooms': minBedrooms,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Gets all listings created by the authenticated user.
  _ida.Future<List<_i26f0rzm.PropertyListing>> getMyListings() =>
      caller.callServerEndpoint<List<_i26f0rzm.PropertyListing>>(
        'listing',
        'getMyListings',
        {},
      );

  /// Gets listing details by ID. Only active listings are publicly visible.
  _ida.Future<_i26f0rzm.PropertyListing?> getListingDetails(int listingId) =>
      caller.callServerEndpoint<_i26f0rzm.PropertyListing?>(
        'listing',
        'getListingDetails',
        {'listingId': listingId},
      );
}

/// {@category Endpoint}
class EndpointMatching extends _isc.EndpointRef {
  EndpointMatching(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'matching';

  /// Finds and ranks compatible flatmates for the current user.
  _ida.Future<List<_inwyof3t.FlatmateCard>> findFlatmates({
    String? city,
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_inwyof3t.FlatmateCard>>(
    'matching',
    'findFlatmates',
    {
      'city': city,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Calculates a detailed compatibility report for a specific candidate.
  _ida.Future<_ir50854f.CompatibilityReport?> getCompatibility(
    String targetUserId,
  ) => caller.callServerEndpoint<_ir50854f.CompatibilityReport?>(
    'matching',
    'getCompatibility',
    {'targetUserId': targetUserId},
  );
}

/// {@category Endpoint}
class EndpointNotification extends _isc.EndpointRef {
  EndpointNotification(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'notification';

  /// Fetches notifications for the current user.
  _ida.Future<List<_iiblsauw.AppNotification>> getMyNotifications({
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_iiblsauw.AppNotification>>(
    'notification',
    'getMyNotifications',
    {
      'limit': limit,
      'offset': offset,
    },
  );

  /// Marks a specific notification as read.
  _ida.Future<bool> markAsRead(int notificationId) =>
      caller.callServerEndpoint<bool>(
        'notification',
        'markAsRead',
        {'notificationId': notificationId},
      );

  /// Marks all notifications for current user as read.
  _ida.Future<void> markAllAsRead() => caller.callServerEndpoint<void>(
    'notification',
    'markAllAsRead',
    {},
  );

  /// Gets the count of unread notifications.
  _ida.Future<int> getUnreadCount() => caller.callServerEndpoint<int>(
    'notification',
    'getUnreadCount',
    {},
  );
}

/// {@category Endpoint}
class EndpointProfile extends _isc.EndpointRef {
  EndpointProfile(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'profile';

  /// Saves or updates the authenticated user's UserProfile.
  _ida.Future<_i62dlp37.UserProfile> saveUserProfile(
    _i62dlp37.UserProfile profile,
  ) => caller.callServerEndpoint<_i62dlp37.UserProfile>(
    'profile',
    'saveUserProfile',
    {'profile': profile},
  );

  /// Gets the currently authenticated user's UserProfile.
  _ida.Future<_i62dlp37.UserProfile?> getMyUserProfile() =>
      caller.callServerEndpoint<_i62dlp37.UserProfile?>(
        'profile',
        'getMyUserProfile',
        {},
      );

  /// Gets another user's public profile by their user ID.
  _ida.Future<_i62dlp37.UserProfile?> getUserProfile(String userId) =>
      caller.callServerEndpoint<_i62dlp37.UserProfile?>(
        'profile',
        'getUserProfile',
        {'userId': userId},
      );

  /// Saves or updates the authenticated user's LifestyleProfile.
  _ida.Future<_ipqw7y5c.LifestyleProfile> saveLifestyleProfile(
    _ipqw7y5c.LifestyleProfile profile,
  ) => caller.callServerEndpoint<_ipqw7y5c.LifestyleProfile>(
    'profile',
    'saveLifestyleProfile',
    {'profile': profile},
  );

  /// Gets the currently authenticated user's LifestyleProfile.
  _ida.Future<_ipqw7y5c.LifestyleProfile?> getMyLifestyleProfile() =>
      caller.callServerEndpoint<_ipqw7y5c.LifestyleProfile?>(
        'profile',
        'getMyLifestyleProfile',
        {},
      );

  /// Backwards-compatible legacy method.
  _ida.Future<_ipqw7y5c.LifestyleProfile> saveProfile(
    _ipqw7y5c.LifestyleProfile profile,
  ) => caller.callServerEndpoint<_ipqw7y5c.LifestyleProfile>(
    'profile',
    'saveProfile',
    {'profile': profile},
  );

  /// Backwards-compatible legacy method.
  _ida.Future<List<_ipqw7y5c.LifestyleProfile>> getAllProfiles() =>
      caller.callServerEndpoint<List<_ipqw7y5c.LifestyleProfile>>(
        'profile',
        'getAllProfiles',
        {},
      );
}

/// {@category Endpoint}
class EndpointRoom extends _isc.EndpointRef {
  EndpointRoom(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'room';

  /// Creates a collaborative Team Up room.
  _ida.Future<_ik6glzyj.MatchingRoom> createRoom(String roomName) =>
      caller.callServerEndpoint<_ik6glzyj.MatchingRoom>(
        'room',
        'createRoom',
        {'roomName': roomName},
      );

  /// Joins an existing matching room by invite code.
  _ida.Future<_ik6glzyj.MatchingRoom> joinRoomByInviteCode(String inviteCode) =>
      caller.callServerEndpoint<_ik6glzyj.MatchingRoom>(
        'room',
        'joinRoomByInviteCode',
        {'inviteCode': inviteCode},
      );

  /// Leaves a matching room.
  _ida.Future<bool> leaveRoom(int roomId) => caller.callServerEndpoint<bool>(
    'room',
    'leaveRoom',
    {'roomId': roomId},
  );

  /// Gets all rooms that the current user belongs to.
  _ida.Future<List<_ik6glzyj.MatchingRoom>> getMyRooms() =>
      caller.callServerEndpoint<List<_ik6glzyj.MatchingRoom>>(
        'room',
        'getMyRooms',
        {},
      );

  /// Gets full room details, participants, and shortlisted cards with vote tallies.
  _ida.Future<_ir6z5of8.RoomDetailPayload> getRoomDetails(int roomId) =>
      caller.callServerEndpoint<_ir6z5of8.RoomDetailPayload>(
        'room',
        'getRoomDetails',
        {'roomId': roomId},
      );

  /// Shortlists a property listing in the collaborative room.
  _ida.Future<_idi6gxc6.RoomShortlistItem> shortlistListing(
    int roomId,
    int listingId,
  ) => caller.callServerEndpoint<_idi6gxc6.RoomShortlistItem>(
    'room',
    'shortlistListing',
    {
      'roomId': roomId,
      'listingId': listingId,
    },
  );

  /// Casts a vote on a shortlisted listing.
  _ida.Future<_i0hxpk0k.RoomVote> castVote(
    int shortlistItemId,
    String voteType,
  ) => caller.callServerEndpoint<_i0hxpk0k.RoomVote>(
    'room',
    'castVote',
    {
      'shortlistItemId': shortlistItemId,
      'voteType': voteType,
    },
  );

  /// Sends a live chat or reaction message to the room stream.
  _ida.Future<void> sendRoomMessage(
    int roomId,
    String message,
  ) => caller.callServerEndpoint<void>(
    'room',
    'sendRoomMessage',
    {
      'roomId': roomId,
      'message': message,
    },
  );

  /// Subscribes to the live event stream for a room.
  _ida.Stream<_i4tsludg.RoomEvent> streamRoomEvents(int roomId) =>
      caller.callStreamingServerEndpoint<
        _ida.Stream<_i4tsludg.RoomEvent>,
        _i4tsludg.RoomEvent
      >(
        'room',
        'streamRoomEvents',
        {'roomId': roomId},
        {},
      );
}

/// {@category Endpoint}
class EndpointSafety extends _isc.EndpointRef {
  EndpointSafety(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'safety';

  /// Blocks a user, preventing them from appearing in discovery or contacting the user.
  _ida.Future<bool> blockUser(String targetUserId) =>
      caller.callServerEndpoint<bool>(
        'safety',
        'blockUser',
        {'targetUserId': targetUserId},
      );

  /// Unblocks a user.
  _ida.Future<bool> unblockUser(String targetUserId) =>
      caller.callServerEndpoint<bool>(
        'safety',
        'unblockUser',
        {'targetUserId': targetUserId},
      );

  /// Gets the list of user IDs blocked by current user.
  _ida.Future<List<String>> getBlockedUserIds() =>
      caller.callServerEndpoint<List<String>>(
        'safety',
        'getBlockedUserIds',
        {},
      );

  /// Submits a moderation report for a user or listing.
  _ida.Future<bool> reportEntity({
    required String targetEntity,
    required String targetId,
    required String reason,
    String? details,
  }) => caller.callServerEndpoint<bool>(
    'safety',
    'reportEntity',
    {
      'targetEntity': targetEntity,
      'targetId': targetId,
      'reason': reason,
      'details': details,
    },
  );
}

/// {@category Endpoint}
class EndpointSaved extends _isc.EndpointRef {
  EndpointSaved(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'saved';

  /// Toggles saving or bookmarking a property listing. Returns true if saved, false if removed.
  _ida.Future<bool> toggleSaveListing(int listingId) =>
      caller.callServerEndpoint<bool>(
        'saved',
        'toggleSaveListing',
        {'listingId': listingId},
      );

  /// Toggles saving or bookmarking a potential flatmate profile.
  _ida.Future<bool> toggleSaveFlatmate(String targetUserId) =>
      caller.callServerEndpoint<bool>(
        'saved',
        'toggleSaveFlatmate',
        {'targetUserId': targetUserId},
      );

  /// Gets all property listings bookmarked by the current user.
  _ida.Future<List<_i26f0rzm.PropertyListing>> getMySavedListings() =>
      caller.callServerEndpoint<List<_i26f0rzm.PropertyListing>>(
        'saved',
        'getMySavedListings',
        {},
      );

  /// Gets all flatmates saved by the current user.
  _ida.Future<List<_i62dlp37.UserProfile>> getMySavedFlatmates() =>
      caller.callServerEndpoint<List<_i62dlp37.UserProfile>>(
        'saved',
        'getMySavedFlatmates',
        {},
      );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _iaic.Caller(client);
    serverpod_auth_core = _iacc.Caller(client);
  }

  late final _iaic.Caller serverpod_auth_idp;

  late final _iacc.Caller serverpod_auth_core;
}

class Client extends _isc.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _isc.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_isc.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
    _i85jenna.Client? httpClientOverride,
  }) : super(
         host,
         _il2as5qe.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
         httpClientOverride: httpClientOverride,
       ) {
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    greeting = EndpointGreeting(this);
    listing = EndpointListing(this);
    matching = EndpointMatching(this);
    notification = EndpointNotification(this);
    profile = EndpointProfile(this);
    room = EndpointRoom(this);
    safety = EndpointSafety(this);
    saved = EndpointSaved(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointGreeting greeting;

  late final EndpointListing listing;

  late final EndpointMatching matching;

  late final EndpointNotification notification;

  late final EndpointProfile profile;

  late final EndpointRoom room;

  late final EndpointSafety safety;

  late final EndpointSaved saved;

  late final Modules modules;

  @override
  Map<String, _isc.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'greeting': greeting,
    'listing': listing,
    'matching': matching,
    'notification': notification,
    'profile': profile,
    'room': room,
    'safety': safety,
    'saved': saved,
  };

  @override
  Map<String, _isc.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
