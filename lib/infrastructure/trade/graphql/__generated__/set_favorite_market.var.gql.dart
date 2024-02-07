// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'set_favorite_market.var.gql.g.dart';

abstract class GsetFavoriteMarketVars
    implements Built<GsetFavoriteMarketVars, GsetFavoriteMarketVarsBuilder> {
  GsetFavoriteMarketVars._();

  factory GsetFavoriteMarketVars(
          [Function(GsetFavoriteMarketVarsBuilder b) updates]) =
      _$GsetFavoriteMarketVars;

  String get marketId;
  static Serializer<GsetFavoriteMarketVars> get serializer =>
      _$gsetFavoriteMarketVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GsetFavoriteMarketVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GsetFavoriteMarketVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GsetFavoriteMarketVars.serializer,
        json,
      );
}
