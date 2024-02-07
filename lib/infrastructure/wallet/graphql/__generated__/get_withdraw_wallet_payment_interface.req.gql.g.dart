// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_withdraw_wallet_payment_interface.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetWithdrawWalletPaymentInterfaceReq>
    _$gGetWithdrawWalletPaymentInterfaceReqSerializer =
    new _$GGetWithdrawWalletPaymentInterfaceReqSerializer();

class _$GGetWithdrawWalletPaymentInterfaceReqSerializer
    implements StructuredSerializer<GGetWithdrawWalletPaymentInterfaceReq> {
  @override
  final Iterable<Type> types = const [
    GGetWithdrawWalletPaymentInterfaceReq,
    _$GGetWithdrawWalletPaymentInterfaceReq
  ];
  @override
  final String wireName = 'GGetWithdrawWalletPaymentInterfaceReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetWithdrawWalletPaymentInterfaceReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType:
              const FullType(_i3.GGetWithdrawWalletPaymentInterfaceVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i4.Operation)),
      'executeOnListen',
      serializers.serialize(object.executeOnListen,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.requestId;
    if (value != null) {
      result
        ..add('requestId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.optimisticResponse;
    if (value != null) {
      result
        ..add('optimisticResponse')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(_i2.GGetWithdrawWalletPaymentInterfaceData)));
    }
    value = object.updateCacheHandlerKey;
    if (value != null) {
      result
        ..add('updateCacheHandlerKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updateCacheHandlerContext;
    if (value != null) {
      result
        ..add('updateCacheHandlerContext')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    value = object.fetchPolicy;
    if (value != null) {
      result
        ..add('fetchPolicy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.FetchPolicy)));
    }
    return result;
  }

  @override
  GGetWithdrawWalletPaymentInterfaceReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetWithdrawWalletPaymentInterfaceReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      _i3.GGetWithdrawWalletPaymentInterfaceVars))!
              as _i3.GGetWithdrawWalletPaymentInterfaceVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i4.Operation))! as _i4.Operation;
          break;
        case 'requestId':
          result.requestId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'optimisticResponse':
          result.optimisticResponse.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      _i2.GGetWithdrawWalletPaymentInterfaceData))!
              as _i2.GGetWithdrawWalletPaymentInterfaceData);
          break;
        case 'updateCacheHandlerKey':
          result.updateCacheHandlerKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updateCacheHandlerContext':
          result.updateCacheHandlerContext = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>?;
          break;
        case 'fetchPolicy':
          result.fetchPolicy = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.FetchPolicy))
              as _i1.FetchPolicy?;
          break;
        case 'executeOnListen':
          result.executeOnListen = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetWithdrawWalletPaymentInterfaceReq
    extends GGetWithdrawWalletPaymentInterfaceReq {
  @override
  final _i3.GGetWithdrawWalletPaymentInterfaceVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GGetWithdrawWalletPaymentInterfaceData? Function(
      _i2.GGetWithdrawWalletPaymentInterfaceData?,
      _i2.GGetWithdrawWalletPaymentInterfaceData?)? updateResult;
  @override
  final _i2.GGetWithdrawWalletPaymentInterfaceData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GGetWithdrawWalletPaymentInterfaceReq(
          [void Function(GGetWithdrawWalletPaymentInterfaceReqBuilder)?
              updates]) =>
      (new GGetWithdrawWalletPaymentInterfaceReqBuilder()..update(updates))
          ._build();

  _$GGetWithdrawWalletPaymentInterfaceReq._(
      {required this.vars,
      required this.operation,
      this.requestId,
      this.updateResult,
      this.optimisticResponse,
      this.updateCacheHandlerKey,
      this.updateCacheHandlerContext,
      this.fetchPolicy,
      required this.executeOnListen})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, r'GGetWithdrawWalletPaymentInterfaceReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GGetWithdrawWalletPaymentInterfaceReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(executeOnListen,
        r'GGetWithdrawWalletPaymentInterfaceReq', 'executeOnListen');
  }

  @override
  GGetWithdrawWalletPaymentInterfaceReq rebuild(
          void Function(GGetWithdrawWalletPaymentInterfaceReqBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetWithdrawWalletPaymentInterfaceReqBuilder toBuilder() =>
      new GGetWithdrawWalletPaymentInterfaceReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GGetWithdrawWalletPaymentInterfaceReq &&
        vars == other.vars &&
        operation == other.operation &&
        requestId == other.requestId &&
        updateResult == _$dynamicOther.updateResult &&
        optimisticResponse == other.optimisticResponse &&
        updateCacheHandlerKey == other.updateCacheHandlerKey &&
        updateCacheHandlerContext == other.updateCacheHandlerContext &&
        fetchPolicy == other.fetchPolicy &&
        executeOnListen == other.executeOnListen;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jc(_$hash, requestId.hashCode);
    _$hash = $jc(_$hash, updateResult.hashCode);
    _$hash = $jc(_$hash, optimisticResponse.hashCode);
    _$hash = $jc(_$hash, updateCacheHandlerKey.hashCode);
    _$hash = $jc(_$hash, updateCacheHandlerContext.hashCode);
    _$hash = $jc(_$hash, fetchPolicy.hashCode);
    _$hash = $jc(_$hash, executeOnListen.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetWithdrawWalletPaymentInterfaceReq')
          ..add('vars', vars)
          ..add('operation', operation)
          ..add('requestId', requestId)
          ..add('updateResult', updateResult)
          ..add('optimisticResponse', optimisticResponse)
          ..add('updateCacheHandlerKey', updateCacheHandlerKey)
          ..add('updateCacheHandlerContext', updateCacheHandlerContext)
          ..add('fetchPolicy', fetchPolicy)
          ..add('executeOnListen', executeOnListen))
        .toString();
  }
}

