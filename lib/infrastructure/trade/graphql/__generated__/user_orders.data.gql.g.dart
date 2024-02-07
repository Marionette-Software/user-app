// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_orders.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUseOrdersData> _$gGetUseOrdersDataSerializer =
    new _$GGetUseOrdersDataSerializer();
Serializer<GGetUseOrdersData_userOrders>
    _$gGetUseOrdersDataUserOrdersSerializer =
    new _$GGetUseOrdersData_userOrdersSerializer();
Serializer<GGetUseOrdersData_userOrders_result>
    _$gGetUseOrdersDataUserOrdersResultSerializer =
    new _$GGetUseOrdersData_userOrders_resultSerializer();
Serializer<GGetUseOrdersData_userOrders_result_Market>
    _$gGetUseOrdersDataUserOrdersResultMarketSerializer =
    new _$GGetUseOrdersData_userOrders_result_MarketSerializer();
Serializer<GGetUseOrdersData_userOrders_result_Market_quote_currency>
    _$gGetUseOrdersDataUserOrdersResultMarketQuoteCurrencySerializer =
    new _$GGetUseOrdersData_userOrders_result_Market_quote_currencySerializer();
Serializer<GGetUseOrdersData_userOrders_result_Market_base_currency>
    _$gGetUseOrdersDataUserOrdersResultMarketBaseCurrencySerializer =
    new _$GGetUseOrdersData_userOrders_result_Market_base_currencySerializer();
Serializer<GGetUseOrdersData_userOrders_result_Market_marketDynamics>
    _$gGetUseOrdersDataUserOrdersResultMarketMarketDynamicsSerializer =
    new _$GGetUseOrdersData_userOrders_result_Market_marketDynamicsSerializer();
Serializer<GGetUseOrdersData_userOrders_result_user>
    _$gGetUseOrdersDataUserOrdersResultUserSerializer =
    new _$GGetUseOrdersData_userOrders_result_userSerializer();

