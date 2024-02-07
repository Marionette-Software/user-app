// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'user_all_balance_subscription.data.gql.g.dart';

abstract class GUserAllBalanceData
    implements Built<GUserAllBalanceData, GUserAllBalanceDataBuilder> {
  GUserAllBalanceData._();

  factory GUserAllBalanceData(
      [Function(GUserAllBalanceDataBuilder b) updates]) = _$GUserAllBalanceData;

  static void _initializeBuilder(GUserAllBalanceDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GUserAllBalanceData_userAllBalance?>? get userAllBalance;
  static Serializer<GUserAllBalanceData> get serializer =>
      _$gUserAllBalanceDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserAllBalanceData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserAllBalanceData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserAllBalanceData.serializer,
        json,
      );
}

abstract class GUserAllBalanceData_userAllBalance
    implements
        Built<GUserAllBalanceData_userAllBalance,
            GUserAllBalanceData_userAllBalanceBuilder> {
  GUserAllBalanceData_userAllBalance._();

  factory GUserAllBalanceData_userAllBalance(
          [Function(GUserAllBalanceData_userAllBalanceBuilder b) updates]) =
      _$GUserAllBalanceData_userAllBalance;

  static void _initializeBuilder(GUserAllBalanceData_userAllBalanceBuilder b) =>
      b..G__typename = 'Balance';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get currencyId;
  double? get balance;
  double? get lockedBalance;
  double? get advancedTradingBalance;
  double? get advancedTradingLockedBalance;
  double? get withdrawLockedBalance;
  double? get stakingLockedBalance;
  double? get activeStakingBalance;
  String? get ts;
  static Serializer<GUserAllBalanceData_userAllBalance> get serializer =>
      _$gUserAllBalanceDataUserAllBalanceSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserAllBalanceData_userAllBalance.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserAllBalanceData_userAllBalance? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserAllBalanceData_userAllBalance.serializer,
        json,
      );
}
