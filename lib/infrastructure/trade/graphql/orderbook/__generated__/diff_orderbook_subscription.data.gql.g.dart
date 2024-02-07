// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diff_orderbook_subscription.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPublicDiffOrderBookSubscriptionData>
    _$gPublicDiffOrderBookSubscriptionDataSerializer =
    new _$GPublicDiffOrderBookSubscriptionDataSerializer();
Serializer<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook>
    _$gPublicDiffOrderBookSubscriptionDataPublicDiffOrderBookSerializer =
    new _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookSerializer();
Serializer<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy>
    _$gPublicDiffOrderBookSubscriptionDataPublicDiffOrderBookBuySerializer =
    new _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buySerializer();
Serializer<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell>
    _$gPublicDiffOrderBookSubscriptionDataPublicDiffOrderBookSellSerializer =
    new _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellSerializer();

class _$GPublicDiffOrderBookSubscriptionDataSerializer
    implements StructuredSerializer<GPublicDiffOrderBookSubscriptionData> {
  @override
  final Iterable<Type> types = const [
    GPublicDiffOrderBookSubscriptionData,
    _$GPublicDiffOrderBookSubscriptionData
  ];
  @override
  final String wireName = 'GPublicDiffOrderBookSubscriptionData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPublicDiffOrderBookSubscriptionData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.publicDiffOrderBook;
    if (value != null) {
      result
        ..add('publicDiffOrderBook')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook)));
    }
    return result;
  }

  @override
  GPublicDiffOrderBookSubscriptionData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPublicDiffOrderBookSubscriptionDataBuilder();

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
        case 'publicDiffOrderBook':
          result.publicDiffOrderBook.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook))!
              as GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook);
          break;
      }
    }

    return result.build();
  }
}

