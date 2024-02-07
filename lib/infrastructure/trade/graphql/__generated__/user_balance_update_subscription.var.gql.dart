// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'user_balance_update_subscription.var.gql.g.dart';

abstract class GGetUserBalanceUpdatedVars
    implements
        Built<GGetUserBalanceUpdatedVars, GGetUserBalanceUpdatedVarsBuilder> {
  GGetUserBalanceUpdatedVars._();

  factory GGetUserBalanceUpdatedVars(
          [Function(GGetUserBalanceUpdatedVarsBuilder b) updates]) =
      _$GGetUserBalanceUpdatedVars;

  String get token;
  static Serializer<GGetUserBalanceUpdatedVars> get serializer =>
      _$gGetUserBalanceUpdatedVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserBalanceUpdatedVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserBalanceUpdatedVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserBalanceUpdatedVars.serializer,
        json,
      );
}
