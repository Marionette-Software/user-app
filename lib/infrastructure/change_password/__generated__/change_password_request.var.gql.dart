// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'change_password_request.var.gql.g.dart';

abstract class GChangeMyPasswordVars
    implements Built<GChangeMyPasswordVars, GChangeMyPasswordVarsBuilder> {
  GChangeMyPasswordVars._();

  factory GChangeMyPasswordVars(
          [Function(GChangeMyPasswordVarsBuilder b) updates]) =
      _$GChangeMyPasswordVars;

  String get old_password;
  String get new_password;
  static Serializer<GChangeMyPasswordVars> get serializer =>
      _$gChangeMyPasswordVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GChangeMyPasswordVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GChangeMyPasswordVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GChangeMyPasswordVars.serializer,
        json,
      );
}
