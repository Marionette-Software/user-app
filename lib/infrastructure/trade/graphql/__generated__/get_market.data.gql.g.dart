// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_market.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetMarketData> _$gGetMarketDataSerializer =
    new _$GGetMarketDataSerializer();
Serializer<GGetMarketData_market> _$gGetMarketDataMarketSerializer =
    new _$GGetMarketData_marketSerializer();
Serializer<GGetMarketData_market_quote_currency>
    _$gGetMarketDataMarketQuoteCurrencySerializer =
    new _$GGetMarketData_market_quote_currencySerializer();
Serializer<GGetMarketData_market_base_currency>
    _$gGetMarketDataMarketBaseCurrencySerializer =
    new _$GGetMarketData_market_base_currencySerializer();
Serializer<GGetMarketData_market_marketDynamics>
    _$gGetMarketDataMarketMarketDynamicsSerializer =
    new _$GGetMarketData_market_marketDynamicsSerializer();

class _$GGetMarketDataSerializer
    implements StructuredSerializer<GGetMarketData> {
  @override
  final Iterable<Type> types = const [GGetMarketData, _$GGetMarketData];
  @override
  final String wireName = 'GGetMarketData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetMarketData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.market;
    if (value != null) {
      result
        ..add('market')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetMarketData_market)));
    }
    return result;
  }

  @override
  GGetMarketData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetMarketDataBuilder();

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
        case 'market':
          result.market.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GGetMarketData_market))!
              as GGetMarketData_market);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetMarketData_marketSerializer
    implements StructuredSerializer<GGetMarketData_market> {
  @override
  final Iterable<Type> types = const [
    GGetMarketData_market,
    _$GGetMarketData_market
  ];
  @override
  final String wireName = 'GGetMarketData_market';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetMarketData_market object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.isFavorite;
    if (value != null) {
      result
        ..add('isFavorite')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rate;
    if (value != null) {
      result
        ..add('rate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.enable_trading;
    if (value != null) {
      result
        ..add('enable_trading')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.quote_currency;
    if (value != null) {
      result
        ..add('quote_currency')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GGetMarketData_market_quote_currency)));
    }
    value = object.base_currency;
    if (value != null) {
      result
        ..add('base_currency')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GGetMarketData_market_base_currency)));
    }
    value = object.change24;
    if (value != null) {
      result
        ..add('change24')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.trading_min_price;
    if (value != null) {
      result
        ..add('trading_min_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.trading_max_price;
    if (value != null) {
      result
        ..add('trading_max_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.trading_min_amount;
    if (value != null) {
      result
        ..add('trading_min_amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.trading_price_precision;
    if (value != null) {
      result
        ..add('trading_price_precision')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.trading_amount_precision;
    if (value != null) {
      result
        ..add('trading_amount_precision')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.trading_position;
    if (value != null) {
      result
        ..add('trading_position')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.marketDynamics;
    if (value != null) {
      result
        ..add('marketDynamics')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GGetMarketData_market_marketDynamics)));
    }
    return result;
  }

  @override
  GGetMarketData_market deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetMarketData_marketBuilder();

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
        case 'isFavorite':
          result.isFavorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'enable_trading':
          result.enable_trading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'quote_currency':
          result.quote_currency.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetMarketData_market_quote_currency))!
              as GGetMarketData_market_quote_currency);
          break;
        case 'base_currency':
          result.base_currency.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetMarketData_market_base_currency))!
              as GGetMarketData_market_base_currency);
          break;
        case 'change24':
          result.change24 = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'trading_min_price':
          result.trading_min_price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'trading_max_price':
          result.trading_max_price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'trading_min_amount':
          result.trading_min_amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'trading_price_precision':
          result.trading_price_precision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'trading_amount_precision':
          result.trading_amount_precision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'trading_position':
          result.trading_position = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'marketDynamics':
          result.marketDynamics.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetMarketData_market_marketDynamics))!
              as GGetMarketData_market_marketDynamics);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetMarketData_market_quote_currencySerializer
    implements StructuredSerializer<GGetMarketData_market_quote_currency> {
  @override
  final Iterable<Type> types = const [
    GGetMarketData_market_quote_currency,
    _$GGetMarketData_market_quote_currency
  ];
  @override
  final String wireName = 'GGetMarketData_market_quote_currency';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetMarketData_market_quote_currency object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.precision;
    if (value != null) {
      result
        ..add('precision')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.icon_url;
    if (value != null) {
      result
        ..add('icon_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userBalanceEnable;
    if (value != null) {
      result
        ..add('userBalanceEnable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GGetMarketData_market_quote_currency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetMarketData_market_quote_currencyBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'precision':
          result.precision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'icon_url':
          result.icon_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userBalanceEnable':
          result.userBalanceEnable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'enabled':
          result.enabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetMarketData_market_base_currencySerializer
    implements StructuredSerializer<GGetMarketData_market_base_currency> {
  @override
  final Iterable<Type> types = const [
    GGetMarketData_market_base_currency,
    _$GGetMarketData_market_base_currency
  ];
  @override
  final String wireName = 'GGetMarketData_market_base_currency';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetMarketData_market_base_currency object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.precision;
    if (value != null) {
      result
        ..add('precision')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.icon_url;
    if (value != null) {
      result
        ..add('icon_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userBalanceEnable;
    if (value != null) {
      result
        ..add('userBalanceEnable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GGetMarketData_market_base_currency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetMarketData_market_base_currencyBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'precision':
          result.precision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'icon_url':
          result.icon_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userBalanceEnable':
          result.userBalanceEnable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'enabled':
          result.enabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetMarketData_market_marketDynamicsSerializer
    implements StructuredSerializer<GGetMarketData_market_marketDynamics> {
  @override
  final Iterable<Type> types = const [
    GGetMarketData_market_marketDynamics,
    _$GGetMarketData_market_marketDynamics
  ];
  @override
  final String wireName = 'GGetMarketData_market_marketDynamics';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetMarketData_market_marketDynamics object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.marketId;
    if (value != null) {
      result
        ..add('marketId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.startPrice;
    if (value != null) {
      result
        ..add('startPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.amount24h;
    if (value != null) {
      result
        ..add('amount24h')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.lastPrice;
    if (value != null) {
      result
        ..add('lastPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.lowPrice;
    if (value != null) {
      result
        ..add('lowPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.highPrice;
    if (value != null) {
      result
        ..add('highPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GGetMarketData_market_marketDynamics deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetMarketData_market_marketDynamicsBuilder();

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
        case 'marketId':
          result.marketId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'startPrice':
          result.startPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'amount24h':
          result.amount24h = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'lastPrice':
          result.lastPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'lowPrice':
          result.lowPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'highPrice':
          result.highPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetMarketData extends GGetMarketData {
  @override
  final String G__typename;
  @override
  final GGetMarketData_market? market;

  factory _$GGetMarketData([void Function(GGetMarketDataBuilder)? updates]) =>
      (new GGetMarketDataBuilder()..update(updates))._build();

  _$GGetMarketData._({required this.G__typename, this.market}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetMarketData', 'G__typename');
  }

  @override
  GGetMarketData rebuild(void Function(GGetMarketDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetMarketDataBuilder toBuilder() =>
      new GGetMarketDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetMarketData &&
        G__typename == other.G__typename &&
        market == other.market;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, market.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetMarketData')
          ..add('G__typename', G__typename)
          ..add('market', market))
        .toString();
  }
}

class GGetMarketDataBuilder
    implements Builder<GGetMarketData, GGetMarketDataBuilder> {
  _$GGetMarketData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetMarketData_marketBuilder? _market;
  GGetMarketData_marketBuilder get market =>
      _$this._market ??= new GGetMarketData_marketBuilder();
  set market(GGetMarketData_marketBuilder? market) => _$this._market = market;

  GGetMarketDataBuilder() {
    GGetMarketData._initializeBuilder(this);
  }

  GGetMarketDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _market = $v.market?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetMarketData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetMarketData;
  }

  @override
  void update(void Function(GGetMarketDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetMarketData build() => _build();

  _$GGetMarketData _build() {
    _$GGetMarketData _$result;
    try {
      _$result = _$v ??
          new _$GGetMarketData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetMarketData', 'G__typename'),
              market: _market?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'market';
        _market?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetMarketData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetMarketData_market extends GGetMarketData_market {
  @override
  final String G__typename;
  @override
  final bool? isFavorite;
  @override
  final String? id;
  @override
  final double? rate;
  @override
  final bool? enable_trading;
  @override
  final GGetMarketData_market_quote_currency? quote_currency;
  @override
  final GGetMarketData_market_base_currency? base_currency;
  @override
  final double? change24;
  @override
  final double? trading_min_price;
  @override
  final double? trading_max_price;
  @override
  final double? trading_min_amount;
  @override
  final int? trading_price_precision;
  @override
  final int? trading_amount_precision;
  @override
  final int? trading_position;
  @override
  final GGetMarketData_market_marketDynamics? marketDynamics;

  factory _$GGetMarketData_market(
          [void Function(GGetMarketData_marketBuilder)? updates]) =>
      (new GGetMarketData_marketBuilder()..update(updates))._build();

  _$GGetMarketData_market._(
      {required this.G__typename,
      this.isFavorite,
      this.id,
      this.rate,
      this.enable_trading,
      this.quote_currency,
      this.base_currency,
      this.change24,
      this.trading_min_price,
      this.trading_max_price,
      this.trading_min_amount,
      this.trading_price_precision,
      this.trading_amount_precision,
      this.trading_position,
      this.marketDynamics})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetMarketData_market', 'G__typename');
  }

  @override
  GGetMarketData_market rebuild(
          void Function(GGetMarketData_marketBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetMarketData_marketBuilder toBuilder() =>
      new GGetMarketData_marketBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetMarketData_market &&
        G__typename == other.G__typename &&
        isFavorite == other.isFavorite &&
        id == other.id &&
        rate == other.rate &&
        enable_trading == other.enable_trading &&
        quote_currency == other.quote_currency &&
        base_currency == other.base_currency &&
        change24 == other.change24 &&
        trading_min_price == other.trading_min_price &&
        trading_max_price == other.trading_max_price &&
        trading_min_amount == other.trading_min_amount &&
        trading_price_precision == other.trading_price_precision &&
        trading_amount_precision == other.trading_amount_precision &&
        trading_position == other.trading_position &&
        marketDynamics == other.marketDynamics;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, isFavorite.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jc(_$hash, enable_trading.hashCode);
    _$hash = $jc(_$hash, quote_currency.hashCode);
    _$hash = $jc(_$hash, base_currency.hashCode);
    _$hash = $jc(_$hash, change24.hashCode);
    _$hash = $jc(_$hash, trading_min_price.hashCode);
    _$hash = $jc(_$hash, trading_max_price.hashCode);
    _$hash = $jc(_$hash, trading_min_amount.hashCode);
    _$hash = $jc(_$hash, trading_price_precision.hashCode);
    _$hash = $jc(_$hash, trading_amount_precision.hashCode);
    _$hash = $jc(_$hash, trading_position.hashCode);
    _$hash = $jc(_$hash, marketDynamics.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetMarketData_market')
          ..add('G__typename', G__typename)
          ..add('isFavorite', isFavorite)
          ..add('id', id)
          ..add('rate', rate)
          ..add('enable_trading', enable_trading)
          ..add('quote_currency', quote_currency)
          ..add('base_currency', base_currency)
          ..add('change24', change24)
          ..add('trading_min_price', trading_min_price)
          ..add('trading_max_price', trading_max_price)
          ..add('trading_min_amount', trading_min_amount)
          ..add('trading_price_precision', trading_price_precision)
          ..add('trading_amount_precision', trading_amount_precision)
          ..add('trading_position', trading_position)
          ..add('marketDynamics', marketDynamics))
        .toString();
  }
}

class GGetMarketData_marketBuilder
    implements Builder<GGetMarketData_market, GGetMarketData_marketBuilder> {
  _$GGetMarketData_market? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _isFavorite;
  bool? get isFavorite => _$this._isFavorite;
  set isFavorite(bool? isFavorite) => _$this._isFavorite = isFavorite;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  double? _rate;
  double? get rate => _$this._rate;
  set rate(double? rate) => _$this._rate = rate;

  bool? _enable_trading;
  bool? get enable_trading => _$this._enable_trading;
  set enable_trading(bool? enable_trading) =>
      _$this._enable_trading = enable_trading;

  GGetMarketData_market_quote_currencyBuilder? _quote_currency;
  GGetMarketData_market_quote_currencyBuilder get quote_currency =>
      _$this._quote_currency ??=
          new GGetMarketData_market_quote_currencyBuilder();
  set quote_currency(
          GGetMarketData_market_quote_currencyBuilder? quote_currency) =>
      _$this._quote_currency = quote_currency;

  GGetMarketData_market_base_currencyBuilder? _base_currency;
  GGetMarketData_market_base_currencyBuilder get base_currency =>
      _$this._base_currency ??=
          new GGetMarketData_market_base_currencyBuilder();
  set base_currency(
          GGetMarketData_market_base_currencyBuilder? base_currency) =>
      _$this._base_currency = base_currency;

  double? _change24;
  double? get change24 => _$this._change24;
  set change24(double? change24) => _$this._change24 = change24;

  double? _trading_min_price;
  double? get trading_min_price => _$this._trading_min_price;
  set trading_min_price(double? trading_min_price) =>
      _$this._trading_min_price = trading_min_price;

  double? _trading_max_price;
  double? get trading_max_price => _$this._trading_max_price;
  set trading_max_price(double? trading_max_price) =>
      _$this._trading_max_price = trading_max_price;

  double? _trading_min_amount;
  double? get trading_min_amount => _$this._trading_min_amount;
  set trading_min_amount(double? trading_min_amount) =>
      _$this._trading_min_amount = trading_min_amount;

  int? _trading_price_precision;
  int? get trading_price_precision => _$this._trading_price_precision;
  set trading_price_precision(int? trading_price_precision) =>
      _$this._trading_price_precision = trading_price_precision;

  int? _trading_amount_precision;
  int? get trading_amount_precision => _$this._trading_amount_precision;
  set trading_amount_precision(int? trading_amount_precision) =>
      _$this._trading_amount_precision = trading_amount_precision;

  int? _trading_position;
  int? get trading_position => _$this._trading_position;
  set trading_position(int? trading_position) =>
      _$this._trading_position = trading_position;

  GGetMarketData_market_marketDynamicsBuilder? _marketDynamics;
  GGetMarketData_market_marketDynamicsBuilder get marketDynamics =>
      _$this._marketDynamics ??=
          new GGetMarketData_market_marketDynamicsBuilder();
  set marketDynamics(
          GGetMarketData_market_marketDynamicsBuilder? marketDynamics) =>
      _$this._marketDynamics = marketDynamics;

  GGetMarketData_marketBuilder() {
    GGetMarketData_market._initializeBuilder(this);
  }

  GGetMarketData_marketBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _isFavorite = $v.isFavorite;
      _id = $v.id;
      _rate = $v.rate;
      _enable_trading = $v.enable_trading;
      _quote_currency = $v.quote_currency?.toBuilder();
      _base_currency = $v.base_currency?.toBuilder();
      _change24 = $v.change24;
      _trading_min_price = $v.trading_min_price;
      _trading_max_price = $v.trading_max_price;
      _trading_min_amount = $v.trading_min_amount;
      _trading_price_precision = $v.trading_price_precision;
      _trading_amount_precision = $v.trading_amount_precision;
      _trading_position = $v.trading_position;
      _marketDynamics = $v.marketDynamics?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetMarketData_market other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetMarketData_market;
  }

  @override
  void update(void Function(GGetMarketData_marketBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetMarketData_market build() => _build();

  _$GGetMarketData_market _build() {
    _$GGetMarketData_market _$result;
    try {
      _$result = _$v ??
          new _$GGetMarketData_market._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetMarketData_market', 'G__typename'),
              isFavorite: isFavorite,
              id: id,
              rate: rate,
              enable_trading: enable_trading,
              quote_currency: _quote_currency?.build(),
              base_currency: _base_currency?.build(),
              change24: change24,
              trading_min_price: trading_min_price,
              trading_max_price: trading_max_price,
              trading_min_amount: trading_min_amount,
              trading_price_precision: trading_price_precision,
              trading_amount_precision: trading_amount_precision,
              trading_position: trading_position,
              marketDynamics: _marketDynamics?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'quote_currency';
        _quote_currency?.build();
        _$failedField = 'base_currency';
        _base_currency?.build();

        _$failedField = 'marketDynamics';
        _marketDynamics?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetMarketData_market', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetMarketData_market_quote_currency
    extends GGetMarketData_market_quote_currency {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final int? precision;
  @override
  final String? icon_url;
  @override
  final String? name;
  @override
  final bool? userBalanceEnable;
  @override
  final bool? enabled;

  factory _$GGetMarketData_market_quote_currency(
          [void Function(GGetMarketData_market_quote_currencyBuilder)?
              updates]) =>
      (new GGetMarketData_market_quote_currencyBuilder()..update(updates))
          ._build();

  _$GGetMarketData_market_quote_currency._(
      {required this.G__typename,
      this.id,
      this.precision,
      this.icon_url,
      this.name,
      this.userBalanceEnable,
      this.enabled})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetMarketData_market_quote_currency', 'G__typename');
  }

  @override
  GGetMarketData_market_quote_currency rebuild(
          void Function(GGetMarketData_market_quote_currencyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetMarketData_market_quote_currencyBuilder toBuilder() =>
      new GGetMarketData_market_quote_currencyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetMarketData_market_quote_currency &&
        G__typename == other.G__typename &&
        id == other.id &&
        precision == other.precision &&
        icon_url == other.icon_url &&
        name == other.name &&
        userBalanceEnable == other.userBalanceEnable &&
        enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, precision.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, userBalanceEnable.hashCode);
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetMarketData_market_quote_currency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('precision', precision)
          ..add('icon_url', icon_url)
          ..add('name', name)
          ..add('userBalanceEnable', userBalanceEnable)
          ..add('enabled', enabled))
        .toString();
  }
}

class GGetMarketData_market_quote_currencyBuilder
    implements
        Builder<GGetMarketData_market_quote_currency,
            GGetMarketData_market_quote_currencyBuilder> {
  _$GGetMarketData_market_quote_currency? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _precision;
  int? get precision => _$this._precision;
  set precision(int? precision) => _$this._precision = precision;

  String? _icon_url;
  String? get icon_url => _$this._icon_url;
  set icon_url(String? icon_url) => _$this._icon_url = icon_url;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _userBalanceEnable;
  bool? get userBalanceEnable => _$this._userBalanceEnable;
  set userBalanceEnable(bool? userBalanceEnable) =>
      _$this._userBalanceEnable = userBalanceEnable;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  GGetMarketData_market_quote_currencyBuilder() {
    GGetMarketData_market_quote_currency._initializeBuilder(this);
  }

  GGetMarketData_market_quote_currencyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _precision = $v.precision;
      _icon_url = $v.icon_url;
      _name = $v.name;
      _userBalanceEnable = $v.userBalanceEnable;
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetMarketData_market_quote_currency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetMarketData_market_quote_currency;
  }

  @override
  void update(
      void Function(GGetMarketData_market_quote_currencyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetMarketData_market_quote_currency build() => _build();

  _$GGetMarketData_market_quote_currency _build() {
    final _$result = _$v ??
        new _$GGetMarketData_market_quote_currency._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetMarketData_market_quote_currency', 'G__typename'),
            id: id,
            precision: precision,
            icon_url: icon_url,
            name: name,
            userBalanceEnable: userBalanceEnable,
            enabled: enabled);
    replace(_$result);
    return _$result;
  }
}

class _$GGetMarketData_market_base_currency
    extends GGetMarketData_market_base_currency {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final int? precision;
  @override
  final String? icon_url;
  @override
  final String? name;
  @override
  final bool? userBalanceEnable;
  @override
  final bool? enabled;

  factory _$GGetMarketData_market_base_currency(
          [void Function(GGetMarketData_market_base_currencyBuilder)?
              updates]) =>
      (new GGetMarketData_market_base_currencyBuilder()..update(updates))
          ._build();

  _$GGetMarketData_market_base_currency._(
      {required this.G__typename,
      this.id,
      this.precision,
      this.icon_url,
      this.name,
      this.userBalanceEnable,
      this.enabled})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetMarketData_market_base_currency', 'G__typename');
  }

  @override
  GGetMarketData_market_base_currency rebuild(
          void Function(GGetMarketData_market_base_currencyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetMarketData_market_base_currencyBuilder toBuilder() =>
      new GGetMarketData_market_base_currencyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetMarketData_market_base_currency &&
        G__typename == other.G__typename &&
        id == other.id &&
        precision == other.precision &&
        icon_url == other.icon_url &&
        name == other.name &&
        userBalanceEnable == other.userBalanceEnable &&
        enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, precision.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, userBalanceEnable.hashCode);
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetMarketData_market_base_currency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('precision', precision)
          ..add('icon_url', icon_url)
          ..add('name', name)
          ..add('userBalanceEnable', userBalanceEnable)
          ..add('enabled', enabled))
        .toString();
  }
}

class GGetMarketData_market_base_currencyBuilder
    implements
        Builder<GGetMarketData_market_base_currency,
            GGetMarketData_market_base_currencyBuilder> {
  _$GGetMarketData_market_base_currency? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _precision;
  int? get precision => _$this._precision;
  set precision(int? precision) => _$this._precision = precision;

  String? _icon_url;
  String? get icon_url => _$this._icon_url;
  set icon_url(String? icon_url) => _$this._icon_url = icon_url;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _userBalanceEnable;
  bool? get userBalanceEnable => _$this._userBalanceEnable;
  set userBalanceEnable(bool? userBalanceEnable) =>
      _$this._userBalanceEnable = userBalanceEnable;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  GGetMarketData_market_base_currencyBuilder() {
    GGetMarketData_market_base_currency._initializeBuilder(this);
  }

  GGetMarketData_market_base_currencyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _precision = $v.precision;
      _icon_url = $v.icon_url;
      _name = $v.name;
      _userBalanceEnable = $v.userBalanceEnable;
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetMarketData_market_base_currency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetMarketData_market_base_currency;
  }

  @override
  void update(
      void Function(GGetMarketData_market_base_currencyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetMarketData_market_base_currency build() => _build();

  _$GGetMarketData_market_base_currency _build() {
    final _$result = _$v ??
        new _$GGetMarketData_market_base_currency._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetMarketData_market_base_currency', 'G__typename'),
            id: id,
            precision: precision,
            icon_url: icon_url,
            name: name,
            userBalanceEnable: userBalanceEnable,
            enabled: enabled);
    replace(_$result);
    return _$result;
  }
}

class _$GGetMarketData_market_marketDynamics
    extends GGetMarketData_market_marketDynamics {
  @override
  final String G__typename;
  @override
  final String? marketId;
  @override
  final double? startPrice;
  @override
  final double? amount24h;
  @override
  final double? lastPrice;
  @override
  final double? lowPrice;
  @override
  final double? highPrice;

  factory _$GGetMarketData_market_marketDynamics(
          [void Function(GGetMarketData_market_marketDynamicsBuilder)?
              updates]) =>
      (new GGetMarketData_market_marketDynamicsBuilder()..update(updates))
          ._build();

  _$GGetMarketData_market_marketDynamics._(
      {required this.G__typename,
      this.marketId,
      this.startPrice,
      this.amount24h,
      this.lastPrice,
      this.lowPrice,
      this.highPrice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetMarketData_market_marketDynamics', 'G__typename');
  }

  @override
  GGetMarketData_market_marketDynamics rebuild(
          void Function(GGetMarketData_market_marketDynamicsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetMarketData_market_marketDynamicsBuilder toBuilder() =>
      new GGetMarketData_market_marketDynamicsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetMarketData_market_marketDynamics &&
        G__typename == other.G__typename &&
        marketId == other.marketId &&
        startPrice == other.startPrice &&
        amount24h == other.amount24h &&
        lastPrice == other.lastPrice &&
        lowPrice == other.lowPrice &&
        highPrice == other.highPrice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, marketId.hashCode);
    _$hash = $jc(_$hash, startPrice.hashCode);
    _$hash = $jc(_$hash, amount24h.hashCode);
    _$hash = $jc(_$hash, lastPrice.hashCode);
    _$hash = $jc(_$hash, lowPrice.hashCode);
    _$hash = $jc(_$hash, highPrice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetMarketData_market_marketDynamics')
          ..add('G__typename', G__typename)
          ..add('marketId', marketId)
          ..add('startPrice', startPrice)
          ..add('amount24h', amount24h)
          ..add('lastPrice', lastPrice)
          ..add('lowPrice', lowPrice)
          ..add('highPrice', highPrice))
        .toString();
  }
}

class GGetMarketData_market_marketDynamicsBuilder
    implements
        Builder<GGetMarketData_market_marketDynamics,
            GGetMarketData_market_marketDynamicsBuilder> {
  _$GGetMarketData_market_marketDynamics? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _marketId;
  String? get marketId => _$this._marketId;
  set marketId(String? marketId) => _$this._marketId = marketId;

  double? _startPrice;
  double? get startPrice => _$this._startPrice;
  set startPrice(double? startPrice) => _$this._startPrice = startPrice;

  double? _amount24h;
  double? get amount24h => _$this._amount24h;
  set amount24h(double? amount24h) => _$this._amount24h = amount24h;

  double? _lastPrice;
  double? get lastPrice => _$this._lastPrice;
  set lastPrice(double? lastPrice) => _$this._lastPrice = lastPrice;

  double? _lowPrice;
  double? get lowPrice => _$this._lowPrice;
  set lowPrice(double? lowPrice) => _$this._lowPrice = lowPrice;

  double? _highPrice;
  double? get highPrice => _$this._highPrice;
  set highPrice(double? highPrice) => _$this._highPrice = highPrice;

  GGetMarketData_market_marketDynamicsBuilder() {
    GGetMarketData_market_marketDynamics._initializeBuilder(this);
  }

  GGetMarketData_market_marketDynamicsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _marketId = $v.marketId;
      _startPrice = $v.startPrice;
      _amount24h = $v.amount24h;
      _lastPrice = $v.lastPrice;
      _lowPrice = $v.lowPrice;
      _highPrice = $v.highPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetMarketData_market_marketDynamics other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetMarketData_market_marketDynamics;
  }

  @override
  void update(
      void Function(GGetMarketData_market_marketDynamicsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetMarketData_market_marketDynamics build() => _build();

  _$GGetMarketData_market_marketDynamics _build() {
    final _$result = _$v ??
        new _$GGetMarketData_market_marketDynamics._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetMarketData_market_marketDynamics', 'G__typename'),
            marketId: marketId,
            startPrice: startPrice,
            amount24h: amount24h,
            lastPrice: lastPrice,
            lowPrice: lowPrice,
            highPrice: highPrice);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
