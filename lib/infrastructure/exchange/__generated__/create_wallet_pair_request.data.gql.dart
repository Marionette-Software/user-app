// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'create_wallet_pair_request.data.gql.g.dart';

abstract class GInitiateNonCustodianExchangeData
    implements
        Built<GInitiateNonCustodianExchangeData,
            GInitiateNonCustodianExchangeDataBuilder> {
  GInitiateNonCustodianExchangeData._();

  factory GInitiateNonCustodianExchangeData(
          [Function(GInitiateNonCustodianExchangeDataBuilder b) updates]) =
      _$GInitiateNonCustodianExchangeData;

  static void _initializeBuilder(GInitiateNonCustodianExchangeDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get userExchange;
  static Serializer<GInitiateNonCustodianExchangeData> get serializer =>
      _$gInitiateNonCustodianExchangeDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GInitiateNonCustodianExchangeData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GInitiateNonCustodianExchangeData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GInitiateNonCustodianExchangeData.serializer,
        json,
      );
}
