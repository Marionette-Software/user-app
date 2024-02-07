// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_currencies.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetNonCustodialCurrenciesData>
    _$gGetNonCustodialCurrenciesDataSerializer =
    new _$GGetNonCustodialCurrenciesDataSerializer();
Serializer<GGetNonCustodialCurrenciesData_currencies>
    _$gGetNonCustodialCurrenciesDataCurrenciesSerializer =
    new _$GGetNonCustodialCurrenciesData_currenciesSerializer();
Serializer<GGetNonCustodialCurrenciesData_currencies_markets>
    _$gGetNonCustodialCurrenciesDataCurrenciesMarketsSerializer =
    new _$GGetNonCustodialCurrenciesData_currencies_marketsSerializer();
Serializer<GGetNonCustodialCurrenciesData_currencies_markets_base_currency>
    _$gGetNonCustodialCurrenciesDataCurrenciesMarketsBaseCurrencySerializer =
    new _$GGetNonCustodialCurrenciesData_currencies_markets_base_currencySerializer();
Serializer<
        GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces>
    _$gGetNonCustodialCurrenciesDataCurrenciesMarketsBaseCurrencyCurrencyPaymentInterfacesSerializer =
    new _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesSerializer();
Serializer<
        GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface>
    _$gGetNonCustodialCurrenciesDataCurrenciesMarketsBaseCurrencyCurrencyPaymentInterfacesPaymentInterfaceSerializer =
    new _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceSerializer();
Serializer<GGetNonCustodialCurrenciesData_currencies_markets_quote_currency>
    _$gGetNonCustodialCurrenciesDataCurrenciesMarketsQuoteCurrencySerializer =
    new _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currencySerializer();
Serializer<
        GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces>
    _$gGetNonCustodialCurrenciesDataCurrenciesMarketsQuoteCurrencyCurrencyPaymentInterfacesSerializer =
    new _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesSerializer();
Serializer<
        GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface>
    _$gGetNonCustodialCurrenciesDataCurrenciesMarketsQuoteCurrencyCurrencyPaymentInterfacesPaymentInterfaceSerializer =
    new _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceSerializer();
Serializer<GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces>
    _$gGetNonCustodialCurrenciesDataCurrenciesCurrencyPaymentInterfacesSerializer =
    new _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesSerializer();
Serializer<
        GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface>
    _$gGetNonCustodialCurrenciesDataCurrenciesCurrencyPaymentInterfacesPaymentInterfaceSerializer =
    new _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceSerializer();
Serializer<
        GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain>
    _$gGetNonCustodialCurrenciesDataCurrenciesCurrencyPaymentInterfacesPaymentInterfaceBlockchainSerializer =
    new _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainSerializer();

