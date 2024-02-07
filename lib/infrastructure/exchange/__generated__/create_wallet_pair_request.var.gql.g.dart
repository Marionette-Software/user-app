// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_pair_request.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GInitiateNonCustodianExchangeVars>
    _$gInitiateNonCustodianExchangeVarsSerializer =
    new _$GInitiateNonCustodianExchangeVarsSerializer();

class _$GInitiateNonCustodianExchangeVarsSerializer
    implements StructuredSerializer<GInitiateNonCustodianExchangeVars> {
  @override
  final Iterable<Type> types = const [
    GInitiateNonCustodianExchangeVars,
    _$GInitiateNonCustodianExchangeVars
  ];
  @override
  final String wireName = 'GInitiateNonCustodianExchangeVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GInitiateNonCustodianExchangeVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.currencyFrom;
    if (value != null) {
      result
        ..add('currencyFrom')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentInterfaceFrom;
    if (value != null) {
      result
        ..add('paymentInterfaceFrom')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.currencyTo;
    if (value != null) {
      result
        ..add('currencyTo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentInterfaceTo;
    if (value != null) {
      result
        ..add('paymentInterfaceTo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentInterfaceToData;
    if (value != null) {
      result
        ..add('paymentInterfaceToData')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GInitiateNonCustodianExchangeVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInitiateNonCustodianExchangeVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'currencyFrom':
          result.currencyFrom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'paymentInterfaceFrom':
          result.paymentInterfaceFrom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'currencyTo':
          result.currencyTo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'paymentInterfaceTo':
          result.paymentInterfaceTo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'paymentInterfaceToData':
          result.paymentInterfaceToData = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GInitiateNonCustodianExchangeVars
    extends GInitiateNonCustodianExchangeVars {
  @override
  final String? currencyFrom;
  @override
  final String? paymentInterfaceFrom;
  @override
  final String? currencyTo;
  @override
  final String? paymentInterfaceTo;
  @override
  final String? paymentInterfaceToData;
  @override
  final double? amount;

  factory _$GInitiateNonCustodianExchangeVars(
          [void Function(GInitiateNonCustodianExchangeVarsBuilder)? updates]) =>
      (new GInitiateNonCustodianExchangeVarsBuilder()..update(updates))
          ._build();

  _$GInitiateNonCustodianExchangeVars._(
      {this.currencyFrom,
      this.paymentInterfaceFrom,
      this.currencyTo,
      this.paymentInterfaceTo,
      this.paymentInterfaceToData,
      this.amount})
      : super._();

  @override
  GInitiateNonCustodianExchangeVars rebuild(
          void Function(GInitiateNonCustodianExchangeVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInitiateNonCustodianExchangeVarsBuilder toBuilder() =>
      new GInitiateNonCustodianExchangeVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInitiateNonCustodianExchangeVars &&
        currencyFrom == other.currencyFrom &&
        paymentInterfaceFrom == other.paymentInterfaceFrom &&
        currencyTo == other.currencyTo &&
        paymentInterfaceTo == other.paymentInterfaceTo &&
        paymentInterfaceToData == other.paymentInterfaceToData &&
        amount == other.amount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currencyFrom.hashCode);
    _$hash = $jc(_$hash, paymentInterfaceFrom.hashCode);
    _$hash = $jc(_$hash, currencyTo.hashCode);
    _$hash = $jc(_$hash, paymentInterfaceTo.hashCode);
    _$hash = $jc(_$hash, paymentInterfaceToData.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GInitiateNonCustodianExchangeVars')
          ..add('currencyFrom', currencyFrom)
          ..add('paymentInterfaceFrom', paymentInterfaceFrom)
          ..add('currencyTo', currencyTo)
          ..add('paymentInterfaceTo', paymentInterfaceTo)
          ..add('paymentInterfaceToData', paymentInterfaceToData)
          ..add('amount', amount))
        .toString();
  }
}

class GInitiateNonCustodianExchangeVarsBuilder
    implements
        Builder<GInitiateNonCustodianExchangeVars,
            GInitiateNonCustodianExchangeVarsBuilder> {
  _$GInitiateNonCustodianExchangeVars? _$v;

  String? _currencyFrom;
  String? get currencyFrom => _$this._currencyFrom;
  set currencyFrom(String? currencyFrom) => _$this._currencyFrom = currencyFrom;

  String? _paymentInterfaceFrom;
  String? get paymentInterfaceFrom => _$this._paymentInterfaceFrom;
  set paymentInterfaceFrom(String? paymentInterfaceFrom) =>
      _$this._paymentInterfaceFrom = paymentInterfaceFrom;

  String? _currencyTo;
  String? get currencyTo => _$this._currencyTo;
  set currencyTo(String? currencyTo) => _$this._currencyTo = currencyTo;

  String? _paymentInterfaceTo;
  String? get paymentInterfaceTo => _$this._paymentInterfaceTo;
  set paymentInterfaceTo(String? paymentInterfaceTo) =>
      _$this._paymentInterfaceTo = paymentInterfaceTo;

  String? _paymentInterfaceToData;
  String? get paymentInterfaceToData => _$this._paymentInterfaceToData;
  set paymentInterfaceToData(String? paymentInterfaceToData) =>
      _$this._paymentInterfaceToData = paymentInterfaceToData;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  GInitiateNonCustodianExchangeVarsBuilder();

  GInitiateNonCustodianExchangeVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyFrom = $v.currencyFrom;
      _paymentInterfaceFrom = $v.paymentInterfaceFrom;
      _currencyTo = $v.currencyTo;
      _paymentInterfaceTo = $v.paymentInterfaceTo;
      _paymentInterfaceToData = $v.paymentInterfaceToData;
      _amount = $v.amount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInitiateNonCustodianExchangeVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInitiateNonCustodianExchangeVars;
  }

  @override
  void update(
      void Function(GInitiateNonCustodianExchangeVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GInitiateNonCustodianExchangeVars build() => _build();

  _$GInitiateNonCustodianExchangeVars _build() {
    final _$result = _$v ??
        new _$GInitiateNonCustodianExchangeVars._(
            currencyFrom: currencyFrom,
            paymentInterfaceFrom: paymentInterfaceFrom,
            currencyTo: currencyTo,
            paymentInterfaceTo: paymentInterfaceTo,
            paymentInterfaceToData: paymentInterfaceToData,
            amount: amount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