class GGetWithdrawWalletPaymentInterfaceReqBuilder
    implements
        Builder<GGetWithdrawWalletPaymentInterfaceReq,
            GGetWithdrawWalletPaymentInterfaceReqBuilder> {
  _$GGetWithdrawWalletPaymentInterfaceReq? _$v;

  _i3.GGetWithdrawWalletPaymentInterfaceVarsBuilder? _vars;
  _i3.GGetWithdrawWalletPaymentInterfaceVarsBuilder get vars =>
      _$this._vars ??= new _i3.GGetWithdrawWalletPaymentInterfaceVarsBuilder();
  set vars(_i3.GGetWithdrawWalletPaymentInterfaceVarsBuilder? vars) =>
      _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GGetWithdrawWalletPaymentInterfaceData? Function(
      _i2.GGetWithdrawWalletPaymentInterfaceData?,
      _i2.GGetWithdrawWalletPaymentInterfaceData?)? _updateResult;
  _i2.GGetWithdrawWalletPaymentInterfaceData? Function(
          _i2.GGetWithdrawWalletPaymentInterfaceData?,
          _i2.GGetWithdrawWalletPaymentInterfaceData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GGetWithdrawWalletPaymentInterfaceData? Function(
                  _i2.GGetWithdrawWalletPaymentInterfaceData?,
                  _i2.GGetWithdrawWalletPaymentInterfaceData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GGetWithdrawWalletPaymentInterfaceDataBuilder? _optimisticResponse;
  _i2.GGetWithdrawWalletPaymentInterfaceDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??=
          new _i2.GGetWithdrawWalletPaymentInterfaceDataBuilder();
  set optimisticResponse(
          _i2.GGetWithdrawWalletPaymentInterfaceDataBuilder?
              optimisticResponse) =>
      _$this._optimisticResponse = optimisticResponse;

  String? _updateCacheHandlerKey;
  String? get updateCacheHandlerKey => _$this._updateCacheHandlerKey;
  set updateCacheHandlerKey(String? updateCacheHandlerKey) =>
      _$this._updateCacheHandlerKey = updateCacheHandlerKey;

  Map<String, dynamic>? _updateCacheHandlerContext;
  Map<String, dynamic>? get updateCacheHandlerContext =>
      _$this._updateCacheHandlerContext;
  set updateCacheHandlerContext(
          Map<String, dynamic>? updateCacheHandlerContext) =>
      _$this._updateCacheHandlerContext = updateCacheHandlerContext;

  _i1.FetchPolicy? _fetchPolicy;
  _i1.FetchPolicy? get fetchPolicy => _$this._fetchPolicy;
  set fetchPolicy(_i1.FetchPolicy? fetchPolicy) =>
      _$this._fetchPolicy = fetchPolicy;

  bool? _executeOnListen;
  bool? get executeOnListen => _$this._executeOnListen;
  set executeOnListen(bool? executeOnListen) =>
      _$this._executeOnListen = executeOnListen;

  GGetWithdrawWalletPaymentInterfaceReqBuilder() {
    GGetWithdrawWalletPaymentInterfaceReq._initializeBuilder(this);
  }

  GGetWithdrawWalletPaymentInterfaceReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _requestId = $v.requestId;
      _updateResult = $v.updateResult;
      _optimisticResponse = $v.optimisticResponse?.toBuilder();
      _updateCacheHandlerKey = $v.updateCacheHandlerKey;
      _updateCacheHandlerContext = $v.updateCacheHandlerContext;
      _fetchPolicy = $v.fetchPolicy;
      _executeOnListen = $v.executeOnListen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetWithdrawWalletPaymentInterfaceReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetWithdrawWalletPaymentInterfaceReq;
  }

  @override
  void update(
      void Function(GGetWithdrawWalletPaymentInterfaceReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetWithdrawWalletPaymentInterfaceReq build() => _build();

  _$GGetWithdrawWalletPaymentInterfaceReq _build() {
    _$GGetWithdrawWalletPaymentInterfaceReq _$result;
    try {
      _$result = _$v ??
          new _$GGetWithdrawWalletPaymentInterfaceReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(operation,
                  r'GGetWithdrawWalletPaymentInterfaceReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  r'GGetWithdrawWalletPaymentInterfaceReq',
                  'executeOnListen'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetWithdrawWalletPaymentInterfaceReq',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
