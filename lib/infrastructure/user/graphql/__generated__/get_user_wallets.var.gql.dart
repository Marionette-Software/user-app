// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_user_wallets.var.gql.g.dart';

abstract class GGetUserWalletsVars
    implements Built<GGetUserWalletsVars, GGetUserWalletsVarsBuilder> {
  GGetUserWalletsVars._();

  factory GGetUserWalletsVars(
      [Function(GGetUserWalletsVarsBuilder b) updates]) = _$GGetUserWalletsVars;

  String? get id;
  static Serializer<GGetUserWalletsVars> get serializer =>
      _$gGetUserWalletsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserWalletsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserWalletsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserWalletsVars.serializer,
        json,
      );
}
