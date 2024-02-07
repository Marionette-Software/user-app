// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/withdraw/__generated__/create_withdraw_request.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/withdraw/__generated__/create_withdraw_request.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/withdraw/__generated__/create_withdraw_request.var.gql.dart'
    as _i3;

part 'create_withdraw_request.req.gql.g.dart';

abstract class GCreateWithdrawalReq
    implements
        Built<GCreateWithdrawalReq, GCreateWithdrawalReqBuilder>,
        _i1.OperationRequest<_i2.GCreateWithdrawalData,
            _i3.GCreateWithdrawalVars> {
  GCreateWithdrawalReq._();

  factory GCreateWithdrawalReq(
          [Function(GCreateWithdrawalReqBuilder b) updates]) =
      _$GCreateWithdrawalReq;

  static void _initializeBuilder(GCreateWithdrawalReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CreateWithdrawal',
    )
    ..executeOnListen = true;

  @override
  _i3.GCreateWithdrawalVars get vars;
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
  _i2.GCreateWithdrawalData? Function(
    _i2.GCreateWithdrawalData?,
    _i2.GCreateWithdrawalData?,
  )? get updateResult;
  @override
  _i2.GCreateWithdrawalData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCreateWithdrawalData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateWithdrawalData.fromJson(json);

  static Serializer<GCreateWithdrawalReq> get serializer =>
      _$gCreateWithdrawalReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCreateWithdrawalReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateWithdrawalReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCreateWithdrawalReq.serializer,
        json,
      );
}
