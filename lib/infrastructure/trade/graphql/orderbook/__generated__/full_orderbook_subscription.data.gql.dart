// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'full_orderbook_subscription.data.gql.g.dart';

abstract class GPublicFullOrderBookSubscriptionData
    implements
        Built<GPublicFullOrderBookSubscriptionData,
            GPublicFullOrderBookSubscriptionDataBuilder> {
  GPublicFullOrderBookSubscriptionData._();

  factory GPublicFullOrderBookSubscriptionData(
          [Function(GPublicFullOrderBookSubscriptionDataBuilder b) updates]) =
      _$GPublicFullOrderBookSubscriptionData;

  static void _initializeBuilder(
          GPublicFullOrderBookSubscriptionDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook?
      get publicFullOrderBook;
  static Serializer<GPublicFullOrderBookSubscriptionData> get serializer =>
      _$gPublicFullOrderBookSubscriptionDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicFullOrderBookSubscriptionData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicFullOrderBookSubscriptionData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicFullOrderBookSubscriptionData.serializer,
        json,
      );
}

abstract class GPublicFullOrderBookSubscriptionData_publicFullOrderBook
    implements
        Built<GPublicFullOrderBookSubscriptionData_publicFullOrderBook,
            GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder> {
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook._();

  factory GPublicFullOrderBookSubscriptionData_publicFullOrderBook(
      [Function(
              GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder b)
          updates]) = _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook;

  static void _initializeBuilder(
          GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder b) =>
      b..G__typename = 'OrderBook';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy?>?
      get buy;
  BuiltList<GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell?>?
      get sell;
  static Serializer<GPublicFullOrderBookSubscriptionData_publicFullOrderBook>
      get serializer =>
          _$gPublicFullOrderBookSubscriptionDataPublicFullOrderBookSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicFullOrderBookSubscriptionData_publicFullOrderBook.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicFullOrderBookSubscriptionData_publicFullOrderBook? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicFullOrderBookSubscriptionData_publicFullOrderBook.serializer,
        json,
      );
}

abstract class GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy
    implements
        Built<GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy,
            GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buyBuilder> {
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy._();

  factory GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy(
          [Function(
                  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buyBuilder
                      b)
              updates]) =
      _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy;

  static void _initializeBuilder(
          GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buyBuilder
              b) =>
      b..G__typename = 'OrderBookRecord';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double? get price;
  double? get amount;
  double? get cumulativeAmount;
  static Serializer<
          GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy>
      get serializer =>
          _$gPublicFullOrderBookSubscriptionDataPublicFullOrderBookBuySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy.serializer,
        json,
      );
}

abstract class GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell
    implements
        Built<GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell,
            GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellBuilder> {
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell._();

  factory GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell(
          [Function(
                  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellBuilder
                      b)
              updates]) =
      _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell;

  static void _initializeBuilder(
          GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellBuilder
              b) =>
      b..G__typename = 'OrderBookRecord';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double? get price;
  double? get amount;
  double? get cumulativeAmount;
  static Serializer<
          GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell>
      get serializer =>
          _$gPublicFullOrderBookSubscriptionDataPublicFullOrderBookSellSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell
                .serializer,
            json,
          );
}
