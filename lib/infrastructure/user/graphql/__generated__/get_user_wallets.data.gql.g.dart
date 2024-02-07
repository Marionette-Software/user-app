// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_wallets.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUserWalletsData> _$gGetUserWalletsDataSerializer =
    new _$GGetUserWalletsDataSerializer();
Serializer<GGetUserWalletsData_user> _$gGetUserWalletsDataUserSerializer =
    new _$GGetUserWalletsData_userSerializer();
Serializer<GGetUserWalletsData_user_currencies>
    _$gGetUserWalletsDataUserCurrenciesSerializer =
    new _$GGetUserWalletsData_user_currenciesSerializer();
Serializer<GGetUserWalletsData_user_currencies_markets>
    _$gGetUserWalletsDataUserCurrenciesMarketsSerializer =
    new _$GGetUserWalletsData_user_currencies_marketsSerializer();
Serializer<GGetUserWalletsData_user_currencies_markets_marketDynamics>
    _$gGetUserWalletsDataUserCurrenciesMarketsMarketDynamicsSerializer =
    new _$GGetUserWalletsData_user_currencies_markets_marketDynamicsSerializer();
Serializer<GGetUserWalletsData_user_currencies_markets_base_currency>
    _$gGetUserWalletsDataUserCurrenciesMarketsBaseCurrencySerializer =
    new _$GGetUserWalletsData_user_currencies_markets_base_currencySerializer();
Serializer<GGetUserWalletsData_user_currencies_markets_quote_currency>
    _$gGetUserWalletsDataUserCurrenciesMarketsQuoteCurrencySerializer =
    new _$GGetUserWalletsData_user_currencies_markets_quote_currencySerializer();

