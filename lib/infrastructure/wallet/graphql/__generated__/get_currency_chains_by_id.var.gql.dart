// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_currency_chains_by_id.var.gql.g.dart';

abstract class GGetCurrencyChainsDataVars
    implements
        Built<GGetCurrencyChainsDataVars, GGetCurrencyChainsDataVarsBuilder> {
  GGetCurrencyChainsDataVars._();

  factory GGetCurrencyChainsDataVars(
          [Function(GGetCurrencyChainsDataVarsBuilder b) updates]) =
      _$GGetCurrencyChainsDataVars;

  String get currencyId;
  static Serializer<GGetCurrencyChainsDataVars> get serializer =>
      _$gGetCurrencyChainsDataVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetCurrencyChainsDataVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetCurrencyChainsDataVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetCurrencyChainsDataVars.serializer,
        json,
      );
}
