// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'user_trades_history.data.gql.g.dart';

abstract class GGetUserTradesHistoryData
    implements
        Built<GGetUserTradesHistoryData, GGetUserTradesHistoryDataBuilder> {
  GGetUserTradesHistoryData._();

  factory GGetUserTradesHistoryData(
          [Function(GGetUserTradesHistoryDataBuilder b) updates]) =
      _$GGetUserTradesHistoryData;

  static void _initializeBuilder(GGetUserTradesHistoryDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetUserTradesHistoryData_userTrades? get userTrades;
  static Serializer<GGetUserTradesHistoryData> get serializer =>
      _$gGetUserTradesHistoryDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserTradesHistoryData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserTradesHistoryData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserTradesHistoryData.serializer,
        json,
      );
}

abstract class GGetUserTradesHistoryData_userTrades
    implements
        Built<GGetUserTradesHistoryData_userTrades,
            GGetUserTradesHistoryData_userTradesBuilder> {
  GGetUserTradesHistoryData_userTrades._();

  factory GGetUserTradesHistoryData_userTrades(
          [Function(GGetUserTradesHistoryData_userTradesBuilder b) updates]) =
      _$GGetUserTradesHistoryData_userTrades;

  static void _initializeBuilder(
          GGetUserTradesHistoryData_userTradesBuilder b) =>
      b..G__typename = 'UserTradesPaginated';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetUserTradesHistoryData_userTrades_result?>? get result;
  static Serializer<GGetUserTradesHistoryData_userTrades> get serializer =>
      _$gGetUserTradesHistoryDataUserTradesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserTradesHistoryData_userTrades.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserTradesHistoryData_userTrades? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserTradesHistoryData_userTrades.serializer,
        json,
      );
}

abstract class GGetUserTradesHistoryData_userTrades_result
    implements
        Built<GGetUserTradesHistoryData_userTrades_result,
            GGetUserTradesHistoryData_userTrades_resultBuilder> {
  GGetUserTradesHistoryData_userTrades_result._();

  factory GGetUserTradesHistoryData_userTrades_result(
      [Function(GGetUserTradesHistoryData_userTrades_resultBuilder b)
          updates]) = _$GGetUserTradesHistoryData_userTrades_result;

  static void _initializeBuilder(
          GGetUserTradesHistoryData_userTrades_resultBuilder b) =>
      b..G__typename = 'UserTrade';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double? get price;
  double? get amount;
  String? get createdAt;
  String? get sellUserId;
  String? get buyUserId;
  static Serializer<GGetUserTradesHistoryData_userTrades_result>
      get serializer => _$gGetUserTradesHistoryDataUserTradesResultSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserTradesHistoryData_userTrades_result.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserTradesHistoryData_userTrades_result? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserTradesHistoryData_userTrades_result.serializer,
        json,
      );
}
