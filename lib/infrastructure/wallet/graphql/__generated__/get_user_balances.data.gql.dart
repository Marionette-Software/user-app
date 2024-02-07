// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_user_balances.data.gql.g.dart';

abstract class GGetUserBalancesData
    implements Built<GGetUserBalancesData, GGetUserBalancesDataBuilder> {
  GGetUserBalancesData._();

  factory GGetUserBalancesData(
          [Function(GGetUserBalancesDataBuilder b) updates]) =
      _$GGetUserBalancesData;

  static void _initializeBuilder(GGetUserBalancesDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetUserBalancesData_user? get user;
  static Serializer<GGetUserBalancesData> get serializer =>
      _$gGetUserBalancesDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserBalancesData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserBalancesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserBalancesData.serializer,
        json,
      );
}

abstract class GGetUserBalancesData_user
    implements
        Built<GGetUserBalancesData_user, GGetUserBalancesData_userBuilder> {
  GGetUserBalancesData_user._();

  factory GGetUserBalancesData_user(
          [Function(GGetUserBalancesData_userBuilder b) updates]) =
      _$GGetUserBalancesData_user;

  static void _initializeBuilder(GGetUserBalancesData_userBuilder b) =>
      b..G__typename = 'User';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetUserBalancesData_user_currencies?>? get currencies;
  static Serializer<GGetUserBalancesData_user> get serializer =>
      _$gGetUserBalancesDataUserSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserBalancesData_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserBalancesData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserBalancesData_user.serializer,
        json,
      );
}

abstract class GGetUserBalancesData_user_currencies
    implements
        Built<GGetUserBalancesData_user_currencies,
            GGetUserBalancesData_user_currenciesBuilder> {
  GGetUserBalancesData_user_currencies._();

  factory GGetUserBalancesData_user_currencies(
          [Function(GGetUserBalancesData_user_currenciesBuilder b) updates]) =
      _$GGetUserBalancesData_user_currencies;

  static void _initializeBuilder(
          GGetUserBalancesData_user_currenciesBuilder b) =>
      b..G__typename = 'Currency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  bool? get enabled;
  double? get balance;
  double? get advancedTradingBalance;
  double? get advancedTradingLockedBalance;
  double? get lockedBalance;
  double? get withdrawLockedBalance;
  double? get stakingLockedBalance;
  double? get activeStakingBalance;
  static Serializer<GGetUserBalancesData_user_currencies> get serializer =>
      _$gGetUserBalancesDataUserCurrenciesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetUserBalancesData_user_currencies.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetUserBalancesData_user_currencies? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetUserBalancesData_user_currencies.serializer,
        json,
      );
}
