// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_user_history.var.gql.g.dart';

abstract class GGetUserHistoryVars
    implements Built<GGetUserHistoryVars, GGetUserHistoryVarsBuilder> {
  GGetUserHistoryVars._();

  factory GGetUserHistoryVars(
      [Function(GGetUserHistoryVarsBuilder b) updates]) = _$GGetUserHistoryVars;

  String? get currencyId;
  int? get limit;
  int? get page;
  String? get type;
  String? get from;
  String? get to;
  static Serializer<GGetUserHistoryVars> get serializer =>
      _$gGetUserHistoryVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserHistoryVars.serializer,
        json,
      );
}
