// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'full_orderbook_subscription.var.gql.g.dart';

abstract class GPublicFullOrderBookSubscriptionVars
    implements
        Built<GPublicFullOrderBookSubscriptionVars,
            GPublicFullOrderBookSubscriptionVarsBuilder> {
  GPublicFullOrderBookSubscriptionVars._();

  factory GPublicFullOrderBookSubscriptionVars(
          [Function(GPublicFullOrderBookSubscriptionVarsBuilder b) updates]) =
      _$GPublicFullOrderBookSubscriptionVars;

  String get market;
  static Serializer<GPublicFullOrderBookSubscriptionVars> get serializer =>
      _$gPublicFullOrderBookSubscriptionVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicFullOrderBookSubscriptionVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicFullOrderBookSubscriptionVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicFullOrderBookSubscriptionVars.serializer,
        json,
      );
}
