import 'package:json_annotation/json_annotation.dart';

part 'referrals_by_level_state.g.dart';

@JsonSerializable()
class ReferralByLevelState {
  final int level;
  final int count;

  ReferralByLevelState({
    required this.level,
    required this.count,
  });

  factory ReferralByLevelState.initialData() => ReferralByLevelState(
        level: 0,
        count: 0,
      );

  factory ReferralByLevelState.fromJson(Map<String, dynamic> json) =>
      _$ReferralByLevelStateFromJson(json);

  Map<String, dynamic> toJson() => _$ReferralByLevelStateToJson(this);
}
