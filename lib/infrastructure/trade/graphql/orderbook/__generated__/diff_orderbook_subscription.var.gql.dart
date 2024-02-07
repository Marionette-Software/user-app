// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'diff_orderbook_subscription.var.gql.g.dart';

abstract class GPublicDiffOrderBookSubscriptionVars
    implements
        Built<GPublicDiffOrderBookSubscriptionVars,
            GPublicDiffOrderBookSubscriptionVarsBuilder> {
  GPublicDiffOrderBookSubscriptionVars._();

  factory GPublicDiffOrderBookSubscriptionVars(
          [Function(GPublicDiffOrderBookSubscriptionVarsBuilder b) updates]) =
      _$GPublicDiffOrderBookSubscriptionVars;

  String get market;
  static Serializer<GPublicDiffOrderBookSubscriptionVars> get serializer =>
      _$gPublicDiffOrderBookSubscriptionVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicDiffOrderBookSubscriptionVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicDiffOrderBookSubscriptionVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicDiffOrderBookSubscriptionVars.serializer,
        json,
      );
}
