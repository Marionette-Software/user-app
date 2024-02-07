// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_withdraw_wallet_payment_interface.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetWithdrawWalletPaymentInterfaceData>
    _$gGetWithdrawWalletPaymentInterfaceDataSerializer =
    new _$GGetWithdrawWalletPaymentInterfaceDataSerializer();
Serializer<GGetWithdrawWalletPaymentInterfaceData_currency>
    _$gGetWithdrawWalletPaymentInterfaceDataCurrencySerializer =
    new _$GGetWithdrawWalletPaymentInterfaceData_currencySerializer();
Serializer<
        GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces>
    _$gGetWithdrawWalletPaymentInterfaceDataCurrencyWithdrawPaymentInterfacesSerializer =
    new _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesSerializer();
Serializer<
        GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface>
    _$gGetWithdrawWalletPaymentInterfaceDataCurrencyWithdrawPaymentInterfacesPaymentInterfaceSerializer =
    new _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceSerializer();
Serializer<
        GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency>
    _$gGetWithdrawWalletPaymentInterfaceDataCurrencyWithdrawPaymentInterfacesCurrencySerializer =
    new _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencySerializer();
Serializer<
        GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients>
    _$gGetWithdrawWalletPaymentInterfaceDataCurrencyWithdrawPaymentInterfacesRecipientsSerializer =
    new _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsSerializer();

