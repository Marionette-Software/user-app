// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_deposti_address.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGenerateDepositAddressVars>
    _$gGenerateDepositAddressVarsSerializer =
    new _$GGenerateDepositAddressVarsSerializer();

class _$GGenerateDepositAddressVarsSerializer
    implements StructuredSerializer<GGenerateDepositAddressVars> {
  @override
  final Iterable<Type> types = const [
    GGenerateDepositAddressVars,
    _$GGenerateDepositAddressVars
  ];
  @override
  final String wireName = 'GGenerateDepositAddressVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGenerateDepositAddressVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'currencyId',
      serializers.serialize(object.currencyId,
          specifiedType: const FullType(String)),
      'paymentInterfaceId',
      serializers.serialize(object.paymentInterfaceId,
          specifiedType: const FullType(String)),
      'isDonation',
      serializers.serialize(object.isDonation,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GGenerateDepositAddressVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGenerateDepositAddressVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'currencyId':
          result.currencyId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'paymentInterfaceId':
          result.paymentInterfaceId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'isDonation':
          result.isDonation = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GGenerateDepositAddressVars extends GGenerateDepositAddressVars {
  @override
  final String currencyId;
  @override
  final String paymentInterfaceId;
  @override
  final bool isDonation;

  factory _$GGenerateDepositAddressVars(
          [void Function(GGenerateDepositAddressVarsBuilder)? updates]) =>
      (new GGenerateDepositAddressVarsBuilder()..update(updates))._build();

  _$GGenerateDepositAddressVars._(
      {required this.currencyId,
      required this.paymentInterfaceId,
      required this.isDonation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currencyId, r'GGenerateDepositAddressVars', 'currencyId');
    BuiltValueNullFieldError.checkNotNull(paymentInterfaceId,
        r'GGenerateDepositAddressVars', 'paymentInterfaceId');
    BuiltValueNullFieldError.checkNotNull(
        isDonation, r'GGenerateDepositAddressVars', 'isDonation');
  }

  @override
  GGenerateDepositAddressVars rebuild(
          void Function(GGenerateDepositAddressVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGenerateDepositAddressVarsBuilder toBuilder() =>
      new GGenerateDepositAddressVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGenerateDepositAddressVars &&
        currencyId == other.currencyId &&
        paymentInterfaceId == other.paymentInterfaceId &&
        isDonation == other.isDonation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currencyId.hashCode);
    _$hash = $jc(_$hash, paymentInterfaceId.hashCode);
    _$hash = $jc(_$hash, isDonation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGenerateDepositAddressVars')
          ..add('currencyId', currencyId)
          ..add('paymentInterfaceId', paymentInterfaceId)
          ..add('isDonation', isDonation))
        .toString();
  }
}

class GGenerateDepositAddressVarsBuilder
    implements
        Builder<GGenerateDepositAddressVars,
            GGenerateDepositAddressVarsBuilder> {
  _$GGenerateDepositAddressVars? _$v;

  String? _currencyId;
  String? get currencyId => _$this._currencyId;
  set currencyId(String? currencyId) => _$this._currencyId = currencyId;

  String? _paymentInterfaceId;
  String? get paymentInterfaceId => _$this._paymentInterfaceId;
  set paymentInterfaceId(String? paymentInterfaceId) =>
      _$this._paymentInterfaceId = paymentInterfaceId;

  bool? _isDonation;
  bool? get isDonation => _$this._isDonation;
  set isDonation(bool? isDonation) => _$this._isDonation = isDonation;

  GGenerateDepositAddressVarsBuilder();

  GGenerateDepositAddressVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyId = $v.currencyId;
      _paymentInterfaceId = $v.paymentInterfaceId;
      _isDonation = $v.isDonation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGenerateDepositAddressVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGenerateDepositAddressVars;
  }

  @override
  void update(void Function(GGenerateDepositAddressVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGenerateDepositAddressVars build() => _build();

  _$GGenerateDepositAddressVars _build() {
    final _$result = _$v ??
        new _$GGenerateDepositAddressVars._(
            currencyId: BuiltValueNullFieldError.checkNotNull(
                currencyId, r'GGenerateDepositAddressVars', 'currencyId'),
            paymentInterfaceId: BuiltValueNullFieldError.checkNotNull(
                paymentInterfaceId,
                r'GGenerateDepositAddressVars',
                'paymentInterfaceId'),
            isDonation: BuiltValueNullFieldError.checkNotNull(
                isDonation, r'GGenerateDepositAddressVars', 'isDonation'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