class _$GGetNonCustodialCurrenciesDataSerializer
    implements StructuredSerializer<GGetNonCustodialCurrenciesData> {
  @override
  final Iterable<Type> types = const [
    GGetNonCustodialCurrenciesData,
    _$GGetNonCustodialCurrenciesData
  ];
  @override
  final String wireName = 'GGetNonCustodialCurrenciesData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetNonCustodialCurrenciesData object,
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
              const FullType.nullable(GGetNonCustodialCurrenciesData_currencies)
            ])));
    }
    return result;
  }

  @override
  GGetNonCustodialCurrenciesData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetNonCustodialCurrenciesDataBuilder();

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
                const FullType.nullable(
                    GGetNonCustodialCurrenciesData_currencies)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetNonCustodialCurrenciesData_currenciesSerializer
    implements StructuredSerializer<GGetNonCustodialCurrenciesData_currencies> {
  @override
  final Iterable<Type> types = const [
    GGetNonCustodialCurrenciesData_currencies,
    _$GGetNonCustodialCurrenciesData_currencies
  ];
  @override
  final String wireName = 'GGetNonCustodialCurrenciesData_currencies';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetNonCustodialCurrenciesData_currencies object,
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
    value = object.markets;
    if (value != null) {
      result
        ..add('markets')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GGetNonCustodialCurrenciesData_currencies_markets)
            ])));
    }
    value = object.currencyPaymentInterfaces;
    if (value != null) {
      result
        ..add('currencyPaymentInterfaces')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces)
            ])));
    }
    return result;
  }

  @override
  GGetNonCustodialCurrenciesData_currencies deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetNonCustodialCurrenciesData_currenciesBuilder();

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
        case 'precision':
          result.precision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'icon_url':
          result.icon_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'markets':
          result.markets.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GGetNonCustodialCurrenciesData_currencies_markets)
              ]))! as BuiltList<Object?>);
          break;
        case 'currencyPaymentInterfaces':
          result.currencyPaymentInterfaces
              .replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType.nullable(
                        GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces)
                  ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_marketsSerializer
    implements
        StructuredSerializer<
            GGetNonCustodialCurrenciesData_currencies_markets> {
  @override
  final Iterable<Type> types = const [
    GGetNonCustodialCurrenciesData_currencies_markets,
    _$GGetNonCustodialCurrenciesData_currencies_markets
  ];
  @override
  final String wireName = 'GGetNonCustodialCurrenciesData_currencies_markets';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetNonCustodialCurrenciesData_currencies_markets object,
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
    value = object.rate;
    if (value != null) {
      result
        ..add('rate')
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
    value = object.base_currency_id;
    if (value != null) {
      result
        ..add('base_currency_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.minBaseCurrencyAmount;
    if (value != null) {
      result
        ..add('minBaseCurrencyAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.base_currency;
    if (value != null) {
      result
        ..add('base_currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetNonCustodialCurrenciesData_currencies_markets_base_currency)));
    }
    value = object.quote_currency;
    if (value != null) {
      result
        ..add('quote_currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetNonCustodialCurrenciesData_currencies_markets_quote_currency)));
    }
    value = object.quote_currency_id;
    if (value != null) {
      result
        ..add('quote_currency_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.minQuoteCurrencyAmount;
    if (value != null) {
      result
        ..add('minQuoteCurrencyAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.buy_commission;
    if (value != null) {
      result
        ..add('buy_commission')
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
    value = object.buy_min_commission;
    if (value != null) {
      result
        ..add('buy_min_commission')
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
    value = object.sell_max_commission;
    if (value != null) {
      result
        ..add('sell_max_commission')
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
    value = object.enable_non_custodial_exchange;
    if (value != null) {
      result
        ..add('enable_non_custodial_exchange')
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
    return result;
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetNonCustodialCurrenciesData_currencies_marketsBuilder();

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
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'commission_currency':
          result.commission_currency = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'base_currency_id':
          result.base_currency_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'minBaseCurrencyAmount':
          result.minBaseCurrencyAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'base_currency':
          result.base_currency.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetNonCustodialCurrenciesData_currencies_markets_base_currency))!
              as GGetNonCustodialCurrenciesData_currencies_markets_base_currency);
          break;
        case 'quote_currency':
          result.quote_currency.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetNonCustodialCurrenciesData_currencies_markets_quote_currency))!
              as GGetNonCustodialCurrenciesData_currencies_markets_quote_currency);
          break;
        case 'quote_currency_id':
          result.quote_currency_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'minQuoteCurrencyAmount':
          result.minQuoteCurrencyAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'buy_commission':
          result.buy_commission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'buy_max_commission':
          result.buy_max_commission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'buy_min_commission':
          result.buy_min_commission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'sell_commission':
          result.sell_commission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'sell_max_commission':
          result.sell_max_commission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'sell_min_commission':
          result.sell_min_commission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'enable_non_custodial_exchange':
          result.enable_non_custodial_exchange = serializers.deserialize(value,
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
      }
    }

    return result.build();
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_markets_base_currencySerializer
    implements
        StructuredSerializer<
            GGetNonCustodialCurrenciesData_currencies_markets_base_currency> {
  @override
  final Iterable<Type> types = const [
    GGetNonCustodialCurrenciesData_currencies_markets_base_currency,
    _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency
  ];
  @override
  final String wireName =
      'GGetNonCustodialCurrenciesData_currencies_markets_base_currency';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetNonCustodialCurrenciesData_currencies_markets_base_currency object,
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
    value = object.userBalanceEnable;
    if (value != null) {
      result
        ..add('userBalanceEnable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.currencyPaymentInterfaces;
    if (value != null) {
      result
        ..add('currencyPaymentInterfaces')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces)
            ])));
    }
    return result;
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder();

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
        case 'precision':
          result.precision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'icon_url':
          result.icon_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userBalanceEnable':
          result.userBalanceEnable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'currencyPaymentInterfaces':
          result.currencyPaymentInterfaces
              .replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType.nullable(
                        GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces)
                  ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesSerializer
    implements
        StructuredSerializer<
            GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces> {
  @override
  final Iterable<Type> types = const [
    GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces,
    _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces
  ];
  @override
  final String wireName =
      'GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentInterface;
    if (value != null) {
      result
        ..add('paymentInterface')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface)));
    }
    return result;
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'paymentInterface':
          result.paymentInterface.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface))!
              as GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceSerializer
    implements
        StructuredSerializer<
            GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface> {
  @override
  final Iterable<Type> types = const [
    GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface,
    _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface
  ];
  @override
  final String wireName =
      'GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface
          object,
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
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subtitle;
    if (value != null) {
      result
        ..add('subtitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logoUrl;
    if (value != null) {
      result
        ..add('logoUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'subtitle':
          result.subtitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'logoUrl':
          result.logoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currencySerializer
    implements
        StructuredSerializer<
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currency> {
  @override
  final Iterable<Type> types = const [
    GGetNonCustodialCurrenciesData_currencies_markets_quote_currency,
    _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency
  ];
  @override
  final String wireName =
      'GGetNonCustodialCurrenciesData_currencies_markets_quote_currency';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetNonCustodialCurrenciesData_currencies_markets_quote_currency object,
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
    value = object.userBalanceEnable;
    if (value != null) {
      result
        ..add('userBalanceEnable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.currencyPaymentInterfaces;
    if (value != null) {
      result
        ..add('currencyPaymentInterfaces')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces)
            ])));
    }
    return result;
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder();

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
        case 'precision':
          result.precision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'icon_url':
          result.icon_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userBalanceEnable':
          result.userBalanceEnable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'currencyPaymentInterfaces':
          result.currencyPaymentInterfaces
              .replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType.nullable(
                        GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces)
                  ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesSerializer
    implements
        StructuredSerializer<
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces> {
  @override
  final Iterable<Type> types = const [
    GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces,
    _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces
  ];
  @override
  final String wireName =
      'GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentInterface;
    if (value != null) {
      result
        ..add('paymentInterface')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface)));
    }
    return result;
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'paymentInterface':
          result.paymentInterface.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface))!
              as GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceSerializer
    implements
        StructuredSerializer<
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface> {
  @override
  final Iterable<Type> types = const [
    GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface,
    _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface
  ];
  @override
  final String wireName =
      'GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface
          object,
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
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subtitle;
    if (value != null) {
      result
        ..add('subtitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logoUrl;
    if (value != null) {
      result
        ..add('logoUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'subtitle':
          result.subtitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'logoUrl':
          result.logoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesSerializer
    implements
        StructuredSerializer<
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces> {
  @override
  final Iterable<Type> types = const [
    GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces,
    _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces
  ];
  @override
  final String wireName =
      'GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.paymentInterfaceId;
    if (value != null) {
      result
        ..add('paymentInterfaceId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentInterface;
    if (value != null) {
      result
        ..add('paymentInterface')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface)));
    }
    value = object.userDepositEnable;
    if (value != null) {
      result
        ..add('userDepositEnable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.userWithdrawEnable;
    if (value != null) {
      result
        ..add('userWithdrawEnable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesBuilder();

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
        case 'paymentInterfaceId':
          result.paymentInterfaceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'paymentInterface':
          result.paymentInterface.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface))!
              as GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface);
          break;
        case 'userDepositEnable':
          result.userDepositEnable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'userWithdrawEnable':
          result.userWithdrawEnable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceSerializer
    implements
        StructuredSerializer<
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface> {
  @override
  final Iterable<Type> types = const [
    GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface,
    _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface
  ];
  @override
  final String wireName =
      'GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface
          object,
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
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logoUrl;
    if (value != null) {
      result
        ..add('logoUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subtitle;
    if (value != null) {
      result
        ..add('subtitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.blockchain;
    if (value != null) {
      result
        ..add('blockchain')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain)));
    }
    return result;
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'logoUrl':
          result.logoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'subtitle':
          result.subtitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'blockchain':
          result.blockchain.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain))!
              as GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainSerializer
    implements
        StructuredSerializer<
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain> {
  @override
  final Iterable<Type> types = const [
    GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain,
    _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain
  ];
  @override
  final String wireName =
      'GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain
          object,
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
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.explorer_address;
    if (value != null) {
      result
        ..add('explorer_address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.chainId;
    if (value != null) {
      result
        ..add('chainId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.wallet;
    if (value != null) {
      result
        ..add('wallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'explorer_address':
          result.explorer_address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'chainId':
          result.chainId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'wallet':
          result.wallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetNonCustodialCurrenciesData extends GGetNonCustodialCurrenciesData {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetNonCustodialCurrenciesData_currencies?>? currencies;

  factory _$GGetNonCustodialCurrenciesData(
          [void Function(GGetNonCustodialCurrenciesDataBuilder)? updates]) =>
      (new GGetNonCustodialCurrenciesDataBuilder()..update(updates))._build();

  _$GGetNonCustodialCurrenciesData._(
      {required this.G__typename, this.currencies})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetNonCustodialCurrenciesData', 'G__typename');
  }

  @override
  GGetNonCustodialCurrenciesData rebuild(
          void Function(GGetNonCustodialCurrenciesDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetNonCustodialCurrenciesDataBuilder toBuilder() =>
      new GGetNonCustodialCurrenciesDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetNonCustodialCurrenciesData &&
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
    return (newBuiltValueToStringHelper(r'GGetNonCustodialCurrenciesData')
          ..add('G__typename', G__typename)
          ..add('currencies', currencies))
        .toString();
  }
}

class GGetNonCustodialCurrenciesDataBuilder
    implements
        Builder<GGetNonCustodialCurrenciesData,
            GGetNonCustodialCurrenciesDataBuilder> {
  _$GGetNonCustodialCurrenciesData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetNonCustodialCurrenciesData_currencies?>? _currencies;
  ListBuilder<GGetNonCustodialCurrenciesData_currencies?> get currencies =>
      _$this._currencies ??=
          new ListBuilder<GGetNonCustodialCurrenciesData_currencies?>();
  set currencies(
          ListBuilder<GGetNonCustodialCurrenciesData_currencies?>?
              currencies) =>
      _$this._currencies = currencies;

  GGetNonCustodialCurrenciesDataBuilder() {
    GGetNonCustodialCurrenciesData._initializeBuilder(this);
  }

  GGetNonCustodialCurrenciesDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _currencies = $v.currencies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetNonCustodialCurrenciesData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetNonCustodialCurrenciesData;
  }

  @override
  void update(void Function(GGetNonCustodialCurrenciesDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetNonCustodialCurrenciesData build() => _build();

  _$GGetNonCustodialCurrenciesData _build() {
    _$GGetNonCustodialCurrenciesData _$result;
    try {
      _$result = _$v ??
          new _$GGetNonCustodialCurrenciesData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetNonCustodialCurrenciesData', 'G__typename'),
              currencies: _currencies?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currencies';
        _currencies?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetNonCustodialCurrenciesData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetNonCustodialCurrenciesData_currencies
    extends GGetNonCustodialCurrenciesData_currencies {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final int? precision;
  @override
  final String? icon_url;
  @override
  final BuiltList<GGetNonCustodialCurrenciesData_currencies_markets?>? markets;
  @override
  final BuiltList<
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces?>?
      currencyPaymentInterfaces;

  factory _$GGetNonCustodialCurrenciesData_currencies(
          [void Function(GGetNonCustodialCurrenciesData_currenciesBuilder)?
              updates]) =>
      (new GGetNonCustodialCurrenciesData_currenciesBuilder()..update(updates))
          ._build();

  _$GGetNonCustodialCurrenciesData_currencies._(
      {required this.G__typename,
      this.id,
      this.name,
      this.precision,
      this.icon_url,
      this.markets,
      this.currencyPaymentInterfaces})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetNonCustodialCurrenciesData_currencies', 'G__typename');
  }

  @override
  GGetNonCustodialCurrenciesData_currencies rebuild(
          void Function(GGetNonCustodialCurrenciesData_currenciesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetNonCustodialCurrenciesData_currenciesBuilder toBuilder() =>
      new GGetNonCustodialCurrenciesData_currenciesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetNonCustodialCurrenciesData_currencies &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        precision == other.precision &&
        icon_url == other.icon_url &&
        markets == other.markets &&
        currencyPaymentInterfaces == other.currencyPaymentInterfaces;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, precision.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jc(_$hash, markets.hashCode);
    _$hash = $jc(_$hash, currencyPaymentInterfaces.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetNonCustodialCurrenciesData_currencies')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('precision', precision)
          ..add('icon_url', icon_url)
          ..add('markets', markets)
          ..add('currencyPaymentInterfaces', currencyPaymentInterfaces))
        .toString();
  }
}

class GGetNonCustodialCurrenciesData_currenciesBuilder
    implements
        Builder<GGetNonCustodialCurrenciesData_currencies,
            GGetNonCustodialCurrenciesData_currenciesBuilder> {
  _$GGetNonCustodialCurrenciesData_currencies? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _precision;
  int? get precision => _$this._precision;
  set precision(int? precision) => _$this._precision = precision;

  String? _icon_url;
  String? get icon_url => _$this._icon_url;
  set icon_url(String? icon_url) => _$this._icon_url = icon_url;

  ListBuilder<GGetNonCustodialCurrenciesData_currencies_markets?>? _markets;
  ListBuilder<GGetNonCustodialCurrenciesData_currencies_markets?> get markets =>
      _$this._markets ??=
          new ListBuilder<GGetNonCustodialCurrenciesData_currencies_markets?>();
  set markets(
          ListBuilder<GGetNonCustodialCurrenciesData_currencies_markets?>?
              markets) =>
      _$this._markets = markets;

  ListBuilder<
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces?>?
      _currencyPaymentInterfaces;
  ListBuilder<
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces?>
      get currencyPaymentInterfaces =>
          _$this._currencyPaymentInterfaces ??= new ListBuilder<
              GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces?>();
  set currencyPaymentInterfaces(
          ListBuilder<
                  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces?>?
              currencyPaymentInterfaces) =>
      _$this._currencyPaymentInterfaces = currencyPaymentInterfaces;

  GGetNonCustodialCurrenciesData_currenciesBuilder() {
    GGetNonCustodialCurrenciesData_currencies._initializeBuilder(this);
  }

  GGetNonCustodialCurrenciesData_currenciesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _precision = $v.precision;
      _icon_url = $v.icon_url;
      _markets = $v.markets?.toBuilder();
      _currencyPaymentInterfaces = $v.currencyPaymentInterfaces?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetNonCustodialCurrenciesData_currencies other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetNonCustodialCurrenciesData_currencies;
  }

  @override
  void update(
      void Function(GGetNonCustodialCurrenciesData_currenciesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetNonCustodialCurrenciesData_currencies build() => _build();

  _$GGetNonCustodialCurrenciesData_currencies _build() {
    _$GGetNonCustodialCurrenciesData_currencies _$result;
    try {
      _$result = _$v ??
          new _$GGetNonCustodialCurrenciesData_currencies._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetNonCustodialCurrenciesData_currencies', 'G__typename'),
              id: id,
              name: name,
              precision: precision,
              icon_url: icon_url,
              markets: _markets?.build(),
              currencyPaymentInterfaces: _currencyPaymentInterfaces?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'markets';
        _markets?.build();
        _$failedField = 'currencyPaymentInterfaces';
        _currencyPaymentInterfaces?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetNonCustodialCurrenciesData_currencies',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_markets
    extends GGetNonCustodialCurrenciesData_currencies_markets {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final double? rate;
  @override
  final String? commission_currency;
  @override
  final String? base_currency_id;
  @override
  final double? minBaseCurrencyAmount;
  @override
  final GGetNonCustodialCurrenciesData_currencies_markets_base_currency?
      base_currency;
  @override
  final GGetNonCustodialCurrenciesData_currencies_markets_quote_currency?
      quote_currency;
  @override
  final String? quote_currency_id;
  @override
  final double? minQuoteCurrencyAmount;
  @override
  final double? buy_commission;
  @override
  final double? buy_max_commission;
  @override
  final double? buy_min_commission;
  @override
  final double? sell_commission;
  @override
  final double? sell_max_commission;
  @override
  final double? sell_min_commission;
  @override
  final bool? enable_non_custodial_exchange;
  @override
  final int? swapBaseToQuotePricePrecision;
  @override
  final int? swapQuoteToBasePricePrecision;

  factory _$GGetNonCustodialCurrenciesData_currencies_markets(
          [void Function(
                  GGetNonCustodialCurrenciesData_currencies_marketsBuilder)?
              updates]) =>
      (new GGetNonCustodialCurrenciesData_currencies_marketsBuilder()
            ..update(updates))
          ._build();

  _$GGetNonCustodialCurrenciesData_currencies_markets._(
      {required this.G__typename,
      this.id,
      this.rate,
      this.commission_currency,
      this.base_currency_id,
      this.minBaseCurrencyAmount,
      this.base_currency,
      this.quote_currency,
      this.quote_currency_id,
      this.minQuoteCurrencyAmount,
      this.buy_commission,
      this.buy_max_commission,
      this.buy_min_commission,
      this.sell_commission,
      this.sell_max_commission,
      this.sell_min_commission,
      this.enable_non_custodial_exchange,
      this.swapBaseToQuotePricePrecision,
      this.swapQuoteToBasePricePrecision})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetNonCustodialCurrenciesData_currencies_markets', 'G__typename');
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets rebuild(
          void Function(
                  GGetNonCustodialCurrenciesData_currencies_marketsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetNonCustodialCurrenciesData_currencies_marketsBuilder toBuilder() =>
      new GGetNonCustodialCurrenciesData_currencies_marketsBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetNonCustodialCurrenciesData_currencies_markets &&
        G__typename == other.G__typename &&
        id == other.id &&
        rate == other.rate &&
        commission_currency == other.commission_currency &&
        base_currency_id == other.base_currency_id &&
        minBaseCurrencyAmount == other.minBaseCurrencyAmount &&
        base_currency == other.base_currency &&
        quote_currency == other.quote_currency &&
        quote_currency_id == other.quote_currency_id &&
        minQuoteCurrencyAmount == other.minQuoteCurrencyAmount &&
        buy_commission == other.buy_commission &&
        buy_max_commission == other.buy_max_commission &&
        buy_min_commission == other.buy_min_commission &&
        sell_commission == other.sell_commission &&
        sell_max_commission == other.sell_max_commission &&
        sell_min_commission == other.sell_min_commission &&
        enable_non_custodial_exchange == other.enable_non_custodial_exchange &&
        swapBaseToQuotePricePrecision == other.swapBaseToQuotePricePrecision &&
        swapQuoteToBasePricePrecision == other.swapQuoteToBasePricePrecision;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jc(_$hash, commission_currency.hashCode);
    _$hash = $jc(_$hash, base_currency_id.hashCode);
    _$hash = $jc(_$hash, minBaseCurrencyAmount.hashCode);
    _$hash = $jc(_$hash, base_currency.hashCode);
    _$hash = $jc(_$hash, quote_currency.hashCode);
    _$hash = $jc(_$hash, quote_currency_id.hashCode);
    _$hash = $jc(_$hash, minQuoteCurrencyAmount.hashCode);
    _$hash = $jc(_$hash, buy_commission.hashCode);
    _$hash = $jc(_$hash, buy_max_commission.hashCode);
    _$hash = $jc(_$hash, buy_min_commission.hashCode);
    _$hash = $jc(_$hash, sell_commission.hashCode);
    _$hash = $jc(_$hash, sell_max_commission.hashCode);
    _$hash = $jc(_$hash, sell_min_commission.hashCode);
    _$hash = $jc(_$hash, enable_non_custodial_exchange.hashCode);
    _$hash = $jc(_$hash, swapBaseToQuotePricePrecision.hashCode);
    _$hash = $jc(_$hash, swapQuoteToBasePricePrecision.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetNonCustodialCurrenciesData_currencies_markets')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('rate', rate)
          ..add('commission_currency', commission_currency)
          ..add('base_currency_id', base_currency_id)
          ..add('minBaseCurrencyAmount', minBaseCurrencyAmount)
          ..add('base_currency', base_currency)
          ..add('quote_currency', quote_currency)
          ..add('quote_currency_id', quote_currency_id)
          ..add('minQuoteCurrencyAmount', minQuoteCurrencyAmount)
          ..add('buy_commission', buy_commission)
          ..add('buy_max_commission', buy_max_commission)
          ..add('buy_min_commission', buy_min_commission)
          ..add('sell_commission', sell_commission)
          ..add('sell_max_commission', sell_max_commission)
          ..add('sell_min_commission', sell_min_commission)
          ..add('enable_non_custodial_exchange', enable_non_custodial_exchange)
          ..add('swapBaseToQuotePricePrecision', swapBaseToQuotePricePrecision)
          ..add('swapQuoteToBasePricePrecision', swapQuoteToBasePricePrecision))
        .toString();
  }
}

class GGetNonCustodialCurrenciesData_currencies_marketsBuilder
    implements
        Builder<GGetNonCustodialCurrenciesData_currencies_markets,
            GGetNonCustodialCurrenciesData_currencies_marketsBuilder> {
  _$GGetNonCustodialCurrenciesData_currencies_markets? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  double? _rate;
  double? get rate => _$this._rate;
  set rate(double? rate) => _$this._rate = rate;

  String? _commission_currency;
  String? get commission_currency => _$this._commission_currency;
  set commission_currency(String? commission_currency) =>
      _$this._commission_currency = commission_currency;

  String? _base_currency_id;
  String? get base_currency_id => _$this._base_currency_id;
  set base_currency_id(String? base_currency_id) =>
      _$this._base_currency_id = base_currency_id;

  double? _minBaseCurrencyAmount;
  double? get minBaseCurrencyAmount => _$this._minBaseCurrencyAmount;
  set minBaseCurrencyAmount(double? minBaseCurrencyAmount) =>
      _$this._minBaseCurrencyAmount = minBaseCurrencyAmount;

  GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder?
      _base_currency;
  GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder
      get base_currency => _$this._base_currency ??=
          new GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder();
  set base_currency(
          GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder?
              base_currency) =>
      _$this._base_currency = base_currency;

  GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder?
      _quote_currency;
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder
      get quote_currency => _$this._quote_currency ??=
          new GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder();
  set quote_currency(
          GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder?
              quote_currency) =>
      _$this._quote_currency = quote_currency;

  String? _quote_currency_id;
  String? get quote_currency_id => _$this._quote_currency_id;
  set quote_currency_id(String? quote_currency_id) =>
      _$this._quote_currency_id = quote_currency_id;

  double? _minQuoteCurrencyAmount;
  double? get minQuoteCurrencyAmount => _$this._minQuoteCurrencyAmount;
  set minQuoteCurrencyAmount(double? minQuoteCurrencyAmount) =>
      _$this._minQuoteCurrencyAmount = minQuoteCurrencyAmount;

  double? _buy_commission;
  double? get buy_commission => _$this._buy_commission;
  set buy_commission(double? buy_commission) =>
      _$this._buy_commission = buy_commission;

  double? _buy_max_commission;
  double? get buy_max_commission => _$this._buy_max_commission;
  set buy_max_commission(double? buy_max_commission) =>
      _$this._buy_max_commission = buy_max_commission;

  double? _buy_min_commission;
  double? get buy_min_commission => _$this._buy_min_commission;
  set buy_min_commission(double? buy_min_commission) =>
      _$this._buy_min_commission = buy_min_commission;

  double? _sell_commission;
  double? get sell_commission => _$this._sell_commission;
  set sell_commission(double? sell_commission) =>
      _$this._sell_commission = sell_commission;

  double? _sell_max_commission;
  double? get sell_max_commission => _$this._sell_max_commission;
  set sell_max_commission(double? sell_max_commission) =>
      _$this._sell_max_commission = sell_max_commission;

  double? _sell_min_commission;
  double? get sell_min_commission => _$this._sell_min_commission;
  set sell_min_commission(double? sell_min_commission) =>
      _$this._sell_min_commission = sell_min_commission;

  bool? _enable_non_custodial_exchange;
  bool? get enable_non_custodial_exchange =>
      _$this._enable_non_custodial_exchange;
  set enable_non_custodial_exchange(bool? enable_non_custodial_exchange) =>
      _$this._enable_non_custodial_exchange = enable_non_custodial_exchange;

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

  GGetNonCustodialCurrenciesData_currencies_marketsBuilder() {
    GGetNonCustodialCurrenciesData_currencies_markets._initializeBuilder(this);
  }

  GGetNonCustodialCurrenciesData_currencies_marketsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _rate = $v.rate;
      _commission_currency = $v.commission_currency;
      _base_currency_id = $v.base_currency_id;
      _minBaseCurrencyAmount = $v.minBaseCurrencyAmount;
      _base_currency = $v.base_currency?.toBuilder();
      _quote_currency = $v.quote_currency?.toBuilder();
      _quote_currency_id = $v.quote_currency_id;
      _minQuoteCurrencyAmount = $v.minQuoteCurrencyAmount;
      _buy_commission = $v.buy_commission;
      _buy_max_commission = $v.buy_max_commission;
      _buy_min_commission = $v.buy_min_commission;
      _sell_commission = $v.sell_commission;
      _sell_max_commission = $v.sell_max_commission;
      _sell_min_commission = $v.sell_min_commission;
      _enable_non_custodial_exchange = $v.enable_non_custodial_exchange;
      _swapBaseToQuotePricePrecision = $v.swapBaseToQuotePricePrecision;
      _swapQuoteToBasePricePrecision = $v.swapQuoteToBasePricePrecision;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetNonCustodialCurrenciesData_currencies_markets other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetNonCustodialCurrenciesData_currencies_markets;
  }

  @override
  void update(
      void Function(GGetNonCustodialCurrenciesData_currencies_marketsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets build() => _build();

  _$GGetNonCustodialCurrenciesData_currencies_markets _build() {
    _$GGetNonCustodialCurrenciesData_currencies_markets _$result;
    try {
      _$result = _$v ??
          new _$GGetNonCustodialCurrenciesData_currencies_markets._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetNonCustodialCurrenciesData_currencies_markets',
                  'G__typename'),
              id: id,
              rate: rate,
              commission_currency: commission_currency,
              base_currency_id: base_currency_id,
              minBaseCurrencyAmount: minBaseCurrencyAmount,
              base_currency: _base_currency?.build(),
              quote_currency: _quote_currency?.build(),
              quote_currency_id: quote_currency_id,
              minQuoteCurrencyAmount: minQuoteCurrencyAmount,
              buy_commission: buy_commission,
              buy_max_commission: buy_max_commission,
              buy_min_commission: buy_min_commission,
              sell_commission: sell_commission,
              sell_max_commission: sell_max_commission,
              sell_min_commission: sell_min_commission,
              enable_non_custodial_exchange: enable_non_custodial_exchange,
              swapBaseToQuotePricePrecision: swapBaseToQuotePricePrecision,
              swapQuoteToBasePricePrecision: swapQuoteToBasePricePrecision);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'base_currency';
        _base_currency?.build();
        _$failedField = 'quote_currency';
        _quote_currency?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetNonCustodialCurrenciesData_currencies_markets',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency
    extends GGetNonCustodialCurrenciesData_currencies_markets_base_currency {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final int? precision;
  @override
  final String? icon_url;
  @override
  final bool? userBalanceEnable;
  @override
  final BuiltList<
          GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces?>?
      currencyPaymentInterfaces;

  factory _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency(
          [void Function(
                  GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder)?
              updates]) =>
      (new GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder()
            ..update(updates))
          ._build();

  _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency._(
      {required this.G__typename,
      this.id,
      this.name,
      this.precision,
      this.icon_url,
      this.userBalanceEnable,
      this.currencyPaymentInterfaces})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetNonCustodialCurrenciesData_currencies_markets_base_currency',
        'G__typename');
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency rebuild(
          void Function(
                  GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder
      toBuilder() =>
          new GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetNonCustodialCurrenciesData_currencies_markets_base_currency &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        precision == other.precision &&
        icon_url == other.icon_url &&
        userBalanceEnable == other.userBalanceEnable &&
        currencyPaymentInterfaces == other.currencyPaymentInterfaces;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, precision.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jc(_$hash, userBalanceEnable.hashCode);
    _$hash = $jc(_$hash, currencyPaymentInterfaces.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetNonCustodialCurrenciesData_currencies_markets_base_currency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('precision', precision)
          ..add('icon_url', icon_url)
          ..add('userBalanceEnable', userBalanceEnable)
          ..add('currencyPaymentInterfaces', currencyPaymentInterfaces))
        .toString();
  }
}

class GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder
    implements
        Builder<GGetNonCustodialCurrenciesData_currencies_markets_base_currency,
            GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder> {
  _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _precision;
  int? get precision => _$this._precision;
  set precision(int? precision) => _$this._precision = precision;

  String? _icon_url;
  String? get icon_url => _$this._icon_url;
  set icon_url(String? icon_url) => _$this._icon_url = icon_url;

  bool? _userBalanceEnable;
  bool? get userBalanceEnable => _$this._userBalanceEnable;
  set userBalanceEnable(bool? userBalanceEnable) =>
      _$this._userBalanceEnable = userBalanceEnable;

  ListBuilder<
          GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces?>?
      _currencyPaymentInterfaces;
  ListBuilder<
          GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces?>
      get currencyPaymentInterfaces =>
          _$this._currencyPaymentInterfaces ??= new ListBuilder<
              GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces?>();
  set currencyPaymentInterfaces(
          ListBuilder<
                  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces?>?
              currencyPaymentInterfaces) =>
      _$this._currencyPaymentInterfaces = currencyPaymentInterfaces;

  GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder() {
    GGetNonCustodialCurrenciesData_currencies_markets_base_currency
        ._initializeBuilder(this);
  }

  GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _precision = $v.precision;
      _icon_url = $v.icon_url;
      _userBalanceEnable = $v.userBalanceEnable;
      _currencyPaymentInterfaces = $v.currencyPaymentInterfaces?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetNonCustodialCurrenciesData_currencies_markets_base_currency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency;
  }

  @override
  void update(
      void Function(
              GGetNonCustodialCurrenciesData_currencies_markets_base_currencyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency build() =>
      _build();

  _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency _build() {
    _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency _$result;
    try {
      _$result = _$v ??
          new _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency
                  ._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetNonCustodialCurrenciesData_currencies_markets_base_currency',
                  'G__typename'),
              id: id,
              name: name,
              precision: precision,
              icon_url: icon_url,
              userBalanceEnable: userBalanceEnable,
              currencyPaymentInterfaces: _currencyPaymentInterfaces?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currencyPaymentInterfaces';
        _currencyPaymentInterfaces?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetNonCustodialCurrenciesData_currencies_markets_base_currency',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces
    extends GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces {
  @override
  final String G__typename;
  @override
  final String? type;
  @override
  final GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface?
      paymentInterface;

  factory _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces(
          [void Function(
                  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesBuilder)?
              updates]) =>
      (new GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesBuilder()
            ..update(updates))
          ._build();

  _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces._(
      {required this.G__typename, this.type, this.paymentInterface})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces',
        'G__typename');
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces
      rebuild(
              void Function(
                      GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesBuilder
      toBuilder() =>
          new GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces &&
        G__typename == other.G__typename &&
        type == other.type &&
        paymentInterface == other.paymentInterface;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, paymentInterface.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('paymentInterface', paymentInterface))
        .toString();
  }
}

class GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesBuilder
    implements
        Builder<
            GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces,
            GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesBuilder> {
  _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder?
      _paymentInterface;
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
      get paymentInterface => _$this._paymentInterface ??=
          new GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder();
  set paymentInterface(
          GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder?
              paymentInterface) =>
      _$this._paymentInterface = paymentInterface;

  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesBuilder() {
    GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces
        ._initializeBuilder(this);
  }

  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _paymentInterface = $v.paymentInterface?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces;
  }

  @override
  void update(
      void Function(
              GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfacesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces
      build() => _build();

  _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces
      _build() {
    _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces
        _$result;
    try {
      _$result = _$v ??
          new _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces
                  ._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces',
                  'G__typename'),
              type: type,
              paymentInterface: _paymentInterface?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'paymentInterface';
        _paymentInterface?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface
    extends GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? logoUrl;

  factory _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface(
          [void Function(
                  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder)?
              updates]) =>
      (new GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder()
            ..update(updates))
          ._build();

  _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface._(
      {required this.G__typename,
      this.id,
      this.title,
      this.subtitle,
      this.logoUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface',
        'G__typename');
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface
      rebuild(
              void Function(
                      GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
      toBuilder() =>
          new GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        subtitle == other.subtitle &&
        logoUrl == other.logoUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, subtitle.hashCode);
    _$hash = $jc(_$hash, logoUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('subtitle', subtitle)
          ..add('logoUrl', logoUrl))
        .toString();
  }
}

class GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
    implements
        Builder<
            GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface,
            GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder> {
  _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _subtitle;
  String? get subtitle => _$this._subtitle;
  set subtitle(String? subtitle) => _$this._subtitle = subtitle;

  String? _logoUrl;
  String? get logoUrl => _$this._logoUrl;
  set logoUrl(String? logoUrl) => _$this._logoUrl = logoUrl;

  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder() {
    GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface
        ._initializeBuilder(this);
  }

  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _subtitle = $v.subtitle;
      _logoUrl = $v.logoUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface;
  }

  @override
  void update(
      void Function(
              GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterfaceBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface
      build() => _build();

  _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface
      _build() {
    final _$result = _$v ??
        new _$GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetNonCustodialCurrenciesData_currencies_markets_base_currency_currencyPaymentInterfaces_paymentInterface',
                'G__typename'),
            id: id,
            title: title,
            subtitle: subtitle,
            logoUrl: logoUrl);
    replace(_$result);
    return _$result;
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency
    extends GGetNonCustodialCurrenciesData_currencies_markets_quote_currency {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final int? precision;
  @override
  final String? icon_url;
  @override
  final bool? userBalanceEnable;
  @override
  final BuiltList<
          GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces?>?
      currencyPaymentInterfaces;

  factory _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency(
          [void Function(
                  GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder)?
              updates]) =>
      (new GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder()
            ..update(updates))
          ._build();

  _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency._(
      {required this.G__typename,
      this.id,
      this.name,
      this.precision,
      this.icon_url,
      this.userBalanceEnable,
      this.currencyPaymentInterfaces})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetNonCustodialCurrenciesData_currencies_markets_quote_currency',
        'G__typename');
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency rebuild(
          void Function(
                  GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder
      toBuilder() =>
          new GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetNonCustodialCurrenciesData_currencies_markets_quote_currency &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        precision == other.precision &&
        icon_url == other.icon_url &&
        userBalanceEnable == other.userBalanceEnable &&
        currencyPaymentInterfaces == other.currencyPaymentInterfaces;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, precision.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jc(_$hash, userBalanceEnable.hashCode);
    _$hash = $jc(_$hash, currencyPaymentInterfaces.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetNonCustodialCurrenciesData_currencies_markets_quote_currency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('precision', precision)
          ..add('icon_url', icon_url)
          ..add('userBalanceEnable', userBalanceEnable)
          ..add('currencyPaymentInterfaces', currencyPaymentInterfaces))
        .toString();
  }
}

class GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder
    implements
        Builder<
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currency,
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder> {
  _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _precision;
  int? get precision => _$this._precision;
  set precision(int? precision) => _$this._precision = precision;

  String? _icon_url;
  String? get icon_url => _$this._icon_url;
  set icon_url(String? icon_url) => _$this._icon_url = icon_url;

  bool? _userBalanceEnable;
  bool? get userBalanceEnable => _$this._userBalanceEnable;
  set userBalanceEnable(bool? userBalanceEnable) =>
      _$this._userBalanceEnable = userBalanceEnable;

  ListBuilder<
          GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces?>?
      _currencyPaymentInterfaces;
  ListBuilder<
          GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces?>
      get currencyPaymentInterfaces =>
          _$this._currencyPaymentInterfaces ??= new ListBuilder<
              GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces?>();
  set currencyPaymentInterfaces(
          ListBuilder<
                  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces?>?
              currencyPaymentInterfaces) =>
      _$this._currencyPaymentInterfaces = currencyPaymentInterfaces;

  GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder() {
    GGetNonCustodialCurrenciesData_currencies_markets_quote_currency
        ._initializeBuilder(this);
  }

  GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _precision = $v.precision;
      _icon_url = $v.icon_url;
      _userBalanceEnable = $v.userBalanceEnable;
      _currencyPaymentInterfaces = $v.currencyPaymentInterfaces?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetNonCustodialCurrenciesData_currencies_markets_quote_currency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency;
  }

  @override
  void update(
      void Function(
              GGetNonCustodialCurrenciesData_currencies_markets_quote_currencyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency build() =>
      _build();

  _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency _build() {
    _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency _$result;
    try {
      _$result = _$v ??
          new _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency
                  ._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetNonCustodialCurrenciesData_currencies_markets_quote_currency',
                  'G__typename'),
              id: id,
              name: name,
              precision: precision,
              icon_url: icon_url,
              userBalanceEnable: userBalanceEnable,
              currencyPaymentInterfaces: _currencyPaymentInterfaces?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currencyPaymentInterfaces';
        _currencyPaymentInterfaces?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetNonCustodialCurrenciesData_currencies_markets_quote_currency',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces
    extends GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces {
  @override
  final String G__typename;
  @override
  final String? type;
  @override
  final GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface?
      paymentInterface;

  factory _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces(
          [void Function(
                  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesBuilder)?
              updates]) =>
      (new GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesBuilder()
            ..update(updates))
          ._build();

  _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces._(
      {required this.G__typename, this.type, this.paymentInterface})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces',
        'G__typename');
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces
      rebuild(
              void Function(
                      GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesBuilder
      toBuilder() =>
          new GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces &&
        G__typename == other.G__typename &&
        type == other.type &&
        paymentInterface == other.paymentInterface;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, paymentInterface.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('paymentInterface', paymentInterface))
        .toString();
  }
}

class GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesBuilder
    implements
        Builder<
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces,
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesBuilder> {
  _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder?
      _paymentInterface;
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
      get paymentInterface => _$this._paymentInterface ??=
          new GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder();
  set paymentInterface(
          GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder?
              paymentInterface) =>
      _$this._paymentInterface = paymentInterface;

  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesBuilder() {
    GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces
        ._initializeBuilder(this);
  }

  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _paymentInterface = $v.paymentInterface?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces;
  }

  @override
  void update(
      void Function(
              GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfacesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces
      build() => _build();

  _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces
      _build() {
    _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces
        _$result;
    try {
      _$result = _$v ??
          new _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces
                  ._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces',
                  'G__typename'),
              type: type,
              paymentInterface: _paymentInterface?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'paymentInterface';
        _paymentInterface?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface
    extends GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? logoUrl;

  factory _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface(
          [void Function(
                  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder)?
              updates]) =>
      (new GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder()
            ..update(updates))
          ._build();

  _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface._(
      {required this.G__typename,
      this.id,
      this.title,
      this.subtitle,
      this.logoUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface',
        'G__typename');
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface
      rebuild(
              void Function(
                      GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
      toBuilder() =>
          new GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        subtitle == other.subtitle &&
        logoUrl == other.logoUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, subtitle.hashCode);
    _$hash = $jc(_$hash, logoUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('subtitle', subtitle)
          ..add('logoUrl', logoUrl))
        .toString();
  }
}

class GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
    implements
        Builder<
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface,
            GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder> {
  _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _subtitle;
  String? get subtitle => _$this._subtitle;
  set subtitle(String? subtitle) => _$this._subtitle = subtitle;

  String? _logoUrl;
  String? get logoUrl => _$this._logoUrl;
  set logoUrl(String? logoUrl) => _$this._logoUrl = logoUrl;

  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder() {
    GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface
        ._initializeBuilder(this);
  }

  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _subtitle = $v.subtitle;
      _logoUrl = $v.logoUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface;
  }

  @override
  void update(
      void Function(
              GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterfaceBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface
      build() => _build();

  _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface
      _build() {
    final _$result = _$v ??
        new _$GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetNonCustodialCurrenciesData_currencies_markets_quote_currency_currencyPaymentInterfaces_paymentInterface',
                'G__typename'),
            id: id,
            title: title,
            subtitle: subtitle,
            logoUrl: logoUrl);
    replace(_$result);
    return _$result;
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces
    extends GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces {
  @override
  final String G__typename;
  @override
  final String? paymentInterfaceId;
  @override
  final String? type;
  @override
  final GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface?
      paymentInterface;
  @override
  final bool? userDepositEnable;
  @override
  final bool? userWithdrawEnable;

  factory _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces(
          [void Function(
                  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesBuilder)?
              updates]) =>
      (new GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesBuilder()
            ..update(updates))
          ._build();

  _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces._(
      {required this.G__typename,
      this.paymentInterfaceId,
      this.type,
      this.paymentInterface,
      this.userDepositEnable,
      this.userWithdrawEnable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces',
        'G__typename');
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces rebuild(
          void Function(
                  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesBuilder
      toBuilder() =>
          new GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces &&
        G__typename == other.G__typename &&
        paymentInterfaceId == other.paymentInterfaceId &&
        type == other.type &&
        paymentInterface == other.paymentInterface &&
        userDepositEnable == other.userDepositEnable &&
        userWithdrawEnable == other.userWithdrawEnable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, paymentInterfaceId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, paymentInterface.hashCode);
    _$hash = $jc(_$hash, userDepositEnable.hashCode);
    _$hash = $jc(_$hash, userWithdrawEnable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces')
          ..add('G__typename', G__typename)
          ..add('paymentInterfaceId', paymentInterfaceId)
          ..add('type', type)
          ..add('paymentInterface', paymentInterface)
          ..add('userDepositEnable', userDepositEnable)
          ..add('userWithdrawEnable', userWithdrawEnable))
        .toString();
  }
}

class GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesBuilder
    implements
        Builder<
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces,
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesBuilder> {
  _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _paymentInterfaceId;
  String? get paymentInterfaceId => _$this._paymentInterfaceId;
  set paymentInterfaceId(String? paymentInterfaceId) =>
      _$this._paymentInterfaceId = paymentInterfaceId;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder?
      _paymentInterface;
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder
      get paymentInterface => _$this._paymentInterface ??=
          new GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder();
  set paymentInterface(
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder?
              paymentInterface) =>
      _$this._paymentInterface = paymentInterface;

  bool? _userDepositEnable;
  bool? get userDepositEnable => _$this._userDepositEnable;
  set userDepositEnable(bool? userDepositEnable) =>
      _$this._userDepositEnable = userDepositEnable;

  bool? _userWithdrawEnable;
  bool? get userWithdrawEnable => _$this._userWithdrawEnable;
  set userWithdrawEnable(bool? userWithdrawEnable) =>
      _$this._userWithdrawEnable = userWithdrawEnable;

  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesBuilder() {
    GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces
        ._initializeBuilder(this);
  }

  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _paymentInterfaceId = $v.paymentInterfaceId;
      _type = $v.type;
      _paymentInterface = $v.paymentInterface?.toBuilder();
      _userDepositEnable = $v.userDepositEnable;
      _userWithdrawEnable = $v.userWithdrawEnable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces;
  }

  @override
  void update(
      void Function(
              GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfacesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces build() =>
      _build();

  _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces
      _build() {
    _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces
        _$result;
    try {
      _$result = _$v ??
          new _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces
                  ._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces',
                  'G__typename'),
              paymentInterfaceId: paymentInterfaceId,
              type: type,
              paymentInterface: _paymentInterface?.build(),
              userDepositEnable: userDepositEnable,
              userWithdrawEnable: userWithdrawEnable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'paymentInterface';
        _paymentInterface?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface
    extends GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? logoUrl;
  @override
  final String? subtitle;
  @override
  final GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain?
      blockchain;

  factory _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface(
          [void Function(
                  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder)?
              updates]) =>
      (new GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder()
            ..update(updates))
          ._build();

  _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface._(
      {required this.G__typename,
      this.id,
      this.title,
      this.logoUrl,
      this.subtitle,
      this.blockchain})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface',
        'G__typename');
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface
      rebuild(
              void Function(
                      GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder
      toBuilder() =>
          new GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        logoUrl == other.logoUrl &&
        subtitle == other.subtitle &&
        blockchain == other.blockchain;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, logoUrl.hashCode);
    _$hash = $jc(_$hash, subtitle.hashCode);
    _$hash = $jc(_$hash, blockchain.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('logoUrl', logoUrl)
          ..add('subtitle', subtitle)
          ..add('blockchain', blockchain))
        .toString();
  }
}

class GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder
    implements
        Builder<
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface,
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder> {
  _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _logoUrl;
  String? get logoUrl => _$this._logoUrl;
  set logoUrl(String? logoUrl) => _$this._logoUrl = logoUrl;

  String? _subtitle;
  String? get subtitle => _$this._subtitle;
  set subtitle(String? subtitle) => _$this._subtitle = subtitle;

  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder?
      _blockchain;
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder
      get blockchain => _$this._blockchain ??=
          new GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder();
  set blockchain(
          GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder?
              blockchain) =>
      _$this._blockchain = blockchain;

  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder() {
    GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface
        ._initializeBuilder(this);
  }

  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _logoUrl = $v.logoUrl;
      _subtitle = $v.subtitle;
      _blockchain = $v.blockchain?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface;
  }

  @override
  void update(
      void Function(
              GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterfaceBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface
      build() => _build();

  _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface
      _build() {
    _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface
        _$result;
    try {
      _$result = _$v ??
          new _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface
                  ._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface',
                  'G__typename'),
              id: id,
              title: title,
              logoUrl: logoUrl,
              subtitle: subtitle,
              blockchain: _blockchain?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blockchain';
        _blockchain?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain
    extends GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? explorer_address;
  @override
  final String? chainId;
  @override
  final String? wallet;

  factory _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain(
          [void Function(
                  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder)?
              updates]) =>
      (new GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder()
            ..update(updates))
          ._build();

  _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain._(
      {required this.G__typename,
      this.id,
      this.name,
      this.description,
      this.explorer_address,
      this.chainId,
      this.wallet})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain',
        'G__typename');
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain
      rebuild(
              void Function(
                      GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder
      toBuilder() =>
          new GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        explorer_address == other.explorer_address &&
        chainId == other.chainId &&
        wallet == other.wallet;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, explorer_address.hashCode);
    _$hash = $jc(_$hash, chainId.hashCode);
    _$hash = $jc(_$hash, wallet.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('explorer_address', explorer_address)
          ..add('chainId', chainId)
          ..add('wallet', wallet))
        .toString();
  }
}

class GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder
    implements
        Builder<
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain,
            GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder> {
  _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _explorer_address;
  String? get explorer_address => _$this._explorer_address;
  set explorer_address(String? explorer_address) =>
      _$this._explorer_address = explorer_address;

  String? _chainId;
  String? get chainId => _$this._chainId;
  set chainId(String? chainId) => _$this._chainId = chainId;

  String? _wallet;
  String? get wallet => _$this._wallet;
  set wallet(String? wallet) => _$this._wallet = wallet;

  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder() {
    GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain
        ._initializeBuilder(this);
  }

  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _explorer_address = $v.explorer_address;
      _chainId = $v.chainId;
      _wallet = $v.wallet;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain;
  }

  @override
  void update(
      void Function(
              GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchainBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain
      build() => _build();

  _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain
      _build() {
    final _$result = _$v ??
        new _$GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface_blockchain',
                'G__typename'),
            id: id,
            name: name,
            description: description,
            explorer_address: explorer_address,
            chainId: chainId,
            wallet: wallet);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