class _$GGetWithdrawWalletPaymentInterfaceDataSerializer
    implements StructuredSerializer<GGetWithdrawWalletPaymentInterfaceData> {
  @override
  final Iterable<Type> types = const [
    GGetWithdrawWalletPaymentInterfaceData,
    _$GGetWithdrawWalletPaymentInterfaceData
  ];
  @override
  final String wireName = 'GGetWithdrawWalletPaymentInterfaceData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetWithdrawWalletPaymentInterfaceData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.currency;
    if (value != null) {
      result
        ..add('currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetWithdrawWalletPaymentInterfaceData_currency)));
    }
    return result;
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetWithdrawWalletPaymentInterfaceDataBuilder();

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
        case 'currency':
          result.currency.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetWithdrawWalletPaymentInterfaceData_currency))!
              as GGetWithdrawWalletPaymentInterfaceData_currency);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetWithdrawWalletPaymentInterfaceData_currencySerializer
    implements
        StructuredSerializer<GGetWithdrawWalletPaymentInterfaceData_currency> {
  @override
  final Iterable<Type> types = const [
    GGetWithdrawWalletPaymentInterfaceData_currency,
    _$GGetWithdrawWalletPaymentInterfaceData_currency
  ];
  @override
  final String wireName = 'GGetWithdrawWalletPaymentInterfaceData_currency';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetWithdrawWalletPaymentInterfaceData_currency object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.withdrawPaymentInterfaces;
    if (value != null) {
      result
        ..add('withdrawPaymentInterfaces')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces)
            ])));
    }
    return result;
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetWithdrawWalletPaymentInterfaceData_currencyBuilder();

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
        case 'withdrawPaymentInterfaces':
          result.withdrawPaymentInterfaces
              .replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType.nullable(
                        GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces)
                  ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesSerializer
    implements
        StructuredSerializer<
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces> {
  @override
  final Iterable<Type> types = const [
    GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces,
    _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces
  ];
  @override
  final String wireName =
      'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces
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
                GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface)));
    }
    value = object.currency;
    if (value != null) {
      result
        ..add('currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency)));
    }
    value = object.recipients;
    if (value != null) {
      result
        ..add('recipients')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(
                  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients)
            ])));
    }
    value = object.recipientSchema;
    if (value != null) {
      result
        ..add('recipientSchema')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.minWithdrawAmount;
    if (value != null) {
      result
        ..add('minWithdrawAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxWithdrawAmount;
    if (value != null) {
      result
        ..add('maxWithdrawAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.withdrawFee;
    if (value != null) {
      result
        ..add('withdrawFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minWithdrawFee;
    if (value != null) {
      result
        ..add('minWithdrawFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxWithdrawFee;
    if (value != null) {
      result
        ..add('maxWithdrawFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxWithdrawAmount24h;
    if (value != null) {
      result
        ..add('maxWithdrawAmount24h')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.withdrawAmount24h;
    if (value != null) {
      result
        ..add('withdrawAmount24h')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesBuilder();

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
                      GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface))!
              as GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface);
          break;
        case 'currency':
          result.currency.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency))!
              as GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency);
          break;
        case 'recipients':
          result.recipients.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients)
              ]))! as BuiltList<Object?>);
          break;
        case 'recipientSchema':
          result.recipientSchema = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'minWithdrawAmount':
          result.minWithdrawAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxWithdrawAmount':
          result.maxWithdrawAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'withdrawFee':
          result.withdrawFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minWithdrawFee':
          result.minWithdrawFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxWithdrawFee':
          result.maxWithdrawFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxWithdrawAmount24h':
          result.maxWithdrawAmount24h = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'withdrawAmount24h':
          result.withdrawAmount24h = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceSerializer
    implements
        StructuredSerializer<
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface> {
  @override
  final Iterable<Type> types = const [
    GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface,
    _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface
  ];
  @override
  final String wireName =
      'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface
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
    return result;
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencySerializer
    implements
        StructuredSerializer<
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency> {
  @override
  final Iterable<Type> types = const [
    GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency,
    _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency
  ];
  @override
  final String wireName =
      'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency
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
    value = object.icon_url;
    if (value != null) {
      result
        ..add('icon_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsSerializer
    implements
        StructuredSerializer<
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients> {
  @override
  final Iterable<Type> types = const [
    GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients,
    _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients
  ];
  @override
  final String wireName =
      'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients
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
    value = object.data;
    if (value != null) {
      result
        ..add('data')
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
    return result;
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsBuilder();

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
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetWithdrawWalletPaymentInterfaceData
    extends GGetWithdrawWalletPaymentInterfaceData {
  @override
  final String G__typename;
  @override
  final GGetWithdrawWalletPaymentInterfaceData_currency? currency;

  factory _$GGetWithdrawWalletPaymentInterfaceData(
          [void Function(GGetWithdrawWalletPaymentInterfaceDataBuilder)?
              updates]) =>
      (new GGetWithdrawWalletPaymentInterfaceDataBuilder()..update(updates))
          ._build();

  _$GGetWithdrawWalletPaymentInterfaceData._(
      {required this.G__typename, this.currency})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetWithdrawWalletPaymentInterfaceData', 'G__typename');
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData rebuild(
          void Function(GGetWithdrawWalletPaymentInterfaceDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetWithdrawWalletPaymentInterfaceDataBuilder toBuilder() =>
      new GGetWithdrawWalletPaymentInterfaceDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetWithdrawWalletPaymentInterfaceData &&
        G__typename == other.G__typename &&
        currency == other.currency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetWithdrawWalletPaymentInterfaceData')
          ..add('G__typename', G__typename)
          ..add('currency', currency))
        .toString();
  }
}

class GGetWithdrawWalletPaymentInterfaceDataBuilder
    implements
        Builder<GGetWithdrawWalletPaymentInterfaceData,
            GGetWithdrawWalletPaymentInterfaceDataBuilder> {
  _$GGetWithdrawWalletPaymentInterfaceData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetWithdrawWalletPaymentInterfaceData_currencyBuilder? _currency;
  GGetWithdrawWalletPaymentInterfaceData_currencyBuilder get currency =>
      _$this._currency ??=
          new GGetWithdrawWalletPaymentInterfaceData_currencyBuilder();
  set currency(
          GGetWithdrawWalletPaymentInterfaceData_currencyBuilder? currency) =>
      _$this._currency = currency;

  GGetWithdrawWalletPaymentInterfaceDataBuilder() {
    GGetWithdrawWalletPaymentInterfaceData._initializeBuilder(this);
  }

  GGetWithdrawWalletPaymentInterfaceDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _currency = $v.currency?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetWithdrawWalletPaymentInterfaceData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetWithdrawWalletPaymentInterfaceData;
  }

  @override
  void update(
      void Function(GGetWithdrawWalletPaymentInterfaceDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData build() => _build();

  _$GGetWithdrawWalletPaymentInterfaceData _build() {
    _$GGetWithdrawWalletPaymentInterfaceData _$result;
    try {
      _$result = _$v ??
          new _$GGetWithdrawWalletPaymentInterfaceData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetWithdrawWalletPaymentInterfaceData', 'G__typename'),
              currency: _currency?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currency';
        _currency?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetWithdrawWalletPaymentInterfaceData',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetWithdrawWalletPaymentInterfaceData_currency
    extends GGetWithdrawWalletPaymentInterfaceData_currency {
  @override
  final String G__typename;
  @override
  final BuiltList<
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces?>?
      withdrawPaymentInterfaces;

  factory _$GGetWithdrawWalletPaymentInterfaceData_currency(
          [void Function(
                  GGetWithdrawWalletPaymentInterfaceData_currencyBuilder)?
              updates]) =>
      (new GGetWithdrawWalletPaymentInterfaceData_currencyBuilder()
            ..update(updates))
          ._build();

  _$GGetWithdrawWalletPaymentInterfaceData_currency._(
      {required this.G__typename, this.withdrawPaymentInterfaces})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetWithdrawWalletPaymentInterfaceData_currency', 'G__typename');
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency rebuild(
          void Function(GGetWithdrawWalletPaymentInterfaceData_currencyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetWithdrawWalletPaymentInterfaceData_currencyBuilder toBuilder() =>
      new GGetWithdrawWalletPaymentInterfaceData_currencyBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetWithdrawWalletPaymentInterfaceData_currency &&
        G__typename == other.G__typename &&
        withdrawPaymentInterfaces == other.withdrawPaymentInterfaces;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, withdrawPaymentInterfaces.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetWithdrawWalletPaymentInterfaceData_currency')
          ..add('G__typename', G__typename)
          ..add('withdrawPaymentInterfaces', withdrawPaymentInterfaces))
        .toString();
  }
}

class GGetWithdrawWalletPaymentInterfaceData_currencyBuilder
    implements
        Builder<GGetWithdrawWalletPaymentInterfaceData_currency,
            GGetWithdrawWalletPaymentInterfaceData_currencyBuilder> {
  _$GGetWithdrawWalletPaymentInterfaceData_currency? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces?>?
      _withdrawPaymentInterfaces;
  ListBuilder<
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces?>
      get withdrawPaymentInterfaces =>
          _$this._withdrawPaymentInterfaces ??= new ListBuilder<
              GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces?>();
  set withdrawPaymentInterfaces(
          ListBuilder<
                  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces?>?
              withdrawPaymentInterfaces) =>
      _$this._withdrawPaymentInterfaces = withdrawPaymentInterfaces;

  GGetWithdrawWalletPaymentInterfaceData_currencyBuilder() {
    GGetWithdrawWalletPaymentInterfaceData_currency._initializeBuilder(this);
  }

  GGetWithdrawWalletPaymentInterfaceData_currencyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _withdrawPaymentInterfaces = $v.withdrawPaymentInterfaces?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetWithdrawWalletPaymentInterfaceData_currency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetWithdrawWalletPaymentInterfaceData_currency;
  }

  @override
  void update(
      void Function(GGetWithdrawWalletPaymentInterfaceData_currencyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency build() => _build();

  _$GGetWithdrawWalletPaymentInterfaceData_currency _build() {
    _$GGetWithdrawWalletPaymentInterfaceData_currency _$result;
    try {
      _$result = _$v ??
          new _$GGetWithdrawWalletPaymentInterfaceData_currency._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetWithdrawWalletPaymentInterfaceData_currency',
                  'G__typename'),
              withdrawPaymentInterfaces: _withdrawPaymentInterfaces?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'withdrawPaymentInterfaces';
        _withdrawPaymentInterfaces?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetWithdrawWalletPaymentInterfaceData_currency',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces
    extends GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces {
  @override
  final String G__typename;
  @override
  final String? type;
  @override
  final GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface?
      paymentInterface;
  @override
  final GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency?
      currency;
  @override
  final BuiltList<
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients?>?
      recipients;
  @override
  final String? recipientSchema;
  @override
  final double? minWithdrawAmount;
  @override
  final double? maxWithdrawAmount;
  @override
  final double? withdrawFee;
  @override
  final double? minWithdrawFee;
  @override
  final double? maxWithdrawFee;
  @override
  final double? maxWithdrawAmount24h;
  @override
  final double? withdrawAmount24h;

  factory _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces(
          [void Function(
                  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesBuilder)?
              updates]) =>
      (new GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesBuilder()
            ..update(updates))
          ._build();

  _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces._(
      {required this.G__typename,
      this.type,
      this.paymentInterface,
      this.currency,
      this.recipients,
      this.recipientSchema,
      this.minWithdrawAmount,
      this.maxWithdrawAmount,
      this.withdrawFee,
      this.minWithdrawFee,
      this.maxWithdrawFee,
      this.maxWithdrawAmount24h,
      this.withdrawAmount24h})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces',
        'G__typename');
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces rebuild(
          void Function(
                  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesBuilder
      toBuilder() =>
          new GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces &&
        G__typename == other.G__typename &&
        type == other.type &&
        paymentInterface == other.paymentInterface &&
        currency == other.currency &&
        recipients == other.recipients &&
        recipientSchema == other.recipientSchema &&
        minWithdrawAmount == other.minWithdrawAmount &&
        maxWithdrawAmount == other.maxWithdrawAmount &&
        withdrawFee == other.withdrawFee &&
        minWithdrawFee == other.minWithdrawFee &&
        maxWithdrawFee == other.maxWithdrawFee &&
        maxWithdrawAmount24h == other.maxWithdrawAmount24h &&
        withdrawAmount24h == other.withdrawAmount24h;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, paymentInterface.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jc(_$hash, recipients.hashCode);
    _$hash = $jc(_$hash, recipientSchema.hashCode);
    _$hash = $jc(_$hash, minWithdrawAmount.hashCode);
    _$hash = $jc(_$hash, maxWithdrawAmount.hashCode);
    _$hash = $jc(_$hash, withdrawFee.hashCode);
    _$hash = $jc(_$hash, minWithdrawFee.hashCode);
    _$hash = $jc(_$hash, maxWithdrawFee.hashCode);
    _$hash = $jc(_$hash, maxWithdrawAmount24h.hashCode);
    _$hash = $jc(_$hash, withdrawAmount24h.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces')
          ..add('G__typename', G__typename)
          ..add('type', type)
          ..add('paymentInterface', paymentInterface)
          ..add('currency', currency)
          ..add('recipients', recipients)
          ..add('recipientSchema', recipientSchema)
          ..add('minWithdrawAmount', minWithdrawAmount)
          ..add('maxWithdrawAmount', maxWithdrawAmount)
          ..add('withdrawFee', withdrawFee)
          ..add('minWithdrawFee', minWithdrawFee)
          ..add('maxWithdrawFee', maxWithdrawFee)
          ..add('maxWithdrawAmount24h', maxWithdrawAmount24h)
          ..add('withdrawAmount24h', withdrawAmount24h))
        .toString();
  }
}

class GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesBuilder
    implements
        Builder<
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces,
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesBuilder> {
  _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder?
      _paymentInterface;
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder
      get paymentInterface => _$this._paymentInterface ??=
          new GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder();
  set paymentInterface(
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder?
              paymentInterface) =>
      _$this._paymentInterface = paymentInterface;

  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder?
      _currency;
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder
      get currency => _$this._currency ??=
          new GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder();
  set currency(
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder?
              currency) =>
      _$this._currency = currency;

  ListBuilder<
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients?>?
      _recipients;
  ListBuilder<
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients?>
      get recipients => _$this._recipients ??= new ListBuilder<
          GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients?>();
  set recipients(
          ListBuilder<
                  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients?>?
              recipients) =>
      _$this._recipients = recipients;

  String? _recipientSchema;
  String? get recipientSchema => _$this._recipientSchema;
  set recipientSchema(String? recipientSchema) =>
      _$this._recipientSchema = recipientSchema;

  double? _minWithdrawAmount;
  double? get minWithdrawAmount => _$this._minWithdrawAmount;
  set minWithdrawAmount(double? minWithdrawAmount) =>
      _$this._minWithdrawAmount = minWithdrawAmount;

  double? _maxWithdrawAmount;
  double? get maxWithdrawAmount => _$this._maxWithdrawAmount;
  set maxWithdrawAmount(double? maxWithdrawAmount) =>
      _$this._maxWithdrawAmount = maxWithdrawAmount;

  double? _withdrawFee;
  double? get withdrawFee => _$this._withdrawFee;
  set withdrawFee(double? withdrawFee) => _$this._withdrawFee = withdrawFee;

  double? _minWithdrawFee;
  double? get minWithdrawFee => _$this._minWithdrawFee;
  set minWithdrawFee(double? minWithdrawFee) =>
      _$this._minWithdrawFee = minWithdrawFee;

  double? _maxWithdrawFee;
  double? get maxWithdrawFee => _$this._maxWithdrawFee;
  set maxWithdrawFee(double? maxWithdrawFee) =>
      _$this._maxWithdrawFee = maxWithdrawFee;

  double? _maxWithdrawAmount24h;
  double? get maxWithdrawAmount24h => _$this._maxWithdrawAmount24h;
  set maxWithdrawAmount24h(double? maxWithdrawAmount24h) =>
      _$this._maxWithdrawAmount24h = maxWithdrawAmount24h;

  double? _withdrawAmount24h;
  double? get withdrawAmount24h => _$this._withdrawAmount24h;
  set withdrawAmount24h(double? withdrawAmount24h) =>
      _$this._withdrawAmount24h = withdrawAmount24h;

  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesBuilder() {
    GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces
        ._initializeBuilder(this);
  }

  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _type = $v.type;
      _paymentInterface = $v.paymentInterface?.toBuilder();
      _currency = $v.currency?.toBuilder();
      _recipients = $v.recipients?.toBuilder();
      _recipientSchema = $v.recipientSchema;
      _minWithdrawAmount = $v.minWithdrawAmount;
      _maxWithdrawAmount = $v.maxWithdrawAmount;
      _withdrawFee = $v.withdrawFee;
      _minWithdrawFee = $v.minWithdrawFee;
      _maxWithdrawFee = $v.maxWithdrawFee;
      _maxWithdrawAmount24h = $v.maxWithdrawAmount24h;
      _withdrawAmount24h = $v.withdrawAmount24h;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces;
  }

  @override
  void update(
      void Function(
              GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfacesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces
      build() => _build();

  _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces
      _build() {
    _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces
        _$result;
    try {
      _$result = _$v ??
          new _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces
                  ._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces',
                  'G__typename'),
              type: type,
              paymentInterface: _paymentInterface?.build(),
              currency: _currency?.build(),
              recipients: _recipients?.build(),
              recipientSchema: recipientSchema,
              minWithdrawAmount: minWithdrawAmount,
              maxWithdrawAmount: maxWithdrawAmount,
              withdrawFee: withdrawFee,
              minWithdrawFee: minWithdrawFee,
              maxWithdrawFee: maxWithdrawFee,
              maxWithdrawAmount24h: maxWithdrawAmount24h,
              withdrawAmount24h: withdrawAmount24h);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'paymentInterface';
        _paymentInterface?.build();
        _$failedField = 'currency';
        _currency?.build();
        _$failedField = 'recipients';
        _recipients?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface
    extends GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface {
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

  factory _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface(
          [void Function(
                  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder)?
              updates]) =>
      (new GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder()
            ..update(updates))
          ._build();

  _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface._(
      {required this.G__typename,
      this.id,
      this.title,
      this.logoUrl,
      this.subtitle})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface',
        'G__typename');
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface
      rebuild(
              void Function(
                      GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder
      toBuilder() =>
          new GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        logoUrl == other.logoUrl &&
        subtitle == other.subtitle;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, logoUrl.hashCode);
    _$hash = $jc(_$hash, subtitle.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('logoUrl', logoUrl)
          ..add('subtitle', subtitle))
        .toString();
  }
}

class GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder
    implements
        Builder<
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface,
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder> {
  _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface?
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

  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder() {
    GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface
        ._initializeBuilder(this);
  }

  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _logoUrl = $v.logoUrl;
      _subtitle = $v.subtitle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface;
  }

  @override
  void update(
      void Function(
              GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterfaceBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface
      build() => _build();

  _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface
      _build() {
    final _$result = _$v ??
        new _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_paymentInterface',
                'G__typename'),
            id: id,
            title: title,
            logoUrl: logoUrl,
            subtitle: subtitle);
    replace(_$result);
    return _$result;
  }
}

class _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency
    extends GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? icon_url;

  factory _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency(
          [void Function(
                  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder)?
              updates]) =>
      (new GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder()
            ..update(updates))
          ._build();

  _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency._(
      {required this.G__typename, this.id, this.name, this.icon_url})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency',
        'G__typename');
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency
      rebuild(
              void Function(
                      GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder
      toBuilder() =>
          new GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        icon_url == other.icon_url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('icon_url', icon_url))
        .toString();
  }
}

class GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder
    implements
        Builder<
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency,
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder> {
  _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency?
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

  String? _icon_url;
  String? get icon_url => _$this._icon_url;
  set icon_url(String? icon_url) => _$this._icon_url = icon_url;

  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder() {
    GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency
        ._initializeBuilder(this);
  }

  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _icon_url = $v.icon_url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency;
  }

  @override
  void update(
      void Function(
              GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currencyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency
      build() => _build();

  _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency
      _build() {
    final _$result = _$v ??
        new _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_currency',
                'G__typename'),
            id: id,
            name: name,
            icon_url: icon_url);
    replace(_$result);
    return _$result;
  }
}

class _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients
    extends GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? data;
  @override
  final String? description;

  factory _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients(
          [void Function(
                  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsBuilder)?
              updates]) =>
      (new GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsBuilder()
            ..update(updates))
          ._build();

  _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients._(
      {required this.G__typename, this.id, this.data, this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients',
        'G__typename');
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients
      rebuild(
              void Function(
                      GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsBuilder
      toBuilder() =>
          new GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients &&
        G__typename == other.G__typename &&
        id == other.id &&
        data == other.data &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('data', data)
          ..add('description', description))
        .toString();
  }
}

class GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsBuilder
    implements
        Builder<
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients,
            GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsBuilder> {
  _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _data;
  String? get data => _$this._data;
  set data(String? data) => _$this._data = data;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsBuilder() {
    GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients
        ._initializeBuilder(this);
  }

  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _data = $v.data;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients;
  }

  @override
  void update(
      void Function(
              GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipientsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients
      build() => _build();

  _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients
      _build() {
    final _$result = _$v ??
        new _$GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients
                ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGetWithdrawWalletPaymentInterfaceData_currency_withdrawPaymentInterfaces_recipients',
                'G__typename'),
            id: id,
            data: data,
            description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
