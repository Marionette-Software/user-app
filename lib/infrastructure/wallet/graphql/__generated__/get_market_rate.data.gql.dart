// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_market_rate.data.gql.g.dart';

abstract class GGetMarketRateData
    implements Built<GGetMarketRateData, GGetMarketRateDataBuilder> {
  GGetMarketRateData._();

  factory GGetMarketRateData([Function(GGetMarketRateDataBuilder b) updates]) =
      _$GGetMarketRateData;

  static void _initializeBuilder(GGetMarketRateDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetMarketRateData_marketRate? get marketRate;
  static Serializer<GGetMarketRateData> get serializer =>
      _$gGetMarketRateDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketRateData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketRateData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketRateData.serializer,
        json,
      );
}

abstract class GGetMarketRateData_marketRate
    implements
        Built<GGetMarketRateData_marketRate,
            GGetMarketRateData_marketRateBuilder> {
  GGetMarketRateData_marketRate._();

  factory GGetMarketRateData_marketRate(
          [Function(GGetMarketRateData_marketRateBuilder b) updates]) =
      _$GGetMarketRateData_marketRate;

  static void _initializeBuilder(GGetMarketRateData_marketRateBuilder b) =>
      b..G__typename = 'MarketRate';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get market;
  double? get rate;
  String? get ts;
  static Serializer<GGetMarketRateData_marketRate> get serializer =>
      _$gGetMarketRateDataMarketRateSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketRateData_marketRate.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketRateData_marketRate? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketRateData_marketRate.serializer,
        json,
      );
}