class _$GGetUseOrdersDataSerializer
    implements StructuredSerializer<GGetUseOrdersData> {
  @override
  final Iterable<Type> types = const [GGetUseOrdersData, _$GGetUseOrdersData];
  @override
  final String wireName = 'GGetUseOrdersData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetUseOrdersData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.userOrders;
    if (value != null) {
      result
        ..add('userOrders')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetUseOrdersData_userOrders)));
    }
    return result;
  }

  @override
  GGetUseOrdersData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUseOrdersDataBuilder();

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
        case 'userOrders':
          result.userOrders.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GGetUseOrdersData_userOrders))!
              as GGetUseOrdersData_userOrders);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUseOrdersData_userOrdersSerializer
    implements StructuredSerializer<GGetUseOrdersData_userOrders> {
  @override
  final Iterable<Type> types = const [
    GGetUseOrdersData_userOrders,
    _$GGetUseOrdersData_userOrders
  ];
  @override
  final String wireName = 'GGetUseOrdersData_userOrders';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUseOrdersData_userOrders object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.result;
    if (value != null) {
      result
        ..add('result')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GGetUseOrdersData_userOrders_result)
            ])));
    }
    value = object.limit;
    if (value != null) {
      result
        ..add('limit')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GGetUseOrdersData_userOrders deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUseOrdersData_userOrdersBuilder();

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
        case 'result':
          result.result.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GGetUseOrdersData_userOrders_result)
              ]))! as BuiltList<Object?>);
          break;
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUseOrdersData_userOrders_resultSerializer
    implements StructuredSerializer<GGetUseOrdersData_userOrders_result> {
  @override
  final Iterable<Type> types = const [
    GGetUseOrdersData_userOrders_result,
    _$GGetUseOrdersData_userOrders_result
  ];
  @override
  final String wireName = 'GGetUseOrdersData_userOrders_result';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUseOrdersData_userOrders_result object,
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
    value = object.market;
    if (value != null) {
      result
        ..add('market')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.Market;
    if (value != null) {
      result
        ..add('Market')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GGetUseOrdersData_userOrders_result_Market)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.side;
    if (value != null) {
      result
        ..add('side')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.executedAmount;
    if (value != null) {
      result
        ..add('executedAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.executedVolume;
    if (value != null) {
      result
        ..add('executedVolume')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GGetUseOrdersData_userOrders_result_user)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
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
    return result;
  }

  @override
  GGetUseOrdersData_userOrders_result deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUseOrdersData_userOrders_resultBuilder();

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
        case 'market':
          result.market = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Market':
          result.Market.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetUseOrdersData_userOrders_result_Market))!
              as GGetUseOrdersData_userOrders_result_Market);
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'side':
          result.side = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'executedAmount':
          result.executedAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'executedVolume':
          result.executedVolume = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetUseOrdersData_userOrders_result_user))!
              as GGetUseOrdersData_userOrders_result_user);
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUseOrdersData_userOrders_result_MarketSerializer
    implements
        StructuredSerializer<GGetUseOrdersData_userOrders_result_Market> {
  @override
  final Iterable<Type> types = const [
    GGetUseOrdersData_userOrders_result_Market,
    _$GGetUseOrdersData_userOrders_result_Market
  ];
  @override
  final String wireName = 'GGetUseOrdersData_userOrders_result_Market';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetUseOrdersData_userOrders_result_Market object,
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
            specifiedType: const FullType(
                GGetUseOrdersData_userOrders_result_Market_quote_currency)));
    }
    value = object.base_currency;
    if (value != null) {
      result
        ..add('base_currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetUseOrdersData_userOrders_result_Market_base_currency)));
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
    value = object.marketDynamics;
    if (value != null) {
      result
        ..add('marketDynamics')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetUseOrdersData_userOrders_result_Market_marketDynamics)));
    }
    return result;
  }

  @override
  GGetUseOrdersData_userOrders_result_Market deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUseOrdersData_userOrders_result_MarketBuilder();

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
        case 'enable_trading':
          result.enable_trading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'quote_currency':
          result.quote_currency.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetUseOrdersData_userOrders_result_Market_quote_currency))!
              as GGetUseOrdersData_userOrders_result_Market_quote_currency);
          break;
        case 'base_currency':
          result.base_currency.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetUseOrdersData_userOrders_result_Market_base_currency))!
              as GGetUseOrdersData_userOrders_result_Market_base_currency);
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
        case 'marketDynamics':
          result.marketDynamics.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetUseOrdersData_userOrders_result_Market_marketDynamics))!
              as GGetUseOrdersData_userOrders_result_Market_marketDynamics);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUseOrdersData_userOrders_result_Market_quote_currencySerializer
    implements
        StructuredSerializer<
            GGetUseOrdersData_userOrders_result_Market_quote_currency> {
  @override
  final Iterable<Type> types = const [
    GGetUseOrdersData_userOrders_result_Market_quote_currency,
    _$GGetUseOrdersData_userOrders_result_Market_quote_currency
  ];
  @override
  final String wireName =
      'GGetUseOrdersData_userOrders_result_Market_quote_currency';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetUseOrdersData_userOrders_result_Market_quote_currency object,
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
    return result;
  }

  @override
  GGetUseOrdersData_userOrders_result_Market_quote_currency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GGetUseOrdersData_userOrders_result_Market_base_currencySerializer
    implements
        StructuredSerializer<
            GGetUseOrdersData_userOrders_result_Market_base_currency> {
  @override
  final Iterable<Type> types = const [
    GGetUseOrdersData_userOrders_result_Market_base_currency,
    _$GGetUseOrdersData_userOrders_result_Market_base_currency
  ];
  @override
  final String wireName =
      'GGetUseOrdersData_userOrders_result_Market_base_currency';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetUseOrdersData_userOrders_result_Market_base_currency object,
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
    return result;
  }

  @override
  GGetUseOrdersData_userOrders_result_Market_base_currency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GGetUseOrdersData_userOrders_result_Market_marketDynamicsSerializer
    implements
        StructuredSerializer<
            GGetUseOrdersData_userOrders_result_Market_marketDynamics> {
  @override
  final Iterable<Type> types = const [
    GGetUseOrdersData_userOrders_result_Market_marketDynamics,
    _$GGetUseOrdersData_userOrders_result_Market_marketDynamics
  ];
  @override
  final String wireName =
      'GGetUseOrdersData_userOrders_result_Market_marketDynamics';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetUseOrdersData_userOrders_result_Market_marketDynamics object,
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
  GGetUseOrdersData_userOrders_result_Market_marketDynamics deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder();

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

class _$GGetUseOrdersData_userOrders_result_userSerializer
    implements StructuredSerializer<GGetUseOrdersData_userOrders_result_user> {
  @override
  final Iterable<Type> types = const [
    GGetUseOrdersData_userOrders_result_user,
    _$GGetUseOrdersData_userOrders_result_user
  ];
  @override
  final String wireName = 'GGetUseOrdersData_userOrders_result_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUseOrdersData_userOrders_result_user object,
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
    return result;
  }

  @override
  GGetUseOrdersData_userOrders_result_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUseOrdersData_userOrders_result_userBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GGetUseOrdersData extends GGetUseOrdersData {
  @override
  final String G__typename;
  @override
  final GGetUseOrdersData_userOrders? userOrders;

  factory _$GGetUseOrdersData(
          [void Function(GGetUseOrdersDataBuilder)? updates]) =>
      (new GGetUseOrdersDataBuilder()..update(updates))._build();

  _$GGetUseOrdersData._({required this.G__typename, this.userOrders})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUseOrdersData', 'G__typename');
  }

  @override
  GGetUseOrdersData rebuild(void Function(GGetUseOrdersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUseOrdersDataBuilder toBuilder() =>
      new GGetUseOrdersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUseOrdersData &&
        G__typename == other.G__typename &&
        userOrders == other.userOrders;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, userOrders.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUseOrdersData')
          ..add('G__typename', G__typename)
          ..add('userOrders', userOrders))
        .toString();
  }
}

