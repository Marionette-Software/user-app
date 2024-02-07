// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'cancel_all_orders.var.gql.g.dart';

abstract class GCancelAllOrdersVars
    implements Built<GCancelAllOrdersVars, GCancelAllOrdersVarsBuilder> {
  GCancelAllOrdersVars._();

  factory GCancelAllOrdersVars(
          [Function(GCancelAllOrdersVarsBuilder b) updates]) =
      _$GCancelAllOrdersVars;

  String get market;
  static Serializer<GCancelAllOrdersVars> get serializer =>
      _$gCancelAllOrdersVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCancelAllOrdersVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCancelAllOrdersVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCancelAllOrdersVars.serializer,
        json,
      );
}
