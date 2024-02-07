// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_interface_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentInterfaceCurrency _$PaymentInterfaceCurrencyFromJson(
        Map<String, dynamic> json) =>
    PaymentInterfaceCurrency(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'N/A',
      icon_url: json['icon_url'] as String?,
    );

Map<String, dynamic> _$PaymentInterfaceCurrencyToJson(
        PaymentInterfaceCurrency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_url': instance.icon_url,
    };
