// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBalance _$UserBalanceFromJson(Map<String, dynamic> json) => UserBalance(
      id: json['id'] as String,
      enabled: json['enabled'] as bool,
      withdrawLockedBalance:
          (json['withdrawLockedBalance'] as num?)?.toDouble(),
      stakingLockedBalance: (json['stakingLockedBalance'] as num?)?.toDouble(),
      activeStakingBalance: (json['activeStakingBalance'] as num?)?.toDouble(),
      balance: (json['balance'] as num?)?.toDouble(),
      advancedTradingBalance:
          (json['advancedTradingBalance'] as num?)?.toDouble(),
      advancedTradingLockedBalance:
          (json['advancedTradingLockedBalance'] as num?)?.toDouble(),
      lockedBalance: (json['lockedBalance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserBalanceToJson(UserBalance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'enabled': instance.enabled,
      'balance': instance.balance,
      'advancedTradingBalance': instance.advancedTradingBalance,
      'advancedTradingLockedBalance': instance.advancedTradingLockedBalance,
      'lockedBalance': instance.lockedBalance,
      'withdrawLockedBalance': instance.withdrawLockedBalance,
      'stakingLockedBalance': instance.stakingLockedBalance,
      'activeStakingBalance': instance.activeStakingBalance,
    };
