// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'init_non_custodial_classic.data.gql.g.dart';

abstract class GInitNonCustodialClassicData
    implements
        Built<GInitNonCustodialClassicData,
            GInitNonCustodialClassicDataBuilder> {
  GInitNonCustodialClassicData._();

  factory GInitNonCustodialClassicData(
          [Function(GInitNonCustodialClassicDataBuilder b) updates]) =
      _$GInitNonCustodialClassicData;

  static void _initializeBuilder(GInitNonCustodialClassicDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GInitNonCustodialClassicData_initNonCustodialExchange?
      get initNonCustodialExchange;
  static Serializer<GInitNonCustodialClassicData> get serializer =>
      _$gInitNonCustodialClassicDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GInitNonCustodialClassicData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GInitNonCustodialClassicData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GInitNonCustodialClassicData.serializer,
        json,
      );
}

abstract class GInitNonCustodialClassicData_initNonCustodialExchange
    implements
        Built<GInitNonCustodialClassicData_initNonCustodialExchange,
            GInitNonCustodialClassicData_initNonCustodialExchangeBuilder> {
  GInitNonCustodialClassicData_initNonCustodialExchange._();

  factory GInitNonCustodialClassicData_initNonCustodialExchange(
      [Function(GInitNonCustodialClassicData_initNonCustodialExchangeBuilder b)
          updates]) = _$GInitNonCustodialClassicData_initNonCustodialExchange;

  static void _initializeBuilder(
          GInitNonCustodialClassicData_initNonCustodialExchangeBuilder b) =>
      b..G__typename = 'InitialDepositData';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get address;
  String? get encodedAddress;
  String? get redirectUrl;
  static Serializer<GInitNonCustodialClassicData_initNonCustodialExchange>
      get serializer =>
          _$gInitNonCustodialClassicDataInitNonCustodialExchangeSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GInitNonCustodialClassicData_initNonCustodialExchange.serializer,
        this,
      ) as Map<String, dynamic>);

  static GInitNonCustodialClassicData_initNonCustodialExchange? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GInitNonCustodialClassicData_initNonCustodialExchange.serializer,
        json,
      );
}
