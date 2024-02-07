// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GOperationType _$gOperationTypeDIRECT_DEPOSIT =
    const GOperationType._('DIRECT_DEPOSIT');
const GOperationType _$gOperationTypeON_CHAIN_SWAP =
    const GOperationType._('ON_CHAIN_SWAP');

GOperationType _$gOperationTypeValueOf(String name) {
  switch (name) {
    case 'DIRECT_DEPOSIT':
      return _$gOperationTypeDIRECT_DEPOSIT;
    case 'ON_CHAIN_SWAP':
      return _$gOperationTypeON_CHAIN_SWAP;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GOperationType> _$gOperationTypeValues =
    new BuiltSet<GOperationType>(const <GOperationType>[
  _$gOperationTypeDIRECT_DEPOSIT,
  _$gOperationTypeON_CHAIN_SWAP,
]);

const GUserType _$gUserTypeADMIN = const GUserType._('ADMIN');
const GUserType _$gUserTypeUSER = const GUserType._('USER');

GUserType _$gUserTypeValueOf(String name) {
  switch (name) {
    case 'ADMIN':
      return _$gUserTypeADMIN;
    case 'USER':
      return _$gUserTypeUSER;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GUserType> _$gUserTypeValues =
    new BuiltSet<GUserType>(const <GUserType>[
  _$gUserTypeADMIN,
  _$gUserTypeUSER,
]);

const GUserState _$gUserStatepending = const GUserState._('pending');
const GUserState _$gUserStateactive = const GUserState._('active');
const GUserState _$gUserStatebanned = const GUserState._('banned');

GUserState _$gUserStateValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$gUserStatepending;
    case 'active':
      return _$gUserStateactive;
    case 'banned':
      return _$gUserStatebanned;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GUserState> _$gUserStateValues =
    new BuiltSet<GUserState>(const <GUserState>[
  _$gUserStatepending,
  _$gUserStateactive,
  _$gUserStatebanned,
]);

Serializer<GRefGroupPercentageInput> _$gRefGroupPercentageInputSerializer =
    new _$GRefGroupPercentageInputSerializer();
Serializer<GRefGroupOTPaymentInput> _$gRefGroupOTPaymentInputSerializer =
    new _$GRefGroupOTPaymentInputSerializer();
Serializer<GInputDonateProject> _$gInputDonateProjectSerializer =
    new _$GInputDonateProjectSerializer();
Serializer<GInputBonusDonate> _$gInputBonusDonateSerializer =
    new _$GInputBonusDonateSerializer();
Serializer<GCurrencyPaymentInterfaceInput>
    _$gCurrencyPaymentInterfaceInputSerializer =
    new _$GCurrencyPaymentInterfaceInputSerializer();
Serializer<GOperationType> _$gOperationTypeSerializer =
    new _$GOperationTypeSerializer();
Serializer<GIcoLevelInput> _$gIcoLevelInputSerializer =
    new _$GIcoLevelInputSerializer();
Serializer<GUserType> _$gUserTypeSerializer = new _$GUserTypeSerializer();
Serializer<GUserState> _$gUserStateSerializer = new _$GUserStateSerializer();

class _$GRefGroupPercentageInputSerializer
    implements StructuredSerializer<GRefGroupPercentageInput> {
  @override
  final Iterable<Type> types = const [
    GRefGroupPercentageInput,
    _$GRefGroupPercentageInput
  ];
  @override
  final String wireName = 'GRefGroupPercentageInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GRefGroupPercentageInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.level;
    if (value != null) {
      result
        ..add('level')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.percent;
    if (value != null) {
      result
        ..add('percent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GRefGroupPercentageInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRefGroupPercentageInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'level':
          result.level = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'percent':
          result.percent = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GRefGroupOTPaymentInputSerializer
    implements StructuredSerializer<GRefGroupOTPaymentInput> {
  @override
  final Iterable<Type> types = const [
    GRefGroupOTPaymentInput,
    _$GRefGroupOTPaymentInput
  ];
  @override
  final String wireName = 'GRefGroupOTPaymentInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GRefGroupOTPaymentInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.operation;
    if (value != null) {
      result
        ..add('operation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.currency_id;
    if (value != null) {
      result
        ..add('currency_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.payment_interface_id;
    if (value != null) {
      result
        ..add('payment_interface_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.min_base;
    if (value != null) {
      result
        ..add('min_base')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.percent;
    if (value != null) {
      result
        ..add('percent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.max_reward;
    if (value != null) {
      result
        ..add('max_reward')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GRefGroupOTPaymentInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRefGroupOTPaymentInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'currency_id':
          result.currency_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'payment_interface_id':
          result.payment_interface_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'min_base':
          result.min_base = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'percent':
          result.percent = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'max_reward':
          result.max_reward = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GInputDonateProjectSerializer
    implements StructuredSerializer<GInputDonateProject> {
  @override
  final Iterable<Type> types = const [
    GInputDonateProject,
    _$GInputDonateProject
  ];
  @override
  final String wireName = 'GInputDonateProject';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GInputDonateProject object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
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
    value = object.iconUrl;
    if (value != null) {
      result
        ..add('iconUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.max_amount;
    if (value != null) {
      result
        ..add('max_amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.currencyId;
    if (value != null) {
      result
        ..add('currencyId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.coordinatorUserId;
    if (value != null) {
      result
        ..add('coordinatorUserId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.selected;
    if (value != null) {
      result
        ..add('selected')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.featured;
    if (value != null) {
      result
        ..add('featured')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.categId;
    if (value != null) {
      result
        ..add('categId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updatedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GInputDonateProject deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInputDonateProjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'max_amount':
          result.max_amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'currencyId':
          result.currencyId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'coordinatorUserId':
          result.coordinatorUserId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'enabled':
          result.enabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'selected':
          result.selected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'featured':
          result.featured = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'categId':
          result.categId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GInputBonusDonateSerializer
    implements StructuredSerializer<GInputBonusDonate> {
  @override
  final Iterable<Type> types = const [GInputBonusDonate, _$GInputBonusDonate];
  @override
  final String wireName = 'GInputBonusDonate';

  @override
  Iterable<Object?> serialize(Serializers serializers, GInputBonusDonate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.coef;
    if (value != null) {
      result
        ..add('coef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GInputBonusDonate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInputBonusDonateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'coef':
          result.coef = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCurrencyPaymentInterfaceInputSerializer
    implements StructuredSerializer<GCurrencyPaymentInterfaceInput> {
  @override
  final Iterable<Type> types = const [
    GCurrencyPaymentInterfaceInput,
    _$GCurrencyPaymentInterfaceInput
  ];
  @override
  final String wireName = 'GCurrencyPaymentInterfaceInput';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCurrencyPaymentInterfaceInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'paymentInterfaceId',
      serializers.serialize(object.paymentInterfaceId,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contractAddress;
    if (value != null) {
      result
        ..add('contractAddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gasLimit;
    if (value != null) {
      result
        ..add('gasLimit')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.subunits;
    if (value != null) {
      result
        ..add('subunits')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minDepositAmount;
    if (value != null) {
      result
        ..add('minDepositAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.depositFee;
    if (value != null) {
      result
        ..add('depositFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minDepositFee;
    if (value != null) {
      result
        ..add('minDepositFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxDepositFee;
    if (value != null) {
      result
        ..add('maxDepositFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.userDepositEnable;
    if (value != null) {
      result
        ..add('userDepositEnable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.minDirectDepositAmount;
    if (value != null) {
      result
        ..add('minDirectDepositAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.directDepositFee;
    if (value != null) {
      result
        ..add('directDepositFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minDirectDepositFee;
    if (value != null) {
      result
        ..add('minDirectDepositFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxDirectDepositFee;
    if (value != null) {
      result
        ..add('maxDirectDepositFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.userDirectDepositEnabled;
    if (value != null) {
      result
        ..add('userDirectDepositEnabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
    value = object.maxWithdrawAmount24h;
    if (value != null) {
      result
        ..add('maxWithdrawAmount24h')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxWithdrawAmount72h;
    if (value != null) {
      result
        ..add('maxWithdrawAmount72h')
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
    value = object.minCollectionAmount;
    if (value != null) {
      result
        ..add('minCollectionAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.userWithdrawEnable;
    if (value != null) {
      result
        ..add('userWithdrawEnable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isDonationEnabled;
    if (value != null) {
      result
        ..add('isDonationEnabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.enable;
    if (value != null) {
      result
        ..add('enable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GCurrencyPaymentInterfaceInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCurrencyPaymentInterfaceInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'paymentInterfaceId':
          result.paymentInterfaceId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'contractAddress':
          result.contractAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'gasLimit':
          result.gasLimit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'subunits':
          result.subunits = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'minDepositAmount':
          result.minDepositAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'depositFee':
          result.depositFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minDepositFee':
          result.minDepositFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxDepositFee':
          result.maxDepositFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'userDepositEnable':
          result.userDepositEnable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'minDirectDepositAmount':
          result.minDirectDepositAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'directDepositFee':
          result.directDepositFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minDirectDepositFee':
          result.minDirectDepositFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxDirectDepositFee':
          result.maxDirectDepositFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'userDirectDepositEnabled':
          result.userDirectDepositEnabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'minWithdrawAmount':
          result.minWithdrawAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxWithdrawAmount':
          result.maxWithdrawAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxWithdrawAmount24h':
          result.maxWithdrawAmount24h = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxWithdrawAmount72h':
          result.maxWithdrawAmount72h = serializers.deserialize(value,
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
        case 'minCollectionAmount':
          result.minCollectionAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'userWithdrawEnable':
          result.userWithdrawEnable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isDonationEnabled':
          result.isDonationEnabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'enable':
          result.enable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GOperationTypeSerializer
    implements PrimitiveSerializer<GOperationType> {
  @override
  final Iterable<Type> types = const <Type>[GOperationType];
  @override
  final String wireName = 'GOperationType';

  @override
  Object serialize(Serializers serializers, GOperationType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GOperationType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GOperationType.valueOf(serialized as String);
}

class _$GIcoLevelInputSerializer
    implements StructuredSerializer<GIcoLevelInput> {
  @override
  final Iterable<Type> types = const [GIcoLevelInput, _$GIcoLevelInput];
  @override
  final String wireName = 'GIcoLevelInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GIcoLevelInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.level;
    if (value != null) {
      result
        ..add('level')
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
    return result;
  }

  @override
  GIcoLevelInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GIcoLevelInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'level':
          result.level = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserTypeSerializer implements PrimitiveSerializer<GUserType> {
  @override
  final Iterable<Type> types = const <Type>[GUserType];
  @override
  final String wireName = 'GUserType';

  @override
  Object serialize(Serializers serializers, GUserType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GUserType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GUserType.valueOf(serialized as String);
}

class _$GUserStateSerializer implements PrimitiveSerializer<GUserState> {
  @override
  final Iterable<Type> types = const <Type>[GUserState];
  @override
  final String wireName = 'GUserState';

  @override
  Object serialize(Serializers serializers, GUserState object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GUserState deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GUserState.valueOf(serialized as String);
}

class _$GDate extends GDate {
  @override
  final String value;

  factory _$GDate([void Function(GDateBuilder)? updates]) =>
      (new GDateBuilder()..update(updates))._build();

  _$GDate._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'GDate', 'value');
  }

  @override
  GDate rebuild(void Function(GDateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDateBuilder toBuilder() => new GDateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDate && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDate')..add('value', value))
        .toString();
  }
}

class GDateBuilder implements Builder<GDate, GDateBuilder> {
  _$GDate? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GDateBuilder();

  GDateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDate;
  }

  @override
  void update(void Function(GDateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDate build() => _build();

  _$GDate _build() {
    final _$result = _$v ??
        new _$GDate._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'GDate', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GTimestamp extends GTimestamp {
  @override
  final String value;

  factory _$GTimestamp([void Function(GTimestampBuilder)? updates]) =>
      (new GTimestampBuilder()..update(updates))._build();

  _$GTimestamp._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'GTimestamp', 'value');
  }

  @override
  GTimestamp rebuild(void Function(GTimestampBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTimestampBuilder toBuilder() => new GTimestampBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTimestamp && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTimestamp')..add('value', value))
        .toString();
  }
}

class GTimestampBuilder implements Builder<GTimestamp, GTimestampBuilder> {
  _$GTimestamp? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GTimestampBuilder();

  GTimestampBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTimestamp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTimestamp;
  }

  @override
  void update(void Function(GTimestampBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTimestamp build() => _build();

  _$GTimestamp _build() {
    final _$result = _$v ??
        new _$GTimestamp._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'GTimestamp', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GRefGroupPercentageInput extends GRefGroupPercentageInput {
  @override
  final int? level;
  @override
  final double? percent;

  factory _$GRefGroupPercentageInput(
          [void Function(GRefGroupPercentageInputBuilder)? updates]) =>
      (new GRefGroupPercentageInputBuilder()..update(updates))._build();

  _$GRefGroupPercentageInput._({this.level, this.percent}) : super._();

  @override
  GRefGroupPercentageInput rebuild(
          void Function(GRefGroupPercentageInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRefGroupPercentageInputBuilder toBuilder() =>
      new GRefGroupPercentageInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRefGroupPercentageInput &&
        level == other.level &&
        percent == other.percent;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, level.hashCode);
    _$hash = $jc(_$hash, percent.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GRefGroupPercentageInput')
          ..add('level', level)
          ..add('percent', percent))
        .toString();
  }
}

class GRefGroupPercentageInputBuilder
    implements
        Builder<GRefGroupPercentageInput, GRefGroupPercentageInputBuilder> {
  _$GRefGroupPercentageInput? _$v;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  double? _percent;
  double? get percent => _$this._percent;
  set percent(double? percent) => _$this._percent = percent;

  GRefGroupPercentageInputBuilder();

  GRefGroupPercentageInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _level = $v.level;
      _percent = $v.percent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRefGroupPercentageInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRefGroupPercentageInput;
  }

  @override
  void update(void Function(GRefGroupPercentageInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GRefGroupPercentageInput build() => _build();

  _$GRefGroupPercentageInput _build() {
    final _$result =
        _$v ?? new _$GRefGroupPercentageInput._(level: level, percent: percent);
    replace(_$result);
    return _$result;
  }
}

class _$GRefGroupOTPaymentInput extends GRefGroupOTPaymentInput {
  @override
  final String? operation;
  @override
  final String? currency_id;
  @override
  final String? payment_interface_id;
  @override
  final double? min_base;
  @override
  final double? percent;
  @override
  final double? max_reward;

  factory _$GRefGroupOTPaymentInput(
          [void Function(GRefGroupOTPaymentInputBuilder)? updates]) =>
      (new GRefGroupOTPaymentInputBuilder()..update(updates))._build();

  _$GRefGroupOTPaymentInput._(
      {this.operation,
      this.currency_id,
      this.payment_interface_id,
      this.min_base,
      this.percent,
      this.max_reward})
      : super._();

  @override
  GRefGroupOTPaymentInput rebuild(
          void Function(GRefGroupOTPaymentInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRefGroupOTPaymentInputBuilder toBuilder() =>
      new GRefGroupOTPaymentInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRefGroupOTPaymentInput &&
        operation == other.operation &&
        currency_id == other.currency_id &&
        payment_interface_id == other.payment_interface_id &&
        min_base == other.min_base &&
        percent == other.percent &&
        max_reward == other.max_reward;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jc(_$hash, currency_id.hashCode);
    _$hash = $jc(_$hash, payment_interface_id.hashCode);
    _$hash = $jc(_$hash, min_base.hashCode);
    _$hash = $jc(_$hash, percent.hashCode);
    _$hash = $jc(_$hash, max_reward.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GRefGroupOTPaymentInput')
          ..add('operation', operation)
          ..add('currency_id', currency_id)
          ..add('payment_interface_id', payment_interface_id)
          ..add('min_base', min_base)
          ..add('percent', percent)
          ..add('max_reward', max_reward))
        .toString();
  }
}

class GRefGroupOTPaymentInputBuilder
    implements
        Builder<GRefGroupOTPaymentInput, GRefGroupOTPaymentInputBuilder> {
  _$GRefGroupOTPaymentInput? _$v;

  String? _operation;
  String? get operation => _$this._operation;
  set operation(String? operation) => _$this._operation = operation;

  String? _currency_id;
  String? get currency_id => _$this._currency_id;
  set currency_id(String? currency_id) => _$this._currency_id = currency_id;

  String? _payment_interface_id;
  String? get payment_interface_id => _$this._payment_interface_id;
  set payment_interface_id(String? payment_interface_id) =>
      _$this._payment_interface_id = payment_interface_id;

  double? _min_base;
  double? get min_base => _$this._min_base;
  set min_base(double? min_base) => _$this._min_base = min_base;

  double? _percent;
  double? get percent => _$this._percent;
  set percent(double? percent) => _$this._percent = percent;

  double? _max_reward;
  double? get max_reward => _$this._max_reward;
  set max_reward(double? max_reward) => _$this._max_reward = max_reward;

  GRefGroupOTPaymentInputBuilder();

  GRefGroupOTPaymentInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _operation = $v.operation;
      _currency_id = $v.currency_id;
      _payment_interface_id = $v.payment_interface_id;
      _min_base = $v.min_base;
      _percent = $v.percent;
      _max_reward = $v.max_reward;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRefGroupOTPaymentInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRefGroupOTPaymentInput;
  }

  @override
  void update(void Function(GRefGroupOTPaymentInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GRefGroupOTPaymentInput build() => _build();

  _$GRefGroupOTPaymentInput _build() {
    final _$result = _$v ??
        new _$GRefGroupOTPaymentInput._(
            operation: operation,
            currency_id: currency_id,
            payment_interface_id: payment_interface_id,
            min_base: min_base,
            percent: percent,
            max_reward: max_reward);
    replace(_$result);
    return _$result;
  }
}

class _$GInputDonateProject extends GInputDonateProject {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? iconUrl;
  @override
  final double? max_amount;
  @override
  final String? currencyId;
  @override
  final String? coordinatorUserId;
  @override
  final bool? enabled;
  @override
  final bool? selected;
  @override
  final bool? featured;
  @override
  final String? categId;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  factory _$GInputDonateProject(
          [void Function(GInputDonateProjectBuilder)? updates]) =>
      (new GInputDonateProjectBuilder()..update(updates))._build();

  _$GInputDonateProject._(
      {this.id,
      this.name,
      this.description,
      this.iconUrl,
      this.max_amount,
      this.currencyId,
      this.coordinatorUserId,
      this.enabled,
      this.selected,
      this.featured,
      this.categId,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  GInputDonateProject rebuild(
          void Function(GInputDonateProjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInputDonateProjectBuilder toBuilder() =>
      new GInputDonateProjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInputDonateProject &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        iconUrl == other.iconUrl &&
        max_amount == other.max_amount &&
        currencyId == other.currencyId &&
        coordinatorUserId == other.coordinatorUserId &&
        enabled == other.enabled &&
        selected == other.selected &&
        featured == other.featured &&
        categId == other.categId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jc(_$hash, max_amount.hashCode);
    _$hash = $jc(_$hash, currencyId.hashCode);
    _$hash = $jc(_$hash, coordinatorUserId.hashCode);
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, selected.hashCode);
    _$hash = $jc(_$hash, featured.hashCode);
    _$hash = $jc(_$hash, categId.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GInputDonateProject')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('iconUrl', iconUrl)
          ..add('max_amount', max_amount)
          ..add('currencyId', currencyId)
          ..add('coordinatorUserId', coordinatorUserId)
          ..add('enabled', enabled)
          ..add('selected', selected)
          ..add('featured', featured)
          ..add('categId', categId)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class GInputDonateProjectBuilder
    implements Builder<GInputDonateProject, GInputDonateProjectBuilder> {
  _$GInputDonateProject? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

  double? _max_amount;
  double? get max_amount => _$this._max_amount;
  set max_amount(double? max_amount) => _$this._max_amount = max_amount;

  String? _currencyId;
  String? get currencyId => _$this._currencyId;
  set currencyId(String? currencyId) => _$this._currencyId = currencyId;

  String? _coordinatorUserId;
  String? get coordinatorUserId => _$this._coordinatorUserId;
  set coordinatorUserId(String? coordinatorUserId) =>
      _$this._coordinatorUserId = coordinatorUserId;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  bool? _selected;
  bool? get selected => _$this._selected;
  set selected(bool? selected) => _$this._selected = selected;

  bool? _featured;
  bool? get featured => _$this._featured;
  set featured(bool? featured) => _$this._featured = featured;

  String? _categId;
  String? get categId => _$this._categId;
  set categId(String? categId) => _$this._categId = categId;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  GInputDonateProjectBuilder();

  GInputDonateProjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _iconUrl = $v.iconUrl;
      _max_amount = $v.max_amount;
      _currencyId = $v.currencyId;
      _coordinatorUserId = $v.coordinatorUserId;
      _enabled = $v.enabled;
      _selected = $v.selected;
      _featured = $v.featured;
      _categId = $v.categId;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInputDonateProject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInputDonateProject;
  }

  @override
  void update(void Function(GInputDonateProjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GInputDonateProject build() => _build();

  _$GInputDonateProject _build() {
    final _$result = _$v ??
        new _$GInputDonateProject._(
            id: id,
            name: name,
            description: description,
            iconUrl: iconUrl,
            max_amount: max_amount,
            currencyId: currencyId,
            coordinatorUserId: coordinatorUserId,
            enabled: enabled,
            selected: selected,
            featured: featured,
            categId: categId,
            createdAt: createdAt,
            updatedAt: updatedAt);
    replace(_$result);
    return _$result;
  }
}

class _$GInputBonusDonate extends GInputBonusDonate {
  @override
  final String? token;
  @override
  final double? coef;

  factory _$GInputBonusDonate(
          [void Function(GInputBonusDonateBuilder)? updates]) =>
      (new GInputBonusDonateBuilder()..update(updates))._build();

  _$GInputBonusDonate._({this.token, this.coef}) : super._();

  @override
  GInputBonusDonate rebuild(void Function(GInputBonusDonateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInputBonusDonateBuilder toBuilder() =>
      new GInputBonusDonateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInputBonusDonate &&
        token == other.token &&
        coef == other.coef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, coef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GInputBonusDonate')
          ..add('token', token)
          ..add('coef', coef))
        .toString();
  }
}

class GInputBonusDonateBuilder
    implements Builder<GInputBonusDonate, GInputBonusDonateBuilder> {
  _$GInputBonusDonate? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  double? _coef;
  double? get coef => _$this._coef;
  set coef(double? coef) => _$this._coef = coef;

  GInputBonusDonateBuilder();

  GInputBonusDonateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _coef = $v.coef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInputBonusDonate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInputBonusDonate;
  }

  @override
  void update(void Function(GInputBonusDonateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GInputBonusDonate build() => _build();

  _$GInputBonusDonate _build() {
    final _$result = _$v ?? new _$GInputBonusDonate._(token: token, coef: coef);
    replace(_$result);
    return _$result;
  }
}

class _$GCurrencyPaymentInterfaceInput extends GCurrencyPaymentInterfaceInput {
  @override
  final String paymentInterfaceId;
  @override
  final String? description;
  @override
  final String type;
  @override
  final String? contractAddress;
  @override
  final int? gasLimit;
  @override
  final int? subunits;
  @override
  final double? minDepositAmount;
  @override
  final double? depositFee;
  @override
  final double? minDepositFee;
  @override
  final double? maxDepositFee;
  @override
  final bool? userDepositEnable;
  @override
  final double? minDirectDepositAmount;
  @override
  final double? directDepositFee;
  @override
  final double? minDirectDepositFee;
  @override
  final double? maxDirectDepositFee;
  @override
  final bool? userDirectDepositEnabled;
  @override
  final double? minWithdrawAmount;
  @override
  final double? maxWithdrawAmount;
  @override
  final double? maxWithdrawAmount24h;
  @override
  final double? maxWithdrawAmount72h;
  @override
  final double? withdrawFee;
  @override
  final double? minWithdrawFee;
  @override
  final double? maxWithdrawFee;
  @override
  final double? minCollectionAmount;
  @override
  final bool? userWithdrawEnable;
  @override
  final bool? isDonationEnabled;
  @override
  final bool? enable;

  factory _$GCurrencyPaymentInterfaceInput(
          [void Function(GCurrencyPaymentInterfaceInputBuilder)? updates]) =>
      (new GCurrencyPaymentInterfaceInputBuilder()..update(updates))._build();

  _$GCurrencyPaymentInterfaceInput._(
      {required this.paymentInterfaceId,
      this.description,
      required this.type,
      this.contractAddress,
      this.gasLimit,
      this.subunits,
      this.minDepositAmount,
      this.depositFee,
      this.minDepositFee,
      this.maxDepositFee,
      this.userDepositEnable,
      this.minDirectDepositAmount,
      this.directDepositFee,
      this.minDirectDepositFee,
      this.maxDirectDepositFee,
      this.userDirectDepositEnabled,
      this.minWithdrawAmount,
      this.maxWithdrawAmount,
      this.maxWithdrawAmount24h,
      this.maxWithdrawAmount72h,
      this.withdrawFee,
      this.minWithdrawFee,
      this.maxWithdrawFee,
      this.minCollectionAmount,
      this.userWithdrawEnable,
      this.isDonationEnabled,
      this.enable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(paymentInterfaceId,
        r'GCurrencyPaymentInterfaceInput', 'paymentInterfaceId');
    BuiltValueNullFieldError.checkNotNull(
        type, r'GCurrencyPaymentInterfaceInput', 'type');
  }

  @override
  GCurrencyPaymentInterfaceInput rebuild(
          void Function(GCurrencyPaymentInterfaceInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCurrencyPaymentInterfaceInputBuilder toBuilder() =>
      new GCurrencyPaymentInterfaceInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCurrencyPaymentInterfaceInput &&
        paymentInterfaceId == other.paymentInterfaceId &&
        description == other.description &&
        type == other.type &&
        contractAddress == other.contractAddress &&
        gasLimit == other.gasLimit &&
        subunits == other.subunits &&
        minDepositAmount == other.minDepositAmount &&
        depositFee == other.depositFee &&
        minDepositFee == other.minDepositFee &&
        maxDepositFee == other.maxDepositFee &&
        userDepositEnable == other.userDepositEnable &&
        minDirectDepositAmount == other.minDirectDepositAmount &&
        directDepositFee == other.directDepositFee &&
        minDirectDepositFee == other.minDirectDepositFee &&
        maxDirectDepositFee == other.maxDirectDepositFee &&
        userDirectDepositEnabled == other.userDirectDepositEnabled &&
        minWithdrawAmount == other.minWithdrawAmount &&
        maxWithdrawAmount == other.maxWithdrawAmount &&
        maxWithdrawAmount24h == other.maxWithdrawAmount24h &&
        maxWithdrawAmount72h == other.maxWithdrawAmount72h &&
        withdrawFee == other.withdrawFee &&
        minWithdrawFee == other.minWithdrawFee &&
        maxWithdrawFee == other.maxWithdrawFee &&
        minCollectionAmount == other.minCollectionAmount &&
        userWithdrawEnable == other.userWithdrawEnable &&
        isDonationEnabled == other.isDonationEnabled &&
        enable == other.enable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, paymentInterfaceId.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, contractAddress.hashCode);
    _$hash = $jc(_$hash, gasLimit.hashCode);
    _$hash = $jc(_$hash, subunits.hashCode);
    _$hash = $jc(_$hash, minDepositAmount.hashCode);
    _$hash = $jc(_$hash, depositFee.hashCode);
    _$hash = $jc(_$hash, minDepositFee.hashCode);
    _$hash = $jc(_$hash, maxDepositFee.hashCode);
    _$hash = $jc(_$hash, userDepositEnable.hashCode);
    _$hash = $jc(_$hash, minDirectDepositAmount.hashCode);
    _$hash = $jc(_$hash, directDepositFee.hashCode);
    _$hash = $jc(_$hash, minDirectDepositFee.hashCode);
    _$hash = $jc(_$hash, maxDirectDepositFee.hashCode);
    _$hash = $jc(_$hash, userDirectDepositEnabled.hashCode);
    _$hash = $jc(_$hash, minWithdrawAmount.hashCode);
    _$hash = $jc(_$hash, maxWithdrawAmount.hashCode);
    _$hash = $jc(_$hash, maxWithdrawAmount24h.hashCode);
    _$hash = $jc(_$hash, maxWithdrawAmount72h.hashCode);
    _$hash = $jc(_$hash, withdrawFee.hashCode);
    _$hash = $jc(_$hash, minWithdrawFee.hashCode);
    _$hash = $jc(_$hash, maxWithdrawFee.hashCode);
    _$hash = $jc(_$hash, minCollectionAmount.hashCode);
    _$hash = $jc(_$hash, userWithdrawEnable.hashCode);
    _$hash = $jc(_$hash, isDonationEnabled.hashCode);
    _$hash = $jc(_$hash, enable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCurrencyPaymentInterfaceInput')
          ..add('paymentInterfaceId', paymentInterfaceId)
          ..add('description', description)
          ..add('type', type)
          ..add('contractAddress', contractAddress)
          ..add('gasLimit', gasLimit)
          ..add('subunits', subunits)
          ..add('minDepositAmount', minDepositAmount)
          ..add('depositFee', depositFee)
          ..add('minDepositFee', minDepositFee)
          ..add('maxDepositFee', maxDepositFee)
          ..add('userDepositEnable', userDepositEnable)
          ..add('minDirectDepositAmount', minDirectDepositAmount)
          ..add('directDepositFee', directDepositFee)
          ..add('minDirectDepositFee', minDirectDepositFee)
          ..add('maxDirectDepositFee', maxDirectDepositFee)
          ..add('userDirectDepositEnabled', userDirectDepositEnabled)
          ..add('minWithdrawAmount', minWithdrawAmount)
          ..add('maxWithdrawAmount', maxWithdrawAmount)
          ..add('maxWithdrawAmount24h', maxWithdrawAmount24h)
          ..add('maxWithdrawAmount72h', maxWithdrawAmount72h)
          ..add('withdrawFee', withdrawFee)
          ..add('minWithdrawFee', minWithdrawFee)
          ..add('maxWithdrawFee', maxWithdrawFee)
          ..add('minCollectionAmount', minCollectionAmount)
          ..add('userWithdrawEnable', userWithdrawEnable)
          ..add('isDonationEnabled', isDonationEnabled)
          ..add('enable', enable))
        .toString();
  }
}

class GCurrencyPaymentInterfaceInputBuilder
    implements
        Builder<GCurrencyPaymentInterfaceInput,
            GCurrencyPaymentInterfaceInputBuilder> {
  _$GCurrencyPaymentInterfaceInput? _$v;

  String? _paymentInterfaceId;
  String? get paymentInterfaceId => _$this._paymentInterfaceId;
  set paymentInterfaceId(String? paymentInterfaceId) =>
      _$this._paymentInterfaceId = paymentInterfaceId;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _contractAddress;
  String? get contractAddress => _$this._contractAddress;
  set contractAddress(String? contractAddress) =>
      _$this._contractAddress = contractAddress;

  int? _gasLimit;
  int? get gasLimit => _$this._gasLimit;
  set gasLimit(int? gasLimit) => _$this._gasLimit = gasLimit;

  int? _subunits;
  int? get subunits => _$this._subunits;
  set subunits(int? subunits) => _$this._subunits = subunits;

  double? _minDepositAmount;
  double? get minDepositAmount => _$this._minDepositAmount;
  set minDepositAmount(double? minDepositAmount) =>
      _$this._minDepositAmount = minDepositAmount;

  double? _depositFee;
  double? get depositFee => _$this._depositFee;
  set depositFee(double? depositFee) => _$this._depositFee = depositFee;

  double? _minDepositFee;
  double? get minDepositFee => _$this._minDepositFee;
  set minDepositFee(double? minDepositFee) =>
      _$this._minDepositFee = minDepositFee;

  double? _maxDepositFee;
  double? get maxDepositFee => _$this._maxDepositFee;
  set maxDepositFee(double? maxDepositFee) =>
      _$this._maxDepositFee = maxDepositFee;

  bool? _userDepositEnable;
  bool? get userDepositEnable => _$this._userDepositEnable;
  set userDepositEnable(bool? userDepositEnable) =>
      _$this._userDepositEnable = userDepositEnable;

  double? _minDirectDepositAmount;
  double? get minDirectDepositAmount => _$this._minDirectDepositAmount;
  set minDirectDepositAmount(double? minDirectDepositAmount) =>
      _$this._minDirectDepositAmount = minDirectDepositAmount;

  double? _directDepositFee;
  double? get directDepositFee => _$this._directDepositFee;
  set directDepositFee(double? directDepositFee) =>
      _$this._directDepositFee = directDepositFee;

  double? _minDirectDepositFee;
  double? get minDirectDepositFee => _$this._minDirectDepositFee;
  set minDirectDepositFee(double? minDirectDepositFee) =>
      _$this._minDirectDepositFee = minDirectDepositFee;

  double? _maxDirectDepositFee;
  double? get maxDirectDepositFee => _$this._maxDirectDepositFee;
  set maxDirectDepositFee(double? maxDirectDepositFee) =>
      _$this._maxDirectDepositFee = maxDirectDepositFee;

  bool? _userDirectDepositEnabled;
  bool? get userDirectDepositEnabled => _$this._userDirectDepositEnabled;
  set userDirectDepositEnabled(bool? userDirectDepositEnabled) =>
      _$this._userDirectDepositEnabled = userDirectDepositEnabled;

  double? _minWithdrawAmount;
  double? get minWithdrawAmount => _$this._minWithdrawAmount;
  set minWithdrawAmount(double? minWithdrawAmount) =>
      _$this._minWithdrawAmount = minWithdrawAmount;

  double? _maxWithdrawAmount;
  double? get maxWithdrawAmount => _$this._maxWithdrawAmount;
  set maxWithdrawAmount(double? maxWithdrawAmount) =>
      _$this._maxWithdrawAmount = maxWithdrawAmount;

  double? _maxWithdrawAmount24h;
  double? get maxWithdrawAmount24h => _$this._maxWithdrawAmount24h;
  set maxWithdrawAmount24h(double? maxWithdrawAmount24h) =>
      _$this._maxWithdrawAmount24h = maxWithdrawAmount24h;

  double? _maxWithdrawAmount72h;
  double? get maxWithdrawAmount72h => _$this._maxWithdrawAmount72h;
  set maxWithdrawAmount72h(double? maxWithdrawAmount72h) =>
      _$this._maxWithdrawAmount72h = maxWithdrawAmount72h;

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

  double? _minCollectionAmount;
  double? get minCollectionAmount => _$this._minCollectionAmount;
  set minCollectionAmount(double? minCollectionAmount) =>
      _$this._minCollectionAmount = minCollectionAmount;

  bool? _userWithdrawEnable;
  bool? get userWithdrawEnable => _$this._userWithdrawEnable;
  set userWithdrawEnable(bool? userWithdrawEnable) =>
      _$this._userWithdrawEnable = userWithdrawEnable;

  bool? _isDonationEnabled;
  bool? get isDonationEnabled => _$this._isDonationEnabled;
  set isDonationEnabled(bool? isDonationEnabled) =>
      _$this._isDonationEnabled = isDonationEnabled;

  bool? _enable;
  bool? get enable => _$this._enable;
  set enable(bool? enable) => _$this._enable = enable;

  GCurrencyPaymentInterfaceInputBuilder();

  GCurrencyPaymentInterfaceInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _paymentInterfaceId = $v.paymentInterfaceId;
      _description = $v.description;
      _type = $v.type;
      _contractAddress = $v.contractAddress;
      _gasLimit = $v.gasLimit;
      _subunits = $v.subunits;
      _minDepositAmount = $v.minDepositAmount;
      _depositFee = $v.depositFee;
      _minDepositFee = $v.minDepositFee;
      _maxDepositFee = $v.maxDepositFee;
      _userDepositEnable = $v.userDepositEnable;
      _minDirectDepositAmount = $v.minDirectDepositAmount;
      _directDepositFee = $v.directDepositFee;
      _minDirectDepositFee = $v.minDirectDepositFee;
      _maxDirectDepositFee = $v.maxDirectDepositFee;
      _userDirectDepositEnabled = $v.userDirectDepositEnabled;
      _minWithdrawAmount = $v.minWithdrawAmount;
      _maxWithdrawAmount = $v.maxWithdrawAmount;
      _maxWithdrawAmount24h = $v.maxWithdrawAmount24h;
      _maxWithdrawAmount72h = $v.maxWithdrawAmount72h;
      _withdrawFee = $v.withdrawFee;
      _minWithdrawFee = $v.minWithdrawFee;
      _maxWithdrawFee = $v.maxWithdrawFee;
      _minCollectionAmount = $v.minCollectionAmount;
      _userWithdrawEnable = $v.userWithdrawEnable;
      _isDonationEnabled = $v.isDonationEnabled;
      _enable = $v.enable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCurrencyPaymentInterfaceInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCurrencyPaymentInterfaceInput;
  }

  @override
  void update(void Function(GCurrencyPaymentInterfaceInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCurrencyPaymentInterfaceInput build() => _build();

  _$GCurrencyPaymentInterfaceInput _build() {
    final _$result = _$v ??
        new _$GCurrencyPaymentInterfaceInput._(
            paymentInterfaceId: BuiltValueNullFieldError.checkNotNull(
                paymentInterfaceId,
                r'GCurrencyPaymentInterfaceInput',
                'paymentInterfaceId'),
            description: description,
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'GCurrencyPaymentInterfaceInput', 'type'),
            contractAddress: contractAddress,
            gasLimit: gasLimit,
            subunits: subunits,
            minDepositAmount: minDepositAmount,
            depositFee: depositFee,
            minDepositFee: minDepositFee,
            maxDepositFee: maxDepositFee,
            userDepositEnable: userDepositEnable,
            minDirectDepositAmount: minDirectDepositAmount,
            directDepositFee: directDepositFee,
            minDirectDepositFee: minDirectDepositFee,
            maxDirectDepositFee: maxDirectDepositFee,
            userDirectDepositEnabled: userDirectDepositEnabled,
            minWithdrawAmount: minWithdrawAmount,
            maxWithdrawAmount: maxWithdrawAmount,
            maxWithdrawAmount24h: maxWithdrawAmount24h,
            maxWithdrawAmount72h: maxWithdrawAmount72h,
            withdrawFee: withdrawFee,
            minWithdrawFee: minWithdrawFee,
            maxWithdrawFee: maxWithdrawFee,
            minCollectionAmount: minCollectionAmount,
            userWithdrawEnable: userWithdrawEnable,
            isDonationEnabled: isDonationEnabled,
            enable: enable);
    replace(_$result);
    return _$result;
  }
}

class _$GIcoLevelInput extends GIcoLevelInput {
  @override
  final String? id;
  @override
  final double? level;
  @override
  final double? price;

  factory _$GIcoLevelInput([void Function(GIcoLevelInputBuilder)? updates]) =>
      (new GIcoLevelInputBuilder()..update(updates))._build();

  _$GIcoLevelInput._({this.id, this.level, this.price}) : super._();

  @override
  GIcoLevelInput rebuild(void Function(GIcoLevelInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GIcoLevelInputBuilder toBuilder() =>
      new GIcoLevelInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GIcoLevelInput &&
        id == other.id &&
        level == other.level &&
        price == other.price;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, level.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GIcoLevelInput')
          ..add('id', id)
          ..add('level', level)
          ..add('price', price))
        .toString();
  }
}

class GIcoLevelInputBuilder
    implements Builder<GIcoLevelInput, GIcoLevelInputBuilder> {
  _$GIcoLevelInput? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  double? _level;
  double? get level => _$this._level;
  set level(double? level) => _$this._level = level;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  GIcoLevelInputBuilder();

  GIcoLevelInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _level = $v.level;
      _price = $v.price;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GIcoLevelInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GIcoLevelInput;
  }

  @override
  void update(void Function(GIcoLevelInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GIcoLevelInput build() => _build();

  _$GIcoLevelInput _build() {
    final _$result =
        _$v ?? new _$GIcoLevelInput._(id: id, level: level, price: price);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
