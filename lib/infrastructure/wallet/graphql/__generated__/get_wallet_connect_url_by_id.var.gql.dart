// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_wallet_connect_url_by_id.var.gql.g.dart';

abstract class GgetWalletConnectURIByIdVars
    implements
        Built<GgetWalletConnectURIByIdVars,
            GgetWalletConnectURIByIdVarsBuilder> {
  GgetWalletConnectURIByIdVars._();

  factory GgetWalletConnectURIByIdVars(
          [Function(GgetWalletConnectURIByIdVarsBuilder b) updates]) =
      _$GgetWalletConnectURIByIdVars;

  String get currencyPaymentInterface;
  static Serializer<GgetWalletConnectURIByIdVars> get serializer =>
      _$ggetWalletConnectURIByIdVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetWalletConnectURIByIdVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetWalletConnectURIByIdVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetWalletConnectURIByIdVars.serializer,
        json,
      );
}
