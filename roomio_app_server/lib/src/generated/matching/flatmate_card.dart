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
import '../matching/compatibility_report.dart' as _i7cb9p6i;
import '../profiles/lifestyle_profile.dart' as _ivde4aq1;
import '../profiles/user_profile.dart' as _iyur9qvu;

abstract class FlatmateCard
    implements _is.SerializableModel, _is.ProtocolSerialization {
  FlatmateCard._({
    required this.profile,
    required this.lifestyle,
    required this.compatibility,
  });

  factory FlatmateCard({
    required _iyur9qvu.UserProfile profile,
    required _ivde4aq1.LifestyleProfile lifestyle,
    required _i7cb9p6i.CompatibilityReport compatibility,
  }) = _FlatmateCardImpl;

  factory FlatmateCard.fromJson(Map<String, dynamic> jsonSerialization) {
    return FlatmateCard(
      profile: _ivuzlq4e.Protocol().deserialize<_iyur9qvu.UserProfile>(
        jsonSerialization['profile'],
      ),
      lifestyle: _ivuzlq4e.Protocol().deserialize<_ivde4aq1.LifestyleProfile>(
        jsonSerialization['lifestyle'],
      ),
      compatibility: _ivuzlq4e.Protocol()
          .deserialize<_i7cb9p6i.CompatibilityReport>(
            jsonSerialization['compatibility'],
          ),
    );
  }

  _iyur9qvu.UserProfile profile;

  _ivde4aq1.LifestyleProfile lifestyle;

  _i7cb9p6i.CompatibilityReport compatibility;

  /// Returns a shallow copy of this [FlatmateCard]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  FlatmateCard copyWith({
    _iyur9qvu.UserProfile? profile,
    _ivde4aq1.LifestyleProfile? lifestyle,
    _i7cb9p6i.CompatibilityReport? compatibility,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FlatmateCard',
      'profile': profile.toJson(),
      'lifestyle': lifestyle.toJson(),
      'compatibility': compatibility.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'FlatmateCard',
      'profile': profile.toJsonForProtocol(),
      'lifestyle': lifestyle.toJsonForProtocol(),
      'compatibility': compatibility.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _FlatmateCardImpl extends FlatmateCard {
  _FlatmateCardImpl({
    required _iyur9qvu.UserProfile profile,
    required _ivde4aq1.LifestyleProfile lifestyle,
    required _i7cb9p6i.CompatibilityReport compatibility,
  }) : super._(
         profile: profile,
         lifestyle: lifestyle,
         compatibility: compatibility,
       );

  /// Returns a shallow copy of this [FlatmateCard]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  FlatmateCard copyWith({
    _iyur9qvu.UserProfile? profile,
    _ivde4aq1.LifestyleProfile? lifestyle,
    _i7cb9p6i.CompatibilityReport? compatibility,
  }) {
    return FlatmateCard(
      profile: profile ?? this.profile.copyWith(),
      lifestyle: lifestyle ?? this.lifestyle.copyWith(),
      compatibility: compatibility ?? this.compatibility.copyWith(),
    );
  }
}
