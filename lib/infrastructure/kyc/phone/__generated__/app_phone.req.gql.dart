// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/kyc/phone/__generated__/app_phone.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/kyc/phone/__generated__/app_phone.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/kyc/phone/__generated__/app_phone.var.gql.dart'
    as _i3;

part 'app_phone.req.gql.g.dart';

abstract class GAddPhoneReq
    implements
        Built<GAddPhoneReq, GAddPhoneReqBuilder>,
        _i1.OperationRequest<_i2.GAddPhoneData, _i3.GAddPhoneVars> {
  GAddPhoneReq._();

  factory GAddPhoneReq([Function(GAddPhoneReqBuilder b) updates]) =
      _$GAddPhoneReq;

  static void _initializeBuilder(GAddPhoneReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'AddPhone',
    )
    ..executeOnListen = true;

  @override
  _i3.GAddPhoneVars get vars;
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
  _i2.GAddPhoneData? Function(
    _i2.GAddPhoneData?,
    _i2.GAddPhoneData?,
  )? get updateResult;
  @override
  _i2.GAddPhoneData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GAddPhoneData? parseData(Map<String, dynamic> json) =>
      _i2.GAddPhoneData.fromJson(json);

  static Serializer<GAddPhoneReq> get serializer => _$gAddPhoneReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GAddPhoneReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddPhoneReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GAddPhoneReq.serializer,
        json,
      );
}
