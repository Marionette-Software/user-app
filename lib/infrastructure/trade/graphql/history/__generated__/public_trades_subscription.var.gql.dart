// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'public_trades_subscription.var.gql.g.dart';

abstract class GPublicTradesSubscriptionVars
    implements
        Built<GPublicTradesSubscriptionVars,
            GPublicTradesSubscriptionVarsBuilder> {
  GPublicTradesSubscriptionVars._();

  factory GPublicTradesSubscriptionVars(
          [Function(GPublicTradesSubscriptionVarsBuilder b) updates]) =
      _$GPublicTradesSubscriptionVars;

  String get market;
  static Serializer<GPublicTradesSubscriptionVars> get serializer =>
      _$gPublicTradesSubscriptionVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicTradesSubscriptionVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicTradesSubscriptionVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicTradesSubscriptionVars.serializer,
        json,
      );
}