class _$GGetUserWalletsDataSerializer
    implements StructuredSerializer<GGetUserWalletsData> {
  @override
  final Iterable<Type> types = const [
    GGetUserWalletsData,
    _$GGetUserWalletsData
  ];
  @override
  final String wireName = 'GGetUserWalletsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserWalletsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetUserWalletsData_user)));
    }
    return result;
  }

  @override
  GGetUserWalletsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserWalletsDataBuilder();

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
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GGetUserWalletsData_user))!
              as GGetUserWalletsData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserWalletsData_userSerializer
    implements StructuredSerializer<GGetUserWalletsData_user> {
  @override
  final Iterable<Type> types = const [
    GGetUserWalletsData_user,
    _$GGetUserWalletsData_user
  ];
  @override
  final String wireName = 'GGetUserWalletsData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserWalletsData_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.currencies;
    if (value != null) {
      result
        ..add('currencies')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GGetUserWalletsData_user_currencies)
            ])));
    }
    return result;
  }

  @override
  GGetUserWalletsData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserWalletsData_userBuilder();

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
        case 'currencies':
          result.currencies.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GGetUserWalletsData_user_currencies)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserWalletsData_user_currenciesSerializer
    implements StructuredSerializer<GGetUserWalletsData_user_currencies> {
  @override
  final Iterable<Type> types = const [
    GGetUserWalletsData_user_currencies,
    _$GGetUserWalletsData_user_currencies
  ];
  @override
  final String wireName = 'GGetUserWalletsData_user_currencies';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserWalletsData_user_currencies object,
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
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.icon_url;
    if (value != null) {
      result
        ..add('icon_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.position;
    if (value != null) {
      result
        ..add('position')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.precision;
    if (value != null) {
      result
        ..add('precision')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.lightBgColor1;
    if (value != null) {
      result
        ..add('lightBgColor1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lightBgColor2;
    if (value != null) {
      result
        ..add('lightBgColor2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.darkBgColor1;
    if (value != null) {
      result
        ..add('darkBgColor1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.darkBgColor2;
    if (value != null) {
      result
        ..add('darkBgColor2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lightTextColor;
    if (value != null) {
      result
        ..add('lightTextColor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.staking_enabled;
    if (value != null) {
      result
        ..add('staking_enabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isUnstakingProcess;
    if (value != null) {
      result
        ..add('isUnstakingProcess')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isFavorite;
    if (value != null) {
      result
        ..add('isFavorite')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.markets;
    if (value != null) {
      result
        ..add('markets')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GGetUserWalletsData_user_currencies_markets)
            ])));
    }
    return result;
  }

  @override
  GGetUserWalletsData_user_currencies deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserWalletsData_user_currenciesBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'icon_url':
          result.icon_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'position':
          result.position = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'precision':
          result.precision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'enabled':
          result.enabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'lightBgColor1':
          result.lightBgColor1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lightBgColor2':
          result.lightBgColor2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'darkBgColor1':
          result.darkBgColor1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'darkBgColor2':
          result.darkBgColor2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lightTextColor':
          result.lightTextColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'staking_enabled':
          result.staking_enabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isUnstakingProcess':
          result.isUnstakingProcess = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isFavorite':
          result.isFavorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'markets':
          result.markets.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GGetUserWalletsData_user_currencies_markets)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserWalletsData_user_currencies_marketsSerializer
    implements
        StructuredSerializer<GGetUserWalletsData_user_currencies_markets> {
  @override
  final Iterable<Type> types = const [
    GGetUserWalletsData_user_currencies_markets,
    _$GGetUserWalletsData_user_currencies_markets
  ];
  @override
  final String wireName = 'GGetUserWalletsData_user_currencies_markets';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetUserWalletsData_user_currencies_markets object,
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
    value = object.isFavorite;
    if (value != null) {
      result
        ..add('isFavorite')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.marketDynamics;
    if (value != null) {
      result
        ..add('marketDynamics')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetUserWalletsData_user_currencies_markets_marketDynamics)));
    }
    value = object.base_currency;
    if (value != null) {
      result
        ..add('base_currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetUserWalletsData_user_currencies_markets_base_currency)));
    }
    value = object.quote_currency;
    if (value != null) {
      result
        ..add('quote_currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetUserWalletsData_user_currencies_markets_quote_currency)));
    }
    value = object.rate;
    if (value != null) {
      result
        ..add('rate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minBaseCurrencyAmount;
    if (value != null) {
      result
        ..add('minBaseCurrencyAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minQuoteCurrencyAmount;
    if (value != null) {
      result
        ..add('minQuoteCurrencyAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.commission_currency;
    if (value != null) {
      result
        ..add('commission_currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.buy_commission;
    if (value != null) {
      result
        ..add('buy_commission')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.buy_min_commission;
    if (value != null) {
      result
        ..add('buy_min_commission')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.buy_max_commission;
    if (value != null) {
      result
        ..add('buy_max_commission')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.sell_commission;
    if (value != null) {
      result
        ..add('sell_commission')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.sell_min_commission;
    if (value != null) {
      result
        ..add('sell_min_commission')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.sell_max_commission;
    if (value != null) {
      result
        ..add('sell_max_commission')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.enable_custodial_exchange;
    if (value != null) {
      result
        ..add('enable_custodial_exchange')
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
    value = object.swapBaseToQuotePricePrecision;
    if (value != null) {
      result
        ..add('swapBaseToQuotePricePrecision')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.swapQuoteToBasePricePrecision;
    if (value != null) {
      result
        ..add('swapQuoteToBasePricePrecision')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.enable_trading;
    if (value != null) {
      result
        ..add('enable_trading')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
    return result;
  }

  @override
  GGetUserWalletsData_user_currencies_markets deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserWalletsData_user_currencies_marketsBuilder();

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
        case 'isFavorite':
          result.isFavorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'marketDynamics':
          result.marketDynamics.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetUserWalletsData_user_currencies_markets_marketDynamics))!
              as GGetUserWalletsData_user_currencies_markets_marketDynamics);
          break;
        case 'base_currency':
          result.base_currency.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetUserWalletsData_user_currencies_markets_base_currency))!
              as GGetUserWalletsData_user_currencies_markets_base_currency);
          break;
        case 'quote_currency':
          result.quote_currency.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetUserWalletsData_user_currencies_markets_quote_currency))!
              as GGetUserWalletsData_user_currencies_markets_quote_currency);
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minBaseCurrencyAmount':
          result.minBaseCurrencyAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minQuoteCurrencyAmount':
          result.minQuoteCurrencyAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'commission_currency':
          result.commission_currency = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'buy_commission':
          result.buy_commission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'buy_min_commission':
          result.buy_min_commission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'buy_max_commission':
          result.buy_max_commission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'sell_commission':
          result.sell_commission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'sell_min_commission':
          result.sell_min_commission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'sell_max_commission':
          result.sell_max_commission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'enable_custodial_exchange':
          result.enable_custodial_exchange = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'enabled':
          result.enabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'swapBaseToQuotePricePrecision':
          result.swapBaseToQuotePricePrecision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'swapQuoteToBasePricePrecision':
          result.swapQuoteToBasePricePrecision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'enable_trading':
          result.enable_trading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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
      }
    }

    return result.build();
  }
}

class _$GGetUserWalletsData_user_currencies_markets_marketDynamicsSerializer
    implements
        StructuredSerializer<
            GGetUserWalletsData_user_currencies_markets_marketDynamics> {
  @override
  final Iterable<Type> types = const [
    GGetUserWalletsData_user_currencies_markets_marketDynamics,
    _$GGetUserWalletsData_user_currencies_markets_marketDynamics
  ];
  @override
  final String wireName =
      'GGetUserWalletsData_user_currencies_markets_marketDynamics';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetUserWalletsData_user_currencies_markets_marketDynamics object,
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
  GGetUserWalletsData_user_currencies_markets_marketDynamics deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder();

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

class _$GGetUserWalletsData_user_currencies_markets_base_currencySerializer
    implements
        StructuredSerializer<
            GGetUserWalletsData_user_currencies_markets_base_currency> {
  @override
  final Iterable<Type> types = const [
    GGetUserWalletsData_user_currencies_markets_base_currency,
    _$GGetUserWalletsData_user_currencies_markets_base_currency
  ];
  @override
  final String wireName =
      'GGetUserWalletsData_user_currencies_markets_base_currency';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetUserWalletsData_user_currencies_markets_base_currency object,
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
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.icon_url;
    if (value != null) {
      result
        ..add('icon_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.precision;
    if (value != null) {
      result
        ..add('precision')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  GGetUserWalletsData_user_currencies_markets_base_currency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetUserWalletsData_user_currencies_markets_base_currencyBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'icon_url':
          result.icon_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'precision':
          result.precision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$GGetUserWalletsData_user_currencies_markets_quote_currencySerializer
    implements
        StructuredSerializer<
            GGetUserWalletsData_user_currencies_markets_quote_currency> {
  @override
  final Iterable<Type> types = const [
    GGetUserWalletsData_user_currencies_markets_quote_currency,
    _$GGetUserWalletsData_user_currencies_markets_quote_currency
  ];
  @override
  final String wireName =
      'GGetUserWalletsData_user_currencies_markets_quote_currency';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetUserWalletsData_user_currencies_markets_quote_currency object,
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
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.icon_url;
    if (value != null) {
      result
        ..add('icon_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.precision;
    if (value != null) {
      result
        ..add('precision')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  GGetUserWalletsData_user_currencies_markets_quote_currency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'icon_url':
          result.icon_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'precision':
          result.precision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$GGetUserWalletsData extends GGetUserWalletsData {
  @override
  final String G__typename;
  @override
  final GGetUserWalletsData_user? user;

  factory _$GGetUserWalletsData(
          [void Function(GGetUserWalletsDataBuilder)? updates]) =>
      (new GGetUserWalletsDataBuilder()..update(updates))._build();

  _$GGetUserWalletsData._({required this.G__typename, this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUserWalletsData', 'G__typename');
  }

  @override
  GGetUserWalletsData rebuild(
          void Function(GGetUserWalletsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserWalletsDataBuilder toBuilder() =>
      new GGetUserWalletsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserWalletsData &&
        G__typename == other.G__typename &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserWalletsData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GGetUserWalletsDataBuilder
    implements Builder<GGetUserWalletsData, GGetUserWalletsDataBuilder> {
  _$GGetUserWalletsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetUserWalletsData_userBuilder? _user;
  GGetUserWalletsData_userBuilder get user =>
      _$this._user ??= new GGetUserWalletsData_userBuilder();
  set user(GGetUserWalletsData_userBuilder? user) => _$this._user = user;

  GGetUserWalletsDataBuilder() {
    GGetUserWalletsData._initializeBuilder(this);
  }

  GGetUserWalletsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserWalletsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserWalletsData;
  }

  @override
  void update(void Function(GGetUserWalletsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserWalletsData build() => _build();

  _$GGetUserWalletsData _build() {
    _$GGetUserWalletsData _$result;
    try {
      _$result = _$v ??
          new _$GGetUserWalletsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetUserWalletsData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUserWalletsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserWalletsData_user extends GGetUserWalletsData_user {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetUserWalletsData_user_currencies?>? currencies;

  factory _$GGetUserWalletsData_user(
          [void Function(GGetUserWalletsData_userBuilder)? updates]) =>
      (new GGetUserWalletsData_userBuilder()..update(updates))._build();

  _$GGetUserWalletsData_user._({required this.G__typename, this.currencies})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUserWalletsData_user', 'G__typename');
  }

  @override
  GGetUserWalletsData_user rebuild(
          void Function(GGetUserWalletsData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserWalletsData_userBuilder toBuilder() =>
      new GGetUserWalletsData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserWalletsData_user &&
        G__typename == other.G__typename &&
        currencies == other.currencies;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, currencies.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserWalletsData_user')
          ..add('G__typename', G__typename)
          ..add('currencies', currencies))
        .toString();
  }
}

class GGetUserWalletsData_userBuilder
    implements
        Builder<GGetUserWalletsData_user, GGetUserWalletsData_userBuilder> {
  _$GGetUserWalletsData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetUserWalletsData_user_currencies?>? _currencies;
  ListBuilder<GGetUserWalletsData_user_currencies?> get currencies =>
      _$this._currencies ??=
          new ListBuilder<GGetUserWalletsData_user_currencies?>();
  set currencies(
          ListBuilder<GGetUserWalletsData_user_currencies?>? currencies) =>
      _$this._currencies = currencies;

  GGetUserWalletsData_userBuilder() {
    GGetUserWalletsData_user._initializeBuilder(this);
  }

  GGetUserWalletsData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _currencies = $v.currencies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserWalletsData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserWalletsData_user;
  }

  @override
  void update(void Function(GGetUserWalletsData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserWalletsData_user build() => _build();

  _$GGetUserWalletsData_user _build() {
    _$GGetUserWalletsData_user _$result;
    try {
      _$result = _$v ??
          new _$GGetUserWalletsData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetUserWalletsData_user', 'G__typename'),
              currencies: _currencies?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currencies';
        _currencies?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUserWalletsData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserWalletsData_user_currencies
    extends GGetUserWalletsData_user_currencies {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? icon_url;
  @override
  final int? position;
  @override
  final int? precision;
  @override
  final bool? enabled;
  @override
  final String? lightBgColor1;
  @override
  final String? lightBgColor2;
  @override
  final String? darkBgColor1;
  @override
  final String? darkBgColor2;
  @override
  final String? lightTextColor;
  @override
  final bool? staking_enabled;
  @override
  final bool? isUnstakingProcess;
  @override
  final bool? isFavorite;
  @override
  final BuiltList<GGetUserWalletsData_user_currencies_markets?>? markets;

  factory _$GGetUserWalletsData_user_currencies(
          [void Function(GGetUserWalletsData_user_currenciesBuilder)?
              updates]) =>
      (new GGetUserWalletsData_user_currenciesBuilder()..update(updates))
          ._build();

  _$GGetUserWalletsData_user_currencies._(
      {required this.G__typename,
      this.id,
      this.name,
      this.icon_url,
      this.position,
      this.precision,
      this.enabled,
      this.lightBgColor1,
      this.lightBgColor2,
      this.darkBgColor1,
      this.darkBgColor2,
      this.lightTextColor,
      this.staking_enabled,
      this.isUnstakingProcess,
      this.isFavorite,
      this.markets})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUserWalletsData_user_currencies', 'G__typename');
  }

  @override
  GGetUserWalletsData_user_currencies rebuild(
          void Function(GGetUserWalletsData_user_currenciesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserWalletsData_user_currenciesBuilder toBuilder() =>
      new GGetUserWalletsData_user_currenciesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserWalletsData_user_currencies &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        icon_url == other.icon_url &&
        position == other.position &&
        precision == other.precision &&
        enabled == other.enabled &&
        lightBgColor1 == other.lightBgColor1 &&
        lightBgColor2 == other.lightBgColor2 &&
        darkBgColor1 == other.darkBgColor1 &&
        darkBgColor2 == other.darkBgColor2 &&
        lightTextColor == other.lightTextColor &&
        staking_enabled == other.staking_enabled &&
        isUnstakingProcess == other.isUnstakingProcess &&
        isFavorite == other.isFavorite &&
        markets == other.markets;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, precision.hashCode);
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, lightBgColor1.hashCode);
    _$hash = $jc(_$hash, lightBgColor2.hashCode);
    _$hash = $jc(_$hash, darkBgColor1.hashCode);
    _$hash = $jc(_$hash, darkBgColor2.hashCode);
    _$hash = $jc(_$hash, lightTextColor.hashCode);
    _$hash = $jc(_$hash, staking_enabled.hashCode);
    _$hash = $jc(_$hash, isUnstakingProcess.hashCode);
    _$hash = $jc(_$hash, isFavorite.hashCode);
    _$hash = $jc(_$hash, markets.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserWalletsData_user_currencies')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('icon_url', icon_url)
          ..add('position', position)
          ..add('precision', precision)
          ..add('enabled', enabled)
          ..add('lightBgColor1', lightBgColor1)
          ..add('lightBgColor2', lightBgColor2)
          ..add('darkBgColor1', darkBgColor1)
          ..add('darkBgColor2', darkBgColor2)
          ..add('lightTextColor', lightTextColor)
          ..add('staking_enabled', staking_enabled)
          ..add('isUnstakingProcess', isUnstakingProcess)
          ..add('isFavorite', isFavorite)
          ..add('markets', markets))
        .toString();
  }
}

class GGetUserWalletsData_user_currenciesBuilder
    implements
        Builder<GGetUserWalletsData_user_currencies,
            GGetUserWalletsData_user_currenciesBuilder> {
  _$GGetUserWalletsData_user_currencies? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _icon_url;
  String? get icon_url => _$this._icon_url;
  set icon_url(String? icon_url) => _$this._icon_url = icon_url;

  int? _position;
  int? get position => _$this._position;
  set position(int? position) => _$this._position = position;

  int? _precision;
  int? get precision => _$this._precision;
  set precision(int? precision) => _$this._precision = precision;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  String? _lightBgColor1;
  String? get lightBgColor1 => _$this._lightBgColor1;
  set lightBgColor1(String? lightBgColor1) =>
      _$this._lightBgColor1 = lightBgColor1;

  String? _lightBgColor2;
  String? get lightBgColor2 => _$this._lightBgColor2;
  set lightBgColor2(String? lightBgColor2) =>
      _$this._lightBgColor2 = lightBgColor2;

  String? _darkBgColor1;
  String? get darkBgColor1 => _$this._darkBgColor1;
  set darkBgColor1(String? darkBgColor1) => _$this._darkBgColor1 = darkBgColor1;

  String? _darkBgColor2;
  String? get darkBgColor2 => _$this._darkBgColor2;
  set darkBgColor2(String? darkBgColor2) => _$this._darkBgColor2 = darkBgColor2;

  String? _lightTextColor;
  String? get lightTextColor => _$this._lightTextColor;
  set lightTextColor(String? lightTextColor) =>
      _$this._lightTextColor = lightTextColor;

  bool? _staking_enabled;
  bool? get staking_enabled => _$this._staking_enabled;
  set staking_enabled(bool? staking_enabled) =>
      _$this._staking_enabled = staking_enabled;

  bool? _isUnstakingProcess;
  bool? get isUnstakingProcess => _$this._isUnstakingProcess;
  set isUnstakingProcess(bool? isUnstakingProcess) =>
      _$this._isUnstakingProcess = isUnstakingProcess;

  bool? _isFavorite;
  bool? get isFavorite => _$this._isFavorite;
  set isFavorite(bool? isFavorite) => _$this._isFavorite = isFavorite;

  ListBuilder<GGetUserWalletsData_user_currencies_markets?>? _markets;
  ListBuilder<GGetUserWalletsData_user_currencies_markets?> get markets =>
      _$this._markets ??=
          new ListBuilder<GGetUserWalletsData_user_currencies_markets?>();
  set markets(
          ListBuilder<GGetUserWalletsData_user_currencies_markets?>? markets) =>
      _$this._markets = markets;

  GGetUserWalletsData_user_currenciesBuilder() {
    GGetUserWalletsData_user_currencies._initializeBuilder(this);
  }

  GGetUserWalletsData_user_currenciesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _icon_url = $v.icon_url;
      _position = $v.position;
      _precision = $v.precision;
      _enabled = $v.enabled;
      _lightBgColor1 = $v.lightBgColor1;
      _lightBgColor2 = $v.lightBgColor2;
      _darkBgColor1 = $v.darkBgColor1;
      _darkBgColor2 = $v.darkBgColor2;
      _lightTextColor = $v.lightTextColor;
      _staking_enabled = $v.staking_enabled;
      _isUnstakingProcess = $v.isUnstakingProcess;
      _isFavorite = $v.isFavorite;
      _markets = $v.markets?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserWalletsData_user_currencies other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserWalletsData_user_currencies;
  }

  @override
  void update(
      void Function(GGetUserWalletsData_user_currenciesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserWalletsData_user_currencies build() => _build();

  _$GGetUserWalletsData_user_currencies _build() {
    _$GGetUserWalletsData_user_currencies _$result;
    try {
      _$result = _$v ??
          new _$GGetUserWalletsData_user_currencies._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetUserWalletsData_user_currencies', 'G__typename'),
              id: id,
              name: name,
              icon_url: icon_url,
              position: position,
              precision: precision,
              enabled: enabled,
              lightBgColor1: lightBgColor1,
              lightBgColor2: lightBgColor2,
              darkBgColor1: darkBgColor1,
              darkBgColor2: darkBgColor2,
              lightTextColor: lightTextColor,
              staking_enabled: staking_enabled,
              isUnstakingProcess: isUnstakingProcess,
              isFavorite: isFavorite,
              markets: _markets?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'markets';
        _markets?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUserWalletsData_user_currencies',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserWalletsData_user_currencies_markets
    extends GGetUserWalletsData_user_currencies_markets {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final bool? isFavorite;
  @override
  final GGetUserWalletsData_user_currencies_markets_marketDynamics?
      marketDynamics;
  @override
  final GGetUserWalletsData_user_currencies_markets_base_currency?
      base_currency;
  @override
  final GGetUserWalletsData_user_currencies_markets_quote_currency?
      quote_currency;
  @override
  final double? rate;
  @override
  final double? minBaseCurrencyAmount;
  @override
  final double? minQuoteCurrencyAmount;
  @override
  final String? commission_currency;
  @override
  final double? buy_commission;
  @override
  final double? buy_min_commission;
  @override
  final double? buy_max_commission;
  @override
  final double? sell_commission;
  @override
  final double? sell_min_commission;
  @override
  final double? sell_max_commission;
  @override
  final bool? enable_custodial_exchange;
  @override
  final bool? enabled;
  @override
  final int? swapBaseToQuotePricePrecision;
  @override
  final int? swapQuoteToBasePricePrecision;
  @override
  final bool? enable_trading;
  @override
  final double? trading_min_amount;
  @override
  final int? trading_price_precision;
  @override
  final int? trading_amount_precision;

  factory _$GGetUserWalletsData_user_currencies_markets(
          [void Function(GGetUserWalletsData_user_currencies_marketsBuilder)?
              updates]) =>
      (new GGetUserWalletsData_user_currencies_marketsBuilder()
            ..update(updates))
          ._build();

  _$GGetUserWalletsData_user_currencies_markets._(
      {required this.G__typename,
      this.id,
      this.isFavorite,
      this.marketDynamics,
      this.base_currency,
      this.quote_currency,
      this.rate,
      this.minBaseCurrencyAmount,
      this.minQuoteCurrencyAmount,
      this.commission_currency,
      this.buy_commission,
      this.buy_min_commission,
      this.buy_max_commission,
      this.sell_commission,
      this.sell_min_commission,
      this.sell_max_commission,
      this.enable_custodial_exchange,
      this.enabled,
      this.swapBaseToQuotePricePrecision,
      this.swapQuoteToBasePricePrecision,
      this.enable_trading,
      this.trading_min_amount,
      this.trading_price_precision,
      this.trading_amount_precision})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetUserWalletsData_user_currencies_markets', 'G__typename');
  }

  @override
  GGetUserWalletsData_user_currencies_markets rebuild(
          void Function(GGetUserWalletsData_user_currencies_marketsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserWalletsData_user_currencies_marketsBuilder toBuilder() =>
      new GGetUserWalletsData_user_currencies_marketsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserWalletsData_user_currencies_markets &&
        G__typename == other.G__typename &&
        id == other.id &&
        isFavorite == other.isFavorite &&
        marketDynamics == other.marketDynamics &&
        base_currency == other.base_currency &&
        quote_currency == other.quote_currency &&
        rate == other.rate &&
        minBaseCurrencyAmount == other.minBaseCurrencyAmount &&
        minQuoteCurrencyAmount == other.minQuoteCurrencyAmount &&
        commission_currency == other.commission_currency &&
        buy_commission == other.buy_commission &&
        buy_min_commission == other.buy_min_commission &&
        buy_max_commission == other.buy_max_commission &&
        sell_commission == other.sell_commission &&
        sell_min_commission == other.sell_min_commission &&
        sell_max_commission == other.sell_max_commission &&
        enable_custodial_exchange == other.enable_custodial_exchange &&
        enabled == other.enabled &&
        swapBaseToQuotePricePrecision == other.swapBaseToQuotePricePrecision &&
        swapQuoteToBasePricePrecision == other.swapQuoteToBasePricePrecision &&
        enable_trading == other.enable_trading &&
        trading_min_amount == other.trading_min_amount &&
        trading_price_precision == other.trading_price_precision &&
        trading_amount_precision == other.trading_amount_precision;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isFavorite.hashCode);
    _$hash = $jc(_$hash, marketDynamics.hashCode);
    _$hash = $jc(_$hash, base_currency.hashCode);
    _$hash = $jc(_$hash, quote_currency.hashCode);
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jc(_$hash, minBaseCurrencyAmount.hashCode);
    _$hash = $jc(_$hash, minQuoteCurrencyAmount.hashCode);
    _$hash = $jc(_$hash, commission_currency.hashCode);
    _$hash = $jc(_$hash, buy_commission.hashCode);
    _$hash = $jc(_$hash, buy_min_commission.hashCode);
    _$hash = $jc(_$hash, buy_max_commission.hashCode);
    _$hash = $jc(_$hash, sell_commission.hashCode);
    _$hash = $jc(_$hash, sell_min_commission.hashCode);
    _$hash = $jc(_$hash, sell_max_commission.hashCode);
    _$hash = $jc(_$hash, enable_custodial_exchange.hashCode);
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, swapBaseToQuotePricePrecision.hashCode);
    _$hash = $jc(_$hash, swapQuoteToBasePricePrecision.hashCode);
    _$hash = $jc(_$hash, enable_trading.hashCode);
    _$hash = $jc(_$hash, trading_min_amount.hashCode);
    _$hash = $jc(_$hash, trading_price_precision.hashCode);
    _$hash = $jc(_$hash, trading_amount_precision.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetUserWalletsData_user_currencies_markets')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isFavorite', isFavorite)
          ..add('marketDynamics', marketDynamics)
          ..add('base_currency', base_currency)
          ..add('quote_currency', quote_currency)
          ..add('rate', rate)
          ..add('minBaseCurrencyAmount', minBaseCurrencyAmount)
          ..add('minQuoteCurrencyAmount', minQuoteCurrencyAmount)
          ..add('commission_currency', commission_currency)
          ..add('buy_commission', buy_commission)
          ..add('buy_min_commission', buy_min_commission)
          ..add('buy_max_commission', buy_max_commission)
          ..add('sell_commission', sell_commission)
          ..add('sell_min_commission', sell_min_commission)
          ..add('sell_max_commission', sell_max_commission)
          ..add('enable_custodial_exchange', enable_custodial_exchange)
          ..add('enabled', enabled)
          ..add('swapBaseToQuotePricePrecision', swapBaseToQuotePricePrecision)
          ..add('swapQuoteToBasePricePrecision', swapQuoteToBasePricePrecision)
          ..add('enable_trading', enable_trading)
          ..add('trading_min_amount', trading_min_amount)
          ..add('trading_price_precision', trading_price_precision)
          ..add('trading_amount_precision', trading_amount_precision))
        .toString();
  }
}

class GGetUserWalletsData_user_currencies_marketsBuilder
    implements
        Builder<GGetUserWalletsData_user_currencies_markets,
            GGetUserWalletsData_user_currencies_marketsBuilder> {
  _$GGetUserWalletsData_user_currencies_markets? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _isFavorite;
  bool? get isFavorite => _$this._isFavorite;
  set isFavorite(bool? isFavorite) => _$this._isFavorite = isFavorite;

  GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder?
      _marketDynamics;
  GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder
      get marketDynamics => _$this._marketDynamics ??=
          new GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder();
  set marketDynamics(
          GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder?
              marketDynamics) =>
      _$this._marketDynamics = marketDynamics;

  GGetUserWalletsData_user_currencies_markets_base_currencyBuilder?
      _base_currency;
  GGetUserWalletsData_user_currencies_markets_base_currencyBuilder
      get base_currency => _$this._base_currency ??=
          new GGetUserWalletsData_user_currencies_markets_base_currencyBuilder();
  set base_currency(
          GGetUserWalletsData_user_currencies_markets_base_currencyBuilder?
              base_currency) =>
      _$this._base_currency = base_currency;

  GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder?
      _quote_currency;
  GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder
      get quote_currency => _$this._quote_currency ??=
          new GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder();
  set quote_currency(
          GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder?
              quote_currency) =>
      _$this._quote_currency = quote_currency;

  double? _rate;
  double? get rate => _$this._rate;
  set rate(double? rate) => _$this._rate = rate;

  double? _minBaseCurrencyAmount;
  double? get minBaseCurrencyAmount => _$this._minBaseCurrencyAmount;
  set minBaseCurrencyAmount(double? minBaseCurrencyAmount) =>
      _$this._minBaseCurrencyAmount = minBaseCurrencyAmount;

  double? _minQuoteCurrencyAmount;
  double? get minQuoteCurrencyAmount => _$this._minQuoteCurrencyAmount;
  set minQuoteCurrencyAmount(double? minQuoteCurrencyAmount) =>
      _$this._minQuoteCurrencyAmount = minQuoteCurrencyAmount;

  String? _commission_currency;
  String? get commission_currency => _$this._commission_currency;
  set commission_currency(String? commission_currency) =>
      _$this._commission_currency = commission_currency;

  double? _buy_commission;
  double? get buy_commission => _$this._buy_commission;
  set buy_commission(double? buy_commission) =>
      _$this._buy_commission = buy_commission;

  double? _buy_min_commission;
  double? get buy_min_commission => _$this._buy_min_commission;
  set buy_min_commission(double? buy_min_commission) =>
      _$this._buy_min_commission = buy_min_commission;

  double? _buy_max_commission;
  double? get buy_max_commission => _$this._buy_max_commission;
  set buy_max_commission(double? buy_max_commission) =>
      _$this._buy_max_commission = buy_max_commission;

  double? _sell_commission;
  double? get sell_commission => _$this._sell_commission;
  set sell_commission(double? sell_commission) =>
      _$this._sell_commission = sell_commission;

  double? _sell_min_commission;
  double? get sell_min_commission => _$this._sell_min_commission;
  set sell_min_commission(double? sell_min_commission) =>
      _$this._sell_min_commission = sell_min_commission;

  double? _sell_max_commission;
  double? get sell_max_commission => _$this._sell_max_commission;
  set sell_max_commission(double? sell_max_commission) =>
      _$this._sell_max_commission = sell_max_commission;

  bool? _enable_custodial_exchange;
  bool? get enable_custodial_exchange => _$this._enable_custodial_exchange;
  set enable_custodial_exchange(bool? enable_custodial_exchange) =>
      _$this._enable_custodial_exchange = enable_custodial_exchange;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  int? _swapBaseToQuotePricePrecision;
  int? get swapBaseToQuotePricePrecision =>
      _$this._swapBaseToQuotePricePrecision;
  set swapBaseToQuotePricePrecision(int? swapBaseToQuotePricePrecision) =>
      _$this._swapBaseToQuotePricePrecision = swapBaseToQuotePricePrecision;

  int? _swapQuoteToBasePricePrecision;
  int? get swapQuoteToBasePricePrecision =>
      _$this._swapQuoteToBasePricePrecision;
  set swapQuoteToBasePricePrecision(int? swapQuoteToBasePricePrecision) =>
      _$this._swapQuoteToBasePricePrecision = swapQuoteToBasePricePrecision;

  bool? _enable_trading;
  bool? get enable_trading => _$this._enable_trading;
  set enable_trading(bool? enable_trading) =>
      _$this._enable_trading = enable_trading;

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

  GGetUserWalletsData_user_currencies_marketsBuilder() {
    GGetUserWalletsData_user_currencies_markets._initializeBuilder(this);
  }

  GGetUserWalletsData_user_currencies_marketsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _isFavorite = $v.isFavorite;
      _marketDynamics = $v.marketDynamics?.toBuilder();
      _base_currency = $v.base_currency?.toBuilder();
      _quote_currency = $v.quote_currency?.toBuilder();
      _rate = $v.rate;
      _minBaseCurrencyAmount = $v.minBaseCurrencyAmount;
      _minQuoteCurrencyAmount = $v.minQuoteCurrencyAmount;
      _commission_currency = $v.commission_currency;
      _buy_commission = $v.buy_commission;
      _buy_min_commission = $v.buy_min_commission;
      _buy_max_commission = $v.buy_max_commission;
      _sell_commission = $v.sell_commission;
      _sell_min_commission = $v.sell_min_commission;
      _sell_max_commission = $v.sell_max_commission;
      _enable_custodial_exchange = $v.enable_custodial_exchange;
      _enabled = $v.enabled;
      _swapBaseToQuotePricePrecision = $v.swapBaseToQuotePricePrecision;
      _swapQuoteToBasePricePrecision = $v.swapQuoteToBasePricePrecision;
      _enable_trading = $v.enable_trading;
      _trading_min_amount = $v.trading_min_amount;
      _trading_price_precision = $v.trading_price_precision;
      _trading_amount_precision = $v.trading_amount_precision;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserWalletsData_user_currencies_markets other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserWalletsData_user_currencies_markets;
  }

  @override
  void update(
      void Function(GGetUserWalletsData_user_currencies_marketsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserWalletsData_user_currencies_markets build() => _build();

  _$GGetUserWalletsData_user_currencies_markets _build() {
    _$GGetUserWalletsData_user_currencies_markets _$result;
    try {
      _$result = _$v ??
          new _$GGetUserWalletsData_user_currencies_markets._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetUserWalletsData_user_currencies_markets',
                  'G__typename'),
              id: id,
              isFavorite: isFavorite,
              marketDynamics: _marketDynamics?.build(),
              base_currency: _base_currency?.build(),
              quote_currency: _quote_currency?.build(),
              rate: rate,
              minBaseCurrencyAmount: minBaseCurrencyAmount,
              minQuoteCurrencyAmount: minQuoteCurrencyAmount,
              commission_currency: commission_currency,
              buy_commission: buy_commission,
              buy_min_commission: buy_min_commission,
              buy_max_commission: buy_max_commission,
              sell_commission: sell_commission,
              sell_min_commission: sell_min_commission,
              sell_max_commission: sell_max_commission,
              enable_custodial_exchange: enable_custodial_exchange,
              enabled: enabled,
              swapBaseToQuotePricePrecision: swapBaseToQuotePricePrecision,
              swapQuoteToBasePricePrecision: swapQuoteToBasePricePrecision,
              enable_trading: enable_trading,
              trading_min_amount: trading_min_amount,
              trading_price_precision: trading_price_precision,
              trading_amount_precision: trading_amount_precision);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'marketDynamics';
        _marketDynamics?.build();
        _$failedField = 'base_currency';
        _base_currency?.build();
        _$failedField = 'quote_currency';
        _quote_currency?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUserWalletsData_user_currencies_markets',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserWalletsData_user_currencies_markets_marketDynamics
    extends GGetUserWalletsData_user_currencies_markets_marketDynamics {
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

  factory _$GGetUserWalletsData_user_currencies_markets_marketDynamics(
          [void Function(
                  GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder)?
              updates]) =>
      (new GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder()
            ..update(updates))
          ._build();

  _$GGetUserWalletsData_user_currencies_markets_marketDynamics._(
      {required this.G__typename,
      this.marketId,
      this.startPrice,
      this.amount24h,
      this.lastPrice,
      this.lowPrice,
      this.highPrice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetUserWalletsData_user_currencies_markets_marketDynamics',
        'G__typename');
  }

  @override
  GGetUserWalletsData_user_currencies_markets_marketDynamics rebuild(
          void Function(
                  GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder
      toBuilder() =>
          new GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetUserWalletsData_user_currencies_markets_marketDynamics &&
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
    return (newBuiltValueToStringHelper(
            r'GGetUserWalletsData_user_currencies_markets_marketDynamics')
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

class GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder
    implements
        Builder<GGetUserWalletsData_user_currencies_markets_marketDynamics,
            GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder> {
  _$GGetUserWalletsData_user_currencies_markets_marketDynamics? _$v;

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

  GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder() {
    GGetUserWalletsData_user_currencies_markets_marketDynamics
        ._initializeBuilder(this);
  }

  GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder get _$this {
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
  void replace(
      GGetUserWalletsData_user_currencies_markets_marketDynamics other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserWalletsData_user_currencies_markets_marketDynamics;
  }

  @override
  void update(
      void Function(
              GGetUserWalletsData_user_currencies_markets_marketDynamicsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserWalletsData_user_currencies_markets_marketDynamics build() =>
      _build();

  _$GGetUserWalletsData_user_currencies_markets_marketDynamics _build() {
    final _$result = _$v ??
        new _$GGetUserWalletsData_user_currencies_markets_marketDynamics._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetUserWalletsData_user_currencies_markets_marketDynamics',
                'G__typename'),
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

class _$GGetUserWalletsData_user_currencies_markets_base_currency
    extends GGetUserWalletsData_user_currencies_markets_base_currency {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? icon_url;
  @override
  final int? precision;
  @override
  final bool? userBalanceEnable;
  @override
  final bool? enabled;

  factory _$GGetUserWalletsData_user_currencies_markets_base_currency(
          [void Function(
                  GGetUserWalletsData_user_currencies_markets_base_currencyBuilder)?
              updates]) =>
      (new GGetUserWalletsData_user_currencies_markets_base_currencyBuilder()
            ..update(updates))
          ._build();

  _$GGetUserWalletsData_user_currencies_markets_base_currency._(
      {required this.G__typename,
      this.id,
      this.name,
      this.icon_url,
      this.precision,
      this.userBalanceEnable,
      this.enabled})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetUserWalletsData_user_currencies_markets_base_currency',
        'G__typename');
  }

  @override
  GGetUserWalletsData_user_currencies_markets_base_currency rebuild(
          void Function(
                  GGetUserWalletsData_user_currencies_markets_base_currencyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserWalletsData_user_currencies_markets_base_currencyBuilder
      toBuilder() =>
          new GGetUserWalletsData_user_currencies_markets_base_currencyBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserWalletsData_user_currencies_markets_base_currency &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        icon_url == other.icon_url &&
        precision == other.precision &&
        userBalanceEnable == other.userBalanceEnable &&
        enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jc(_$hash, precision.hashCode);
    _$hash = $jc(_$hash, userBalanceEnable.hashCode);
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetUserWalletsData_user_currencies_markets_base_currency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('icon_url', icon_url)
          ..add('precision', precision)
          ..add('userBalanceEnable', userBalanceEnable)
          ..add('enabled', enabled))
        .toString();
  }
}

class GGetUserWalletsData_user_currencies_markets_base_currencyBuilder
    implements
        Builder<GGetUserWalletsData_user_currencies_markets_base_currency,
            GGetUserWalletsData_user_currencies_markets_base_currencyBuilder> {
  _$GGetUserWalletsData_user_currencies_markets_base_currency? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _icon_url;
  String? get icon_url => _$this._icon_url;
  set icon_url(String? icon_url) => _$this._icon_url = icon_url;

  int? _precision;
  int? get precision => _$this._precision;
  set precision(int? precision) => _$this._precision = precision;

  bool? _userBalanceEnable;
  bool? get userBalanceEnable => _$this._userBalanceEnable;
  set userBalanceEnable(bool? userBalanceEnable) =>
      _$this._userBalanceEnable = userBalanceEnable;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  GGetUserWalletsData_user_currencies_markets_base_currencyBuilder() {
    GGetUserWalletsData_user_currencies_markets_base_currency
        ._initializeBuilder(this);
  }

  GGetUserWalletsData_user_currencies_markets_base_currencyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _icon_url = $v.icon_url;
      _precision = $v.precision;
      _userBalanceEnable = $v.userBalanceEnable;
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetUserWalletsData_user_currencies_markets_base_currency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserWalletsData_user_currencies_markets_base_currency;
  }

  @override
  void update(
      void Function(
              GGetUserWalletsData_user_currencies_markets_base_currencyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserWalletsData_user_currencies_markets_base_currency build() => _build();

  _$GGetUserWalletsData_user_currencies_markets_base_currency _build() {
    final _$result = _$v ??
        new _$GGetUserWalletsData_user_currencies_markets_base_currency._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetUserWalletsData_user_currencies_markets_base_currency',
                'G__typename'),
            id: id,
            name: name,
            icon_url: icon_url,
            precision: precision,
            userBalanceEnable: userBalanceEnable,
            enabled: enabled);
    replace(_$result);
    return _$result;
  }
}

class _$GGetUserWalletsData_user_currencies_markets_quote_currency
    extends GGetUserWalletsData_user_currencies_markets_quote_currency {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? icon_url;
  @override
  final int? precision;
  @override
  final bool? userBalanceEnable;
  @override
  final bool? enabled;

  factory _$GGetUserWalletsData_user_currencies_markets_quote_currency(
          [void Function(
                  GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder)?
              updates]) =>
      (new GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder()
            ..update(updates))
          ._build();

  _$GGetUserWalletsData_user_currencies_markets_quote_currency._(
      {required this.G__typename,
      this.id,
      this.name,
      this.icon_url,
      this.precision,
      this.userBalanceEnable,
      this.enabled})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetUserWalletsData_user_currencies_markets_quote_currency',
        'G__typename');
  }

  @override
  GGetUserWalletsData_user_currencies_markets_quote_currency rebuild(
          void Function(
                  GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder
      toBuilder() =>
          new GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetUserWalletsData_user_currencies_markets_quote_currency &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        icon_url == other.icon_url &&
        precision == other.precision &&
        userBalanceEnable == other.userBalanceEnable &&
        enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jc(_$hash, precision.hashCode);
    _$hash = $jc(_$hash, userBalanceEnable.hashCode);
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetUserWalletsData_user_currencies_markets_quote_currency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('icon_url', icon_url)
          ..add('precision', precision)
          ..add('userBalanceEnable', userBalanceEnable)
          ..add('enabled', enabled))
        .toString();
  }
}

class GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder
    implements
        Builder<GGetUserWalletsData_user_currencies_markets_quote_currency,
            GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder> {
  _$GGetUserWalletsData_user_currencies_markets_quote_currency? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _icon_url;
  String? get icon_url => _$this._icon_url;
  set icon_url(String? icon_url) => _$this._icon_url = icon_url;

  int? _precision;
  int? get precision => _$this._precision;
  set precision(int? precision) => _$this._precision = precision;

  bool? _userBalanceEnable;
  bool? get userBalanceEnable => _$this._userBalanceEnable;
  set userBalanceEnable(bool? userBalanceEnable) =>
      _$this._userBalanceEnable = userBalanceEnable;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder() {
    GGetUserWalletsData_user_currencies_markets_quote_currency
        ._initializeBuilder(this);
  }

  GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _icon_url = $v.icon_url;
      _precision = $v.precision;
      _userBalanceEnable = $v.userBalanceEnable;
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetUserWalletsData_user_currencies_markets_quote_currency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserWalletsData_user_currencies_markets_quote_currency;
  }

  @override
  void update(
      void Function(
              GGetUserWalletsData_user_currencies_markets_quote_currencyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserWalletsData_user_currencies_markets_quote_currency build() =>
      _build();

  _$GGetUserWalletsData_user_currencies_markets_quote_currency _build() {
    final _$result = _$v ??
        new _$GGetUserWalletsData_user_currencies_markets_quote_currency._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetUserWalletsData_user_currencies_markets_quote_currency',
                'G__typename'),
            id: id,
            name: name,
            icon_url: icon_url,
            precision: precision,
            userBalanceEnable: userBalanceEnable,
            enabled: enabled);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
