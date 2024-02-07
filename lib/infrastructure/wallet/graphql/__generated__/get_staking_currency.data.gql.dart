// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_staking_currency.data.gql.g.dart';

abstract class GGetStakingCurrencyData
    implements Built<GGetStakingCurrencyData, GGetStakingCurrencyDataBuilder> {
  GGetStakingCurrencyData._();

  factory GGetStakingCurrencyData(
          [Function(GGetStakingCurrencyDataBuilder b) updates]) =
      _$GGetStakingCurrencyData;

  static void _initializeBuilder(GGetStakingCurrencyDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGetStakingCurrencyData_stakingCurrency? get stakingCurrency;
  static Serializer<GGetStakingCurrencyData> get serializer =>
      _$gGetStakingCurrencyDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetStakingCurrencyData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetStakingCurrencyData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetStakingCurrencyData.serializer,
        json,
      );
}

abstract class GGetStakingCurrencyData_stakingCurrency
    implements
        Built<GGetStakingCurrencyData_stakingCurrency,
            GGetStakingCurrencyData_stakingCurrencyBuilder> {
  GGetStakingCurrencyData_stakingCurrency._();

  factory GGetStakingCurrencyData_stakingCurrency(
      [Function(GGetStakingCurrencyData_stakingCurrencyBuilder b)
          updates]) = _$GGetStakingCurrencyData_stakingCurrency;

  static void _initializeBuilder(
          GGetStakingCurrencyData_stakingCurrencyBuilder b) =>
      b..G__typename = 'StakingCurrency';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get id;
  bool? get staking_enabled;
  String? get staking_period;
  double? get staking_apr;
  double? get last_staking_calc;
  double? get next_staking_calc;
  double? get next_reward_amount;
  double? get locked_balance;
  double? get active_balance;
  double? get min_staking_amount;
  bool? get isUnstakingProcess;
  static Serializer<GGetStakingCurrencyData_stakingCurrency> get serializer =>
      _$gGetStakingCurrencyDataStakingCurrencySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetStakingCurrencyData_stakingCurrency.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetStakingCurrencyData_stakingCurrency? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetStakingCurrencyData_stakingCurrency.serializer,
        json,
      );
}
