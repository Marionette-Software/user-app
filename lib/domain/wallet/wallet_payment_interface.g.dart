// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_payment_interface.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletPaymentInterface _$WalletPaymentInterfaceFromJson(
        Map<String, dynamic> json) =>
    WalletPaymentInterface(
      id: json['id'] as String,
      userDirectDepositEnabled: json['userDirectDepositEnabled'] as bool,
      currency: PaymentInterfaceCurrency.fromJson(
          json['currency'] as Map<String, dynamic>),
      paymentInterface: PaymentInterface.fromJson(
          json['paymentInterface'] as Map<String, dynamic>),
      type: json['type'] as String,
      minDirectDepositAmount:
          (json['minDirectDepositAmount'] as num).toDouble(),
      enable: json['enable'] as bool,
      userDepositEnable: json['userDepositEnable'] as bool,
    );

Map<String, dynamic> _$WalletPaymentInterfaceToJson(
        WalletPaymentInterface instance) =>
    <String, dynamic>{
      'userDepositEnable': instance.userDepositEnable,
      'userDirectDepositEnabled': instance.userDirectDepositEnabled,
      'enable': instance.enable,
      'id': instance.id,
      'minDirectDepositAmount': instance.minDirectDepositAmount,
      'type': instance.type,
      'paymentInterface': instance.paymentInterface,
      'currency': instance.currency,
    };
