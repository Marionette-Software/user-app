// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_non_custodial.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GInitNonCustodialVars> _$gInitNonCustodialVarsSerializer =
    new _$GInitNonCustodialVarsSerializer();

class _$GInitNonCustodialVarsSerializer
    implements StructuredSerializer<GInitNonCustodialVars> {
  @override
  final Iterable<Type> types = const [
    GInitNonCustodialVars,
    _$GInitNonCustodialVars
  ];
  @override
  final String wireName = 'GInitNonCustodialVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GInitNonCustodialVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'provider',
      serializers.serialize(object.provider,
          specifiedType: const FullType(String)),
      'inPaymentInterfaceId',
      serializers.serialize(object.inPaymentInterfaceId,
          specifiedType: const FullType(String)),
      'inCurrencyId',
      serializers.serialize(object.inCurrencyId,
          specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(double)),
      'slippage',
      serializers.serialize(object.slippage,
          specifiedType: const FullType(double)),
      'recipientId',
      serializers.serialize(object.recipientId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GInitNonCustodialVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInitNonCustodialVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'provider':
          result.provider = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'inPaymentInterfaceId':
          result.inPaymentInterfaceId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'inCurrencyId':
          result.inCurrencyId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'slippage':
          result.slippage = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'recipientId':
          result.recipientId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GInitNonCustodialVars extends GInitNonCustodialVars {
  @override
  final String provider;
  @override
  final String inPaymentInterfaceId;
  @override
  final String inCurrencyId;
  @override
  final double amount;
  @override
  final double slippage;
  @override
  final String recipientId;

  factory _$GInitNonCustodialVars(
          [void Function(GInitNonCustodialVarsBuilder)? updates]) =>
      (new GInitNonCustodialVarsBuilder()..update(updates))._build();

  _$GInitNonCustodialVars._(
      {required this.provider,
      required this.inPaymentInterfaceId,
      required this.inCurrencyId,
      required this.amount,
      required this.slippage,
      required this.recipientId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        provider, r'GInitNonCustodialVars', 'provider');
    BuiltValueNullFieldError.checkNotNull(
        inPaymentInterfaceId, r'GInitNonCustodialVars', 'inPaymentInterfaceId');
    BuiltValueNullFieldError.checkNotNull(
        inCurrencyId, r'GInitNonCustodialVars', 'inCurrencyId');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'GInitNonCustodialVars', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        slippage, r'GInitNonCustodialVars', 'slippage');
    BuiltValueNullFieldError.checkNotNull(
        recipientId, r'GInitNonCustodialVars', 'recipientId');
  }

  @override
  GInitNonCustodialVars rebuild(
          void Function(GInitNonCustodialVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInitNonCustodialVarsBuilder toBuilder() =>
      new GInitNonCustodialVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInitNonCustodialVars &&
        provider == other.provider &&
        inPaymentInterfaceId == other.inPaymentInterfaceId &&
        inCurrencyId == other.inCurrencyId &&
        amount == other.amount &&
        slippage == other.slippage &&
        recipientId == other.recipientId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, provider.hashCode);
    _$hash = $jc(_$hash, inPaymentInterfaceId.hashCode);
    _$hash = $jc(_$hash, inCurrencyId.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, slippage.hashCode);
    _$hash = $jc(_$hash, recipientId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GInitNonCustodialVars')
          ..add('provider', provider)
          ..add('inPaymentInterfaceId', inPaymentInterfaceId)
          ..add('inCurrencyId', inCurrencyId)
          ..add('amount', amount)
          ..add('slippage', slippage)
          ..add('recipientId', recipientId))
        .toString();
  }
}

class GInitNonCustodialVarsBuilder
    implements Builder<GInitNonCustodialVars, GInitNonCustodialVarsBuilder> {
  _$GInitNonCustodialVars? _$v;

  String? _provider;
  String? get provider => _$this._provider;
  set provider(String? provider) => _$this._provider = provider;

  String? _inPaymentInterfaceId;
  String? get inPaymentInterfaceId => _$this._inPaymentInterfaceId;
  set inPaymentInterfaceId(String? inPaymentInterfaceId) =>
      _$this._inPaymentInterfaceId = inPaymentInterfaceId;

  String? _inCurrencyId;
  String? get inCurrencyId => _$this._inCurrencyId;
  set inCurrencyId(String? inCurrencyId) => _$this._inCurrencyId = inCurrencyId;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  double? _slippage;
  double? get slippage => _$this._slippage;
  set slippage(double? slippage) => _$this._slippage = slippage;

  String? _recipientId;
  String? get recipientId => _$this._recipientId;
  set recipientId(String? recipientId) => _$this._recipientId = recipientId;

  GInitNonCustodialVarsBuilder();

  GInitNonCustodialVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _provider = $v.provider;
      _inPaymentInterfaceId = $v.inPaymentInterfaceId;
      _inCurrencyId = $v.inCurrencyId;
      _amount = $v.amount;
      _slippage = $v.slippage;
      _recipientId = $v.recipientId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInitNonCustodialVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInitNonCustodialVars;
  }

  @override
  void update(void Function(GInitNonCustodialVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GInitNonCustodialVars build() => _build();

  _$GInitNonCustodialVars _build() {
    final _$result = _$v ??
        new _$GInitNonCustodialVars._(
            provider: BuiltValueNullFieldError.checkNotNull(
                provider, r'GInitNonCustodialVars', 'provider'),
            inPaymentInterfaceId: BuiltValueNullFieldError.checkNotNull(
                inPaymentInterfaceId,
                r'GInitNonCustodialVars',
                'inPaymentInterfaceId'),
            inCurrencyId: BuiltValueNullFieldError.checkNotNull(
                inCurrencyId, r'GInitNonCustodialVars', 'inCurrencyId'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'GInitNonCustodialVars', 'amount'),
            slippage: BuiltValueNullFieldError.checkNotNull(
                slippage, r'GInitNonCustodialVars', 'slippage'),
            recipientId: BuiltValueNullFieldError.checkNotNull(
                recipientId, r'GInitNonCustodialVars', 'recipientId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
