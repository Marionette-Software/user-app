// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'user_balances_subscription.var.gql.g.dart';

abstract class GUserBalancesVars
    implements Built<GUserBalancesVars, GUserBalancesVarsBuilder> {
  GUserBalancesVars._();

  factory GUserBalancesVars([Function(GUserBalancesVarsBuilder b) updates]) =
      _$GUserBalancesVars;

  String get token;
  static Serializer<GUserBalancesVars> get serializer =>
      _$gUserBalancesVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserBalancesVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserBalancesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserBalancesVars.serializer,
        json,
      );
}
