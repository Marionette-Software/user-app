// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_orderbook.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPublicOrderBookData> _$gPublicOrderBookDataSerializer =
    new _$GPublicOrderBookDataSerializer();
Serializer<GPublicOrderBookData_publicOrderBook>
    _$gPublicOrderBookDataPublicOrderBookSerializer =
    new _$GPublicOrderBookData_publicOrderBookSerializer();
Serializer<GPublicOrderBookData_publicOrderBook_buy>
    _$gPublicOrderBookDataPublicOrderBookBuySerializer =
    new _$GPublicOrderBookData_publicOrderBook_buySerializer();
Serializer<GPublicOrderBookData_publicOrderBook_sell>
    _$gPublicOrderBookDataPublicOrderBookSellSerializer =
    new _$GPublicOrderBookData_publicOrderBook_sellSerializer();

class _$GPublicOrderBookDataSerializer
    implements StructuredSerializer<GPublicOrderBookData> {
  @override
  final Iterable<Type> types = const [
    GPublicOrderBookData,
    _$GPublicOrderBookData
  ];
  @override
  final String wireName = 'GPublicOrderBookData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPublicOrderBookData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.publicOrderBook;
    if (value != null) {
      result
        ..add('publicOrderBook')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GPublicOrderBookData_publicOrderBook)));
    }
    return result;
  }

  @override
  GPublicOrderBookData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPublicOrderBookDataBuilder();

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
        case 'publicOrderBook':
          result.publicOrderBook.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPublicOrderBookData_publicOrderBook))!
              as GPublicOrderBookData_publicOrderBook);
          break;
      }
    }

    return result.build();
  }
}

