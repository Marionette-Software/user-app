import 'package:json_annotation/json_annotation.dart';
import 'package:user_app/domain/referral_user/referrals_by_level_state.dart';

part 'referral_user_state.g.dart';

@JsonSerializable()
class ReferralUserState {
  final String id;
  final String refCode;
  final List<ReferralByLevelState> referralsByLevel;

  ReferralUserState({
    required this.id,
    required this.refCode,
    required this.referralsByLevel,
  });

  factory ReferralUserState.initialData() => ReferralUserState(
        id: '',
        refCode: '',
        referralsByLevel: [],
      );

  factory ReferralUserState.fromJson(Map<String, dynamic> json) =>
      _$ReferralUserStateFromJson(json);

  Map<String, dynamic> toJson() => _$ReferralUserStateToJson(this);
}
