// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i1;
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i2;

part 'schema.schema.gql.g.dart';

abstract class GDate implements Built<GDate, GDateBuilder> {
  GDate._();

  factory GDate([String? value]) =>
      _$GDate((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDate> get serializer => _i1.DefaultScalarSerializer<GDate>(
      (Object serialized) => GDate((serialized as String?)));
}

abstract class GTimestamp implements Built<GTimestamp, GTimestampBuilder> {
  GTimestamp._();

  factory GTimestamp([String? value]) =>
      _$GTimestamp((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GTimestamp> get serializer =>
      _i1.DefaultScalarSerializer<GTimestamp>(
          (Object serialized) => GTimestamp((serialized as String?)));
}

abstract class GRefGroupPercentageInput
    implements
        Built<GRefGroupPercentageInput, GRefGroupPercentageInputBuilder> {
  GRefGroupPercentageInput._();

  factory GRefGroupPercentageInput(
          [Function(GRefGroupPercentageInputBuilder b) updates]) =
      _$GRefGroupPercentageInput;

  int? get level;
  double? get percent;
  static Serializer<GRefGroupPercentageInput> get serializer =>
      _$gRefGroupPercentageInputSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GRefGroupPercentageInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRefGroupPercentageInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GRefGroupPercentageInput.serializer,
        json,
      );
}

abstract class GRefGroupOTPaymentInput
    implements Built<GRefGroupOTPaymentInput, GRefGroupOTPaymentInputBuilder> {
  GRefGroupOTPaymentInput._();

  factory GRefGroupOTPaymentInput(
          [Function(GRefGroupOTPaymentInputBuilder b) updates]) =
      _$GRefGroupOTPaymentInput;

  String? get operation;
  String? get currency_id;
  String? get payment_interface_id;
  double? get min_base;
  double? get percent;
  double? get max_reward;
  static Serializer<GRefGroupOTPaymentInput> get serializer =>
      _$gRefGroupOTPaymentInputSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GRefGroupOTPaymentInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRefGroupOTPaymentInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GRefGroupOTPaymentInput.serializer,
        json,
      );
}

abstract class GInputDonateProject
    implements Built<GInputDonateProject, GInputDonateProjectBuilder> {
  GInputDonateProject._();

  factory GInputDonateProject(
      [Function(GInputDonateProjectBuilder b) updates]) = _$GInputDonateProject;

  String? get id;
  String? get name;
  String? get description;
  String? get iconUrl;
  double? get max_amount;
  String? get currencyId;
  String? get coordinatorUserId;
  bool? get enabled;
  bool? get selected;
  bool? get featured;
  String? get categId;
  String? get createdAt;
  String? get updatedAt;
  static Serializer<GInputDonateProject> get serializer =>
      _$gInputDonateProjectSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GInputDonateProject.serializer,
        this,
      ) as Map<String, dynamic>);

  static GInputDonateProject? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GInputDonateProject.serializer,
        json,
      );
}

abstract class GInputBonusDonate
    implements Built<GInputBonusDonate, GInputBonusDonateBuilder> {
  GInputBonusDonate._();

  factory GInputBonusDonate([Function(GInputBonusDonateBuilder b) updates]) =
      _$GInputBonusDonate;

  String? get token;
  double? get coef;
  static Serializer<GInputBonusDonate> get serializer =>
      _$gInputBonusDonateSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GInputBonusDonate.serializer,
        this,
      ) as Map<String, dynamic>);

  static GInputBonusDonate? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GInputBonusDonate.serializer,
        json,
      );
}

abstract class GCurrencyPaymentInterfaceInput
    implements
        Built<GCurrencyPaymentInterfaceInput,
            GCurrencyPaymentInterfaceInputBuilder> {
  GCurrencyPaymentInterfaceInput._();

  factory GCurrencyPaymentInterfaceInput(
          [Function(GCurrencyPaymentInterfaceInputBuilder b) updates]) =
      _$GCurrencyPaymentInterfaceInput;

  String get paymentInterfaceId;
  String? get description;
  String get type;
  String? get contractAddress;
  int? get gasLimit;
  int? get subunits;
  double? get minDepositAmount;
  double? get depositFee;
  double? get minDepositFee;
  double? get maxDepositFee;
  bool? get userDepositEnable;
  double? get minDirectDepositAmount;
  double? get directDepositFee;
  double? get minDirectDepositFee;
  double? get maxDirectDepositFee;
  bool? get userDirectDepositEnabled;
  double? get minWithdrawAmount;
  double? get maxWithdrawAmount;
  double? get maxWithdrawAmount24h;
  double? get maxWithdrawAmount72h;
  double? get withdrawFee;
  double? get minWithdrawFee;
  double? get maxWithdrawFee;
  double? get minCollectionAmount;
  bool? get userWithdrawEnable;
  bool? get isDonationEnabled;
  bool? get enable;
  static Serializer<GCurrencyPaymentInterfaceInput> get serializer =>
      _$gCurrencyPaymentInterfaceInputSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCurrencyPaymentInterfaceInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCurrencyPaymentInterfaceInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCurrencyPaymentInterfaceInput.serializer,
        json,
      );
}

class GOperationType extends EnumClass {
  const GOperationType._(String name) : super(name);

  static const GOperationType DIRECT_DEPOSIT = _$gOperationTypeDIRECT_DEPOSIT;

  static const GOperationType ON_CHAIN_SWAP = _$gOperationTypeON_CHAIN_SWAP;

  static Serializer<GOperationType> get serializer =>
      _$gOperationTypeSerializer;

  static BuiltSet<GOperationType> get values => _$gOperationTypeValues;

  static GOperationType valueOf(String name) => _$gOperationTypeValueOf(name);
}

abstract class GIcoLevelInput
    implements Built<GIcoLevelInput, GIcoLevelInputBuilder> {
  GIcoLevelInput._();

  factory GIcoLevelInput([Function(GIcoLevelInputBuilder b) updates]) =
      _$GIcoLevelInput;

  String? get id;
  double? get level;
  double? get price;
  static Serializer<GIcoLevelInput> get serializer =>
      _$gIcoLevelInputSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GIcoLevelInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GIcoLevelInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GIcoLevelInput.serializer,
        json,
      );
}

class GUserType extends EnumClass {
  const GUserType._(String name) : super(name);

  static const GUserType ADMIN = _$gUserTypeADMIN;

  static const GUserType USER = _$gUserTypeUSER;

  static Serializer<GUserType> get serializer => _$gUserTypeSerializer;

  static BuiltSet<GUserType> get values => _$gUserTypeValues;

  static GUserType valueOf(String name) => _$gUserTypeValueOf(name);
}

class GUserState extends EnumClass {
  const GUserState._(String name) : super(name);

  static const GUserState pending = _$gUserStatepending;

  static const GUserState active = _$gUserStateactive;

  static const GUserState banned = _$gUserStatebanned;

  static Serializer<GUserState> get serializer => _$gUserStateSerializer;

  static BuiltSet<GUserState> get values => _$gUserStateValues;

  static GUserState valueOf(String name) => _$gUserStateValueOf(name);
}

const Map<String, Set<String>> possibleTypesMap = {};
