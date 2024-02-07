// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_market.var.gql.g.dart';

abstract class GGetMarketVars
    implements Built<GGetMarketVars, GGetMarketVarsBuilder> {
  GGetMarketVars._();

  factory GGetMarketVars([Function(GGetMarketVarsBuilder b) updates]) =
      _$GGetMarketVars;

  String get id;
  static Serializer<GGetMarketVars> get serializer =>
      _$gGetMarketVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketVars.serializer,
        json,
      );
}
