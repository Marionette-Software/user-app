// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'market_rate_subscription.data.gql.g.dart';

abstract class GMarketRateData
    implements Built<GMarketRateData, GMarketRateDataBuilder> {
  GMarketRateData._();

  factory GMarketRateData([Function(GMarketRateDataBuilder b) updates]) =
      _$GMarketRateData;

  static void _initializeBuilder(GMarketRateDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GMarketRateData_marketRate? get marketRate;
  static Serializer<GMarketRateData> get serializer =>
      _$gMarketRateDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMarketRateData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMarketRateData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMarketRateData.serializer,
        json,
      );
}

abstract class GMarketRateData_marketRate
    implements
        Built<GMarketRateData_marketRate, GMarketRateData_marketRateBuilder> {
  GMarketRateData_marketRate._();

  factory GMarketRateData_marketRate(
          [Function(GMarketRateData_marketRateBuilder b) updates]) =
      _$GMarketRateData_marketRate;

  static void _initializeBuilder(GMarketRateData_marketRateBuilder b) =>
      b..G__typename = 'MarketRate';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get market;
  double? get rate;
  String? get ts;
  static Serializer<GMarketRateData_marketRate> get serializer =>
      _$gMarketRateDataMarketRateSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMarketRateData_marketRate.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMarketRateData_marketRate? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMarketRateData_marketRate.serializer,
        json,
      );
}
