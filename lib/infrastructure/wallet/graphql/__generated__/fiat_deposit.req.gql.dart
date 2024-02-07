// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/fiat_deposit.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/fiat_deposit.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/fiat_deposit.var.gql.dart'
    as _i3;

part 'fiat_deposit.req.gql.g.dart';

abstract class GFiatGenerateWalletReq
    implements
        Built<GFiatGenerateWalletReq, GFiatGenerateWalletReqBuilder>,
        _i1.OperationRequest<_i2.GFiatGenerateWalletData,
            _i3.GFiatGenerateWalletVars> {
  GFiatGenerateWalletReq._();

  factory GFiatGenerateWalletReq(
          [Function(GFiatGenerateWalletReqBuilder b) updates]) =
      _$GFiatGenerateWalletReq;

  static void _initializeBuilder(GFiatGenerateWalletReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'FiatGenerateWallet',
    )
    ..executeOnListen = true;

  @override
  _i3.GFiatGenerateWalletVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GFiatGenerateWalletData? Function(
    _i2.GFiatGenerateWalletData?,
    _i2.GFiatGenerateWalletData?,
  )? get updateResult;
  @override
  _i2.GFiatGenerateWalletData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GFiatGenerateWalletData? parseData(Map<String, dynamic> json) =>
      _i2.GFiatGenerateWalletData.fromJson(json);

  static Serializer<GFiatGenerateWalletReq> get serializer =>
      _$gFiatGenerateWalletReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GFiatGenerateWalletReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFiatGenerateWalletReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GFiatGenerateWalletReq.serializer,
        json,
      );
}
