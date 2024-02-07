// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'verify_user_phone.var.gql.g.dart';

abstract class GVerifyUserPhoneNumberVars
    implements
        Built<GVerifyUserPhoneNumberVars, GVerifyUserPhoneNumberVarsBuilder> {
  GVerifyUserPhoneNumberVars._();

  factory GVerifyUserPhoneNumberVars(
          [Function(GVerifyUserPhoneNumberVarsBuilder b) updates]) =
      _$GVerifyUserPhoneNumberVars;

  String get phone;
  String get code;
  static Serializer<GVerifyUserPhoneNumberVars> get serializer =>
      _$gVerifyUserPhoneNumberVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GVerifyUserPhoneNumberVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GVerifyUserPhoneNumberVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GVerifyUserPhoneNumberVars.serializer,
        json,
      );
}
