// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'create_order.var.gql.g.dart';

abstract class GCreateOrderVars
    implements Built<GCreateOrderVars, GCreateOrderVarsBuilder> {
  GCreateOrderVars._();

  factory GCreateOrderVars([Function(GCreateOrderVarsBuilder b) updates]) =
      _$GCreateOrderVars;

  String get market;
  String get side;
  String get type;
  double? get price;
  double get amount;
  static Serializer<GCreateOrderVars> get serializer =>
      _$gCreateOrderVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateOrderVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateOrderVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateOrderVars.serializer,
        json,
      );
}
