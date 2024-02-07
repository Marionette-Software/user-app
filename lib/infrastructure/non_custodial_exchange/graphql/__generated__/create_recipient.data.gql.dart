// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'create_recipient.data.gql.g.dart';

abstract class GCreateNonCustodialRecipientData
    implements
        Built<GCreateNonCustodialRecipientData,
            GCreateNonCustodialRecipientDataBuilder> {
  GCreateNonCustodialRecipientData._();

  factory GCreateNonCustodialRecipientData(
          [Function(GCreateNonCustodialRecipientDataBuilder b) updates]) =
      _$GCreateNonCustodialRecipientData;

  static void _initializeBuilder(GCreateNonCustodialRecipientDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateNonCustodialRecipientData_createRecipient? get createRecipient;
  static Serializer<GCreateNonCustodialRecipientData> get serializer =>
      _$gCreateNonCustodialRecipientDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateNonCustodialRecipientData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateNonCustodialRecipientData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateNonCustodialRecipientData.serializer,
        json,
      );
}

abstract class GCreateNonCustodialRecipientData_createRecipient
    implements
        Built<GCreateNonCustodialRecipientData_createRecipient,
            GCreateNonCustodialRecipientData_createRecipientBuilder> {
  GCreateNonCustodialRecipientData_createRecipient._();

  factory GCreateNonCustodialRecipientData_createRecipient(
      [Function(GCreateNonCustodialRecipientData_createRecipientBuilder b)
          updates]) = _$GCreateNonCustodialRecipientData_createRecipient;

  static void _initializeBuilder(
          GCreateNonCustodialRecipientData_createRecipientBuilder b) =>
      b..G__typename = 'Recipient';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  static Serializer<GCreateNonCustodialRecipientData_createRecipient>
      get serializer =>
          _$gCreateNonCustodialRecipientDataCreateRecipientSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateNonCustodialRecipientData_createRecipient.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateNonCustodialRecipientData_createRecipient? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateNonCustodialRecipientData_createRecipient.serializer,
        json,
      );
}
