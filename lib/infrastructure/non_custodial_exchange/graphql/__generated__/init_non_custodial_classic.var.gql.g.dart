// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_non_custodial_classic.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GInitNonCustodialClassicVars>
    _$gInitNonCustodialClassicVarsSerializer =
    new _$GInitNonCustodialClassicVarsSerializer();

class _$GInitNonCustodialClassicVarsSerializer
    implements StructuredSerializer<GInitNonCustodialClassicVars> {
  @override
  final Iterable<Type> types = const [
    GInitNonCustodialClassicVars,
    _$GInitNonCustodialClassicVars
  ];
  @override
  final String wireName = 'GInitNonCustodialClassicVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GInitNonCustodialClassicVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'inPaymentInterfaceId',
      serializers.serialize(object.inPaymentInterfaceId,
          specifiedType: const FullType(String)),
      'inCurrencyId',
      serializers.serialize(object.inCurrencyId,
          specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(double)),
      'recipientId',
      serializers.serialize(object.recipientId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GInitNonCustodialClassicVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInitNonCustodialClassicVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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
        case 'recipientId':
          result.recipientId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GInitNonCustodialClassicVars extends GInitNonCustodialClassicVars {
  @override
  final String inPaymentInterfaceId;
  @override
  final String inCurrencyId;
  @override
  final double amount;
  @override
  final String recipientId;

  factory _$GInitNonCustodialClassicVars(
          [void Function(GInitNonCustodialClassicVarsBuilder)? updates]) =>
      (new GInitNonCustodialClassicVarsBuilder()..update(updates))._build();

  _$GInitNonCustodialClassicVars._(
      {required this.inPaymentInterfaceId,
      required this.inCurrencyId,
      required this.amount,
      required this.recipientId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(inPaymentInterfaceId,
        r'GInitNonCustodialClassicVars', 'inPaymentInterfaceId');
    BuiltValueNullFieldError.checkNotNull(
        inCurrencyId, r'GInitNonCustodialClassicVars', 'inCurrencyId');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'GInitNonCustodialClassicVars', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        recipientId, r'GInitNonCustodialClassicVars', 'recipientId');
  }

  @override
  GInitNonCustodialClassicVars rebuild(
          void Function(GInitNonCustodialClassicVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInitNonCustodialClassicVarsBuilder toBuilder() =>
      new GInitNonCustodialClassicVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInitNonCustodialClassicVars &&
        inPaymentInterfaceId == other.inPaymentInterfaceId &&
        inCurrencyId == other.inCurrencyId &&
        amount == other.amount &&
        recipientId == other.recipientId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, inPaymentInterfaceId.hashCode);
    _$hash = $jc(_$hash, inCurrencyId.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, recipientId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GInitNonCustodialClassicVars')
          ..add('inPaymentInterfaceId', inPaymentInterfaceId)
          ..add('inCurrencyId', inCurrencyId)
          ..add('amount', amount)
          ..add('recipientId', recipientId))
        .toString();
  }
}

class GInitNonCustodialClassicVarsBuilder
    implements
        Builder<GInitNonCustodialClassicVars,
            GInitNonCustodialClassicVarsBuilder> {
  _$GInitNonCustodialClassicVars? _$v;

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

  String? _recipientId;
  String? get recipientId => _$this._recipientId;
  set recipientId(String? recipientId) => _$this._recipientId = recipientId;

  GInitNonCustodialClassicVarsBuilder();

  GInitNonCustodialClassicVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _inPaymentInterfaceId = $v.inPaymentInterfaceId;
      _inCurrencyId = $v.inCurrencyId;
      _amount = $v.amount;
      _recipientId = $v.recipientId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInitNonCustodialClassicVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInitNonCustodialClassicVars;
  }

  @override
  void update(void Function(GInitNonCustodialClassicVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GInitNonCustodialClassicVars build() => _build();

  _$GInitNonCustodialClassicVars _build() {
    final _$result = _$v ??
        new _$GInitNonCustodialClassicVars._(
            inPaymentInterfaceId: BuiltValueNullFieldError.checkNotNull(
                inPaymentInterfaceId,
                r'GInitNonCustodialClassicVars',
                'inPaymentInterfaceId'),
            inCurrencyId: BuiltValueNullFieldError.checkNotNull(
                inCurrencyId, r'GInitNonCustodialClassicVars', 'inCurrencyId'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'GInitNonCustodialClassicVars', 'amount'),
            recipientId: BuiltValueNullFieldError.checkNotNull(
                recipientId, r'GInitNonCustodialClassicVars', 'recipientId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
