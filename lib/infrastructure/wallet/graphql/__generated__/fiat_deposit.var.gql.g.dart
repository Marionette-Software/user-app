// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiat_deposit.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFiatGenerateWalletVars> _$gFiatGenerateWalletVarsSerializer =
    new _$GFiatGenerateWalletVarsSerializer();

class _$GFiatGenerateWalletVarsSerializer
    implements StructuredSerializer<GFiatGenerateWalletVars> {
  @override
  final Iterable<Type> types = const [
    GFiatGenerateWalletVars,
    _$GFiatGenerateWalletVars
  ];
  @override
  final String wireName = 'GFiatGenerateWalletVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFiatGenerateWalletVars object,
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
  GFiatGenerateWalletVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFiatGenerateWalletVarsBuilder();

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

class _$GFiatGenerateWalletVars extends GFiatGenerateWalletVars {
  @override
  final String currencyId;
  @override
  final String paymentInterfaceId;
  @override
  final bool isDonation;

  factory _$GFiatGenerateWalletVars(
          [void Function(GFiatGenerateWalletVarsBuilder)? updates]) =>
      (new GFiatGenerateWalletVarsBuilder()..update(updates))._build();

  _$GFiatGenerateWalletVars._(
      {required this.currencyId,
      required this.paymentInterfaceId,
      required this.isDonation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currencyId, r'GFiatGenerateWalletVars', 'currencyId');
    BuiltValueNullFieldError.checkNotNull(
        paymentInterfaceId, r'GFiatGenerateWalletVars', 'paymentInterfaceId');
    BuiltValueNullFieldError.checkNotNull(
        isDonation, r'GFiatGenerateWalletVars', 'isDonation');
  }

  @override
  GFiatGenerateWalletVars rebuild(
          void Function(GFiatGenerateWalletVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFiatGenerateWalletVarsBuilder toBuilder() =>
      new GFiatGenerateWalletVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFiatGenerateWalletVars &&
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
    return (newBuiltValueToStringHelper(r'GFiatGenerateWalletVars')
          ..add('currencyId', currencyId)
          ..add('paymentInterfaceId', paymentInterfaceId)
          ..add('isDonation', isDonation))
        .toString();
  }
}

class GFiatGenerateWalletVarsBuilder
    implements
        Builder<GFiatGenerateWalletVars, GFiatGenerateWalletVarsBuilder> {
  _$GFiatGenerateWalletVars? _$v;

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

  GFiatGenerateWalletVarsBuilder();

  GFiatGenerateWalletVarsBuilder get _$this {
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
  void replace(GFiatGenerateWalletVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFiatGenerateWalletVars;
  }

  @override
  void update(void Function(GFiatGenerateWalletVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFiatGenerateWalletVars build() => _build();

  _$GFiatGenerateWalletVars _build() {
    final _$result = _$v ??
        new _$GFiatGenerateWalletVars._(
            currencyId: BuiltValueNullFieldError.checkNotNull(
                currencyId, r'GFiatGenerateWalletVars', 'currencyId'),
            paymentInterfaceId: BuiltValueNullFieldError.checkNotNull(
                paymentInterfaceId,
                r'GFiatGenerateWalletVars',
                'paymentInterfaceId'),
            isDonation: BuiltValueNullFieldError.checkNotNull(
                isDonation, r'GFiatGenerateWalletVars', 'isDonation'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
