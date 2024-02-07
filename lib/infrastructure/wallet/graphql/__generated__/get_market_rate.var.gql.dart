// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_market_rate.var.gql.g.dart';

abstract class GGetMarketRateVars
    implements Built<GGetMarketRateVars, GGetMarketRateVarsBuilder> {
  GGetMarketRateVars._();

  factory GGetMarketRateVars([Function(GGetMarketRateVarsBuilder b) updates]) =
      _$GGetMarketRateVars;

  String get market;
  static Serializer<GGetMarketRateVars> get serializer =>
      _$gGetMarketRateVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketRateVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketRateVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketRateVars.serializer,
        json,
      );
}
