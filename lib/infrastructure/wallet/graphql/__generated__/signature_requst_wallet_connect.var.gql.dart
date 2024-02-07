// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'signature_requst_wallet_connect.var.gql.g.dart';

abstract class GsignatureRequestWalletConnectVars
    implements
        Built<GsignatureRequestWalletConnectVars,
            GsignatureRequestWalletConnectVarsBuilder> {
  GsignatureRequestWalletConnectVars._();

  factory GsignatureRequestWalletConnectVars(
          [Function(GsignatureRequestWalletConnectVarsBuilder b) updates]) =
      _$GsignatureRequestWalletConnectVars;

  int get chainId;
  String get address;
  static Serializer<GsignatureRequestWalletConnectVars> get serializer =>
      _$gsignatureRequestWalletConnectVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GsignatureRequestWalletConnectVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GsignatureRequestWalletConnectVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GsignatureRequestWalletConnectVars.serializer,
        json,
      );
}
