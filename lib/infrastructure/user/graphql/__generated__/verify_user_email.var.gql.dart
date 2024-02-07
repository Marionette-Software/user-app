// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'verify_user_email.var.gql.g.dart';

abstract class GVerifyEmailTokenVars
    implements Built<GVerifyEmailTokenVars, GVerifyEmailTokenVarsBuilder> {
  GVerifyEmailTokenVars._();

  factory GVerifyEmailTokenVars(
          [Function(GVerifyEmailTokenVarsBuilder b) updates]) =
      _$GVerifyEmailTokenVars;

  String get token;
  bool? get isFront;
  static Serializer<GVerifyEmailTokenVars> get serializer =>
      _$gVerifyEmailTokenVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GVerifyEmailTokenVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GVerifyEmailTokenVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GVerifyEmailTokenVars.serializer,
        json,
      );
}
