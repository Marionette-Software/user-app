// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_orderbook_subscription.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPublicFullOrderBookSubscriptionData>
    _$gPublicFullOrderBookSubscriptionDataSerializer =
    new _$GPublicFullOrderBookSubscriptionDataSerializer();
Serializer<GPublicFullOrderBookSubscriptionData_publicFullOrderBook>
    _$gPublicFullOrderBookSubscriptionDataPublicFullOrderBookSerializer =
    new _$GPublicFullOrderBookSubscriptionData_publicFullOrderBookSerializer();
Serializer<GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy>
    _$gPublicFullOrderBookSubscriptionDataPublicFullOrderBookBuySerializer =
    new _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buySerializer();
Serializer<GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell>
    _$gPublicFullOrderBookSubscriptionDataPublicFullOrderBookSellSerializer =
    new _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellSerializer();

class _$GPublicFullOrderBookSubscriptionDataSerializer
    implements StructuredSerializer<GPublicFullOrderBookSubscriptionData> {
  @override
  final Iterable<Type> types = const [
    GPublicFullOrderBookSubscriptionData,
    _$GPublicFullOrderBookSubscriptionData
  ];
  @override
  final String wireName = 'GPublicFullOrderBookSubscriptionData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPublicFullOrderBookSubscriptionData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.publicFullOrderBook;
    if (value != null) {
      result
        ..add('publicFullOrderBook')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GPublicFullOrderBookSubscriptionData_publicFullOrderBook)));
    }
    return result;
  }

  @override
  GPublicFullOrderBookSubscriptionData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPublicFullOrderBookSubscriptionDataBuilder();

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
        case 'publicFullOrderBook':
          result.publicFullOrderBook.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GPublicFullOrderBookSubscriptionData_publicFullOrderBook))!
              as GPublicFullOrderBookSubscriptionData_publicFullOrderBook);
          break;
      }
    }

    return result.build();
  }
}

