// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'market_dynamics_query.var.gql.g.dart';

abstract class GGetMarketDynamicsVars
    implements Built<GGetMarketDynamicsVars, GGetMarketDynamicsVarsBuilder> {
  GGetMarketDynamicsVars._();

  factory GGetMarketDynamicsVars(
          [Function(GGetMarketDynamicsVarsBuilder b) updates]) =
      _$GGetMarketDynamicsVars;

  String get market;
  static Serializer<GGetMarketDynamicsVars> get serializer =>
      _$gGetMarketDynamicsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketDynamicsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketDynamicsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketDynamicsVars.serializer,
        json,
      );
}
