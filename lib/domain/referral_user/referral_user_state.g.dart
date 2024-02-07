// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferralUserState _$ReferralUserStateFromJson(Map<String, dynamic> json) =>
    ReferralUserState(
      id: json['id'] as String,
      refCode: json['refCode'] as String,
      referralsByLevel: (json['referralsByLevel'] as List<dynamic>)
          .map((e) => ReferralByLevelState.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReferralUserStateToJson(ReferralUserState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'refCode': instance.refCode,
      'referralsByLevel': instance.referralsByLevel,
    };
