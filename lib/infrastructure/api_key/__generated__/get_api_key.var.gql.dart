// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_api_key.var.gql.g.dart';

abstract class GGetApiKeysVars
    implements Built<GGetApiKeysVars, GGetApiKeysVarsBuilder> {
  GGetApiKeysVars._();

  factory GGetApiKeysVars([Function(GGetApiKeysVarsBuilder b) updates]) =
      _$GGetApiKeysVars;

  static Serializer<GGetApiKeysVars> get serializer =>
      _$gGetApiKeysVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetApiKeysVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetApiKeysVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetApiKeysVars.serializer,
        json,
      );
}
