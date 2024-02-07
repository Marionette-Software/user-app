// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'diff_orderbook_subscription.data.gql.g.dart';

abstract class GPublicDiffOrderBookSubscriptionData
    implements
        Built<GPublicDiffOrderBookSubscriptionData,
            GPublicDiffOrderBookSubscriptionDataBuilder> {
  GPublicDiffOrderBookSubscriptionData._();

  factory GPublicDiffOrderBookSubscriptionData(
          [Function(GPublicDiffOrderBookSubscriptionDataBuilder b) updates]) =
      _$GPublicDiffOrderBookSubscriptionData;

  static void _initializeBuilder(
          GPublicDiffOrderBookSubscriptionDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook?
      get publicDiffOrderBook;
  static Serializer<GPublicDiffOrderBookSubscriptionData> get serializer =>
      _$gPublicDiffOrderBookSubscriptionDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicDiffOrderBookSubscriptionData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicDiffOrderBookSubscriptionData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicDiffOrderBookSubscriptionData.serializer,
        json,
      );
}

abstract class GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook
    implements
        Built<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook,
            GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder> {
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook._();

  factory GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook(
      [Function(
              GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder b)
          updates]) = _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook;

  static void _initializeBuilder(
          GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder b) =>
      b..G__typename = 'OrderBookDiff';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy?>?
      get buy;
  BuiltList<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell?>?
      get sell;
  static Serializer<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook>
      get serializer =>
          _$gPublicDiffOrderBookSubscriptionDataPublicDiffOrderBookSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook.serializer,
        json,
      );
}

abstract class GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy
    implements
        Built<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy,
            GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buyBuilder> {
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy._();

  factory GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy(
          [Function(
                  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buyBuilder
                      b)
              updates]) =
      _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy;

  static void _initializeBuilder(
          GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buyBuilder
              b) =>
      b..G__typename = 'OrderBookRecordDiff';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double? get price;
  double? get amountDiff;
  static Serializer<
          GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy>
      get serializer =>
          _$gPublicDiffOrderBookSubscriptionDataPublicDiffOrderBookBuySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy.serializer,
        json,
      );
}

abstract class GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell
    implements
        Built<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell,
            GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellBuilder> {
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell._();

  factory GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell(
          [Function(
                  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellBuilder
                      b)
              updates]) =
      _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell;

  static void _initializeBuilder(
          GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellBuilder
              b) =>
      b..G__typename = 'OrderBookRecordDiff';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double? get price;
  double? get amountDiff;
  static Serializer<
          GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell>
      get serializer =>
          _$gPublicDiffOrderBookSubscriptionDataPublicDiffOrderBookSellSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell
                .serializer,
            json,
          );
}
