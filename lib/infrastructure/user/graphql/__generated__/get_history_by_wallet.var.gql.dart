// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_history_by_wallet.var.gql.g.dart';

abstract class GGetUserHistoryByIdVars
    implements Built<GGetUserHistoryByIdVars, GGetUserHistoryByIdVarsBuilder> {
  GGetUserHistoryByIdVars._();

  factory GGetUserHistoryByIdVars(
          [Function(GGetUserHistoryByIdVarsBuilder b) updates]) =
      _$GGetUserHistoryByIdVars;

  String get currencyId;
  static Serializer<GGetUserHistoryByIdVars> get serializer =>
      _$gGetUserHistoryByIdVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserHistoryByIdVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserHistoryByIdVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserHistoryByIdVars.serializer,
        json,
      );
}
