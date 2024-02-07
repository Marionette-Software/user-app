// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'user_all_balance_subscription.var.gql.g.dart';

abstract class GUserAllBalanceVars
    implements Built<GUserAllBalanceVars, GUserAllBalanceVarsBuilder> {
  GUserAllBalanceVars._();

  factory GUserAllBalanceVars(
      [Function(GUserAllBalanceVarsBuilder b) updates]) = _$GUserAllBalanceVars;

  String get token;
  static Serializer<GUserAllBalanceVars> get serializer =>
      _$gUserAllBalanceVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserAllBalanceVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserAllBalanceVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserAllBalanceVars.serializer,
        json,
      );
}
