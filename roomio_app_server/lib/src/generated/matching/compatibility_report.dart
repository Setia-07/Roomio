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
import 'package:roomio_app_server/src/generated/protocol.dart' as _ivuzlq4e;
import 'package:serverpod/serverpod.dart' as _is;

abstract class CompatibilityReport
    implements _is.SerializableModel, _is.ProtocolSerialization {
  CompatibilityReport._({
    required this.targetUserId,
    required this.targetName,
    required this.overallScore,
    required this.budgetScore,
    required this.locationScore,
    required this.cleanlinessScore,
    required this.sleepScore,
    required this.socialScore,
    required this.foodScore,
    required this.passedHardFilters,
    this.hardFilterFailureReason,
    required this.alignments,
    required this.differences,
    this.guidanceDisclaimer,
  });

  factory CompatibilityReport({
    required String targetUserId,
    required String targetName,
    required double overallScore,
    required double budgetScore,
    required double locationScore,
    required double cleanlinessScore,
    required double sleepScore,
    required double socialScore,
    required double foodScore,
    required bool passedHardFilters,
    String? hardFilterFailureReason,
    required List<String> alignments,
    required List<String> differences,
    String? guidanceDisclaimer,
  }) = _CompatibilityReportImpl;

  factory CompatibilityReport.fromJson(Map<String, dynamic> jsonSerialization) {
    return CompatibilityReport(
      targetUserId: jsonSerialization['targetUserId'] as String,
      targetName: jsonSerialization['targetName'] as String,
      overallScore: (jsonSerialization['overallScore'] as num).toDouble(),
      budgetScore: (jsonSerialization['budgetScore'] as num).toDouble(),
      locationScore: (jsonSerialization['locationScore'] as num).toDouble(),
      cleanlinessScore: (jsonSerialization['cleanlinessScore'] as num)
          .toDouble(),
      sleepScore: (jsonSerialization['sleepScore'] as num).toDouble(),
      socialScore: (jsonSerialization['socialScore'] as num).toDouble(),
      foodScore: (jsonSerialization['foodScore'] as num).toDouble(),
      passedHardFilters: _is.BoolJsonExtension.fromJson(
        jsonSerialization['passedHardFilters'],
      ),
      hardFilterFailureReason:
          jsonSerialization['hardFilterFailureReason'] as String?,
      alignments: _ivuzlq4e.Protocol().deserialize<List<String>>(
        jsonSerialization['alignments'],
      ),
      differences: _ivuzlq4e.Protocol().deserialize<List<String>>(
        jsonSerialization['differences'],
      ),
      guidanceDisclaimer: jsonSerialization['guidanceDisclaimer'] as String?,
    );
  }

  String targetUserId;

  String targetName;

  double overallScore;

  double budgetScore;

  double locationScore;

  double cleanlinessScore;

  double sleepScore;

  double socialScore;

  double foodScore;

  bool passedHardFilters;

  String? hardFilterFailureReason;

  List<String> alignments;

  List<String> differences;

  String? guidanceDisclaimer;

  /// Returns a shallow copy of this [CompatibilityReport]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  CompatibilityReport copyWith({
    String? targetUserId,
    String? targetName,
    double? overallScore,
    double? budgetScore,
    double? locationScore,
    double? cleanlinessScore,
    double? sleepScore,
    double? socialScore,
    double? foodScore,
    bool? passedHardFilters,
    String? hardFilterFailureReason,
    List<String>? alignments,
    List<String>? differences,
    String? guidanceDisclaimer,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CompatibilityReport',
      'targetUserId': targetUserId,
      'targetName': targetName,
      'overallScore': overallScore,
      'budgetScore': budgetScore,
      'locationScore': locationScore,
      'cleanlinessScore': cleanlinessScore,
      'sleepScore': sleepScore,
      'socialScore': socialScore,
      'foodScore': foodScore,
      'passedHardFilters': passedHardFilters,
      if (hardFilterFailureReason != null)
        'hardFilterFailureReason': hardFilterFailureReason,
      'alignments': alignments.toJson(),
      'differences': differences.toJson(),
      if (guidanceDisclaimer != null) 'guidanceDisclaimer': guidanceDisclaimer,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CompatibilityReport',
      'targetUserId': targetUserId,
      'targetName': targetName,
      'overallScore': overallScore,
      'budgetScore': budgetScore,
      'locationScore': locationScore,
      'cleanlinessScore': cleanlinessScore,
      'sleepScore': sleepScore,
      'socialScore': socialScore,
      'foodScore': foodScore,
      'passedHardFilters': passedHardFilters,
      if (hardFilterFailureReason != null)
        'hardFilterFailureReason': hardFilterFailureReason,
      'alignments': alignments.toJson(),
      'differences': differences.toJson(),
      if (guidanceDisclaimer != null) 'guidanceDisclaimer': guidanceDisclaimer,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CompatibilityReportImpl extends CompatibilityReport {
  _CompatibilityReportImpl({
    required String targetUserId,
    required String targetName,
    required double overallScore,
    required double budgetScore,
    required double locationScore,
    required double cleanlinessScore,
    required double sleepScore,
    required double socialScore,
    required double foodScore,
    required bool passedHardFilters,
    String? hardFilterFailureReason,
    required List<String> alignments,
    required List<String> differences,
    String? guidanceDisclaimer,
  }) : super._(
         targetUserId: targetUserId,
         targetName: targetName,
         overallScore: overallScore,
         budgetScore: budgetScore,
         locationScore: locationScore,
         cleanlinessScore: cleanlinessScore,
         sleepScore: sleepScore,
         socialScore: socialScore,
         foodScore: foodScore,
         passedHardFilters: passedHardFilters,
         hardFilterFailureReason: hardFilterFailureReason,
         alignments: alignments,
         differences: differences,
         guidanceDisclaimer: guidanceDisclaimer,
       );

  /// Returns a shallow copy of this [CompatibilityReport]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  CompatibilityReport copyWith({
    String? targetUserId,
    String? targetName,
    double? overallScore,
    double? budgetScore,
    double? locationScore,
    double? cleanlinessScore,
    double? sleepScore,
    double? socialScore,
    double? foodScore,
    bool? passedHardFilters,
    Object? hardFilterFailureReason = _Undefined,
    List<String>? alignments,
    List<String>? differences,
    Object? guidanceDisclaimer = _Undefined,
  }) {
    return CompatibilityReport(
      targetUserId: targetUserId ?? this.targetUserId,
      targetName: targetName ?? this.targetName,
      overallScore: overallScore ?? this.overallScore,
      budgetScore: budgetScore ?? this.budgetScore,
      locationScore: locationScore ?? this.locationScore,
      cleanlinessScore: cleanlinessScore ?? this.cleanlinessScore,
      sleepScore: sleepScore ?? this.sleepScore,
      socialScore: socialScore ?? this.socialScore,
      foodScore: foodScore ?? this.foodScore,
      passedHardFilters: passedHardFilters ?? this.passedHardFilters,
      hardFilterFailureReason: hardFilterFailureReason is String?
          ? hardFilterFailureReason
          : this.hardFilterFailureReason,
      alignments: alignments ?? this.alignments.map((e0) => e0).toList(),
      differences: differences ?? this.differences.map((e0) => e0).toList(),
      guidanceDisclaimer: guidanceDisclaimer is String?
          ? guidanceDisclaimer
          : this.guidanceDisclaimer,
    );
  }
}
