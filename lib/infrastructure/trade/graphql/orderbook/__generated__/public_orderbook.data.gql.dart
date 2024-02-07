// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'public_orderbook.data.gql.g.dart';

abstract class GPublicOrderBookData
    implements Built<GPublicOrderBookData, GPublicOrderBookDataBuilder> {
  GPublicOrderBookData._();

  factory GPublicOrderBookData(
          [Function(GPublicOrderBookDataBuilder b) updates]) =
      _$GPublicOrderBookData;

  static void _initializeBuilder(GPublicOrderBookDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GPublicOrderBookData_publicOrderBook? get publicOrderBook;
  static Serializer<GPublicOrderBookData> get serializer =>
      _$gPublicOrderBookDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicOrderBookData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicOrderBookData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicOrderBookData.serializer,
        json,
      );
}

abstract class GPublicOrderBookData_publicOrderBook
    implements
        Built<GPublicOrderBookData_publicOrderBook,
            GPublicOrderBookData_publicOrderBookBuilder> {
  GPublicOrderBookData_publicOrderBook._();

  factory GPublicOrderBookData_publicOrderBook(
          [Function(GPublicOrderBookData_publicOrderBookBuilder b) updates]) =
      _$GPublicOrderBookData_publicOrderBook;

  static void _initializeBuilder(
          GPublicOrderBookData_publicOrderBookBuilder b) =>
      b..G__typename = 'OrderBook';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GPublicOrderBookData_publicOrderBook_buy?>? get buy;
  BuiltList<GPublicOrderBookData_publicOrderBook_sell?>? get sell;
  static Serializer<GPublicOrderBookData_publicOrderBook> get serializer =>
      _$gPublicOrderBookDataPublicOrderBookSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicOrderBookData_publicOrderBook.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicOrderBookData_publicOrderBook? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicOrderBookData_publicOrderBook.serializer,
        json,
      );
}

abstract class GPublicOrderBookData_publicOrderBook_buy
    implements
        Built<GPublicOrderBookData_publicOrderBook_buy,
            GPublicOrderBookData_publicOrderBook_buyBuilder> {
  GPublicOrderBookData_publicOrderBook_buy._();

  factory GPublicOrderBookData_publicOrderBook_buy(
      [Function(GPublicOrderBookData_publicOrderBook_buyBuilder b)
          updates]) = _$GPublicOrderBookData_publicOrderBook_buy;

  static void _initializeBuilder(
          GPublicOrderBookData_publicOrderBook_buyBuilder b) =>
      b..G__typename = 'OrderBookRecord';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double? get price;
  double? get amount;
  double? get cumulativeAmount;
  static Serializer<GPublicOrderBookData_publicOrderBook_buy> get serializer =>
      _$gPublicOrderBookDataPublicOrderBookBuySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicOrderBookData_publicOrderBook_buy.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicOrderBookData_publicOrderBook_buy? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicOrderBookData_publicOrderBook_buy.serializer,
        json,
      );
}

abstract class GPublicOrderBookData_publicOrderBook_sell
    implements
        Built<GPublicOrderBookData_publicOrderBook_sell,
            GPublicOrderBookData_publicOrderBook_sellBuilder> {
  GPublicOrderBookData_publicOrderBook_sell._();

  factory GPublicOrderBookData_publicOrderBook_sell(
      [Function(GPublicOrderBookData_publicOrderBook_sellBuilder b)
          updates]) = _$GPublicOrderBookData_publicOrderBook_sell;

  static void _initializeBuilder(
          GPublicOrderBookData_publicOrderBook_sellBuilder b) =>
      b..G__typename = 'OrderBookRecord';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double? get price;
  double? get amount;
  double? get cumulativeAmount;
  static Serializer<GPublicOrderBookData_publicOrderBook_sell> get serializer =>
      _$gPublicOrderBookDataPublicOrderBookSellSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicOrderBookData_publicOrderBook_sell.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicOrderBookData_publicOrderBook_sell? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicOrderBookData_publicOrderBook_sell.serializer,
        json,
      );
}
