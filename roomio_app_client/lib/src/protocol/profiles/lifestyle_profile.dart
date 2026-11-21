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
    required this.name,
    required this.sleepSchedule,
    required this.noiseLevel,
    required this.cleanliness,
    required this.budget,
  });

  factory LifestyleProfile({
    int? id,
    required String name,
    required String sleepSchedule,
    required String noiseLevel,
    required String cleanliness,
    required int budget,
  }) = _LifestyleProfileImpl;

  factory LifestyleProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return LifestyleProfile(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      sleepSchedule: jsonSerialization['sleepSchedule'] as String,
      noiseLevel: jsonSerialization['noiseLevel'] as String,
      cleanliness: jsonSerialization['cleanliness'] as String,
      budget: jsonSerialization['budget'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String sleepSchedule;

  String noiseLevel;

  String cleanliness;

  int budget;

  /// Returns a shallow copy of this [LifestyleProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  LifestyleProfile copyWith({
    int? id,
    String? name,
    String? sleepSchedule,
    String? noiseLevel,
    String? cleanliness,
    int? budget,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LifestyleProfile',
      if (id != null) 'id': id,
      'name': name,
      'sleepSchedule': sleepSchedule,
      'noiseLevel': noiseLevel,
      'cleanliness': cleanliness,
      'budget': budget,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LifestyleProfile',
      if (id != null) 'id': id,
      'name': name,
      'sleepSchedule': sleepSchedule,
      'noiseLevel': noiseLevel,
      'cleanliness': cleanliness,
      'budget': budget,
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
    required String name,
    required String sleepSchedule,
    required String noiseLevel,
    required String cleanliness,
    required int budget,
  }) : super._(
         id: id,
         name: name,
         sleepSchedule: sleepSchedule,
         noiseLevel: noiseLevel,
         cleanliness: cleanliness,
         budget: budget,
       );

  /// Returns a shallow copy of this [LifestyleProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  LifestyleProfile copyWith({
    Object? id = _Undefined,
    String? name,
    String? sleepSchedule,
    String? noiseLevel,
    String? cleanliness,
    int? budget,
  }) {
    return LifestyleProfile(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      sleepSchedule: sleepSchedule ?? this.sleepSchedule,
      noiseLevel: noiseLevel ?? this.noiseLevel,
      cleanliness: cleanliness ?? this.cleanliness,
      budget: budget ?? this.budget,
    );
  }
}
