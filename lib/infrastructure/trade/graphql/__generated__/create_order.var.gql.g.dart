// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateOrderVars> _$gCreateOrderVarsSerializer =
    new _$GCreateOrderVarsSerializer();

class _$GCreateOrderVarsSerializer
    implements StructuredSerializer<GCreateOrderVars> {
  @override
  final Iterable<Type> types = const [GCreateOrderVars, _$GCreateOrderVars];
  @override
  final String wireName = 'GCreateOrderVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateOrderVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'market',
      serializers.serialize(object.market,
          specifiedType: const FullType(String)),
      'side',
      serializers.serialize(object.side, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(double)),
    ];
    Object? value;
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GCreateOrderVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateOrderVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'market':
          result.market = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'side':
          result.side = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$GCreateOrderVars extends GCreateOrderVars {
  @override
  final String market;
  @override
  final String side;
  @override
  final String type;
  @override
  final double? price;
  @override
  final double amount;

  factory _$GCreateOrderVars(
          [void Function(GCreateOrderVarsBuilder)? updates]) =>
      (new GCreateOrderVarsBuilder()..update(updates))._build();

  _$GCreateOrderVars._(
      {required this.market,
      required this.side,
      required this.type,
      this.price,
      required this.amount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        market, r'GCreateOrderVars', 'market');
    BuiltValueNullFieldError.checkNotNull(side, r'GCreateOrderVars', 'side');
    BuiltValueNullFieldError.checkNotNull(type, r'GCreateOrderVars', 'type');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'GCreateOrderVars', 'amount');
  }

  @override
  GCreateOrderVars rebuild(void Function(GCreateOrderVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateOrderVarsBuilder toBuilder() =>
      new GCreateOrderVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateOrderVars &&
        market == other.market &&
        side == other.side &&
        type == other.type &&
        price == other.price &&
        amount == other.amount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, market.hashCode);
    _$hash = $jc(_$hash, side.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateOrderVars')
          ..add('market', market)
          ..add('side', side)
          ..add('type', type)
          ..add('price', price)
          ..add('amount', amount))
        .toString();
  }
}

class GCreateOrderVarsBuilder
    implements Builder<GCreateOrderVars, GCreateOrderVarsBuilder> {
  _$GCreateOrderVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  String? _side;
  String? get side => _$this._side;
  set side(String? side) => _$this._side = side;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  GCreateOrderVarsBuilder();

  GCreateOrderVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _side = $v.side;
      _type = $v.type;
      _price = $v.price;
      _amount = $v.amount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateOrderVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateOrderVars;
  }

  @override
  void update(void Function(GCreateOrderVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateOrderVars build() => _build();

  _$GCreateOrderVars _build() {
    final _$result = _$v ??
        new _$GCreateOrderVars._(
            market: BuiltValueNullFieldError.checkNotNull(
                market, r'GCreateOrderVars', 'market'),
            side: BuiltValueNullFieldError.checkNotNull(
                side, r'GCreateOrderVars', 'side'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'GCreateOrderVars', 'type'),
            price: price,
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'GCreateOrderVars', 'amount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
