// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipient _$RecipientFromJson(Map<String, dynamic> json) => Recipient(
      id: json['id'] as String,
      data: json['data'] as String? ?? 'N/A',
      description: json['description'] as String? ?? 'N/A',
      confirmDelete: json['confirmDelete'] as bool? ?? false,
    );

Map<String, dynamic> _$RecipientToJson(Recipient instance) => <String, dynamic>{
      'id': instance.id,
      'data': instance.data,
      'description': instance.description,
      'confirmDelete': instance.confirmDelete,
    };
