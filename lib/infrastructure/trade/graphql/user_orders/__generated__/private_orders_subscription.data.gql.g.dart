// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_orders_subscription.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPrivateOrdersSubscriptionData>
    _$gPrivateOrdersSubscriptionDataSerializer =
    new _$GPrivateOrdersSubscriptionDataSerializer();
Serializer<GPrivateOrdersSubscriptionData_privateOrders>
    _$gPrivateOrdersSubscriptionDataPrivateOrdersSerializer =
    new _$GPrivateOrdersSubscriptionData_privateOrdersSerializer();
Serializer<GPrivateOrdersSubscriptionData_privateOrders_user>
    _$gPrivateOrdersSubscriptionDataPrivateOrdersUserSerializer =
    new _$GPrivateOrdersSubscriptionData_privateOrders_userSerializer();
Serializer<GPrivateOrdersSubscriptionData_privateOrders_Market>
    _$gPrivateOrdersSubscriptionDataPrivateOrdersMarketSerializer =
    new _$GPrivateOrdersSubscriptionData_privateOrders_MarketSerializer();
Serializer<GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency>
    _$gPrivateOrdersSubscriptionDataPrivateOrdersMarketQuoteCurrencySerializer =
    new _$GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencySerializer();
Serializer<GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency>
    _$gPrivateOrdersSubscriptionDataPrivateOrdersMarketBaseCurrencySerializer =
    new _$GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencySerializer();
Serializer<GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics>
    _$gPrivateOrdersSubscriptionDataPrivateOrdersMarketMarketDynamicsSerializer =
    new _$GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsSerializer();

class _$GPrivateOrdersSubscriptionDataSerializer
    implements StructuredSerializer<GPrivateOrdersSubscriptionData> {
  @override
  final Iterable<Type> types = const [
    GPrivateOrdersSubscriptionData,
    _$GPrivateOrdersSubscriptionData
  ];
  @override
  final String wireName = 'GPrivateOrdersSubscriptionData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPrivateOrdersSubscriptionData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.privateOrders;
    if (value != null) {
      result
        ..add('privateOrders')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GPrivateOrdersSubscriptionData_privateOrders)));
    }
    return result;
  }

  @override
  GPrivateOrdersSubscriptionData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPrivateOrdersSubscriptionDataBuilder();

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
        case 'privateOrders':
          result.privateOrders.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GPrivateOrdersSubscriptionData_privateOrders))!
              as GPrivateOrdersSubscriptionData_privateOrders);
          break;
      }
    }

    return result.build();
  }
}

class _$GPrivateOrdersSubscriptionData_privateOrdersSerializer
    implements
        StructuredSerializer<GPrivateOrdersSubscriptionData_privateOrders> {
  @override
  final Iterable<Type> types = const [
    GPrivateOrdersSubscriptionData_privateOrders,
    _$GPrivateOrdersSubscriptionData_privateOrders
  ];
  @override
  final String wireName = 'GPrivateOrdersSubscriptionData_privateOrders';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPrivateOrdersSubscriptionData_privateOrders object,
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
            specifiedType: const FullType(
                GPrivateOrdersSubscriptionData_privateOrders_user)));
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
    value = object.Market;
    if (value != null) {
      result
        ..add('Market')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GPrivateOrdersSubscriptionData_privateOrders_Market)));
    }
    return result;
  }

  @override
  GPrivateOrdersSubscriptionData_privateOrders deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPrivateOrdersSubscriptionData_privateOrdersBuilder();

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
                  specifiedType: const FullType(
                      GPrivateOrdersSubscriptionData_privateOrders_user))!
              as GPrivateOrdersSubscriptionData_privateOrders_user);
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
        case 'Market':
          result.Market.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GPrivateOrdersSubscriptionData_privateOrders_Market))!
              as GPrivateOrdersSubscriptionData_privateOrders_Market);
          break;
      }
    }

    return result.build();
  }
}

