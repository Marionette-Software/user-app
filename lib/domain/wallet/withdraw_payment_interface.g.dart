// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_payment_interface.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawPaymentInterface _$WithdrawPaymentInterfaceFromJson(
        Map<String, dynamic> json) =>
    WithdrawPaymentInterface(
      type: json['type'] as String,
      paymentInterface: PaymentInterface.fromJson(
          json['paymentInterface'] as Map<String, dynamic>),
      currency: PaymentInterfaceCurrency.fromJson(
          json['currency'] as Map<String, dynamic>),
      recipients: (json['recipients'] as List<dynamic>)
          .map((e) => Recipient.fromJson(e as Map<String, dynamic>))
          .toList(),
      recipientSchema: json['recipientSchema'] as String?,
      maxWithdrawAmount: (json['maxWithdrawAmount'] as num).toDouble(),
      minWithdrawAmount: (json['minWithdrawAmount'] as num).toDouble(),
      withdrawFee: (json['withdrawFee'] as num).toDouble(),
      maxWithdrawAmount24h: (json['maxWithdrawAmount24h'] as num).toDouble(),
      maxWithdrawFee: (json['maxWithdrawFee'] as num).toDouble(),
      minWithdrawFee: (json['minWithdrawFee'] as num).toDouble(),
      withdrawAmount24h: (json['withdrawAmount24h'] as num).toDouble(),
    );

Map<String, dynamic> _$WithdrawPaymentInterfaceToJson(
        WithdrawPaymentInterface instance) =>
    <String, dynamic>{
      'type': instance.type,
      'paymentInterface': instance.paymentInterface,
      'currency': instance.currency,
      'recipients': instance.recipients,
      'recipientSchema': instance.recipientSchema,
      'minWithdrawAmount': instance.minWithdrawAmount,
      'maxWithdrawAmount': instance.maxWithdrawAmount,
      'withdrawFee': instance.withdrawFee,
      'minWithdrawFee': instance.minWithdrawFee,
      'maxWithdrawFee': instance.maxWithdrawFee,
      'maxWithdrawAmount24h': instance.maxWithdrawAmount24h,
      'withdrawAmount24h': instance.withdrawAmount24h,
    };
