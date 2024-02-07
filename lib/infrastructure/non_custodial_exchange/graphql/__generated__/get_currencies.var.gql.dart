// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_currencies.var.gql.g.dart';

abstract class GGetNonCustodialCurrenciesVars
    implements
        Built<GGetNonCustodialCurrenciesVars,
            GGetNonCustodialCurrenciesVarsBuilder> {
  GGetNonCustodialCurrenciesVars._();

  factory GGetNonCustodialCurrenciesVars(
          [Function(GGetNonCustodialCurrenciesVarsBuilder b) updates]) =
      _$GGetNonCustodialCurrenciesVars;

  static Serializer<GGetNonCustodialCurrenciesVars> get serializer =>
      _$gGetNonCustodialCurrenciesVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetNonCustodialCurrenciesVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetNonCustodialCurrenciesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetNonCustodialCurrenciesVars.serializer,
        json,
      );
}
