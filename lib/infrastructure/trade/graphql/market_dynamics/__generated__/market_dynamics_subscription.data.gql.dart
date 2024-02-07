// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'market_dynamics_subscription.data.gql.g.dart';

abstract class GMarketDynamicsData
    implements Built<GMarketDynamicsData, GMarketDynamicsDataBuilder> {
  GMarketDynamicsData._();

  factory GMarketDynamicsData(
      [Function(GMarketDynamicsDataBuilder b) updates]) = _$GMarketDynamicsData;

  static void _initializeBuilder(GMarketDynamicsDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GMarketDynamicsData_marketDynamics? get marketDynamics;
  static Serializer<GMarketDynamicsData> get serializer =>
      _$gMarketDynamicsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMarketDynamicsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMarketDynamicsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMarketDynamicsData.serializer,
        json,
      );
}

abstract class GMarketDynamicsData_marketDynamics
    implements
        Built<GMarketDynamicsData_marketDynamics,
            GMarketDynamicsData_marketDynamicsBuilder> {
  GMarketDynamicsData_marketDynamics._();

  factory GMarketDynamicsData_marketDynamics(
          [Function(GMarketDynamicsData_marketDynamicsBuilder b) updates]) =
      _$GMarketDynamicsData_marketDynamics;

  static void _initializeBuilder(GMarketDynamicsData_marketDynamicsBuilder b) =>
      b..G__typename = 'MarketDynamics';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get marketId;
  double? get startPrice;
  double? get lastPrice;
  double? get amount24h;
  double? get lowPrice;
  double? get highPrice;
  static Serializer<GMarketDynamicsData_marketDynamics> get serializer =>
      _$gMarketDynamicsDataMarketDynamicsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMarketDynamicsData_marketDynamics.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMarketDynamicsData_marketDynamics? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMarketDynamicsData_marketDynamics.serializer,
        json,
      );
}
