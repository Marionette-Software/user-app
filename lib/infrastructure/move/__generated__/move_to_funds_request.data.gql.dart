// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'move_to_funds_request.data.gql.g.dart';

abstract class GMoveToAdvancedTradingFundsData
    implements
        Built<GMoveToAdvancedTradingFundsData,
            GMoveToAdvancedTradingFundsDataBuilder> {
  GMoveToAdvancedTradingFundsData._();

  factory GMoveToAdvancedTradingFundsData(
          [Function(GMoveToAdvancedTradingFundsDataBuilder b) updates]) =
      _$GMoveToAdvancedTradingFundsData;

  static void _initializeBuilder(GMoveToAdvancedTradingFundsDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get moveToAdvancedTrading;
  static Serializer<GMoveToAdvancedTradingFundsData> get serializer =>
      _$gMoveToAdvancedTradingFundsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMoveToAdvancedTradingFundsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMoveToAdvancedTradingFundsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMoveToAdvancedTradingFundsData.serializer,
        json,
      );
}
