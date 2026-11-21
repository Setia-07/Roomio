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
import '../profiles/lifestyle_profile.dart' as _ivde4aq1;

abstract class MatchResult
    implements _is.SerializableModel, _is.ProtocolSerialization {
  MatchResult._({
    required this.otherProfile,
    required this.score,
    required this.reasons,
  });

  factory MatchResult({
    required _ivde4aq1.LifestyleProfile otherProfile,
    required int score,
    required List<String> reasons,
  }) = _MatchResultImpl;

  factory MatchResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchResult(
      otherProfile: _ivuzlq4e.Protocol()
          .deserialize<_ivde4aq1.LifestyleProfile>(
            jsonSerialization['otherProfile'],
          ),
      score: jsonSerialization['score'] as int,
      reasons: _ivuzlq4e.Protocol().deserialize<List<String>>(
        jsonSerialization['reasons'],
      ),
    );
  }

  _ivde4aq1.LifestyleProfile otherProfile;

  int score;

  List<String> reasons;

  /// Returns a shallow copy of this [MatchResult]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  MatchResult copyWith({
    _ivde4aq1.LifestyleProfile? otherProfile,
    int? score,
    List<String>? reasons,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchResult',
      'otherProfile': otherProfile.toJson(),
      'score': score,
      'reasons': reasons.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchResult',
      'otherProfile': otherProfile.toJsonForProtocol(),
      'score': score,
      'reasons': reasons.toJson(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _MatchResultImpl extends MatchResult {
  _MatchResultImpl({
    required _ivde4aq1.LifestyleProfile otherProfile,
    required int score,
    required List<String> reasons,
  }) : super._(
         otherProfile: otherProfile,
         score: score,
         reasons: reasons,
       );

  /// Returns a shallow copy of this [MatchResult]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  MatchResult copyWith({
    _ivde4aq1.LifestyleProfile? otherProfile,
    int? score,
    List<String>? reasons,
  }) {
    return MatchResult(
      otherProfile: otherProfile ?? this.otherProfile.copyWith(),
      score: score ?? this.score,
      reasons: reasons ?? this.reasons.map((e0) => e0).toList(),
    );
  }
}
