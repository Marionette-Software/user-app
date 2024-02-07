// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'move_to_funds_request.var.gql.g.dart';

abstract class GMoveToAdvancedTradingFundsVars
    implements
        Built<GMoveToAdvancedTradingFundsVars,
            GMoveToAdvancedTradingFundsVarsBuilder> {
  GMoveToAdvancedTradingFundsVars._();

  factory GMoveToAdvancedTradingFundsVars(
          [Function(GMoveToAdvancedTradingFundsVarsBuilder b) updates]) =
      _$GMoveToAdvancedTradingFundsVars;

  String get currencyId;
  double get amount;
  static Serializer<GMoveToAdvancedTradingFundsVars> get serializer =>
      _$gMoveToAdvancedTradingFundsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMoveToAdvancedTradingFundsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMoveToAdvancedTradingFundsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMoveToAdvancedTradingFundsVars.serializer,
        json,
      );
}
