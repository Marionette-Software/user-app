// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'resend_email.data.gql.g.dart';

abstract class GResendEmailConfirmData
    implements Built<GResendEmailConfirmData, GResendEmailConfirmDataBuilder> {
  GResendEmailConfirmData._();

  factory GResendEmailConfirmData(
          [Function(GResendEmailConfirmDataBuilder b) updates]) =
      _$GResendEmailConfirmData;

  static void _initializeBuilder(GResendEmailConfirmDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get resendEmailConfirm;
  static Serializer<GResendEmailConfirmData> get serializer =>
      _$gResendEmailConfirmDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GResendEmailConfirmData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GResendEmailConfirmData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GResendEmailConfirmData.serializer,
        json,
      );
}
