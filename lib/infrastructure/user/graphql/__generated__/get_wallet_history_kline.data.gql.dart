// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_wallet_history_kline.data.gql.g.dart';

abstract class GWalletHistoryKlineData
    implements Built<GWalletHistoryKlineData, GWalletHistoryKlineDataBuilder> {
  GWalletHistoryKlineData._();

  factory GWalletHistoryKlineData(
          [Function(GWalletHistoryKlineDataBuilder b) updates]) =
      _$GWalletHistoryKlineData;

  static void _initializeBuilder(GWalletHistoryKlineDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GWalletHistoryKlineData_kline?>? get kline;
  static Serializer<GWalletHistoryKlineData> get serializer =>
      _$gWalletHistoryKlineDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWalletHistoryKlineData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWalletHistoryKlineData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWalletHistoryKlineData.serializer,
        json,
      );
}

abstract class GWalletHistoryKlineData_kline
    implements
        Built<GWalletHistoryKlineData_kline,
            GWalletHistoryKlineData_klineBuilder> {
  GWalletHistoryKlineData_kline._();

  factory GWalletHistoryKlineData_kline(
          [Function(GWalletHistoryKlineData_klineBuilder b) updates]) =
      _$GWalletHistoryKlineData_kline;

  static void _initializeBuilder(GWalletHistoryKlineData_klineBuilder b) =>
      b..G__typename = 'KLine';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double? get close;
  double? get low;
  double? get high;
  int? get timestamp;
  double? get volume;
  static Serializer<GWalletHistoryKlineData_kline> get serializer =>
      _$gWalletHistoryKlineDataKlineSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWalletHistoryKlineData_kline.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWalletHistoryKlineData_kline? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWalletHistoryKlineData_kline.serializer,
        json,
      );
}
