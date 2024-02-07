// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'move_from_funds_request.var.gql.g.dart';

abstract class GMoveFromAdvancedTradingFundsVars
    implements
        Built<GMoveFromAdvancedTradingFundsVars,
            GMoveFromAdvancedTradingFundsVarsBuilder> {
  GMoveFromAdvancedTradingFundsVars._();

  factory GMoveFromAdvancedTradingFundsVars(
          [Function(GMoveFromAdvancedTradingFundsVarsBuilder b) updates]) =
      _$GMoveFromAdvancedTradingFundsVars;

  String get currencyId;
  double get amount;
  static Serializer<GMoveFromAdvancedTradingFundsVars> get serializer =>
      _$gMoveFromAdvancedTradingFundsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMoveFromAdvancedTradingFundsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMoveFromAdvancedTradingFundsVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMoveFromAdvancedTradingFundsVars.serializer,
        json,
      );
}
