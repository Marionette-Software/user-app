// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_trades_subscription.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPublicTradesSubscriptionData>
    _$gPublicTradesSubscriptionDataSerializer =
    new _$GPublicTradesSubscriptionDataSerializer();
Serializer<GPublicTradesSubscriptionData_publicTrades>
    _$gPublicTradesSubscriptionDataPublicTradesSerializer =
    new _$GPublicTradesSubscriptionData_publicTradesSerializer();

class _$GPublicTradesSubscriptionDataSerializer
    implements StructuredSerializer<GPublicTradesSubscriptionData> {
  @override
  final Iterable<Type> types = const [
    GPublicTradesSubscriptionData,
    _$GPublicTradesSubscriptionData
  ];
  @override
  final String wireName = 'GPublicTradesSubscriptionData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPublicTradesSubscriptionData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.publicTrades;
    if (value != null) {
      result
        ..add('publicTrades')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GPublicTradesSubscriptionData_publicTrades)));
    }
    return result;
  }

  @override
  GPublicTradesSubscriptionData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPublicTradesSubscriptionDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'publicTrades':
          result.publicTrades.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GPublicTradesSubscriptionData_publicTrades))!
              as GPublicTradesSubscriptionData_publicTrades);
          break;
      }
    }

    return result.build();
  }
}

class _$GPublicTradesSubscriptionData_publicTradesSerializer
    implements
        StructuredSerializer<GPublicTradesSubscriptionData_publicTrades> {
  @override
  final Iterable<Type> types = const [
    GPublicTradesSubscriptionData_publicTrades,
    _$GPublicTradesSubscriptionData_publicTrades
  ];
  @override
  final String wireName = 'GPublicTradesSubscriptionData_publicTrades';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPublicTradesSubscriptionData_publicTrades object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.makerOrderSide;
    if (value != null) {
      result
        ..add('makerOrderSide')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GPublicTradesSubscriptionData_publicTrades deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPublicTradesSubscriptionData_publicTradesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'makerOrderSide':
          result.makerOrderSide = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPublicTradesSubscriptionData extends GPublicTradesSubscriptionData {
  @override
  final String G__typename;
  @override
  final GPublicTradesSubscriptionData_publicTrades? publicTrades;

  factory _$GPublicTradesSubscriptionData(
          [void Function(GPublicTradesSubscriptionDataBuilder)? updates]) =>
      (new GPublicTradesSubscriptionDataBuilder()..update(updates))._build();

  _$GPublicTradesSubscriptionData._(
      {required this.G__typename, this.publicTrades})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPublicTradesSubscriptionData', 'G__typename');
  }

  @override
  GPublicTradesSubscriptionData rebuild(
          void Function(GPublicTradesSubscriptionDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicTradesSubscriptionDataBuilder toBuilder() =>
      new GPublicTradesSubscriptionDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPublicTradesSubscriptionData &&
        G__typename == other.G__typename &&
        publicTrades == other.publicTrades;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, publicTrades.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPublicTradesSubscriptionData')
          ..add('G__typename', G__typename)
          ..add('publicTrades', publicTrades))
        .toString();
  }
}

class GPublicTradesSubscriptionDataBuilder
    implements
        Builder<GPublicTradesSubscriptionData,
            GPublicTradesSubscriptionDataBuilder> {
  _$GPublicTradesSubscriptionData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GPublicTradesSubscriptionData_publicTradesBuilder? _publicTrades;
  GPublicTradesSubscriptionData_publicTradesBuilder get publicTrades =>
      _$this._publicTrades ??=
          new GPublicTradesSubscriptionData_publicTradesBuilder();
  set publicTrades(
          GPublicTradesSubscriptionData_publicTradesBuilder? publicTrades) =>
      _$this._publicTrades = publicTrades;

  GPublicTradesSubscriptionDataBuilder() {
    GPublicTradesSubscriptionData._initializeBuilder(this);
  }

  GPublicTradesSubscriptionDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _publicTrades = $v.publicTrades?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPublicTradesSubscriptionData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPublicTradesSubscriptionData;
  }

  @override
  void update(void Function(GPublicTradesSubscriptionDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicTradesSubscriptionData build() => _build();

  _$GPublicTradesSubscriptionData _build() {
    _$GPublicTradesSubscriptionData _$result;
    try {
      _$result = _$v ??
          new _$GPublicTradesSubscriptionData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPublicTradesSubscriptionData', 'G__typename'),
              publicTrades: _publicTrades?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'publicTrades';
        _publicTrades?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPublicTradesSubscriptionData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPublicTradesSubscriptionData_publicTrades
    extends GPublicTradesSubscriptionData_publicTrades {
  @override
  final String G__typename;
  @override
  final double? price;
  @override
  final double? amount;
  @override
  final String? createdAt;
  @override
  final String? makerOrderSide;

  factory _$GPublicTradesSubscriptionData_publicTrades(
          [void Function(GPublicTradesSubscriptionData_publicTradesBuilder)?
              updates]) =>
      (new GPublicTradesSubscriptionData_publicTradesBuilder()..update(updates))
          ._build();

  _$GPublicTradesSubscriptionData_publicTrades._(
      {required this.G__typename,
      this.price,
      this.amount,
      this.createdAt,
      this.makerOrderSide})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GPublicTradesSubscriptionData_publicTrades', 'G__typename');
  }

  @override
  GPublicTradesSubscriptionData_publicTrades rebuild(
          void Function(GPublicTradesSubscriptionData_publicTradesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicTradesSubscriptionData_publicTradesBuilder toBuilder() =>
      new GPublicTradesSubscriptionData_publicTradesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPublicTradesSubscriptionData_publicTrades &&
        G__typename == other.G__typename &&
        price == other.price &&
        amount == other.amount &&
        createdAt == other.createdAt &&
        makerOrderSide == other.makerOrderSide;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, makerOrderSide.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPublicTradesSubscriptionData_publicTrades')
          ..add('G__typename', G__typename)
          ..add('price', price)
          ..add('amount', amount)
          ..add('createdAt', createdAt)
          ..add('makerOrderSide', makerOrderSide))
        .toString();
  }
}

class GPublicTradesSubscriptionData_publicTradesBuilder
    implements
        Builder<GPublicTradesSubscriptionData_publicTrades,
            GPublicTradesSubscriptionData_publicTradesBuilder> {
  _$GPublicTradesSubscriptionData_publicTrades? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _makerOrderSide;
  String? get makerOrderSide => _$this._makerOrderSide;
  set makerOrderSide(String? makerOrderSide) =>
      _$this._makerOrderSide = makerOrderSide;

  GPublicTradesSubscriptionData_publicTradesBuilder() {
    GPublicTradesSubscriptionData_publicTrades._initializeBuilder(this);
  }

  GPublicTradesSubscriptionData_publicTradesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _price = $v.price;
      _amount = $v.amount;
      _createdAt = $v.createdAt;
      _makerOrderSide = $v.makerOrderSide;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPublicTradesSubscriptionData_publicTrades other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPublicTradesSubscriptionData_publicTrades;
  }

  @override
  void update(
      void Function(GPublicTradesSubscriptionData_publicTradesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicTradesSubscriptionData_publicTrades build() => _build();

  _$GPublicTradesSubscriptionData_publicTrades _build() {
    final _$result = _$v ??
        new _$GPublicTradesSubscriptionData_publicTrades._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPublicTradesSubscriptionData_publicTrades', 'G__typename'),
            price: price,
            amount: amount,
            createdAt: createdAt,
            makerOrderSide: makerOrderSide);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
