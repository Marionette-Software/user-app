// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'market_dynamics_query.data.gql.g.dart';

abstract class GGetMarketDynamicsData
    implements Built<GGetMarketDynamicsData, GGetMarketDynamicsDataBuilder> {
  GGetMarketDynamicsData._();

  factory GGetMarketDynamicsData(
          [Function(GGetMarketDynamicsDataBuilder b) updates]) =
      _$GGetMarketDynamicsData;

  static void _initializeBuilder(GGetMarketDynamicsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetMarketDynamicsData_marketDynamics? get marketDynamics;
  static Serializer<GGetMarketDynamicsData> get serializer =>
      _$gGetMarketDynamicsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketDynamicsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketDynamicsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketDynamicsData.serializer,
        json,
      );
}

abstract class GGetMarketDynamicsData_marketDynamics
    implements
        Built<GGetMarketDynamicsData_marketDynamics,
            GGetMarketDynamicsData_marketDynamicsBuilder> {
  GGetMarketDynamicsData_marketDynamics._();

  factory GGetMarketDynamicsData_marketDynamics(
          [Function(GGetMarketDynamicsData_marketDynamicsBuilder b) updates]) =
      _$GGetMarketDynamicsData_marketDynamics;

  static void _initializeBuilder(
          GGetMarketDynamicsData_marketDynamicsBuilder b) =>
      b..G__typename = 'MarketDynamics';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double? get startPrice;
  double? get lastPrice;
  double? get amount24h;
  double? get lowPrice;
  double? get highPrice;
  static Serializer<GGetMarketDynamicsData_marketDynamics> get serializer =>
      _$gGetMarketDynamicsDataMarketDynamicsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetMarketDynamicsData_marketDynamics.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetMarketDynamicsData_marketDynamics? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetMarketDynamicsData_marketDynamics.serializer,
        json,
      );
}
