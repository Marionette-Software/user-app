// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'user_balances_subscription.data.gql.g.dart';

abstract class GUserBalancesData
    implements Built<GUserBalancesData, GUserBalancesDataBuilder> {
  GUserBalancesData._();

  factory GUserBalancesData([Function(GUserBalancesDataBuilder b) updates]) =
      _$GUserBalancesData;

  static void _initializeBuilder(GUserBalancesDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserBalancesData_userBalanceUpdated? get userBalanceUpdated;
  static Serializer<GUserBalancesData> get serializer =>
      _$gUserBalancesDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserBalancesData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserBalancesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserBalancesData.serializer,
        json,
      );
}

abstract class GUserBalancesData_userBalanceUpdated
    implements
        Built<GUserBalancesData_userBalanceUpdated,
            GUserBalancesData_userBalanceUpdatedBuilder> {
  GUserBalancesData_userBalanceUpdated._();

  factory GUserBalancesData_userBalanceUpdated(
          [Function(GUserBalancesData_userBalanceUpdatedBuilder b) updates]) =
      _$GUserBalancesData_userBalanceUpdated;

  static void _initializeBuilder(
          GUserBalancesData_userBalanceUpdatedBuilder b) =>
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
  static Serializer<GUserBalancesData_userBalanceUpdated> get serializer =>
      _$gUserBalancesDataUserBalanceUpdatedSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserBalancesData_userBalanceUpdated.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserBalancesData_userBalanceUpdated? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserBalancesData_userBalanceUpdated.serializer,
        json,
      );
}
