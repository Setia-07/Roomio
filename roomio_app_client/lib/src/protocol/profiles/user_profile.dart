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

abstract class UserProfile
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  UserProfile._({
    this.id,
    required this.userId,
    required this.displayName,
    this.bio,
    required this.age,
    required this.gender,
    this.occupation,
    required this.city,
    this.avatarUrl,
    required this.isLookingForFlatmates,
    required this.isLookingForRoom,
    required this.createdAt,
  });

  factory UserProfile({
    int? id,
    required String userId,
    required String displayName,
    String? bio,
    required int age,
    required String gender,
    String? occupation,
    required String city,
    String? avatarUrl,
    required bool isLookingForFlatmates,
    required bool isLookingForRoom,
    required DateTime createdAt,
  }) = _UserProfileImpl;

  factory UserProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserProfile(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      displayName: jsonSerialization['displayName'] as String,
      bio: jsonSerialization['bio'] as String?,
      age: jsonSerialization['age'] as int,
      gender: jsonSerialization['gender'] as String,
      occupation: jsonSerialization['occupation'] as String?,
      city: jsonSerialization['city'] as String,
      avatarUrl: jsonSerialization['avatarUrl'] as String?,
      isLookingForFlatmates: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isLookingForFlatmates'],
      ),
      isLookingForRoom: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isLookingForRoom'],
      ),
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String userId;

  String displayName;

  String? bio;

  int age;

  String gender;

  String? occupation;

  String city;

  String? avatarUrl;

  bool isLookingForFlatmates;

  bool isLookingForRoom;

  DateTime createdAt;

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  UserProfile copyWith({
    int? id,
    String? userId,
    String? displayName,
    String? bio,
    int? age,
    String? gender,
    String? occupation,
    String? city,
    String? avatarUrl,
    bool? isLookingForFlatmates,
    bool? isLookingForRoom,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserProfile',
      if (id != null) 'id': id,
      'userId': userId,
      'displayName': displayName,
      if (bio != null) 'bio': bio,
      'age': age,
      'gender': gender,
      if (occupation != null) 'occupation': occupation,
      'city': city,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      'isLookingForFlatmates': isLookingForFlatmates,
      'isLookingForRoom': isLookingForRoom,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserProfile',
      if (id != null) 'id': id,
      'userId': userId,
      'displayName': displayName,
      if (bio != null) 'bio': bio,
      'age': age,
      'gender': gender,
      if (occupation != null) 'occupation': occupation,
      'city': city,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      'isLookingForFlatmates': isLookingForFlatmates,
      'isLookingForRoom': isLookingForRoom,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserProfileImpl extends UserProfile {
  _UserProfileImpl({
    int? id,
    required String userId,
    required String displayName,
    String? bio,
    required int age,
    required String gender,
    String? occupation,
    required String city,
    String? avatarUrl,
    required bool isLookingForFlatmates,
    required bool isLookingForRoom,
    required DateTime createdAt,
  }) : super._(
         id: id,
         userId: userId,
         displayName: displayName,
         bio: bio,
         age: age,
         gender: gender,
         occupation: occupation,
         city: city,
         avatarUrl: avatarUrl,
         isLookingForFlatmates: isLookingForFlatmates,
         isLookingForRoom: isLookingForRoom,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  UserProfile copyWith({
    Object? id = _Undefined,
    String? userId,
    String? displayName,
    Object? bio = _Undefined,
    int? age,
    String? gender,
    Object? occupation = _Undefined,
    String? city,
    Object? avatarUrl = _Undefined,
    bool? isLookingForFlatmates,
    bool? isLookingForRoom,
    DateTime? createdAt,
  }) {
    return UserProfile(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      displayName: displayName ?? this.displayName,
      bio: bio is String? ? bio : this.bio,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      occupation: occupation is String? ? occupation : this.occupation,
      city: city ?? this.city,
      avatarUrl: avatarUrl is String? ? avatarUrl : this.avatarUrl,
      isLookingForFlatmates:
          isLookingForFlatmates ?? this.isLookingForFlatmates,
      isLookingForRoom: isLookingForRoom ?? this.isLookingForRoom,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
