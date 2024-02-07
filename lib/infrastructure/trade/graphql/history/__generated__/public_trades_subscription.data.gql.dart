// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'public_trades_subscription.data.gql.g.dart';

abstract class GPublicTradesSubscriptionData
    implements
        Built<GPublicTradesSubscriptionData,
            GPublicTradesSubscriptionDataBuilder> {
  GPublicTradesSubscriptionData._();

  factory GPublicTradesSubscriptionData(
          [Function(GPublicTradesSubscriptionDataBuilder b) updates]) =
      _$GPublicTradesSubscriptionData;

  static void _initializeBuilder(GPublicTradesSubscriptionDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GPublicTradesSubscriptionData_publicTrades? get publicTrades;
  static Serializer<GPublicTradesSubscriptionData> get serializer =>
      _$gPublicTradesSubscriptionDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicTradesSubscriptionData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicTradesSubscriptionData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicTradesSubscriptionData.serializer,
        json,
      );
}

abstract class GPublicTradesSubscriptionData_publicTrades
    implements
        Built<GPublicTradesSubscriptionData_publicTrades,
            GPublicTradesSubscriptionData_publicTradesBuilder> {
  GPublicTradesSubscriptionData_publicTrades._();

  factory GPublicTradesSubscriptionData_publicTrades(
      [Function(GPublicTradesSubscriptionData_publicTradesBuilder b)
          updates]) = _$GPublicTradesSubscriptionData_publicTrades;

  static void _initializeBuilder(
          GPublicTradesSubscriptionData_publicTradesBuilder b) =>
      b..G__typename = 'PublicTrade';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double? get price;
  double? get amount;
  String? get createdAt;
  String? get makerOrderSide;
  static Serializer<GPublicTradesSubscriptionData_publicTrades>
      get serializer => _$gPublicTradesSubscriptionDataPublicTradesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPublicTradesSubscriptionData_publicTrades.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPublicTradesSubscriptionData_publicTrades? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPublicTradesSubscriptionData_publicTrades.serializer,
        json,
      );
}
