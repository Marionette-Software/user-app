// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'cancel_order.var.gql.g.dart';

abstract class GCancelOrderActionVars
    implements Built<GCancelOrderActionVars, GCancelOrderActionVarsBuilder> {
  GCancelOrderActionVars._();

  factory GCancelOrderActionVars(
          [Function(GCancelOrderActionVarsBuilder b) updates]) =
      _$GCancelOrderActionVars;

  String get id;
  static Serializer<GCancelOrderActionVars> get serializer =>
      _$gCancelOrderActionVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCancelOrderActionVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCancelOrderActionVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCancelOrderActionVars.serializer,
        json,
      );
}
