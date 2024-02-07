// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'delete_api_key.var.gql.g.dart';

abstract class GDeleteApiKeyActionVars
    implements Built<GDeleteApiKeyActionVars, GDeleteApiKeyActionVarsBuilder> {
  GDeleteApiKeyActionVars._();

  factory GDeleteApiKeyActionVars(
          [Function(GDeleteApiKeyActionVarsBuilder b) updates]) =
      _$GDeleteApiKeyActionVars;

  String get id;
  String? get otp_code;
  static Serializer<GDeleteApiKeyActionVars> get serializer =>
      _$gDeleteApiKeyActionVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteApiKeyActionVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteApiKeyActionVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteApiKeyActionVars.serializer,
        json,
      );
}
