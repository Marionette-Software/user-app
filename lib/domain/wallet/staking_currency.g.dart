// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staking_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StakingCurrency _$StakingCurrencyFromJson(Map<String, dynamic> json) =>
    StakingCurrency(
      id: json['id'] as String,
      staking_period: json['staking_period'] as String?,
      staking_apr: (json['staking_apr'] as num?)?.toDouble(),
      min_staking_amount: (json['min_staking_amount'] as num?)?.toDouble(),
      last_staking_calc: (json['last_staking_calc'] as num?)?.toDouble(),
      next_staking_calc: (json['next_staking_calc'] as num?)?.toDouble(),
      next_reward_amount: (json['next_reward_amount'] as num?)?.toDouble(),
      locked_balance: (json['locked_balance'] as num?)?.toDouble(),
      active_balance: (json['active_balance'] as num?)?.toDouble(),
      isUnstakingProcess: json['isUnstakingProcess'] as bool?,
    );

Map<String, dynamic> _$StakingCurrencyToJson(StakingCurrency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'staking_period': instance.staking_period,
      'staking_apr': instance.staking_apr,
      'min_staking_amount': instance.min_staking_amount,
      'last_staking_calc': instance.last_staking_calc,
      'next_staking_calc': instance.next_staking_calc,
      'next_reward_amount': instance.next_reward_amount,
      'locked_balance': instance.locked_balance,
      'active_balance': instance.active_balance,
      'isUnstakingProcess': instance.isUnstakingProcess,
    };
