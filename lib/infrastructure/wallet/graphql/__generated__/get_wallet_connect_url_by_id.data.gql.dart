// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_wallet_connect_url_by_id.data.gql.g.dart';

abstract class GgetWalletConnectURIByIdData
    implements
        Built<GgetWalletConnectURIByIdData,
            GgetWalletConnectURIByIdDataBuilder> {
  GgetWalletConnectURIByIdData._();

  factory GgetWalletConnectURIByIdData(
          [Function(GgetWalletConnectURIByIdDataBuilder b) updates]) =
      _$GgetWalletConnectURIByIdData;

  static void _initializeBuilder(GgetWalletConnectURIByIdDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get getWalletConnectURI;
  static Serializer<GgetWalletConnectURIByIdData> get serializer =>
      _$ggetWalletConnectURIByIdDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetWalletConnectURIByIdData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetWalletConnectURIByIdData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetWalletConnectURIByIdData.serializer,
        json,
      );
}
