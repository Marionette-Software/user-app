// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'create_recipient_request.data.gql.g.dart';

abstract class GCreateRecipientData
    implements Built<GCreateRecipientData, GCreateRecipientDataBuilder> {
  GCreateRecipientData._();

  factory GCreateRecipientData(
          [Function(GCreateRecipientDataBuilder b) updates]) =
      _$GCreateRecipientData;

  static void _initializeBuilder(GCreateRecipientDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateRecipientData_createRecipient? get createRecipient;
  static Serializer<GCreateRecipientData> get serializer =>
      _$gCreateRecipientDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateRecipientData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateRecipientData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateRecipientData.serializer,
        json,
      );
}

abstract class GCreateRecipientData_createRecipient
    implements
        Built<GCreateRecipientData_createRecipient,
            GCreateRecipientData_createRecipientBuilder> {
  GCreateRecipientData_createRecipient._();

  factory GCreateRecipientData_createRecipient(
          [Function(GCreateRecipientData_createRecipientBuilder b) updates]) =
      _$GCreateRecipientData_createRecipient;

  static void _initializeBuilder(
          GCreateRecipientData_createRecipientBuilder b) =>
      b..G__typename = 'Recipient';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  String? get data;
  String? get description;
  static Serializer<GCreateRecipientData_createRecipient> get serializer =>
      _$gCreateRecipientDataCreateRecipientSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateRecipientData_createRecipient.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateRecipientData_createRecipient? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateRecipientData_createRecipient.serializer,
        json,
      );
}
