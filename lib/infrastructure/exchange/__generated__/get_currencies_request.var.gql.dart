// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_currencies_request.var.gql.g.dart';

abstract class GGetCurrenciesVars
    implements Built<GGetCurrenciesVars, GGetCurrenciesVarsBuilder> {
  GGetCurrenciesVars._();

  factory GGetCurrenciesVars([Function(GGetCurrenciesVarsBuilder b) updates]) =
      _$GGetCurrenciesVars;

  static Serializer<GGetCurrenciesVars> get serializer =>
      _$gGetCurrenciesVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetCurrenciesVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetCurrenciesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetCurrenciesVars.serializer,
        json,
      );
}
