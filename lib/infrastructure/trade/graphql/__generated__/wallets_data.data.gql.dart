// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'wallets_data.data.gql.g.dart';

abstract class GTradeWalletsDataData
    implements Built<GTradeWalletsDataData, GTradeWalletsDataDataBuilder> {
  GTradeWalletsDataData._();

  factory GTradeWalletsDataData(
          [Function(GTradeWalletsDataDataBuilder b) updates]) =
      _$GTradeWalletsDataData;

  static void _initializeBuilder(GTradeWalletsDataDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GTradeWalletsDataData_user? get user;
  static Serializer<GTradeWalletsDataData> get serializer =>
      _$gTradeWalletsDataDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTradeWalletsDataData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTradeWalletsDataData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTradeWalletsDataData.serializer,
        json,
      );
}

abstract class GTradeWalletsDataData_user
    implements
        Built<GTradeWalletsDataData_user, GTradeWalletsDataData_userBuilder> {
  GTradeWalletsDataData_user._();

  factory GTradeWalletsDataData_user(
          [Function(GTradeWalletsDataData_userBuilder b) updates]) =
      _$GTradeWalletsDataData_user;

  static void _initializeBuilder(GTradeWalletsDataData_userBuilder b) =>
      b..G__typename = 'User';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GTradeWalletsDataData_user_currencies?>? get currencies;
  static Serializer<GTradeWalletsDataData_user> get serializer =>
      _$gTradeWalletsDataDataUserSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTradeWalletsDataData_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTradeWalletsDataData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTradeWalletsDataData_user.serializer,
        json,
      );
}

abstract class GTradeWalletsDataData_user_currencies
    implements
        Built<GTradeWalletsDataData_user_currencies,
            GTradeWalletsDataData_user_currenciesBuilder> {
  GTradeWalletsDataData_user_currencies._();

  factory GTradeWalletsDataData_user_currencies(
          [Function(GTradeWalletsDataData_user_currenciesBuilder b) updates]) =
      _$GTradeWalletsDataData_user_currencies;

  static void _initializeBuilder(
          GTradeWalletsDataData_user_currenciesBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  double? get advancedTradingBalance;
  double? get balance;
  static Serializer<GTradeWalletsDataData_user_currencies> get serializer =>
      _$gTradeWalletsDataDataUserCurrenciesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTradeWalletsDataData_user_currencies.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTradeWalletsDataData_user_currencies? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTradeWalletsDataData_user_currencies.serializer,
        json,
      );
}
