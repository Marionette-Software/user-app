// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custodial_exchange_request.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserExchangeVars> _$gUserExchangeVarsSerializer =
    new _$GUserExchangeVarsSerializer();

class _$GUserExchangeVarsSerializer
    implements StructuredSerializer<GUserExchangeVars> {
  @override
  final Iterable<Type> types = const [GUserExchangeVars, _$GUserExchangeVars];
  @override
  final String wireName = 'GUserExchangeVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserExchangeVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'currencyFrom',
      serializers.serialize(object.currencyFrom,
          specifiedType: const FullType(String)),
      'currencyTo',
      serializers.serialize(object.currencyTo,
          specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  GUserExchangeVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserExchangeVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'currencyFrom':
          result.currencyFrom = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'currencyTo':
          result.currencyTo = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserExchangeVars extends GUserExchangeVars {
  @override
  final String currencyFrom;
  @override
  final String currencyTo;
  @override
  final double amount;

  factory _$GUserExchangeVars(
          [void Function(GUserExchangeVarsBuilder)? updates]) =>
      (new GUserExchangeVarsBuilder()..update(updates))._build();

  _$GUserExchangeVars._(
      {required this.currencyFrom,
      required this.currencyTo,
      required this.amount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currencyFrom, r'GUserExchangeVars', 'currencyFrom');
    BuiltValueNullFieldError.checkNotNull(
        currencyTo, r'GUserExchangeVars', 'currencyTo');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'GUserExchangeVars', 'amount');
  }

  @override
  GUserExchangeVars rebuild(void Function(GUserExchangeVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserExchangeVarsBuilder toBuilder() =>
      new GUserExchangeVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserExchangeVars &&
        currencyFrom == other.currencyFrom &&
        currencyTo == other.currencyTo &&
        amount == other.amount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currencyFrom.hashCode);
    _$hash = $jc(_$hash, currencyTo.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserExchangeVars')
          ..add('currencyFrom', currencyFrom)
          ..add('currencyTo', currencyTo)
          ..add('amount', amount))
        .toString();
  }
}

class GUserExchangeVarsBuilder
    implements Builder<GUserExchangeVars, GUserExchangeVarsBuilder> {
  _$GUserExchangeVars? _$v;

  String? _currencyFrom;
  String? get currencyFrom => _$this._currencyFrom;
  set currencyFrom(String? currencyFrom) => _$this._currencyFrom = currencyFrom;

  String? _currencyTo;
  String? get currencyTo => _$this._currencyTo;
  set currencyTo(String? currencyTo) => _$this._currencyTo = currencyTo;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  GUserExchangeVarsBuilder();

  GUserExchangeVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyFrom = $v.currencyFrom;
      _currencyTo = $v.currencyTo;
      _amount = $v.amount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserExchangeVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserExchangeVars;
  }

  @override
  void update(void Function(GUserExchangeVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserExchangeVars build() => _build();

  _$GUserExchangeVars _build() {
    final _$result = _$v ??
        new _$GUserExchangeVars._(
            currencyFrom: BuiltValueNullFieldError.checkNotNull(
                currencyFrom, r'GUserExchangeVars', 'currencyFrom'),
            currencyTo: BuiltValueNullFieldError.checkNotNull(
                currencyTo, r'GUserExchangeVars', 'currencyTo'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'GUserExchangeVars', 'amount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
