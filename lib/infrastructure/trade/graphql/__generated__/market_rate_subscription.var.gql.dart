// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'market_rate_subscription.var.gql.g.dart';

abstract class GMarketRateVars
    implements Built<GMarketRateVars, GMarketRateVarsBuilder> {
  GMarketRateVars._();

  factory GMarketRateVars([Function(GMarketRateVarsBuilder b) updates]) =
      _$GMarketRateVars;

  String get market;
  static Serializer<GMarketRateVars> get serializer =>
      _$gMarketRateVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMarketRateVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMarketRateVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMarketRateVars.serializer,
        json,
      );
}