class GGetUseOrdersDataBuilder
    implements Builder<GGetUseOrdersData, GGetUseOrdersDataBuilder> {
  _$GGetUseOrdersData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetUseOrdersData_userOrdersBuilder? _userOrders;
  GGetUseOrdersData_userOrdersBuilder get userOrders =>
      _$this._userOrders ??= new GGetUseOrdersData_userOrdersBuilder();
  set userOrders(GGetUseOrdersData_userOrdersBuilder? userOrders) =>
      _$this._userOrders = userOrders;

  GGetUseOrdersDataBuilder() {
    GGetUseOrdersData._initializeBuilder(this);
  }

  GGetUseOrdersDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userOrders = $v.userOrders?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUseOrdersData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUseOrdersData;
  }

  @override
  void update(void Function(GGetUseOrdersDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUseOrdersData build() => _build();

  _$GGetUseOrdersData _build() {
    _$GGetUseOrdersData _$result;
    try {
      _$result = _$v ??
          new _$GGetUseOrdersData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetUseOrdersData', 'G__typename'),
              userOrders: _userOrders?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userOrders';
        _userOrders?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUseOrdersData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUseOrdersData_userOrders extends GGetUseOrdersData_userOrders {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetUseOrdersData_userOrders_result?>? result;
  @override
  final int? limit;
  @override
  final int? total;

  factory _$GGetUseOrdersData_userOrders(
          [void Function(GGetUseOrdersData_userOrdersBuilder)? updates]) =>
      (new GGetUseOrdersData_userOrdersBuilder()..update(updates))._build();

  _$GGetUseOrdersData_userOrders._(
      {required this.G__typename, this.result, this.limit, this.total})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUseOrdersData_userOrders', 'G__typename');
  }

  @override
  GGetUseOrdersData_userOrders rebuild(
          void Function(GGetUseOrdersData_userOrdersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUseOrdersData_userOrdersBuilder toBuilder() =>
      new GGetUseOrdersData_userOrdersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUseOrdersData_userOrders &&
        G__typename == other.G__typename &&
        result == other.result &&
        limit == other.limit &&
        total == other.total;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUseOrdersData_userOrders')
          ..add('G__typename', G__typename)
          ..add('result', result)
          ..add('limit', limit)
          ..add('total', total))
        .toString();
  }
}

class GGetUseOrdersData_userOrdersBuilder
    implements
        Builder<GGetUseOrdersData_userOrders,
            GGetUseOrdersData_userOrdersBuilder> {
  _$GGetUseOrdersData_userOrders? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetUseOrdersData_userOrders_result?>? _result;
  ListBuilder<GGetUseOrdersData_userOrders_result?> get result =>
      _$this._result ??=
          new ListBuilder<GGetUseOrdersData_userOrders_result?>();
  set result(ListBuilder<GGetUseOrdersData_userOrders_result?>? result) =>
      _$this._result = result;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  GGetUseOrdersData_userOrdersBuilder() {
    GGetUseOrdersData_userOrders._initializeBuilder(this);
  }

  GGetUseOrdersData_userOrdersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _result = $v.result?.toBuilder();
      _limit = $v.limit;
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUseOrdersData_userOrders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUseOrdersData_userOrders;
  }

  @override
  void update(void Function(GGetUseOrdersData_userOrdersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUseOrdersData_userOrders build() => _build();

  _$GGetUseOrdersData_userOrders _build() {
    _$GGetUseOrdersData_userOrders _$result;
    try {
      _$result = _$v ??
          new _$GGetUseOrdersData_userOrders._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetUseOrdersData_userOrders', 'G__typename'),
              result: _result?.build(),
              limit: limit,
              total: total);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'result';
        _result?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUseOrdersData_userOrders', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUseOrdersData_userOrders_result
    extends GGetUseOrdersData_userOrders_result {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? market;
  @override
  final GGetUseOrdersData_userOrders_result_Market? Market;
  @override
  final String? type;
  @override
  final String? side;
  @override
  final String? status;
  @override
  final double? executedAmount;
  @override
  final double? executedVolume;
  @override
  final GGetUseOrdersData_userOrders_result_user? user;
  @override
  final double? amount;
  @override
  final double? price;
  @override
  final String? createdAt;

  factory _$GGetUseOrdersData_userOrders_result(
          [void Function(GGetUseOrdersData_userOrders_resultBuilder)?
              updates]) =>
      (new GGetUseOrdersData_userOrders_resultBuilder()..update(updates))
          ._build();

  _$GGetUseOrdersData_userOrders_result._(
      {required this.G__typename,
      this.id,
      this.market,
      this.Market,
      this.type,
      this.side,
      this.status,
      this.executedAmount,
      this.executedVolume,
      this.user,
      this.amount,
      this.price,
      this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUseOrdersData_userOrders_result', 'G__typename');
  }

  @override
  GGetUseOrdersData_userOrders_result rebuild(
          void Function(GGetUseOrdersData_userOrders_resultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUseOrdersData_userOrders_resultBuilder toBuilder() =>
      new GGetUseOrdersData_userOrders_resultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUseOrdersData_userOrders_result &&
        G__typename == other.G__typename &&
        id == other.id &&
        market == other.market &&
        Market == other.Market &&
        type == other.type &&
        side == other.side &&
        status == other.status &&
        executedAmount == other.executedAmount &&
        executedVolume == other.executedVolume &&
        user == other.user &&
        amount == other.amount &&
        price == other.price &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, market.hashCode);
    _$hash = $jc(_$hash, Market.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, side.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, executedAmount.hashCode);
    _$hash = $jc(_$hash, executedVolume.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUseOrdersData_userOrders_result')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('market', market)
          ..add('Market', Market)
          ..add('type', type)
          ..add('side', side)
          ..add('status', status)
          ..add('executedAmount', executedAmount)
          ..add('executedVolume', executedVolume)
          ..add('user', user)
          ..add('amount', amount)
          ..add('price', price)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GGetUseOrdersData_userOrders_resultBuilder
    implements
        Builder<GGetUseOrdersData_userOrders_result,
            GGetUseOrdersData_userOrders_resultBuilder> {
  _$GGetUseOrdersData_userOrders_result? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  GGetUseOrdersData_userOrders_result_MarketBuilder? _Market;
  GGetUseOrdersData_userOrders_result_MarketBuilder get Market =>
      _$this._Market ??=
          new GGetUseOrdersData_userOrders_result_MarketBuilder();
  set Market(GGetUseOrdersData_userOrders_result_MarketBuilder? Market) =>
      _$this._Market = Market;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _side;
  String? get side => _$this._side;
  set side(String? side) => _$this._side = side;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  double? _executedAmount;
  double? get executedAmount => _$this._executedAmount;
  set executedAmount(double? executedAmount) =>
      _$this._executedAmount = executedAmount;

  double? _executedVolume;
  double? get executedVolume => _$this._executedVolume;
  set executedVolume(double? executedVolume) =>
      _$this._executedVolume = executedVolume;

  GGetUseOrdersData_userOrders_result_userBuilder? _user;
  GGetUseOrdersData_userOrders_result_userBuilder get user =>
      _$this._user ??= new GGetUseOrdersData_userOrders_result_userBuilder();
  set user(GGetUseOrdersData_userOrders_result_userBuilder? user) =>
      _$this._user = user;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  GGetUseOrdersData_userOrders_resultBuilder() {
    GGetUseOrdersData_userOrders_result._initializeBuilder(this);
  }

  GGetUseOrdersData_userOrders_resultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _market = $v.market;
      _Market = $v.Market?.toBuilder();
      _type = $v.type;
      _side = $v.side;
      _status = $v.status;
      _executedAmount = $v.executedAmount;
      _executedVolume = $v.executedVolume;
      _user = $v.user?.toBuilder();
      _amount = $v.amount;
      _price = $v.price;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUseOrdersData_userOrders_result other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUseOrdersData_userOrders_result;
  }

  @override
  void update(
      void Function(GGetUseOrdersData_userOrders_resultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUseOrdersData_userOrders_result build() => _build();

  _$GGetUseOrdersData_userOrders_result _build() {
    _$GGetUseOrdersData_userOrders_result _$result;
    try {
      _$result = _$v ??
          new _$GGetUseOrdersData_userOrders_result._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetUseOrdersData_userOrders_result', 'G__typename'),
              id: id,
              market: market,
              Market: _Market?.build(),
              type: type,
              side: side,
              status: status,
              executedAmount: executedAmount,
              executedVolume: executedVolume,
              user: _user?.build(),
              amount: amount,
              price: price,
              createdAt: createdAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'Market';
        _Market?.build();

        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUseOrdersData_userOrders_result',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUseOrdersData_userOrders_result_Market
    extends GGetUseOrdersData_userOrders_result_Market {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final double? rate;
  @override
  final bool? enable_trading;
  @override
  final GGetUseOrdersData_userOrders_result_Market_quote_currency?
      quote_currency;
  @override
  final GGetUseOrdersData_userOrders_result_Market_base_currency? base_currency;
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
  final GGetUseOrdersData_userOrders_result_Market_marketDynamics?
      marketDynamics;

  factory _$GGetUseOrdersData_userOrders_result_Market(
          [void Function(GGetUseOrdersData_userOrders_result_MarketBuilder)?
              updates]) =>
      (new GGetUseOrdersData_userOrders_result_MarketBuilder()..update(updates))
          ._build();

  _$GGetUseOrdersData_userOrders_result_Market._(
      {required this.G__typename,
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
      this.marketDynamics})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetUseOrdersData_userOrders_result_Market', 'G__typename');
  }

  @override
  GGetUseOrdersData_userOrders_result_Market rebuild(
          void Function(GGetUseOrdersData_userOrders_result_MarketBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUseOrdersData_userOrders_result_MarketBuilder toBuilder() =>
      new GGetUseOrdersData_userOrders_result_MarketBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUseOrdersData_userOrders_result_Market &&
        G__typename == other.G__typename &&
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
        marketDynamics == other.marketDynamics;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
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
    _$hash = $jc(_$hash, marketDynamics.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetUseOrdersData_userOrders_result_Market')
          ..add('G__typename', G__typename)
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
          ..add('marketDynamics', marketDynamics))
        .toString();
  }
}

class GGetUseOrdersData_userOrders_result_MarketBuilder
    implements
        Builder<GGetUseOrdersData_userOrders_result_Market,
            GGetUseOrdersData_userOrders_result_MarketBuilder> {
  _$GGetUseOrdersData_userOrders_result_Market? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

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

  GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder?
      _quote_currency;
  GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder
      get quote_currency => _$this._quote_currency ??=
          new GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder();
  set quote_currency(
          GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder?
              quote_currency) =>
      _$this._quote_currency = quote_currency;

  GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder?
      _base_currency;
  GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder
      get base_currency => _$this._base_currency ??=
          new GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder();
  set base_currency(
          GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder?
              base_currency) =>
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

  GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder?
      _marketDynamics;
  GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder
      get marketDynamics => _$this._marketDynamics ??=
          new GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder();
  set marketDynamics(
          GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder?
              marketDynamics) =>
      _$this._marketDynamics = marketDynamics;

  GGetUseOrdersData_userOrders_result_MarketBuilder() {
    GGetUseOrdersData_userOrders_result_Market._initializeBuilder(this);
  }

  GGetUseOrdersData_userOrders_result_MarketBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
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
      _marketDynamics = $v.marketDynamics?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUseOrdersData_userOrders_result_Market other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUseOrdersData_userOrders_result_Market;
  }

  @override
  void update(
      void Function(GGetUseOrdersData_userOrders_result_MarketBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUseOrdersData_userOrders_result_Market build() => _build();

  _$GGetUseOrdersData_userOrders_result_Market _build() {
    _$GGetUseOrdersData_userOrders_result_Market _$result;
    try {
      _$result = _$v ??
          new _$GGetUseOrdersData_userOrders_result_Market._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetUseOrdersData_userOrders_result_Market', 'G__typename'),
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
            r'GGetUseOrdersData_userOrders_result_Market',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUseOrdersData_userOrders_result_Market_quote_currency
    extends GGetUseOrdersData_userOrders_result_Market_quote_currency {
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

  factory _$GGetUseOrdersData_userOrders_result_Market_quote_currency(
          [void Function(
                  GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder)?
              updates]) =>
      (new GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder()
            ..update(updates))
          ._build();

  _$GGetUseOrdersData_userOrders_result_Market_quote_currency._(
      {required this.G__typename,
      this.id,
      this.precision,
      this.icon_url,
      this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetUseOrdersData_userOrders_result_Market_quote_currency',
        'G__typename');
  }

  @override
  GGetUseOrdersData_userOrders_result_Market_quote_currency rebuild(
          void Function(
                  GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder
      toBuilder() =>
          new GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUseOrdersData_userOrders_result_Market_quote_currency &&
        G__typename == other.G__typename &&
        id == other.id &&
        precision == other.precision &&
        icon_url == other.icon_url &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, precision.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetUseOrdersData_userOrders_result_Market_quote_currency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('precision', precision)
          ..add('icon_url', icon_url)
          ..add('name', name))
        .toString();
  }
}

class GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder
    implements
        Builder<GGetUseOrdersData_userOrders_result_Market_quote_currency,
            GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder> {
  _$GGetUseOrdersData_userOrders_result_Market_quote_currency? _$v;

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

  GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder() {
    GGetUseOrdersData_userOrders_result_Market_quote_currency
        ._initializeBuilder(this);
  }

  GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _precision = $v.precision;
      _icon_url = $v.icon_url;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetUseOrdersData_userOrders_result_Market_quote_currency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUseOrdersData_userOrders_result_Market_quote_currency;
  }

  @override
  void update(
      void Function(
              GGetUseOrdersData_userOrders_result_Market_quote_currencyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUseOrdersData_userOrders_result_Market_quote_currency build() => _build();

  _$GGetUseOrdersData_userOrders_result_Market_quote_currency _build() {
    final _$result = _$v ??
        new _$GGetUseOrdersData_userOrders_result_Market_quote_currency._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetUseOrdersData_userOrders_result_Market_quote_currency',
                'G__typename'),
            id: id,
            precision: precision,
            icon_url: icon_url,
            name: name);
    replace(_$result);
    return _$result;
  }
}

class _$GGetUseOrdersData_userOrders_result_Market_base_currency
    extends GGetUseOrdersData_userOrders_result_Market_base_currency {
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

  factory _$GGetUseOrdersData_userOrders_result_Market_base_currency(
          [void Function(
                  GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder)?
              updates]) =>
      (new GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder()
            ..update(updates))
          ._build();

  _$GGetUseOrdersData_userOrders_result_Market_base_currency._(
      {required this.G__typename,
      this.id,
      this.precision,
      this.icon_url,
      this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetUseOrdersData_userOrders_result_Market_base_currency',
        'G__typename');
  }

  @override
  GGetUseOrdersData_userOrders_result_Market_base_currency rebuild(
          void Function(
                  GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder toBuilder() =>
      new GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUseOrdersData_userOrders_result_Market_base_currency &&
        G__typename == other.G__typename &&
        id == other.id &&
        precision == other.precision &&
        icon_url == other.icon_url &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, precision.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetUseOrdersData_userOrders_result_Market_base_currency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('precision', precision)
          ..add('icon_url', icon_url)
          ..add('name', name))
        .toString();
  }
}

class GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder
    implements
        Builder<GGetUseOrdersData_userOrders_result_Market_base_currency,
            GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder> {
  _$GGetUseOrdersData_userOrders_result_Market_base_currency? _$v;

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

  GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder() {
    GGetUseOrdersData_userOrders_result_Market_base_currency._initializeBuilder(
        this);
  }

  GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _precision = $v.precision;
      _icon_url = $v.icon_url;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUseOrdersData_userOrders_result_Market_base_currency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUseOrdersData_userOrders_result_Market_base_currency;
  }

  @override
  void update(
      void Function(
              GGetUseOrdersData_userOrders_result_Market_base_currencyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUseOrdersData_userOrders_result_Market_base_currency build() => _build();

  _$GGetUseOrdersData_userOrders_result_Market_base_currency _build() {
    final _$result = _$v ??
        new _$GGetUseOrdersData_userOrders_result_Market_base_currency._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetUseOrdersData_userOrders_result_Market_base_currency',
                'G__typename'),
            id: id,
            precision: precision,
            icon_url: icon_url,
            name: name);
    replace(_$result);
    return _$result;
  }
}

class _$GGetUseOrdersData_userOrders_result_Market_marketDynamics
    extends GGetUseOrdersData_userOrders_result_Market_marketDynamics {
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

  factory _$GGetUseOrdersData_userOrders_result_Market_marketDynamics(
          [void Function(
                  GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder)?
              updates]) =>
      (new GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder()
            ..update(updates))
          ._build();

  _$GGetUseOrdersData_userOrders_result_Market_marketDynamics._(
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
        r'GGetUseOrdersData_userOrders_result_Market_marketDynamics',
        'G__typename');
  }

  @override
  GGetUseOrdersData_userOrders_result_Market_marketDynamics rebuild(
          void Function(
                  GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder
      toBuilder() =>
          new GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUseOrdersData_userOrders_result_Market_marketDynamics &&
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
            r'GGetUseOrdersData_userOrders_result_Market_marketDynamics')
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

class GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder
    implements
        Builder<GGetUseOrdersData_userOrders_result_Market_marketDynamics,
            GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder> {
  _$GGetUseOrdersData_userOrders_result_Market_marketDynamics? _$v;

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

  GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder() {
    GGetUseOrdersData_userOrders_result_Market_marketDynamics
        ._initializeBuilder(this);
  }

  GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder get _$this {
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
      GGetUseOrdersData_userOrders_result_Market_marketDynamics other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUseOrdersData_userOrders_result_Market_marketDynamics;
  }

  @override
  void update(
      void Function(
              GGetUseOrdersData_userOrders_result_Market_marketDynamicsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUseOrdersData_userOrders_result_Market_marketDynamics build() => _build();

  _$GGetUseOrdersData_userOrders_result_Market_marketDynamics _build() {
    final _$result = _$v ??
        new _$GGetUseOrdersData_userOrders_result_Market_marketDynamics._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetUseOrdersData_userOrders_result_Market_marketDynamics',
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

class _$GGetUseOrdersData_userOrders_result_user
    extends GGetUseOrdersData_userOrders_result_user {
  @override
  final String G__typename;
  @override
  final String? id;

  factory _$GGetUseOrdersData_userOrders_result_user(
          [void Function(GGetUseOrdersData_userOrders_result_userBuilder)?
              updates]) =>
      (new GGetUseOrdersData_userOrders_result_userBuilder()..update(updates))
          ._build();

  _$GGetUseOrdersData_userOrders_result_user._(
      {required this.G__typename, this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetUseOrdersData_userOrders_result_user', 'G__typename');
  }

  @override
  GGetUseOrdersData_userOrders_result_user rebuild(
          void Function(GGetUseOrdersData_userOrders_result_userBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUseOrdersData_userOrders_result_userBuilder toBuilder() =>
      new GGetUseOrdersData_userOrders_result_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUseOrdersData_userOrders_result_user &&
        G__typename == other.G__typename &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetUseOrdersData_userOrders_result_user')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GGetUseOrdersData_userOrders_result_userBuilder
    implements
        Builder<GGetUseOrdersData_userOrders_result_user,
            GGetUseOrdersData_userOrders_result_userBuilder> {
  _$GGetUseOrdersData_userOrders_result_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GGetUseOrdersData_userOrders_result_userBuilder() {
    GGetUseOrdersData_userOrders_result_user._initializeBuilder(this);
  }

  GGetUseOrdersData_userOrders_result_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUseOrdersData_userOrders_result_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUseOrdersData_userOrders_result_user;
  }

  @override
  void update(
      void Function(GGetUseOrdersData_userOrders_result_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUseOrdersData_userOrders_result_user build() => _build();

  _$GGetUseOrdersData_userOrders_result_user _build() {
    final _$result = _$v ??
        new _$GGetUseOrdersData_userOrders_result_user._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetUseOrdersData_userOrders_result_user', 'G__typename'),
            id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
