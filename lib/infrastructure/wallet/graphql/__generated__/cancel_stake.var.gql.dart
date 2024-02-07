// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'cancel_stake.var.gql.g.dart';

abstract class GCancelCurrencyStateVars
    implements
        Built<GCancelCurrencyStateVars, GCancelCurrencyStateVarsBuilder> {
  GCancelCurrencyStateVars._();

  factory GCancelCurrencyStateVars(
          [Function(GCancelCurrencyStateVarsBuilder b) updates]) =
      _$GCancelCurrencyStateVars;

  String get currencyId;
  static Serializer<GCancelCurrencyStateVars> get serializer =>
      _$gCancelCurrencyStateVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCancelCurrencyStateVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCancelCurrencyStateVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCancelCurrencyStateVars.serializer,
        json,
      );
}
