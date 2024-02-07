// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_interface.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentInterface _$PaymentInterfaceFromJson(Map<String, dynamic> json) =>
    PaymentInterface(
      id: json['id'] as String,
      title: json['title'] as String? ?? 'N/A',
      subtitle: json['subtitle'] as String? ?? 'N/A',
      logoUrl: json['logoUrl'] as String?,
    );

Map<String, dynamic> _$PaymentInterfaceToJson(PaymentInterface instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'logoUrl': instance.logoUrl,
      'subtitle': instance.subtitle,
    };
