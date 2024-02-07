import 'package:json_annotation/json_annotation.dart';

part 'staking_currency.g.dart';

@JsonSerializable()
class StakingCurrency {
  final String id;
  final String? staking_period;
  final double? staking_apr;
  final double? min_staking_amount;
  final double? last_staking_calc;
  final double? next_staking_calc;
  final double? next_reward_amount;
  final double? locked_balance;
  final double? active_balance;
  final bool? isUnstakingProcess;

  StakingCurrency({
    required this.id,
    this.staking_period,
    this.staking_apr,
    this.min_staking_amount,
    this.last_staking_calc,
    this.next_staking_calc,
    this.next_reward_amount,
    this.locked_balance,
    this.active_balance,
    this.isUnstakingProcess,
  });

  factory StakingCurrency.initialData() => StakingCurrency(
        id: 'id',
        staking_period: '',
        staking_apr: 0,
        min_staking_amount: 0,
        last_staking_calc: 0,
        next_staking_calc: 0,
        next_reward_amount: 0,
        locked_balance: 0,
        active_balance: 0,
        isUnstakingProcess: false,
      );

  factory StakingCurrency.fromJson(Map<String, dynamic> json) =>
      _$StakingCurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$StakingCurrencyToJson(this);
}
