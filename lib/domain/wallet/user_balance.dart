import 'package:json_annotation/json_annotation.dart';

part 'user_balance.g.dart';

@JsonSerializable()
class UserBalance {
  String id;
  bool enabled;
  double? balance;
  double? advancedTradingBalance;
  double? advancedTradingLockedBalance;
  double? lockedBalance;
  double? withdrawLockedBalance;
  double? stakingLockedBalance;
  double? activeStakingBalance;

  UserBalance({
    required this.id,
    required this.enabled,
    this.withdrawLockedBalance,
    this.stakingLockedBalance,
    this.activeStakingBalance,
    this.balance,
    this.advancedTradingBalance,
    this.advancedTradingLockedBalance,
    this.lockedBalance,
  });

  factory UserBalance.fromJson(Map<String, dynamic> json) =>
      _$UserBalanceFromJson(json);

  Map<String, dynamic> toJson() => _$UserBalanceToJson(this);
}