class _$GPublicOrderBookData_publicOrderBookSerializer
    implements StructuredSerializer<GPublicOrderBookData_publicOrderBook> {
  @override
  final Iterable<Type> types = const [
    GPublicOrderBookData_publicOrderBook,
    _$GPublicOrderBookData_publicOrderBook
  ];
  @override
  final String wireName = 'GPublicOrderBookData_publicOrderBook';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPublicOrderBookData_publicOrderBook object,
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
              const FullType.nullable(GPublicOrderBookData_publicOrderBook_buy)
            ])));
    }
    value = object.sell;
    if (value != null) {
      result
        ..add('sell')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GPublicOrderBookData_publicOrderBook_sell)
            ])));
    }
    return result;
  }

  @override
  GPublicOrderBookData_publicOrderBook deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPublicOrderBookData_publicOrderBookBuilder();

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
                    GPublicOrderBookData_publicOrderBook_buy)
              ]))! as BuiltList<Object?>);
          break;
        case 'sell':
          result.sell.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GPublicOrderBookData_publicOrderBook_sell)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPublicOrderBookData_publicOrderBook_buySerializer
    implements StructuredSerializer<GPublicOrderBookData_publicOrderBook_buy> {
  @override
  final Iterable<Type> types = const [
    GPublicOrderBookData_publicOrderBook_buy,
    _$GPublicOrderBookData_publicOrderBook_buy
  ];
  @override
  final String wireName = 'GPublicOrderBookData_publicOrderBook_buy';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPublicOrderBookData_publicOrderBook_buy object,
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
  GPublicOrderBookData_publicOrderBook_buy deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPublicOrderBookData_publicOrderBook_buyBuilder();

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

class _$GPublicOrderBookData_publicOrderBook_sellSerializer
    implements StructuredSerializer<GPublicOrderBookData_publicOrderBook_sell> {
  @override
  final Iterable<Type> types = const [
    GPublicOrderBookData_publicOrderBook_sell,
    _$GPublicOrderBookData_publicOrderBook_sell
  ];
  @override
  final String wireName = 'GPublicOrderBookData_publicOrderBook_sell';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPublicOrderBookData_publicOrderBook_sell object,
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
  GPublicOrderBookData_publicOrderBook_sell deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPublicOrderBookData_publicOrderBook_sellBuilder();

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

class _$GPublicOrderBookData extends GPublicOrderBookData {
  @override
  final String G__typename;
  @override
  final GPublicOrderBookData_publicOrderBook? publicOrderBook;

  factory _$GPublicOrderBookData(
          [void Function(GPublicOrderBookDataBuilder)? updates]) =>
      (new GPublicOrderBookDataBuilder()..update(updates))._build();

  _$GPublicOrderBookData._({required this.G__typename, this.publicOrderBook})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPublicOrderBookData', 'G__typename');
  }

  @override
  GPublicOrderBookData rebuild(
          void Function(GPublicOrderBookDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicOrderBookDataBuilder toBuilder() =>
      new GPublicOrderBookDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPublicOrderBookData &&
        G__typename == other.G__typename &&
        publicOrderBook == other.publicOrderBook;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, publicOrderBook.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPublicOrderBookData')
          ..add('G__typename', G__typename)
          ..add('publicOrderBook', publicOrderBook))
        .toString();
  }
}

class GPublicOrderBookDataBuilder
    implements Builder<GPublicOrderBookData, GPublicOrderBookDataBuilder> {
  _$GPublicOrderBookData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GPublicOrderBookData_publicOrderBookBuilder? _publicOrderBook;
  GPublicOrderBookData_publicOrderBookBuilder get publicOrderBook =>
      _$this._publicOrderBook ??=
          new GPublicOrderBookData_publicOrderBookBuilder();
  set publicOrderBook(
          GPublicOrderBookData_publicOrderBookBuilder? publicOrderBook) =>
      _$this._publicOrderBook = publicOrderBook;

  GPublicOrderBookDataBuilder() {
    GPublicOrderBookData._initializeBuilder(this);
  }

  GPublicOrderBookDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _publicOrderBook = $v.publicOrderBook?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPublicOrderBookData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPublicOrderBookData;
  }

  @override
  void update(void Function(GPublicOrderBookDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicOrderBookData build() => _build();

  _$GPublicOrderBookData _build() {
    _$GPublicOrderBookData _$result;
    try {
      _$result = _$v ??
          new _$GPublicOrderBookData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPublicOrderBookData', 'G__typename'),
              publicOrderBook: _publicOrderBook?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'publicOrderBook';
        _publicOrderBook?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPublicOrderBookData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPublicOrderBookData_publicOrderBook
    extends GPublicOrderBookData_publicOrderBook {
  @override
  final String G__typename;
  @override
  final BuiltList<GPublicOrderBookData_publicOrderBook_buy?>? buy;
  @override
  final BuiltList<GPublicOrderBookData_publicOrderBook_sell?>? sell;

  factory _$GPublicOrderBookData_publicOrderBook(
          [void Function(GPublicOrderBookData_publicOrderBookBuilder)?
              updates]) =>
      (new GPublicOrderBookData_publicOrderBookBuilder()..update(updates))
          ._build();

  _$GPublicOrderBookData_publicOrderBook._(
      {required this.G__typename, this.buy, this.sell})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPublicOrderBookData_publicOrderBook', 'G__typename');
  }

  @override
  GPublicOrderBookData_publicOrderBook rebuild(
          void Function(GPublicOrderBookData_publicOrderBookBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicOrderBookData_publicOrderBookBuilder toBuilder() =>
      new GPublicOrderBookData_publicOrderBookBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPublicOrderBookData_publicOrderBook &&
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
    return (newBuiltValueToStringHelper(r'GPublicOrderBookData_publicOrderBook')
          ..add('G__typename', G__typename)
          ..add('buy', buy)
          ..add('sell', sell))
        .toString();
  }
}

class GPublicOrderBookData_publicOrderBookBuilder
    implements
        Builder<GPublicOrderBookData_publicOrderBook,
            GPublicOrderBookData_publicOrderBookBuilder> {
  _$GPublicOrderBookData_publicOrderBook? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GPublicOrderBookData_publicOrderBook_buy?>? _buy;
  ListBuilder<GPublicOrderBookData_publicOrderBook_buy?> get buy =>
      _$this._buy ??=
          new ListBuilder<GPublicOrderBookData_publicOrderBook_buy?>();
  set buy(ListBuilder<GPublicOrderBookData_publicOrderBook_buy?>? buy) =>
      _$this._buy = buy;

  ListBuilder<GPublicOrderBookData_publicOrderBook_sell?>? _sell;
  ListBuilder<GPublicOrderBookData_publicOrderBook_sell?> get sell =>
      _$this._sell ??=
          new ListBuilder<GPublicOrderBookData_publicOrderBook_sell?>();
  set sell(ListBuilder<GPublicOrderBookData_publicOrderBook_sell?>? sell) =>
      _$this._sell = sell;

  GPublicOrderBookData_publicOrderBookBuilder() {
    GPublicOrderBookData_publicOrderBook._initializeBuilder(this);
  }

  GPublicOrderBookData_publicOrderBookBuilder get _$this {
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
  void replace(GPublicOrderBookData_publicOrderBook other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPublicOrderBookData_publicOrderBook;
  }

  @override
  void update(
      void Function(GPublicOrderBookData_publicOrderBookBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicOrderBookData_publicOrderBook build() => _build();

  _$GPublicOrderBookData_publicOrderBook _build() {
    _$GPublicOrderBookData_publicOrderBook _$result;
    try {
      _$result = _$v ??
          new _$GPublicOrderBookData_publicOrderBook._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GPublicOrderBookData_publicOrderBook', 'G__typename'),
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
            r'GPublicOrderBookData_publicOrderBook',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPublicOrderBookData_publicOrderBook_buy
    extends GPublicOrderBookData_publicOrderBook_buy {
  @override
  final String G__typename;
  @override
  final double? price;
  @override
  final double? amount;
  @override
  final double? cumulativeAmount;

  factory _$GPublicOrderBookData_publicOrderBook_buy(
          [void Function(GPublicOrderBookData_publicOrderBook_buyBuilder)?
              updates]) =>
      (new GPublicOrderBookData_publicOrderBook_buyBuilder()..update(updates))
          ._build();

  _$GPublicOrderBookData_publicOrderBook_buy._(
      {required this.G__typename,
      this.price,
      this.amount,
      this.cumulativeAmount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GPublicOrderBookData_publicOrderBook_buy', 'G__typename');
  }

  @override
  GPublicOrderBookData_publicOrderBook_buy rebuild(
          void Function(GPublicOrderBookData_publicOrderBook_buyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicOrderBookData_publicOrderBook_buyBuilder toBuilder() =>
      new GPublicOrderBookData_publicOrderBook_buyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPublicOrderBookData_publicOrderBook_buy &&
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
            r'GPublicOrderBookData_publicOrderBook_buy')
          ..add('G__typename', G__typename)
          ..add('price', price)
          ..add('amount', amount)
          ..add('cumulativeAmount', cumulativeAmount))
        .toString();
  }
}

class GPublicOrderBookData_publicOrderBook_buyBuilder
    implements
        Builder<GPublicOrderBookData_publicOrderBook_buy,
            GPublicOrderBookData_publicOrderBook_buyBuilder> {
  _$GPublicOrderBookData_publicOrderBook_buy? _$v;

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

  GPublicOrderBookData_publicOrderBook_buyBuilder() {
    GPublicOrderBookData_publicOrderBook_buy._initializeBuilder(this);
  }

  GPublicOrderBookData_publicOrderBook_buyBuilder get _$this {
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
  void replace(GPublicOrderBookData_publicOrderBook_buy other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPublicOrderBookData_publicOrderBook_buy;
  }

  @override
  void update(
      void Function(GPublicOrderBookData_publicOrderBook_buyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicOrderBookData_publicOrderBook_buy build() => _build();

  _$GPublicOrderBookData_publicOrderBook_buy _build() {
    final _$result = _$v ??
        new _$GPublicOrderBookData_publicOrderBook_buy._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPublicOrderBookData_publicOrderBook_buy', 'G__typename'),
            price: price,
            amount: amount,
            cumulativeAmount: cumulativeAmount);
    replace(_$result);
    return _$result;
  }
}

class _$GPublicOrderBookData_publicOrderBook_sell
    extends GPublicOrderBookData_publicOrderBook_sell {
  @override
  final String G__typename;
  @override
  final double? price;
  @override
  final double? amount;
  @override
  final double? cumulativeAmount;

  factory _$GPublicOrderBookData_publicOrderBook_sell(
          [void Function(GPublicOrderBookData_publicOrderBook_sellBuilder)?
              updates]) =>
      (new GPublicOrderBookData_publicOrderBook_sellBuilder()..update(updates))
          ._build();

  _$GPublicOrderBookData_publicOrderBook_sell._(
      {required this.G__typename,
      this.price,
      this.amount,
      this.cumulativeAmount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GPublicOrderBookData_publicOrderBook_sell', 'G__typename');
  }

  @override
  GPublicOrderBookData_publicOrderBook_sell rebuild(
          void Function(GPublicOrderBookData_publicOrderBook_sellBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicOrderBookData_publicOrderBook_sellBuilder toBuilder() =>
      new GPublicOrderBookData_publicOrderBook_sellBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPublicOrderBookData_publicOrderBook_sell &&
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
            r'GPublicOrderBookData_publicOrderBook_sell')
          ..add('G__typename', G__typename)
          ..add('price', price)
          ..add('amount', amount)
          ..add('cumulativeAmount', cumulativeAmount))
        .toString();
  }
}

class GPublicOrderBookData_publicOrderBook_sellBuilder
    implements
        Builder<GPublicOrderBookData_publicOrderBook_sell,
            GPublicOrderBookData_publicOrderBook_sellBuilder> {
  _$GPublicOrderBookData_publicOrderBook_sell? _$v;

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

  GPublicOrderBookData_publicOrderBook_sellBuilder() {
    GPublicOrderBookData_publicOrderBook_sell._initializeBuilder(this);
  }

  GPublicOrderBookData_publicOrderBook_sellBuilder get _$this {
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
  void replace(GPublicOrderBookData_publicOrderBook_sell other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPublicOrderBookData_publicOrderBook_sell;
  }

  @override
  void update(
      void Function(GPublicOrderBookData_publicOrderBook_sellBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicOrderBookData_publicOrderBook_sell build() => _build();

  _$GPublicOrderBookData_publicOrderBook_sell _build() {
    final _$result = _$v ??
        new _$GPublicOrderBookData_publicOrderBook_sell._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPublicOrderBookData_publicOrderBook_sell', 'G__typename'),
            price: price,
            amount: amount,
            cumulativeAmount: cumulativeAmount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
