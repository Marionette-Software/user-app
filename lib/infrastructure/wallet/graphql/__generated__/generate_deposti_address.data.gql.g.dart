// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_deposti_address.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGenerateDepositAddressData>
    _$gGenerateDepositAddressDataSerializer =
    new _$GGenerateDepositAddressDataSerializer();
Serializer<GGenerateDepositAddressData_generateWallet>
    _$gGenerateDepositAddressDataGenerateWalletSerializer =
    new _$GGenerateDepositAddressData_generateWalletSerializer();
Serializer<GGenerateDepositAddressData_generateWallet_paymentInterface>
    _$gGenerateDepositAddressDataGenerateWalletPaymentInterfaceSerializer =
    new _$GGenerateDepositAddressData_generateWallet_paymentInterfaceSerializer();
Serializer<GGenerateDepositAddressData_generateWallet_currency>
    _$gGenerateDepositAddressDataGenerateWalletCurrencySerializer =
    new _$GGenerateDepositAddressData_generateWallet_currencySerializer();
Serializer<GGenerateDepositAddressData_generateWallet_deposit>
    _$gGenerateDepositAddressDataGenerateWalletDepositSerializer =
    new _$GGenerateDepositAddressData_generateWallet_depositSerializer();

class _$GGenerateDepositAddressDataSerializer
    implements StructuredSerializer<GGenerateDepositAddressData> {
  @override
  final Iterable<Type> types = const [
    GGenerateDepositAddressData,
    _$GGenerateDepositAddressData
  ];
  @override
  final String wireName = 'GGenerateDepositAddressData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGenerateDepositAddressData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.generateWallet;
    if (value != null) {
      result
        ..add('generateWallet')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GGenerateDepositAddressData_generateWallet)));
    }
    return result;
  }

  @override
  GGenerateDepositAddressData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGenerateDepositAddressDataBuilder();

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
        case 'generateWallet':
          result.generateWallet.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGenerateDepositAddressData_generateWallet))!
              as GGenerateDepositAddressData_generateWallet);
          break;
      }
    }

    return result.build();
  }
}

class _$GGenerateDepositAddressData_generateWalletSerializer
    implements
        StructuredSerializer<GGenerateDepositAddressData_generateWallet> {
  @override
  final Iterable<Type> types = const [
    GGenerateDepositAddressData_generateWallet,
    _$GGenerateDepositAddressData_generateWallet
  ];
  @override
  final String wireName = 'GGenerateDepositAddressData_generateWallet';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGenerateDepositAddressData_generateWallet object,
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
                GGenerateDepositAddressData_generateWallet_paymentInterface)));
    }
    value = object.currency;
    if (value != null) {
      result
        ..add('currency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGenerateDepositAddressData_generateWallet_currency)));
    }
    value = object.deposit;
    if (value != null) {
      result
        ..add('deposit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGenerateDepositAddressData_generateWallet_deposit)));
    }
    return result;
  }

  @override
  GGenerateDepositAddressData_generateWallet deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGenerateDepositAddressData_generateWalletBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'paymentInterface':
          result.paymentInterface.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGenerateDepositAddressData_generateWallet_paymentInterface))!
              as GGenerateDepositAddressData_generateWallet_paymentInterface);
          break;
        case 'currency':
          result.currency.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGenerateDepositAddressData_generateWallet_currency))!
              as GGenerateDepositAddressData_generateWallet_currency);
          break;
        case 'deposit':
          result.deposit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGenerateDepositAddressData_generateWallet_deposit))!
              as GGenerateDepositAddressData_generateWallet_deposit);
          break;
      }
    }

    return result.build();
  }
}

