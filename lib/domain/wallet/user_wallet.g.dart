// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserWallet _$UserWalletFromJson(Map<String, dynamic> json) => UserWallet(
      id: json['id'] as String,
      name: json['name'] as String,
      iconUrl: json['icon_url'] as String,
      position: json['position'] as int,
      precision: json['precision'] as int,
      enabled: json['enabled'] as bool,
      staking_enabled: json['staking_enabled'] as bool,
      isUnstakingProcess: json['isUnstakingProcess'] as bool,
      lightBgColor1: json['lightBgColor1'] as String?,
      lightBgColor2: json['lightBgColor2'] as String?,
      darkBgColor2: json['darkBgColor2'] as String?,
      darkBgColor1: json['darkBgColor1'] as String?,
      lightTextColor: json['lightTextColor'] as String?,
      markets: (json['markets'] as List<dynamic>)
          .map((e) => Market.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$UserWalletToJson(UserWallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_url': instance.iconUrl,
      'position': instance.position,
      'precision': instance.precision,
      'enabled': instance.enabled,
      'staking_enabled': instance.staking_enabled,
      'isUnstakingProcess': instance.isUnstakingProcess,
      'lightBgColor1': instance.lightBgColor1,
      'lightBgColor2': instance.lightBgColor2,
      'darkBgColor1': instance.darkBgColor1,
      'darkBgColor2': instance.darkBgColor2,
      'lightTextColor': instance.lightTextColor,
      'markets': instance.markets,
      'isFavorite': instance.isFavorite,
    };