class _$GPrivateOrdersSubscriptionData_privateOrders_userSerializer
    implements
        StructuredSerializer<
            GPrivateOrdersSubscriptionData_privateOrders_user> {
  @override
  final Iterable<Type> types = const [
    GPrivateOrdersSubscriptionData_privateOrders_user,
    _$GPrivateOrdersSubscriptionData_privateOrders_user
  ];
  @override
  final String wireName = 'GPrivateOrdersSubscriptionData_privateOrders_user';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPrivateOrdersSubscriptionData_privateOrders_user object,
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
  GPrivateOrdersSubscriptionData_privateOrders_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GPrivateOrdersSubscriptionData_privateOrders_userBuilder();

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

class _$GPrivateOrdersSubscriptionData_privateOrders_MarketSerializer
    implements
        StructuredSerializer<
            GPrivateOrdersSubscriptionData_privateOrders_Market> {
  @override
  final Iterable<Type> types = const [
    GPrivateOrdersSubscriptionData_privateOrders_Market,
    _$GPrivateOrdersSubscriptionData_privateOrders_Market
  ];
  @override
  final String wireName = 'GPrivateOrdersSubscriptionData_privateOrders_Market';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPrivateOrdersSubscriptionData_privateOrders_Market object,
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
                GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency)));
    }
    value = object.base_currency;
    if (value != null) {
      result
        ..add('base_currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency)));
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
                GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics)));
    }
    return result;
  }

  @override
  GPrivateOrdersSubscriptionData_privateOrders_Market deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder();

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
                      GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency))!
              as GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency);
          break;
        case 'base_currency':
          result.base_currency.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency))!
              as GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency);
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
                      GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics))!
              as GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics);
          break;
      }
    }

    return result.build();
  }
}