class _$GGenerateDepositAddressData_generateWallet_paymentInterfaceSerializer
    implements
        StructuredSerializer<
            GGenerateDepositAddressData_generateWallet_paymentInterface> {
  @override
  final Iterable<Type> types = const [
    GGenerateDepositAddressData_generateWallet_paymentInterface,
    _$GGenerateDepositAddressData_generateWallet_paymentInterface
  ];
  @override
  final String wireName =
      'GGenerateDepositAddressData_generateWallet_paymentInterface';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGenerateDepositAddressData_generateWallet_paymentInterface object,
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
  GGenerateDepositAddressData_generateWallet_paymentInterface deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder();

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

class _$GGenerateDepositAddressData_generateWallet_currencySerializer
    implements
        StructuredSerializer<
            GGenerateDepositAddressData_generateWallet_currency> {
  @override
  final Iterable<Type> types = const [
    GGenerateDepositAddressData_generateWallet_currency,
    _$GGenerateDepositAddressData_generateWallet_currency
  ];
  @override
  final String wireName = 'GGenerateDepositAddressData_generateWallet_currency';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGenerateDepositAddressData_generateWallet_currency object,
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
  GGenerateDepositAddressData_generateWallet_currency deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGenerateDepositAddressData_generateWallet_currencyBuilder();

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
        case 'icon_url':
          result.icon_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGenerateDepositAddressData_generateWallet_depositSerializer
    implements
        StructuredSerializer<
            GGenerateDepositAddressData_generateWallet_deposit> {
  @override
  final Iterable<Type> types = const [
    GGenerateDepositAddressData_generateWallet_deposit,
    _$GGenerateDepositAddressData_generateWallet_deposit
  ];
  @override
  final String wireName = 'GGenerateDepositAddressData_generateWallet_deposit';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGenerateDepositAddressData_generateWallet_deposit object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.encodedAddress;
    if (value != null) {
      result
        ..add('encodedAddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.redirectUrl;
    if (value != null) {
      result
        ..add('redirectUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.depositCommission;
    if (value != null) {
      result
        ..add('depositCommission')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minDepositCommission;
    if (value != null) {
      result
        ..add('minDepositCommission')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxDepositCommission;
    if (value != null) {
      result
        ..add('maxDepositCommission')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minDepositAmount;
    if (value != null) {
      result
        ..add('minDepositAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxDepositAmount;
    if (value != null) {
      result
        ..add('maxDepositAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GGenerateDepositAddressData_generateWallet_deposit deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGenerateDepositAddressData_generateWallet_depositBuilder();

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
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'encodedAddress':
          result.encodedAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'redirectUrl':
          result.redirectUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'depositCommission':
          result.depositCommission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minDepositCommission':
          result.minDepositCommission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxDepositCommission':
          result.maxDepositCommission = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minDepositAmount':
          result.minDepositAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxDepositAmount':
          result.maxDepositAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGenerateDepositAddressData extends GGenerateDepositAddressData {
  @override
  final String G__typename;
  @override
  final GGenerateDepositAddressData_generateWallet? generateWallet;

  factory _$GGenerateDepositAddressData(
          [void Function(GGenerateDepositAddressDataBuilder)? updates]) =>
      (new GGenerateDepositAddressDataBuilder()..update(updates))._build();

  _$GGenerateDepositAddressData._(
      {required this.G__typename, this.generateWallet})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGenerateDepositAddressData', 'G__typename');
  }

  @override
  GGenerateDepositAddressData rebuild(
          void Function(GGenerateDepositAddressDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGenerateDepositAddressDataBuilder toBuilder() =>
      new GGenerateDepositAddressDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGenerateDepositAddressData &&
        G__typename == other.G__typename &&
        generateWallet == other.generateWallet;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, generateWallet.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGenerateDepositAddressData')
          ..add('G__typename', G__typename)
          ..add('generateWallet', generateWallet))
        .toString();
  }
}

class GGenerateDepositAddressDataBuilder
    implements
        Builder<GGenerateDepositAddressData,
            GGenerateDepositAddressDataBuilder> {
  _$GGenerateDepositAddressData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGenerateDepositAddressData_generateWalletBuilder? _generateWallet;
  GGenerateDepositAddressData_generateWalletBuilder get generateWallet =>
      _$this._generateWallet ??=
          new GGenerateDepositAddressData_generateWalletBuilder();
  set generateWallet(
          GGenerateDepositAddressData_generateWalletBuilder? generateWallet) =>
      _$this._generateWallet = generateWallet;

  GGenerateDepositAddressDataBuilder() {
    GGenerateDepositAddressData._initializeBuilder(this);
  }

  GGenerateDepositAddressDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _generateWallet = $v.generateWallet?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGenerateDepositAddressData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGenerateDepositAddressData;
  }

  @override
  void update(void Function(GGenerateDepositAddressDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGenerateDepositAddressData build() => _build();

  _$GGenerateDepositAddressData _build() {
    _$GGenerateDepositAddressData _$result;
    try {
      _$result = _$v ??
          new _$GGenerateDepositAddressData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGenerateDepositAddressData', 'G__typename'),
              generateWallet: _generateWallet?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'generateWallet';
        _generateWallet?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGenerateDepositAddressData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGenerateDepositAddressData_generateWallet
    extends GGenerateDepositAddressData_generateWallet {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? type;
  @override
  final GGenerateDepositAddressData_generateWallet_paymentInterface?
      paymentInterface;
  @override
  final GGenerateDepositAddressData_generateWallet_currency? currency;
  @override
  final GGenerateDepositAddressData_generateWallet_deposit? deposit;

  factory _$GGenerateDepositAddressData_generateWallet(
          [void Function(GGenerateDepositAddressData_generateWalletBuilder)?
              updates]) =>
      (new GGenerateDepositAddressData_generateWalletBuilder()..update(updates))
          ._build();

  _$GGenerateDepositAddressData_generateWallet._(
      {required this.G__typename,
      this.id,
      this.type,
      this.paymentInterface,
      this.currency,
      this.deposit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGenerateDepositAddressData_generateWallet', 'G__typename');
  }

  @override
  GGenerateDepositAddressData_generateWallet rebuild(
          void Function(GGenerateDepositAddressData_generateWalletBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGenerateDepositAddressData_generateWalletBuilder toBuilder() =>
      new GGenerateDepositAddressData_generateWalletBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGenerateDepositAddressData_generateWallet &&
        G__typename == other.G__typename &&
        id == other.id &&
        type == other.type &&
        paymentInterface == other.paymentInterface &&
        currency == other.currency &&
        deposit == other.deposit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, paymentInterface.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jc(_$hash, deposit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGenerateDepositAddressData_generateWallet')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('type', type)
          ..add('paymentInterface', paymentInterface)
          ..add('currency', currency)
          ..add('deposit', deposit))
        .toString();
  }
}

class GGenerateDepositAddressData_generateWalletBuilder
    implements
        Builder<GGenerateDepositAddressData_generateWallet,
            GGenerateDepositAddressData_generateWalletBuilder> {
  _$GGenerateDepositAddressData_generateWallet? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder?
      _paymentInterface;
  GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder
      get paymentInterface => _$this._paymentInterface ??=
          new GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder();
  set paymentInterface(
          GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder?
              paymentInterface) =>
      _$this._paymentInterface = paymentInterface;

  GGenerateDepositAddressData_generateWallet_currencyBuilder? _currency;
  GGenerateDepositAddressData_generateWallet_currencyBuilder get currency =>
      _$this._currency ??=
          new GGenerateDepositAddressData_generateWallet_currencyBuilder();
  set currency(
          GGenerateDepositAddressData_generateWallet_currencyBuilder?
              currency) =>
      _$this._currency = currency;

  GGenerateDepositAddressData_generateWallet_depositBuilder? _deposit;
  GGenerateDepositAddressData_generateWallet_depositBuilder get deposit =>
      _$this._deposit ??=
          new GGenerateDepositAddressData_generateWallet_depositBuilder();
  set deposit(
          GGenerateDepositAddressData_generateWallet_depositBuilder? deposit) =>
      _$this._deposit = deposit;

  GGenerateDepositAddressData_generateWalletBuilder() {
    GGenerateDepositAddressData_generateWallet._initializeBuilder(this);
  }

  GGenerateDepositAddressData_generateWalletBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _type = $v.type;
      _paymentInterface = $v.paymentInterface?.toBuilder();
      _currency = $v.currency?.toBuilder();
      _deposit = $v.deposit?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGenerateDepositAddressData_generateWallet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGenerateDepositAddressData_generateWallet;
  }

  @override
  void update(
      void Function(GGenerateDepositAddressData_generateWalletBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGenerateDepositAddressData_generateWallet build() => _build();

  _$GGenerateDepositAddressData_generateWallet _build() {
    _$GGenerateDepositAddressData_generateWallet _$result;
    try {
      _$result = _$v ??
          new _$GGenerateDepositAddressData_generateWallet._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGenerateDepositAddressData_generateWallet', 'G__typename'),
              id: id,
              type: type,
              paymentInterface: _paymentInterface?.build(),
              currency: _currency?.build(),
              deposit: _deposit?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'paymentInterface';
        _paymentInterface?.build();
        _$failedField = 'currency';
        _currency?.build();
        _$failedField = 'deposit';
        _deposit?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGenerateDepositAddressData_generateWallet',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGenerateDepositAddressData_generateWallet_paymentInterface
    extends GGenerateDepositAddressData_generateWallet_paymentInterface {
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

  factory _$GGenerateDepositAddressData_generateWallet_paymentInterface(
          [void Function(
                  GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder)?
              updates]) =>
      (new GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder()
            ..update(updates))
          ._build();

  _$GGenerateDepositAddressData_generateWallet_paymentInterface._(
      {required this.G__typename,
      this.id,
      this.title,
      this.logoUrl,
      this.subtitle})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GGenerateDepositAddressData_generateWallet_paymentInterface',
        'G__typename');
  }

  @override
  GGenerateDepositAddressData_generateWallet_paymentInterface rebuild(
          void Function(
                  GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder
      toBuilder() =>
          new GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGenerateDepositAddressData_generateWallet_paymentInterface &&
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
            r'GGenerateDepositAddressData_generateWallet_paymentInterface')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('logoUrl', logoUrl)
          ..add('subtitle', subtitle))
        .toString();
  }
}

class GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder
    implements
        Builder<GGenerateDepositAddressData_generateWallet_paymentInterface,
            GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder> {
  _$GGenerateDepositAddressData_generateWallet_paymentInterface? _$v;

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

  GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder() {
    GGenerateDepositAddressData_generateWallet_paymentInterface
        ._initializeBuilder(this);
  }

  GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder
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
      GGenerateDepositAddressData_generateWallet_paymentInterface other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v =
        other as _$GGenerateDepositAddressData_generateWallet_paymentInterface;
  }

  @override
  void update(
      void Function(
              GGenerateDepositAddressData_generateWallet_paymentInterfaceBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGenerateDepositAddressData_generateWallet_paymentInterface build() =>
      _build();

  _$GGenerateDepositAddressData_generateWallet_paymentInterface _build() {
    final _$result = _$v ??
        new _$GGenerateDepositAddressData_generateWallet_paymentInterface._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGenerateDepositAddressData_generateWallet_paymentInterface',
                'G__typename'),
            id: id,
            title: title,
            logoUrl: logoUrl,
            subtitle: subtitle);
    replace(_$result);
    return _$result;
  }
}

class _$GGenerateDepositAddressData_generateWallet_currency
    extends GGenerateDepositAddressData_generateWallet_currency {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? icon_url;

  factory _$GGenerateDepositAddressData_generateWallet_currency(
          [void Function(
                  GGenerateDepositAddressData_generateWallet_currencyBuilder)?
              updates]) =>
      (new GGenerateDepositAddressData_generateWallet_currencyBuilder()
            ..update(updates))
          ._build();

  _$GGenerateDepositAddressData_generateWallet_currency._(
      {required this.G__typename, this.id, this.icon_url})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGenerateDepositAddressData_generateWallet_currency', 'G__typename');
  }

  @override
  GGenerateDepositAddressData_generateWallet_currency rebuild(
          void Function(
                  GGenerateDepositAddressData_generateWallet_currencyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGenerateDepositAddressData_generateWallet_currencyBuilder toBuilder() =>
      new GGenerateDepositAddressData_generateWallet_currencyBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGenerateDepositAddressData_generateWallet_currency &&
        G__typename == other.G__typename &&
        id == other.id &&
        icon_url == other.icon_url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, icon_url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGenerateDepositAddressData_generateWallet_currency')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('icon_url', icon_url))
        .toString();
  }
}

class GGenerateDepositAddressData_generateWallet_currencyBuilder
    implements
        Builder<GGenerateDepositAddressData_generateWallet_currency,
            GGenerateDepositAddressData_generateWallet_currencyBuilder> {
  _$GGenerateDepositAddressData_generateWallet_currency? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _icon_url;
  String? get icon_url => _$this._icon_url;
  set icon_url(String? icon_url) => _$this._icon_url = icon_url;

  GGenerateDepositAddressData_generateWallet_currencyBuilder() {
    GGenerateDepositAddressData_generateWallet_currency._initializeBuilder(
        this);
  }

  GGenerateDepositAddressData_generateWallet_currencyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _icon_url = $v.icon_url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGenerateDepositAddressData_generateWallet_currency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGenerateDepositAddressData_generateWallet_currency;
  }

  @override
  void update(
      void Function(GGenerateDepositAddressData_generateWallet_currencyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGenerateDepositAddressData_generateWallet_currency build() => _build();

  _$GGenerateDepositAddressData_generateWallet_currency _build() {
    final _$result = _$v ??
        new _$GGenerateDepositAddressData_generateWallet_currency._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGenerateDepositAddressData_generateWallet_currency',
                'G__typename'),
            id: id,
            icon_url: icon_url);
    replace(_$result);
    return _$result;
  }
}

class _$GGenerateDepositAddressData_generateWallet_deposit
    extends GGenerateDepositAddressData_generateWallet_deposit {
  @override
  final String G__typename;
  @override
  final String? address;
  @override
  final String? encodedAddress;
  @override
  final String? redirectUrl;
  @override
  final double? depositCommission;
  @override
  final double? minDepositCommission;
  @override
  final double? maxDepositCommission;
  @override
  final double? minDepositAmount;
  @override
  final double? maxDepositAmount;

  factory _$GGenerateDepositAddressData_generateWallet_deposit(
          [void Function(
                  GGenerateDepositAddressData_generateWallet_depositBuilder)?
              updates]) =>
      (new GGenerateDepositAddressData_generateWallet_depositBuilder()
            ..update(updates))
          ._build();

  _$GGenerateDepositAddressData_generateWallet_deposit._(
      {required this.G__typename,
      this.address,
      this.encodedAddress,
      this.redirectUrl,
      this.depositCommission,
      this.minDepositCommission,
      this.maxDepositCommission,
      this.minDepositAmount,
      this.maxDepositAmount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGenerateDepositAddressData_generateWallet_deposit', 'G__typename');
  }

  @override
  GGenerateDepositAddressData_generateWallet_deposit rebuild(
          void Function(
                  GGenerateDepositAddressData_generateWallet_depositBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGenerateDepositAddressData_generateWallet_depositBuilder toBuilder() =>
      new GGenerateDepositAddressData_generateWallet_depositBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGenerateDepositAddressData_generateWallet_deposit &&
        G__typename == other.G__typename &&
        address == other.address &&
        encodedAddress == other.encodedAddress &&
        redirectUrl == other.redirectUrl &&
        depositCommission == other.depositCommission &&
        minDepositCommission == other.minDepositCommission &&
        maxDepositCommission == other.maxDepositCommission &&
        minDepositAmount == other.minDepositAmount &&
        maxDepositAmount == other.maxDepositAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, encodedAddress.hashCode);
    _$hash = $jc(_$hash, redirectUrl.hashCode);
    _$hash = $jc(_$hash, depositCommission.hashCode);
    _$hash = $jc(_$hash, minDepositCommission.hashCode);
    _$hash = $jc(_$hash, maxDepositCommission.hashCode);
    _$hash = $jc(_$hash, minDepositAmount.hashCode);
    _$hash = $jc(_$hash, maxDepositAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGenerateDepositAddressData_generateWallet_deposit')
          ..add('G__typename', G__typename)
          ..add('address', address)
          ..add('encodedAddress', encodedAddress)
          ..add('redirectUrl', redirectUrl)
          ..add('depositCommission', depositCommission)
          ..add('minDepositCommission', minDepositCommission)
          ..add('maxDepositCommission', maxDepositCommission)
          ..add('minDepositAmount', minDepositAmount)
          ..add('maxDepositAmount', maxDepositAmount))
        .toString();
  }
}

class GGenerateDepositAddressData_generateWallet_depositBuilder
    implements
        Builder<GGenerateDepositAddressData_generateWallet_deposit,
            GGenerateDepositAddressData_generateWallet_depositBuilder> {
  _$GGenerateDepositAddressData_generateWallet_deposit? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _encodedAddress;
  String? get encodedAddress => _$this._encodedAddress;
  set encodedAddress(String? encodedAddress) =>
      _$this._encodedAddress = encodedAddress;

  String? _redirectUrl;
  String? get redirectUrl => _$this._redirectUrl;
  set redirectUrl(String? redirectUrl) => _$this._redirectUrl = redirectUrl;

  double? _depositCommission;
  double? get depositCommission => _$this._depositCommission;
  set depositCommission(double? depositCommission) =>
      _$this._depositCommission = depositCommission;

  double? _minDepositCommission;
  double? get minDepositCommission => _$this._minDepositCommission;
  set minDepositCommission(double? minDepositCommission) =>
      _$this._minDepositCommission = minDepositCommission;

  double? _maxDepositCommission;
  double? get maxDepositCommission => _$this._maxDepositCommission;
  set maxDepositCommission(double? maxDepositCommission) =>
      _$this._maxDepositCommission = maxDepositCommission;

  double? _minDepositAmount;
  double? get minDepositAmount => _$this._minDepositAmount;
  set minDepositAmount(double? minDepositAmount) =>
      _$this._minDepositAmount = minDepositAmount;

  double? _maxDepositAmount;
  double? get maxDepositAmount => _$this._maxDepositAmount;
  set maxDepositAmount(double? maxDepositAmount) =>
      _$this._maxDepositAmount = maxDepositAmount;

  GGenerateDepositAddressData_generateWallet_depositBuilder() {
    GGenerateDepositAddressData_generateWallet_deposit._initializeBuilder(this);
  }

  GGenerateDepositAddressData_generateWallet_depositBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _address = $v.address;
      _encodedAddress = $v.encodedAddress;
      _redirectUrl = $v.redirectUrl;
      _depositCommission = $v.depositCommission;
      _minDepositCommission = $v.minDepositCommission;
      _maxDepositCommission = $v.maxDepositCommission;
      _minDepositAmount = $v.minDepositAmount;
      _maxDepositAmount = $v.maxDepositAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGenerateDepositAddressData_generateWallet_deposit other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGenerateDepositAddressData_generateWallet_deposit;
  }

  @override
  void update(
      void Function(GGenerateDepositAddressData_generateWallet_depositBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGenerateDepositAddressData_generateWallet_deposit build() => _build();

  _$GGenerateDepositAddressData_generateWallet_deposit _build() {
    final _$result = _$v ??
        new _$GGenerateDepositAddressData_generateWallet_deposit._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GGenerateDepositAddressData_generateWallet_deposit',
                'G__typename'),
            address: address,
            encodedAddress: encodedAddress,
            redirectUrl: redirectUrl,
            depositCommission: depositCommission,
            minDepositCommission: minDepositCommission,
            maxDepositCommission: maxDepositCommission,
            minDepositAmount: minDepositAmount,
            maxDepositAmount: maxDepositAmount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