class _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookSerializer
    implements
        StructuredSerializer<
            GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook> {
  @override
  final Iterable<Type> types = const [
    GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook,
    _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook
  ];
  @override
  final String wireName =
      'GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook object,
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
                  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy)
            ])));
    }
    value = object.sell;
    if (value != null) {
      result
        ..add('sell')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell)
            ])));
    }
    return result;
  }

  @override
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder();

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
                    GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy)
              ]))! as BuiltList<Object?>);
          break;
        case 'sell':
          result.sell.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buySerializer
    implements
        StructuredSerializer<
            GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy> {
  @override
  final Iterable<Type> types = const [
    GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy,
    _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy
  ];
  @override
  final String wireName =
      'GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy object,
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
    value = object.amountDiff;
    if (value != null) {
      result
        ..add('amountDiff')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buyBuilder();

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
        case 'amountDiff':
          result.amountDiff = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellSerializer
    implements
        StructuredSerializer<
            GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell> {
  @override
  final Iterable<Type> types = const [
    GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell,
    _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell
  ];
  @override
  final String wireName =
      'GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell object,
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
    value = object.amountDiff;
    if (value != null) {
      result
        ..add('amountDiff')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellBuilder();

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
        case 'amountDiff':
          result.amountDiff = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPublicDiffOrderBookSubscriptionData
    extends GPublicDiffOrderBookSubscriptionData {
  @override
  final String G__typename;
  @override
  final GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook?
      publicDiffOrderBook;

  factory _$GPublicDiffOrderBookSubscriptionData(
          [void Function(GPublicDiffOrderBookSubscriptionDataBuilder)?
              updates]) =>
      (new GPublicDiffOrderBookSubscriptionDataBuilder()..update(updates))
          ._build();

  _$GPublicDiffOrderBookSubscriptionData._(
      {required this.G__typename, this.publicDiffOrderBook})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPublicDiffOrderBookSubscriptionData', 'G__typename');
  }

  @override
  GPublicDiffOrderBookSubscriptionData rebuild(
          void Function(GPublicDiffOrderBookSubscriptionDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicDiffOrderBookSubscriptionDataBuilder toBuilder() =>
      new GPublicDiffOrderBookSubscriptionDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPublicDiffOrderBookSubscriptionData &&
        G__typename == other.G__typename &&
        publicDiffOrderBook == other.publicDiffOrderBook;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, publicDiffOrderBook.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPublicDiffOrderBookSubscriptionData')
          ..add('G__typename', G__typename)
          ..add('publicDiffOrderBook', publicDiffOrderBook))
        .toString();
  }
}

class GPublicDiffOrderBookSubscriptionDataBuilder
    implements
        Builder<GPublicDiffOrderBookSubscriptionData,
            GPublicDiffOrderBookSubscriptionDataBuilder> {
  _$GPublicDiffOrderBookSubscriptionData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder?
      _publicDiffOrderBook;
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder
      get publicDiffOrderBook => _$this._publicDiffOrderBook ??=
          new GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder();
  set publicDiffOrderBook(
          GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder?
              publicDiffOrderBook) =>
      _$this._publicDiffOrderBook = publicDiffOrderBook;

  GPublicDiffOrderBookSubscriptionDataBuilder() {
    GPublicDiffOrderBookSubscriptionData._initializeBuilder(this);
  }

  GPublicDiffOrderBookSubscriptionDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _publicDiffOrderBook = $v.publicDiffOrderBook?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPublicDiffOrderBookSubscriptionData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPublicDiffOrderBookSubscriptionData;
  }

  @override
  void update(
      void Function(GPublicDiffOrderBookSubscriptionDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicDiffOrderBookSubscriptionData build() => _build();

  _$GPublicDiffOrderBookSubscriptionData _build() {
    _$GPublicDiffOrderBookSubscriptionData _$result;
    try {
      _$result = _$v ??
          new _$GPublicDiffOrderBookSubscriptionData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GPublicDiffOrderBookSubscriptionData', 'G__typename'),
              publicDiffOrderBook: _publicDiffOrderBook?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'publicDiffOrderBook';
        _publicDiffOrderBook?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPublicDiffOrderBookSubscriptionData',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook
    extends GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook {
  @override
  final String G__typename;
  @override
  final BuiltList<
      GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy?>? buy;
  @override
  final BuiltList<
      GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell?>? sell;

  factory _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook(
          [void Function(
                  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder)?
              updates]) =>
      (new GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder()
            ..update(updates))
          ._build();

  _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook._(
      {required this.G__typename, this.buy, this.sell})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook',
        'G__typename');
  }

  @override
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook rebuild(
          void Function(
                  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder toBuilder() =>
      new GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook &&
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
            r'GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook')
          ..add('G__typename', G__typename)
          ..add('buy', buy)
          ..add('sell', sell))
        .toString();
  }
}

class GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder
    implements
        Builder<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook,
            GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder> {
  _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy?>?
      _buy;
  ListBuilder<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy?>
      get buy => _$this._buy ??= new ListBuilder<
          GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy?>();
  set buy(
          ListBuilder<
                  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy?>?
              buy) =>
      _$this._buy = buy;

  ListBuilder<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell?>?
      _sell;
  ListBuilder<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell?>
      get sell => _$this._sell ??= new ListBuilder<
          GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell?>();
  set sell(
          ListBuilder<
                  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell?>?
              sell) =>
      _$this._sell = sell;

  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder() {
    GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook._initializeBuilder(
        this);
  }

  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder get _$this {
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
  void replace(GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook;
  }

  @override
  void update(
      void Function(
              GPublicDiffOrderBookSubscriptionData_publicDiffOrderBookBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook build() => _build();

  _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook _build() {
    _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook _$result;
    try {
      _$result = _$v ??
          new _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook',
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
            r'GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy
    extends GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy {
  @override
  final String G__typename;
  @override
  final double? price;
  @override
  final double? amountDiff;

  factory _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy(
          [void Function(
                  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buyBuilder)?
              updates]) =>
      (new GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buyBuilder()
            ..update(updates))
          ._build();

  _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy._(
      {required this.G__typename, this.price, this.amountDiff})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy',
        'G__typename');
  }

  @override
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy rebuild(
          void Function(
                  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buyBuilder
      toBuilder() =>
          new GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buyBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy &&
        G__typename == other.G__typename &&
        price == other.price &&
        amountDiff == other.amountDiff;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, amountDiff.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy')
          ..add('G__typename', G__typename)
          ..add('price', price)
          ..add('amountDiff', amountDiff))
        .toString();
  }
}

class GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buyBuilder
    implements
        Builder<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy,
            GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buyBuilder> {
  _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  double? _amountDiff;
  double? get amountDiff => _$this._amountDiff;
  set amountDiff(double? amountDiff) => _$this._amountDiff = amountDiff;

  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buyBuilder() {
    GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy
        ._initializeBuilder(this);
  }

  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buyBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _price = $v.price;
      _amountDiff = $v.amountDiff;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v =
        other as _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy;
  }

  @override
  void update(
      void Function(
              GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy build() =>
      _build();

  _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy _build() {
    final _$result = _$v ??
        new _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_buy',
                'G__typename'),
            price: price,
            amountDiff: amountDiff);
    replace(_$result);
    return _$result;
  }
}

class _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell
    extends GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell {
  @override
  final String G__typename;
  @override
  final double? price;
  @override
  final double? amountDiff;

  factory _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell(
          [void Function(
                  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellBuilder)?
              updates]) =>
      (new GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellBuilder()
            ..update(updates))
          ._build();

  _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell._(
      {required this.G__typename, this.price, this.amountDiff})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell',
        'G__typename');
  }

  @override
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell rebuild(
          void Function(
                  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellBuilder
      toBuilder() =>
          new GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell &&
        G__typename == other.G__typename &&
        price == other.price &&
        amountDiff == other.amountDiff;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, amountDiff.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell')
          ..add('G__typename', G__typename)
          ..add('price', price)
          ..add('amountDiff', amountDiff))
        .toString();
  }
}

class GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellBuilder
    implements
        Builder<GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell,
            GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellBuilder> {
  _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  double? _amountDiff;
  double? get amountDiff => _$this._amountDiff;
  set amountDiff(double? amountDiff) => _$this._amountDiff = amountDiff;

  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellBuilder() {
    GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell
        ._initializeBuilder(this);
  }

  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _price = $v.price;
      _amountDiff = $v.amountDiff;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell;
  }

  @override
  void update(
      void Function(
              GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sellBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell build() =>
      _build();

  _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell _build() {
    final _$result = _$v ??
        new _$GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GPublicDiffOrderBookSubscriptionData_publicDiffOrderBook_sell',
                'G__typename'),
            price: price,
            amountDiff: amountDiff);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
