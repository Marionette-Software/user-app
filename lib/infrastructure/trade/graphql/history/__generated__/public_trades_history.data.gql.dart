// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'public_trades_history.data.gql.g.dart';

abstract class GGetPublicTradesHistoryData
    implements
        Built<GGetPublicTradesHistoryData, GGetPublicTradesHistoryDataBuilder> {
  GGetPublicTradesHistoryData._();

  factory GGetPublicTradesHistoryData(
          [Function(GGetPublicTradesHistoryDataBuilder b) updates]) =
      _$GGetPublicTradesHistoryData;

  static void _initializeBuilder(GGetPublicTradesHistoryDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetPublicTradesHistoryData_publicTrades? get publicTrades;
  static Serializer<GGetPublicTradesHistoryData> get serializer =>
      _$gGetPublicTradesHistoryDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPublicTradesHistoryData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetPublicTradesHistoryData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPublicTradesHistoryData.serializer,
        json,
      );
}

abstract class GGetPublicTradesHistoryData_publicTrades
    implements
        Built<GGetPublicTradesHistoryData_publicTrades,
            GGetPublicTradesHistoryData_publicTradesBuilder> {
  GGetPublicTradesHistoryData_publicTrades._();

  factory GGetPublicTradesHistoryData_publicTrades(
      [Function(GGetPublicTradesHistoryData_publicTradesBuilder b)
          updates]) = _$GGetPublicTradesHistoryData_publicTrades;

  static void _initializeBuilder(
          GGetPublicTradesHistoryData_publicTradesBuilder b) =>
      b..G__typename = 'PublicTradesPaginated';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetPublicTradesHistoryData_publicTrades_result?>? get result;
  static Serializer<GGetPublicTradesHistoryData_publicTrades> get serializer =>
      _$gGetPublicTradesHistoryDataPublicTradesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPublicTradesHistoryData_publicTrades.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetPublicTradesHistoryData_publicTrades? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPublicTradesHistoryData_publicTrades.serializer,
        json,
      );
}

abstract class GGetPublicTradesHistoryData_publicTrades_result
    implements
        Built<GGetPublicTradesHistoryData_publicTrades_result,
            GGetPublicTradesHistoryData_publicTrades_resultBuilder> {
  GGetPublicTradesHistoryData_publicTrades_result._();

  factory GGetPublicTradesHistoryData_publicTrades_result(
      [Function(GGetPublicTradesHistoryData_publicTrades_resultBuilder b)
          updates]) = _$GGetPublicTradesHistoryData_publicTrades_result;

  static void _initializeBuilder(
          GGetPublicTradesHistoryData_publicTrades_resultBuilder b) =>
      b..G__typename = 'PublicTrade';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double? get price;
  double? get amount;
  String? get createdAt;
  String? get makerOrderSide;
  static Serializer<GGetPublicTradesHistoryData_publicTrades_result>
      get serializer =>
          _$gGetPublicTradesHistoryDataPublicTradesResultSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetPublicTradesHistoryData_publicTrades_result.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetPublicTradesHistoryData_publicTrades_result? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetPublicTradesHistoryData_publicTrades_result.serializer,
        json,
      );
}
