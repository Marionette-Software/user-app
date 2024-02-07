// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_user_balances.var.gql.g.dart';

abstract class GGetUserBalancesVars
    implements Built<GGetUserBalancesVars, GGetUserBalancesVarsBuilder> {
  GGetUserBalancesVars._();

  factory GGetUserBalancesVars(
          [Function(GGetUserBalancesVarsBuilder b) updates]) =
      _$GGetUserBalancesVars;

  String? get id;
  static Serializer<GGetUserBalancesVars> get serializer =>
      _$gGetUserBalancesVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserBalancesVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserBalancesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserBalancesVars.serializer,
        json,
      );
}
