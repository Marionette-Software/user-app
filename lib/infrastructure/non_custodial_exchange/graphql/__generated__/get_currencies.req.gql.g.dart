// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_currencies.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetNonCustodialCurrenciesReq>
    _$gGetNonCustodialCurrenciesReqSerializer =
    new _$GGetNonCustodialCurrenciesReqSerializer();

class _$GGetNonCustodialCurrenciesReqSerializer
    implements StructuredSerializer<GGetNonCustodialCurrenciesReq> {
  @override
  final Iterable<Type> types = const [
    GGetNonCustodialCurrenciesReq,
    _$GGetNonCustodialCurrenciesReq
  ];
  @override
  final String wireName = 'GGetNonCustodialCurrenciesReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetNonCustodialCurrenciesReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GGetNonCustodialCurrenciesVars)),
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
            specifiedType: const FullType(_i2.GGetNonCustodialCurrenciesData)));
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
  GGetNonCustodialCurrenciesReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetNonCustodialCurrenciesReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GGetNonCustodialCurrenciesVars))!
              as _i3.GGetNonCustodialCurrenciesVars);
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
                  specifiedType:
                      const FullType(_i2.GGetNonCustodialCurrenciesData))!
              as _i2.GGetNonCustodialCurrenciesData);
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

class _$GGetNonCustodialCurrenciesReq extends GGetNonCustodialCurrenciesReq {
  @override
  final _i3.GGetNonCustodialCurrenciesVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GGetNonCustodialCurrenciesData? Function(
      _i2.GGetNonCustodialCurrenciesData?,
      _i2.GGetNonCustodialCurrenciesData?)? updateResult;
  @override
  final _i2.GGetNonCustodialCurrenciesData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GGetNonCustodialCurrenciesReq(
          [void Function(GGetNonCustodialCurrenciesReqBuilder)? updates]) =>
      (new GGetNonCustodialCurrenciesReqBuilder()..update(updates))._build();

  _$GGetNonCustodialCurrenciesReq._(
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
        vars, r'GGetNonCustodialCurrenciesReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GGetNonCustodialCurrenciesReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, r'GGetNonCustodialCurrenciesReq', 'executeOnListen');
  }

  @override
  GGetNonCustodialCurrenciesReq rebuild(
          void Function(GGetNonCustodialCurrenciesReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetNonCustodialCurrenciesReqBuilder toBuilder() =>
      new GGetNonCustodialCurrenciesReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GGetNonCustodialCurrenciesReq &&
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
    return (newBuiltValueToStringHelper(r'GGetNonCustodialCurrenciesReq')
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

class GGetNonCustodialCurrenciesReqBuilder
    implements
        Builder<GGetNonCustodialCurrenciesReq,
            GGetNonCustodialCurrenciesReqBuilder> {
  _$GGetNonCustodialCurrenciesReq? _$v;

  _i3.GGetNonCustodialCurrenciesVarsBuilder? _vars;
  _i3.GGetNonCustodialCurrenciesVarsBuilder get vars =>
      _$this._vars ??= new _i3.GGetNonCustodialCurrenciesVarsBuilder();
  set vars(_i3.GGetNonCustodialCurrenciesVarsBuilder? vars) =>
      _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GGetNonCustodialCurrenciesData? Function(
      _i2.GGetNonCustodialCurrenciesData?,
      _i2.GGetNonCustodialCurrenciesData?)? _updateResult;
  _i2.GGetNonCustodialCurrenciesData? Function(
          _i2.GGetNonCustodialCurrenciesData?,
          _i2.GGetNonCustodialCurrenciesData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GGetNonCustodialCurrenciesData? Function(
                  _i2.GGetNonCustodialCurrenciesData?,
                  _i2.GGetNonCustodialCurrenciesData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GGetNonCustodialCurrenciesDataBuilder? _optimisticResponse;
  _i2.GGetNonCustodialCurrenciesDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??=
          new _i2.GGetNonCustodialCurrenciesDataBuilder();
  set optimisticResponse(
          _i2.GGetNonCustodialCurrenciesDataBuilder? optimisticResponse) =>
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

  GGetNonCustodialCurrenciesReqBuilder() {
    GGetNonCustodialCurrenciesReq._initializeBuilder(this);
  }

  GGetNonCustodialCurrenciesReqBuilder get _$this {
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
  void replace(GGetNonCustodialCurrenciesReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetNonCustodialCurrenciesReq;
  }

  @override
  void update(void Function(GGetNonCustodialCurrenciesReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetNonCustodialCurrenciesReq build() => _build();

  _$GGetNonCustodialCurrenciesReq _build() {
    _$GGetNonCustodialCurrenciesReq _$result;
    try {
      _$result = _$v ??
          new _$GGetNonCustodialCurrenciesReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GGetNonCustodialCurrenciesReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  r'GGetNonCustodialCurrenciesReq',
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
            r'GGetNonCustodialCurrenciesReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
