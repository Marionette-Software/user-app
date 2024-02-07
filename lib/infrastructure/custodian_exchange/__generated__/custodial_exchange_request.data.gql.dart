// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'custodial_exchange_request.data.gql.g.dart';

abstract class GUserExchangeData
    implements Built<GUserExchangeData, GUserExchangeDataBuilder> {
  GUserExchangeData._();

  factory GUserExchangeData([Function(GUserExchangeDataBuilder b) updates]) =
      _$GUserExchangeData;

  static void _initializeBuilder(GUserExchangeDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get userExchange;
  static Serializer<GUserExchangeData> get serializer =>
      _$gUserExchangeDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserExchangeData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserExchangeData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserExchangeData.serializer,
        json,
      );
}
