// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_ref_user.var.gql.g.dart';

abstract class GGetRefUserVars
    implements Built<GGetRefUserVars, GGetRefUserVarsBuilder> {
  GGetRefUserVars._();

  factory GGetRefUserVars([Function(GGetRefUserVarsBuilder b) updates]) =
      _$GGetRefUserVars;

  static Serializer<GGetRefUserVars> get serializer =>
      _$gGetRefUserVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetRefUserVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetRefUserVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetRefUserVars.serializer,
        json,
      );
}
