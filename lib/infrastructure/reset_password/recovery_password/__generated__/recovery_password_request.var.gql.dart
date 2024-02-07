// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'recovery_password_request.var.gql.g.dart';

abstract class GRecoveryPasswordVars
    implements Built<GRecoveryPasswordVars, GRecoveryPasswordVarsBuilder> {
  GRecoveryPasswordVars._();

  factory GRecoveryPasswordVars(
          [Function(GRecoveryPasswordVarsBuilder b) updates]) =
      _$GRecoveryPasswordVars;

  String get token;
  String get newPassword;
  static Serializer<GRecoveryPasswordVars> get serializer =>
      _$gRecoveryPasswordVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRecoveryPasswordVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRecoveryPasswordVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRecoveryPasswordVars.serializer,
        json,
      );
}