class _$GPublicFullOrderBookSubscriptionData_publicFullOrderBookSerializer
    implements
        StructuredSerializer<
            GPublicFullOrderBookSubscriptionData_publicFullOrderBook> {
  @override
  final Iterable<Type> types = const [
    GPublicFullOrderBookSubscriptionData_publicFullOrderBook,
    _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook
  ];
  @override
  final String wireName =
      'GPublicFullOrderBookSubscriptionData_publicFullOrderBook';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPublicFullOrderBookSubscriptionData_publicFullOrderBook object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.buy;
    if (value != null) {
      result
        ..add('buy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy)
            ])));
    }
    value = object.sell;
    if (value != null) {
      result
        ..add('sell')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell)
            ])));
    }
    return result;
  }

  @override
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder();

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
        case 'buy':
          result.buy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy)
              ]))! as BuiltList<Object?>);
          break;
        case 'sell':
          result.sell.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buySerializer
    implements
        StructuredSerializer<
            GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy> {
  @override
  final Iterable<Type> types = const [
    GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy,
    _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy
  ];
  @override
  final String wireName =
      'GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy object,
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
    value = object.cumulativeAmount;
    if (value != null) {
      result
        ..add('cumulativeAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buyBuilder();

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
        case 'cumulativeAmount':
          result.cumulativeAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellSerializer
    implements
        StructuredSerializer<
            GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell> {
  @override
  final Iterable<Type> types = const [
    GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell,
    _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell
  ];
  @override
  final String wireName =
      'GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell object,
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
    value = object.cumulativeAmount;
    if (value != null) {
      result
        ..add('cumulativeAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellBuilder();

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
        case 'cumulativeAmount':
          result.cumulativeAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPublicFullOrderBookSubscriptionData
    extends GPublicFullOrderBookSubscriptionData {
  @override
  final String G__typename;
  @override
  final GPublicFullOrderBookSubscriptionData_publicFullOrderBook?
      publicFullOrderBook;

  factory _$GPublicFullOrderBookSubscriptionData(
          [void Function(GPublicFullOrderBookSubscriptionDataBuilder)?
              updates]) =>
      (new GPublicFullOrderBookSubscriptionDataBuilder()..update(updates))
          ._build();

  _$GPublicFullOrderBookSubscriptionData._(
      {required this.G__typename, this.publicFullOrderBook})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPublicFullOrderBookSubscriptionData', 'G__typename');
  }

  @override
  GPublicFullOrderBookSubscriptionData rebuild(
          void Function(GPublicFullOrderBookSubscriptionDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicFullOrderBookSubscriptionDataBuilder toBuilder() =>
      new GPublicFullOrderBookSubscriptionDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPublicFullOrderBookSubscriptionData &&
        G__typename == other.G__typename &&
        publicFullOrderBook == other.publicFullOrderBook;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, publicFullOrderBook.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPublicFullOrderBookSubscriptionData')
          ..add('G__typename', G__typename)
          ..add('publicFullOrderBook', publicFullOrderBook))
        .toString();
  }
}

class GPublicFullOrderBookSubscriptionDataBuilder
    implements
        Builder<GPublicFullOrderBookSubscriptionData,
            GPublicFullOrderBookSubscriptionDataBuilder> {
  _$GPublicFullOrderBookSubscriptionData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder?
      _publicFullOrderBook;
  GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder
      get publicFullOrderBook => _$this._publicFullOrderBook ??=
          new GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder();
  set publicFullOrderBook(
          GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder?
              publicFullOrderBook) =>
      _$this._publicFullOrderBook = publicFullOrderBook;

  GPublicFullOrderBookSubscriptionDataBuilder() {
    GPublicFullOrderBookSubscriptionData._initializeBuilder(this);
  }

  GPublicFullOrderBookSubscriptionDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _publicFullOrderBook = $v.publicFullOrderBook?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPublicFullOrderBookSubscriptionData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPublicFullOrderBookSubscriptionData;
  }

  @override
  void update(
      void Function(GPublicFullOrderBookSubscriptionDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicFullOrderBookSubscriptionData build() => _build();

  _$GPublicFullOrderBookSubscriptionData _build() {
    _$GPublicFullOrderBookSubscriptionData _$result;
    try {
      _$result = _$v ??
          new _$GPublicFullOrderBookSubscriptionData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GPublicFullOrderBookSubscriptionData', 'G__typename'),
              publicFullOrderBook: _publicFullOrderBook?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'publicFullOrderBook';
        _publicFullOrderBook?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPublicFullOrderBookSubscriptionData',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook
    extends GPublicFullOrderBookSubscriptionData_publicFullOrderBook {
  @override
  final String G__typename;
  @override
  final BuiltList<
      GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy?>? buy;
  @override
  final BuiltList<
      GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell?>? sell;

  factory _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook(
          [void Function(
                  GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder)?
              updates]) =>
      (new GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder()
            ..update(updates))
          ._build();

  _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook._(
      {required this.G__typename, this.buy, this.sell})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GPublicFullOrderBookSubscriptionData_publicFullOrderBook',
        'G__typename');
  }

  @override
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook rebuild(
          void Function(
                  GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder toBuilder() =>
      new GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPublicFullOrderBookSubscriptionData_publicFullOrderBook &&
        G__typename == other.G__typename &&
        buy == other.buy &&
        sell == other.sell;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, buy.hashCode);
    _$hash = $jc(_$hash, sell.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPublicFullOrderBookSubscriptionData_publicFullOrderBook')
          ..add('G__typename', G__typename)
          ..add('buy', buy)
          ..add('sell', sell))
        .toString();
  }
}

class GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder
    implements
        Builder<GPublicFullOrderBookSubscriptionData_publicFullOrderBook,
            GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder> {
  _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy?>?
      _buy;
  ListBuilder<GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy?>
      get buy => _$this._buy ??= new ListBuilder<
          GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy?>();
  set buy(
          ListBuilder<
                  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy?>?
              buy) =>
      _$this._buy = buy;

  ListBuilder<GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell?>?
      _sell;
  ListBuilder<GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell?>
      get sell => _$this._sell ??= new ListBuilder<
          GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell?>();
  set sell(
          ListBuilder<
                  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell?>?
              sell) =>
      _$this._sell = sell;

  GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder() {
    GPublicFullOrderBookSubscriptionData_publicFullOrderBook._initializeBuilder(
        this);
  }

  GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _buy = $v.buy?.toBuilder();
      _sell = $v.sell?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPublicFullOrderBookSubscriptionData_publicFullOrderBook other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook;
  }

  @override
  void update(
      void Function(
              GPublicFullOrderBookSubscriptionData_publicFullOrderBookBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook build() => _build();

  _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook _build() {
    _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook _$result;
    try {
      _$result = _$v ??
          new _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GPublicFullOrderBookSubscriptionData_publicFullOrderBook',
                  'G__typename'),
              buy: _buy?.build(),
              sell: _sell?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'buy';
        _buy?.build();
        _$failedField = 'sell';
        _sell?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPublicFullOrderBookSubscriptionData_publicFullOrderBook',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy
    extends GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy {
  @override
  final String G__typename;
  @override
  final double? price;
  @override
  final double? amount;
  @override
  final double? cumulativeAmount;

  factory _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy(
          [void Function(
                  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buyBuilder)?
              updates]) =>
      (new GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buyBuilder()
            ..update(updates))
          ._build();

  _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy._(
      {required this.G__typename,
      this.price,
      this.amount,
      this.cumulativeAmount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy',
        'G__typename');
  }

  @override
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy rebuild(
          void Function(
                  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buyBuilder
      toBuilder() =>
          new GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buyBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy &&
        G__typename == other.G__typename &&
        price == other.price &&
        amount == other.amount &&
        cumulativeAmount == other.cumulativeAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, cumulativeAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy')
          ..add('G__typename', G__typename)
          ..add('price', price)
          ..add('amount', amount)
          ..add('cumulativeAmount', cumulativeAmount))
        .toString();
  }
}

class GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buyBuilder
    implements
        Builder<GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy,
            GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buyBuilder> {
  _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  double? _cumulativeAmount;
  double? get cumulativeAmount => _$this._cumulativeAmount;
  set cumulativeAmount(double? cumulativeAmount) =>
      _$this._cumulativeAmount = cumulativeAmount;

  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buyBuilder() {
    GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy
        ._initializeBuilder(this);
  }

  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buyBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _price = $v.price;
      _amount = $v.amount;
      _cumulativeAmount = $v.cumulativeAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v =
        other as _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy;
  }

  @override
  void update(
      void Function(
              GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy build() =>
      _build();

  _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy _build() {
    final _$result = _$v ??
        new _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GPublicFullOrderBookSubscriptionData_publicFullOrderBook_buy',
                'G__typename'),
            price: price,
            amount: amount,
            cumulativeAmount: cumulativeAmount);
    replace(_$result);
    return _$result;
  }
}

class _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell
    extends GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell {
  @override
  final String G__typename;
  @override
  final double? price;
  @override
  final double? amount;
  @override
  final double? cumulativeAmount;

  factory _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell(
          [void Function(
                  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellBuilder)?
              updates]) =>
      (new GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellBuilder()
            ..update(updates))
          ._build();

  _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell._(
      {required this.G__typename,
      this.price,
      this.amount,
      this.cumulativeAmount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell',
        'G__typename');
  }

  @override
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell rebuild(
          void Function(
                  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellBuilder
      toBuilder() =>
          new GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell &&
        G__typename == other.G__typename &&
        price == other.price &&
        amount == other.amount &&
        cumulativeAmount == other.cumulativeAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, cumulativeAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell')
          ..add('G__typename', G__typename)
          ..add('price', price)
          ..add('amount', amount)
          ..add('cumulativeAmount', cumulativeAmount))
        .toString();
  }
}

class GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellBuilder
    implements
        Builder<GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell,
            GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellBuilder> {
  _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  double? _cumulativeAmount;
  double? get cumulativeAmount => _$this._cumulativeAmount;
  set cumulativeAmount(double? cumulativeAmount) =>
      _$this._cumulativeAmount = cumulativeAmount;

  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellBuilder() {
    GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell
        ._initializeBuilder(this);
  }

  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _price = $v.price;
      _amount = $v.amount;
      _cumulativeAmount = $v.cumulativeAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell;
  }

  @override
  void update(
      void Function(
              GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sellBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell build() =>
      _build();

  _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell _build() {
    final _$result = _$v ??
        new _$GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GPublicFullOrderBookSubscriptionData_publicFullOrderBook_sell',
                'G__typename'),
            price: price,
            amount: amount,
            cumulativeAmount: cumulativeAmount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
