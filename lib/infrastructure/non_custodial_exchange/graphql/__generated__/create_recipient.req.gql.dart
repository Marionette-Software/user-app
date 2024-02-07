// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i6;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/create_recipient.ast.gql.dart'
    as _i5;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/create_recipient.data.gql.dart'
    as _i2;
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/create_recipient.var.gql.dart'
    as _i3;

part 'create_recipient.req.gql.g.dart';

abstract class GCreateNonCustodialRecipientReq
    implements
        Built<GCreateNonCustodialRecipientReq,
            GCreateNonCustodialRecipientReqBuilder>,
        _i1.OperationRequest<_i2.GCreateNonCustodialRecipientData,
            _i3.GCreateNonCustodialRecipientVars> {
  GCreateNonCustodialRecipientReq._();

  factory GCreateNonCustodialRecipientReq(
          [Function(GCreateNonCustodialRecipientReqBuilder b) updates]) =
      _$GCreateNonCustodialRecipientReq;

  static void _initializeBuilder(GCreateNonCustodialRecipientReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'CreateNonCustodialRecipient',
    )
    ..executeOnListen = true;

  @override
  _i3.GCreateNonCustodialRecipientVars get vars;
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
  _i2.GCreateNonCustodialRecipientData? Function(
    _i2.GCreateNonCustodialRecipientData?,
    _i2.GCreateNonCustodialRecipientData?,
  )? get updateResult;
  @override
  _i2.GCreateNonCustodialRecipientData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GCreateNonCustodialRecipientData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateNonCustodialRecipientData.fromJson(json);

  static Serializer<GCreateNonCustodialRecipientReq> get serializer =>
      _$gCreateNonCustodialRecipientReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCreateNonCustodialRecipientReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateNonCustodialRecipientReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCreateNonCustodialRecipientReq.serializer,
        json,
      );
}
