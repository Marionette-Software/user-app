// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/set_favorite_currency.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/set_favorite_currency.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/wallet/graphql/__generated__/set_favorite_currency.var.gql.dart'
    as _i3;

part 'set_favorite_currency.req.gql.g.dart';

abstract class GSetFavoriteWalletReq
    implements
        Built<GSetFavoriteWalletReq, GSetFavoriteWalletReqBuilder>,
        _i1.OperationRequest<_i2.GSetFavoriteWalletData,
            _i3.GSetFavoriteWalletVars> {
  GSetFavoriteWalletReq._();

  factory GSetFavoriteWalletReq(
          [Function(GSetFavoriteWalletReqBuilder b) updates]) =
      _$GSetFavoriteWalletReq;

  static void _initializeBuilder(GSetFavoriteWalletReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'SetFavoriteWallet',
    )
    ..executeOnListen = true;

  @override
  _i3.GSetFavoriteWalletVars get vars;
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
  _i2.GSetFavoriteWalletData? Function(
    _i2.GSetFavoriteWalletData?,
    _i2.GSetFavoriteWalletData?,
  )? get updateResult;
  @override
  _i2.GSetFavoriteWalletData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GSetFavoriteWalletData? parseData(Map<String, dynamic> json) =>
      _i2.GSetFavoriteWalletData.fromJson(json);

  static Serializer<GSetFavoriteWalletReq> get serializer =>
      _$gSetFavoriteWalletReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GSetFavoriteWalletReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSetFavoriteWalletReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GSetFavoriteWalletReq.serializer,
        json,
      );
}
