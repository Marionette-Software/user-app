// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'public_trades_history.var.gql.g.dart';

abstract class GGetPublicTradesHistoryVars
    implements
        Built<GGetPublicTradesHistoryVars, GGetPublicTradesHistoryVarsBuilder> {
  GGetPublicTradesHistoryVars._();

  factory GGetPublicTradesHistoryVars(
          [Function(GGetPublicTradesHistoryVarsBuilder b) updates]) =
      _$GGetPublicTradesHistoryVars;

  String? get market;
  static Serializer<GGetPublicTradesHistoryVars> get serializer =>
      _$gGetPublicTradesHistoryVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPublicTradesHistoryVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetPublicTradesHistoryVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPublicTradesHistoryVars.serializer,
        json,
      );
}