class _$GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencySerializer
    implements
        StructuredSerializer<
            GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency> {
  @override
  final Iterable<Type> types = const [
    GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency,
    _$GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency
  ];
  @override
  final String wireName =
      'GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency object,
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
  GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder();

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

class _$GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencySerializer
    implements
        StructuredSerializer<
            GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency> {
  @override
  final Iterable<Type> types = const [
    GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency,
    _$GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency
  ];
  @override
  final String wireName =
      'GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency object,
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
  GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder();

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

class _$GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsSerializer
    implements
        StructuredSerializer<
            GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics> {
  @override
  final Iterable<Type> types = const [
    GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics,
    _$GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics
  ];
  @override
  final String wireName =
      'GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics object,
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
  GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder();

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

class _$GPrivateOrdersSubscriptionData extends GPrivateOrdersSubscriptionData {
  @override
  final String G__typename;
  @override
  final GPrivateOrdersSubscriptionData_privateOrders? privateOrders;

  factory _$GPrivateOrdersSubscriptionData(
          [void Function(GPrivateOrdersSubscriptionDataBuilder)? updates]) =>
      (new GPrivateOrdersSubscriptionDataBuilder()..update(updates))._build();

  _$GPrivateOrdersSubscriptionData._(
      {required this.G__typename, this.privateOrders})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPrivateOrdersSubscriptionData', 'G__typename');
  }

  @override
  GPrivateOrdersSubscriptionData rebuild(
          void Function(GPrivateOrdersSubscriptionDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPrivateOrdersSubscriptionDataBuilder toBuilder() =>
      new GPrivateOrdersSubscriptionDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPrivateOrdersSubscriptionData &&
        G__typename == other.G__typename &&
        privateOrders == other.privateOrders;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, privateOrders.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPrivateOrdersSubscriptionData')
          ..add('G__typename', G__typename)
          ..add('privateOrders', privateOrders))
        .toString();
  }
}

class GPrivateOrdersSubscriptionDataBuilder
    implements
        Builder<GPrivateOrdersSubscriptionData,
            GPrivateOrdersSubscriptionDataBuilder> {
  _$GPrivateOrdersSubscriptionData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GPrivateOrdersSubscriptionData_privateOrdersBuilder? _privateOrders;
  GPrivateOrdersSubscriptionData_privateOrdersBuilder get privateOrders =>
      _$this._privateOrders ??=
          new GPrivateOrdersSubscriptionData_privateOrdersBuilder();
  set privateOrders(
          GPrivateOrdersSubscriptionData_privateOrdersBuilder? privateOrders) =>
      _$this._privateOrders = privateOrders;

  GPrivateOrdersSubscriptionDataBuilder() {
    GPrivateOrdersSubscriptionData._initializeBuilder(this);
  }

  GPrivateOrdersSubscriptionDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _privateOrders = $v.privateOrders?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPrivateOrdersSubscriptionData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPrivateOrdersSubscriptionData;
  }

  @override
  void update(void Function(GPrivateOrdersSubscriptionDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPrivateOrdersSubscriptionData build() => _build();

  _$GPrivateOrdersSubscriptionData _build() {
    _$GPrivateOrdersSubscriptionData _$result;
    try {
      _$result = _$v ??
          new _$GPrivateOrdersSubscriptionData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GPrivateOrdersSubscriptionData', 'G__typename'),
              privateOrders: _privateOrders?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'privateOrders';
        _privateOrders?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPrivateOrdersSubscriptionData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPrivateOrdersSubscriptionData_privateOrders
    extends GPrivateOrdersSubscriptionData_privateOrders {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? market;
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
  final GPrivateOrdersSubscriptionData_privateOrders_user? user;
  @override
  final double? amount;
  @override
  final double? price;
  @override
  final String? createdAt;
  @override
  final GPrivateOrdersSubscriptionData_privateOrders_Market? Market;

  factory _$GPrivateOrdersSubscriptionData_privateOrders(
          [void Function(GPrivateOrdersSubscriptionData_privateOrdersBuilder)?
              updates]) =>
      (new GPrivateOrdersSubscriptionData_privateOrdersBuilder()
            ..update(updates))
          ._build();

  _$GPrivateOrdersSubscriptionData_privateOrders._(
      {required this.G__typename,
      this.id,
      this.market,
      this.type,
      this.side,
      this.status,
      this.executedAmount,
      this.executedVolume,
      this.user,
      this.amount,
      this.price,
      this.createdAt,
      this.Market})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GPrivateOrdersSubscriptionData_privateOrders', 'G__typename');
  }

  @override
  GPrivateOrdersSubscriptionData_privateOrders rebuild(
          void Function(GPrivateOrdersSubscriptionData_privateOrdersBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPrivateOrdersSubscriptionData_privateOrdersBuilder toBuilder() =>
      new GPrivateOrdersSubscriptionData_privateOrdersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPrivateOrdersSubscriptionData_privateOrders &&
        G__typename == other.G__typename &&
        id == other.id &&
        market == other.market &&
        type == other.type &&
        side == other.side &&
        status == other.status &&
        executedAmount == other.executedAmount &&
        executedVolume == other.executedVolume &&
        user == other.user &&
        amount == other.amount &&
        price == other.price &&
        createdAt == other.createdAt &&
        Market == other.Market;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, market.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, side.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, executedAmount.hashCode);
    _$hash = $jc(_$hash, executedVolume.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, Market.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPrivateOrdersSubscriptionData_privateOrders')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('market', market)
          ..add('type', type)
          ..add('side', side)
          ..add('status', status)
          ..add('executedAmount', executedAmount)
          ..add('executedVolume', executedVolume)
          ..add('user', user)
          ..add('amount', amount)
          ..add('price', price)
          ..add('createdAt', createdAt)
          ..add('Market', Market))
        .toString();
  }
}

class GPrivateOrdersSubscriptionData_privateOrdersBuilder
    implements
        Builder<GPrivateOrdersSubscriptionData_privateOrders,
            GPrivateOrdersSubscriptionData_privateOrdersBuilder> {
  _$GPrivateOrdersSubscriptionData_privateOrders? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

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

  GPrivateOrdersSubscriptionData_privateOrders_userBuilder? _user;
  GPrivateOrdersSubscriptionData_privateOrders_userBuilder get user =>
      _$this._user ??=
          new GPrivateOrdersSubscriptionData_privateOrders_userBuilder();
  set user(GPrivateOrdersSubscriptionData_privateOrders_userBuilder? user) =>
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

  GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder? _Market;
  GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder get Market =>
      _$this._Market ??=
          new GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder();
  set Market(
          GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder? Market) =>
      _$this._Market = Market;

  GPrivateOrdersSubscriptionData_privateOrdersBuilder() {
    GPrivateOrdersSubscriptionData_privateOrders._initializeBuilder(this);
  }

  GPrivateOrdersSubscriptionData_privateOrdersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _market = $v.market;
      _type = $v.type;
      _side = $v.side;
      _status = $v.status;
      _executedAmount = $v.executedAmount;
      _executedVolume = $v.executedVolume;
      _user = $v.user?.toBuilder();
      _amount = $v.amount;
      _price = $v.price;
      _createdAt = $v.createdAt;
      _Market = $v.Market?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPrivateOrdersSubscriptionData_privateOrders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPrivateOrdersSubscriptionData_privateOrders;
  }

  @override
  void update(
      void Function(GPrivateOrdersSubscriptionData_privateOrdersBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPrivateOrdersSubscriptionData_privateOrders build() => _build();

  _$GPrivateOrdersSubscriptionData_privateOrders _build() {
    _$GPrivateOrdersSubscriptionData_privateOrders _$result;
    try {
      _$result = _$v ??
          new _$GPrivateOrdersSubscriptionData_privateOrders._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GPrivateOrdersSubscriptionData_privateOrders',
                  'G__typename'),
              id: id,
              market: market,
              type: type,
              side: side,
              status: status,
              executedAmount: executedAmount,
              executedVolume: executedVolume,
              user: _user?.build(),
              amount: amount,
              price: price,
              createdAt: createdAt,
              Market: _Market?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();

        _$failedField = 'Market';
        _Market?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPrivateOrdersSubscriptionData_privateOrders',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPrivateOrdersSubscriptionData_privateOrders_user
    extends GPrivateOrdersSubscriptionData_privateOrders_user {
  @override
  final String G__typename;
  @override
  final String? id;

  factory _$GPrivateOrdersSubscriptionData_privateOrders_user(
          [void Function(
                  GPrivateOrdersSubscriptionData_privateOrders_userBuilder)?
              updates]) =>
      (new GPrivateOrdersSubscriptionData_privateOrders_userBuilder()
            ..update(updates))
          ._build();

  _$GPrivateOrdersSubscriptionData_privateOrders_user._(
      {required this.G__typename, this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GPrivateOrdersSubscriptionData_privateOrders_user', 'G__typename');
  }

  @override
  GPrivateOrdersSubscriptionData_privateOrders_user rebuild(
          void Function(
                  GPrivateOrdersSubscriptionData_privateOrders_userBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPrivateOrdersSubscriptionData_privateOrders_userBuilder toBuilder() =>
      new GPrivateOrdersSubscriptionData_privateOrders_userBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPrivateOrdersSubscriptionData_privateOrders_user &&
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
            r'GPrivateOrdersSubscriptionData_privateOrders_user')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GPrivateOrdersSubscriptionData_privateOrders_userBuilder
    implements
        Builder<GPrivateOrdersSubscriptionData_privateOrders_user,
            GPrivateOrdersSubscriptionData_privateOrders_userBuilder> {
  _$GPrivateOrdersSubscriptionData_privateOrders_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GPrivateOrdersSubscriptionData_privateOrders_userBuilder() {
    GPrivateOrdersSubscriptionData_privateOrders_user._initializeBuilder(this);
  }

  GPrivateOrdersSubscriptionData_privateOrders_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPrivateOrdersSubscriptionData_privateOrders_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPrivateOrdersSubscriptionData_privateOrders_user;
  }

  @override
  void update(
      void Function(GPrivateOrdersSubscriptionData_privateOrders_userBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPrivateOrdersSubscriptionData_privateOrders_user build() => _build();

  _$GPrivateOrdersSubscriptionData_privateOrders_user _build() {
    final _$result = _$v ??
        new _$GPrivateOrdersSubscriptionData_privateOrders_user._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GPrivateOrdersSubscriptionData_privateOrders_user',
                'G__typename'),
            id: id);
    replace(_$result);
    return _$result;
  }
}

class _$GPrivateOrdersSubscriptionData_privateOrders_Market
    extends GPrivateOrdersSubscriptionData_privateOrders_Market {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final double? rate;
  @override
  final bool? enable_trading;
  @override
  final GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency?
      quote_currency;
  @override
  final GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency?
      base_currency;
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
  final GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics?
      marketDynamics;

  factory _$GPrivateOrdersSubscriptionData_privateOrders_Market(
          [void Function(
                  GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder)?
              updates]) =>
      (new GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder()
            ..update(updates))
          ._build();

  _$GPrivateOrdersSubscriptionData_privateOrders_Market._(
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
        r'GPrivateOrdersSubscriptionData_privateOrders_Market', 'G__typename');
  }

  @override
  GPrivateOrdersSubscriptionData_privateOrders_Market rebuild(
          void Function(
                  GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder toBuilder() =>
      new GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPrivateOrdersSubscriptionData_privateOrders_Market &&
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
            r'GPrivateOrdersSubscriptionData_privateOrders_Market')
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

class GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder
    implements
        Builder<GPrivateOrdersSubscriptionData_privateOrders_Market,
            GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder> {
  _$GPrivateOrdersSubscriptionData_privateOrders_Market? _$v;

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

  GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder?
      _quote_currency;
  GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder
      get quote_currency => _$this._quote_currency ??=
          new GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder();
  set quote_currency(
          GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder?
              quote_currency) =>
      _$this._quote_currency = quote_currency;

  GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder?
      _base_currency;
  GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder
      get base_currency => _$this._base_currency ??=
          new GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder();
  set base_currency(
          GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder?
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

  GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder?
      _marketDynamics;
  GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder
      get marketDynamics => _$this._marketDynamics ??=
          new GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder();
  set marketDynamics(
          GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder?
              marketDynamics) =>
      _$this._marketDynamics = marketDynamics;

  GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder() {
    GPrivateOrdersSubscriptionData_privateOrders_Market._initializeBuilder(
        this);
  }

  GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder get _$this {
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
  void replace(GPrivateOrdersSubscriptionData_privateOrders_Market other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPrivateOrdersSubscriptionData_privateOrders_Market;
  }

  @override
  void update(
      void Function(GPrivateOrdersSubscriptionData_privateOrders_MarketBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPrivateOrdersSubscriptionData_privateOrders_Market build() => _build();

  _$GPrivateOrdersSubscriptionData_privateOrders_Market _build() {
    _$GPrivateOrdersSubscriptionData_privateOrders_Market _$result;
    try {
      _$result = _$v ??
          new _$GPrivateOrdersSubscriptionData_privateOrders_Market._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GPrivateOrdersSubscriptionData_privateOrders_Market',
                  'G__typename'),
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
            r'GPrivateOrdersSubscriptionData_privateOrders_Market',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency
    extends GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency {
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

  factory _$GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency(
          [void Function(
                  GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder)?
              updates]) =>
      (new GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder()
            ..update(updates))
          ._build();

  _$GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency._(
      {required this.G__typename,
      this.id,
      this.precision,
      this.icon_url,
      this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency',
        'G__typename');
  }

  @override
  GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency rebuild(
          void Function(
                  GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder
      toBuilder() =>
          new GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency &&
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
            r'GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('precision', precision)
          ..add('icon_url', icon_url)
          ..add('name', name))
        .toString();
  }
}

class GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder
    implements
        Builder<
            GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency,
            GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder> {
  _$GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency? _$v;

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

  GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder() {
    GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency
        ._initializeBuilder(this);
  }

  GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder
      get _$this {
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
      GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency;
  }

  @override
  void update(
      void Function(
              GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currencyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency build() =>
      _build();

  _$GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency
      _build() {
    final _$result = _$v ??
        new _$GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GPrivateOrdersSubscriptionData_privateOrders_Market_quote_currency',
                'G__typename'),
            id: id,
            precision: precision,
            icon_url: icon_url,
            name: name);
    replace(_$result);
    return _$result;
  }
}

class _$GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency
    extends GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency {
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

  factory _$GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency(
          [void Function(
                  GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder)?
              updates]) =>
      (new GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder()
            ..update(updates))
          ._build();

  _$GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency._(
      {required this.G__typename,
      this.id,
      this.precision,
      this.icon_url,
      this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency',
        'G__typename');
  }

  @override
  GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency rebuild(
          void Function(
                  GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder
      toBuilder() =>
          new GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency &&
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
            r'GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('precision', precision)
          ..add('icon_url', icon_url)
          ..add('name', name))
        .toString();
  }
}

class GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder
    implements
        Builder<
            GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency,
            GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder> {
  _$GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency? _$v;

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

  GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder() {
    GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency
        ._initializeBuilder(this);
  }

  GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder
      get _$this {
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
      GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency;
  }

  @override
  void update(
      void Function(
              GPrivateOrdersSubscriptionData_privateOrders_Market_base_currencyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency build() =>
      _build();

  _$GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency _build() {
    final _$result = _$v ??
        new _$GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GPrivateOrdersSubscriptionData_privateOrders_Market_base_currency',
                'G__typename'),
            id: id,
            precision: precision,
            icon_url: icon_url,
            name: name);
    replace(_$result);
    return _$result;
  }
}

class _$GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics
    extends GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics {
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

  factory _$GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics(
          [void Function(
                  GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder)?
              updates]) =>
      (new GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder()
            ..update(updates))
          ._build();

  _$GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics._(
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
        r'GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics',
        'G__typename');
  }

  @override
  GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics rebuild(
          void Function(
                  GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder
      toBuilder() =>
          new GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics &&
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
            r'GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics')
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

class GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder
    implements
        Builder<
            GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics,
            GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder> {
  _$GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics? _$v;

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

  GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder() {
    GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics
        ._initializeBuilder(this);
  }

  GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder
      get _$this {
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
      GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics;
  }

  @override
  void update(
      void Function(
              GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamicsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics build() =>
      _build();

  _$GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics
      _build() {
    final _$result = _$v ??
        new _$GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GPrivateOrdersSubscriptionData_privateOrders_Market_marketDynamics',
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
