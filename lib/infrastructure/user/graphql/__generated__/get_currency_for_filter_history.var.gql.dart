// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_currency_for_filter_history.var.gql.g.dart';

abstract class GGetCurrencyForFilterHistoryVars
    implements
        Built<GGetCurrencyForFilterHistoryVars,
            GGetCurrencyForFilterHistoryVarsBuilder> {
  GGetCurrencyForFilterHistoryVars._();

  factory GGetCurrencyForFilterHistoryVars(
          [Function(GGetCurrencyForFilterHistoryVarsBuilder b) updates]) =
      _$GGetCurrencyForFilterHistoryVars;

  String? get id;
  static Serializer<GGetCurrencyForFilterHistoryVars> get serializer =>
      _$gGetCurrencyForFilterHistoryVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetCurrencyForFilterHistoryVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetCurrencyForFilterHistoryVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetCurrencyForFilterHistoryVars.serializer,
        json,
      );
}
