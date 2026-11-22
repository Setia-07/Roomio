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

abstract class LifestyleProfile
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  LifestyleProfile._({
    this.id,
    required this.userId,
    required this.name,
    required this.minBudget,
    required this.maxBudget,
    required this.preferredCity,
    required this.sleepSchedule,
    required this.cleanliness,
    required this.foodHabit,
    required this.socialHabit,
    required this.smokingHabit,
    required this.petHabit,
    required this.hardFilterNoSmoking,
    required this.hardFilterPetFriendly,
    required this.hardFilterSameGender,
  });

  factory LifestyleProfile({
    int? id,
    required String userId,
    required String name,
    required int minBudget,
    required int maxBudget,
    required String preferredCity,
    required String sleepSchedule,
    required String cleanliness,
    required String foodHabit,
    required String socialHabit,
    required String smokingHabit,
    required String petHabit,
    required bool hardFilterNoSmoking,
    required bool hardFilterPetFriendly,
    required bool hardFilterSameGender,
  }) = _LifestyleProfileImpl;

  factory LifestyleProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return LifestyleProfile(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      name: jsonSerialization['name'] as String,
      minBudget: jsonSerialization['minBudget'] as int,
      maxBudget: jsonSerialization['maxBudget'] as int,
      preferredCity: jsonSerialization['preferredCity'] as String,
      sleepSchedule: jsonSerialization['sleepSchedule'] as String,
      cleanliness: jsonSerialization['cleanliness'] as String,
      foodHabit: jsonSerialization['foodHabit'] as String,
      socialHabit: jsonSerialization['socialHabit'] as String,
      smokingHabit: jsonSerialization['smokingHabit'] as String,
      petHabit: jsonSerialization['petHabit'] as String,
      hardFilterNoSmoking: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['hardFilterNoSmoking'],
      ),
      hardFilterPetFriendly: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['hardFilterPetFriendly'],
      ),
      hardFilterSameGender: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['hardFilterSameGender'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String userId;

  String name;

  int minBudget;

  int maxBudget;

  String preferredCity;

  String sleepSchedule;

  String cleanliness;

  String foodHabit;

  String socialHabit;

  String smokingHabit;

  String petHabit;

  bool hardFilterNoSmoking;

  bool hardFilterPetFriendly;

  bool hardFilterSameGender;

  /// Returns a shallow copy of this [LifestyleProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  LifestyleProfile copyWith({
    int? id,
    String? userId,
    String? name,
    int? minBudget,
    int? maxBudget,
    String? preferredCity,
    String? sleepSchedule,
    String? cleanliness,
    String? foodHabit,
    String? socialHabit,
    String? smokingHabit,
    String? petHabit,
    bool? hardFilterNoSmoking,
    bool? hardFilterPetFriendly,
    bool? hardFilterSameGender,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LifestyleProfile',
      if (id != null) 'id': id,
      'userId': userId,
      'name': name,
      'minBudget': minBudget,
      'maxBudget': maxBudget,
      'preferredCity': preferredCity,
      'sleepSchedule': sleepSchedule,
      'cleanliness': cleanliness,
      'foodHabit': foodHabit,
      'socialHabit': socialHabit,
      'smokingHabit': smokingHabit,
      'petHabit': petHabit,
      'hardFilterNoSmoking': hardFilterNoSmoking,
      'hardFilterPetFriendly': hardFilterPetFriendly,
      'hardFilterSameGender': hardFilterSameGender,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LifestyleProfile',
      if (id != null) 'id': id,
      'userId': userId,
      'name': name,
      'minBudget': minBudget,
      'maxBudget': maxBudget,
      'preferredCity': preferredCity,
      'sleepSchedule': sleepSchedule,
      'cleanliness': cleanliness,
      'foodHabit': foodHabit,
      'socialHabit': socialHabit,
      'smokingHabit': smokingHabit,
      'petHabit': petHabit,
      'hardFilterNoSmoking': hardFilterNoSmoking,
      'hardFilterPetFriendly': hardFilterPetFriendly,
      'hardFilterSameGender': hardFilterSameGender,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LifestyleProfileImpl extends LifestyleProfile {
  _LifestyleProfileImpl({
    int? id,
    required String userId,
    required String name,
    required int minBudget,
    required int maxBudget,
    required String preferredCity,
    required String sleepSchedule,
    required String cleanliness,
    required String foodHabit,
    required String socialHabit,
    required String smokingHabit,
    required String petHabit,
    required bool hardFilterNoSmoking,
    required bool hardFilterPetFriendly,
    required bool hardFilterSameGender,
  }) : super._(
         id: id,
         userId: userId,
         name: name,
         minBudget: minBudget,
         maxBudget: maxBudget,
         preferredCity: preferredCity,
         sleepSchedule: sleepSchedule,
         cleanliness: cleanliness,
         foodHabit: foodHabit,
         socialHabit: socialHabit,
         smokingHabit: smokingHabit,
         petHabit: petHabit,
         hardFilterNoSmoking: hardFilterNoSmoking,
         hardFilterPetFriendly: hardFilterPetFriendly,
         hardFilterSameGender: hardFilterSameGender,
       );

  /// Returns a shallow copy of this [LifestyleProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  LifestyleProfile copyWith({
    Object? id = _Undefined,
    String? userId,
    String? name,
    int? minBudget,
    int? maxBudget,
    String? preferredCity,
    String? sleepSchedule,
    String? cleanliness,
    String? foodHabit,
    String? socialHabit,
    String? smokingHabit,
    String? petHabit,
    bool? hardFilterNoSmoking,
    bool? hardFilterPetFriendly,
    bool? hardFilterSameGender,
  }) {
    return LifestyleProfile(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      minBudget: minBudget ?? this.minBudget,
      maxBudget: maxBudget ?? this.maxBudget,
      preferredCity: preferredCity ?? this.preferredCity,
      sleepSchedule: sleepSchedule ?? this.sleepSchedule,
      cleanliness: cleanliness ?? this.cleanliness,
      foodHabit: foodHabit ?? this.foodHabit,
      socialHabit: socialHabit ?? this.socialHabit,
      smokingHabit: smokingHabit ?? this.smokingHabit,
      petHabit: petHabit ?? this.petHabit,
      hardFilterNoSmoking: hardFilterNoSmoking ?? this.hardFilterNoSmoking,
      hardFilterPetFriendly:
          hardFilterPetFriendly ?? this.hardFilterPetFriendly,
      hardFilterSameGender: hardFilterSameGender ?? this.hardFilterSameGender,
    );
  }
}
