// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_markets.var.gql.g.dart';

abstract class GGetMarketsVars
    implements Built<GGetMarketsVars, GGetMarketsVarsBuilder> {
  GGetMarketsVars._();

  factory GGetMarketsVars([Function(GGetMarketsVarsBuilder b) updates]) =
      _$GGetMarketsVars;

  static Serializer<GGetMarketsVars> get serializer =>
      _$gGetMarketsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketsVars.serializer,
        json,
      );
}
