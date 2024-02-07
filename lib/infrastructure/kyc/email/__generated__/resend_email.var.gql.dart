// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'resend_email.var.gql.g.dart';

abstract class GResendEmailConfirmVars
    implements Built<GResendEmailConfirmVars, GResendEmailConfirmVarsBuilder> {
  GResendEmailConfirmVars._();

  factory GResendEmailConfirmVars(
          [Function(GResendEmailConfirmVarsBuilder b) updates]) =
      _$GResendEmailConfirmVars;

  String get email;
  static Serializer<GResendEmailConfirmVars> get serializer =>
      _$gResendEmailConfirmVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GResendEmailConfirmVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GResendEmailConfirmVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GResendEmailConfirmVars.serializer,
        json,
      );
}
