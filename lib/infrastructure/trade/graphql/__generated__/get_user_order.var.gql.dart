// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_user_order.var.gql.g.dart';

abstract class GGetUserOrderVars
    implements Built<GGetUserOrderVars, GGetUserOrderVarsBuilder> {
  GGetUserOrderVars._();

  factory GGetUserOrderVars([Function(GGetUserOrderVarsBuilder b) updates]) =
      _$GGetUserOrderVars;

  String? get id;
  static Serializer<GGetUserOrderVars> get serializer =>
      _$gGetUserOrderVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserOrderVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserOrderVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserOrderVars.serializer,
        json,
      );
}
