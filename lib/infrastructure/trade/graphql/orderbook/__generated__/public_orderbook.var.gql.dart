// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'public_orderbook.var.gql.g.dart';

abstract class GPublicOrderBookVars
    implements Built<GPublicOrderBookVars, GPublicOrderBookVarsBuilder> {
  GPublicOrderBookVars._();

  factory GPublicOrderBookVars(
          [Function(GPublicOrderBookVarsBuilder b) updates]) =
      _$GPublicOrderBookVars;

  String get market;
  static Serializer<GPublicOrderBookVars> get serializer =>
      _$gPublicOrderBookVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicOrderBookVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicOrderBookVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicOrderBookVars.serializer,
        json,
      );
}
