// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wallet_connect_url_by_id.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GgetWalletConnectURIByIdVars>
    _$ggetWalletConnectURIByIdVarsSerializer =
    new _$GgetWalletConnectURIByIdVarsSerializer();

class _$GgetWalletConnectURIByIdVarsSerializer
    implements StructuredSerializer<GgetWalletConnectURIByIdVars> {
  @override
  final Iterable<Type> types = const [
    GgetWalletConnectURIByIdVars,
    _$GgetWalletConnectURIByIdVars
  ];
  @override
  final String wireName = 'GgetWalletConnectURIByIdVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetWalletConnectURIByIdVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'currencyPaymentInterface',
      serializers.serialize(object.currencyPaymentInterface,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GgetWalletConnectURIByIdVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetWalletConnectURIByIdVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'currencyPaymentInterface':
          result.currencyPaymentInterface = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GgetWalletConnectURIByIdVars extends GgetWalletConnectURIByIdVars {
  @override
  final String currencyPaymentInterface;

  factory _$GgetWalletConnectURIByIdVars(
          [void Function(GgetWalletConnectURIByIdVarsBuilder)? updates]) =>
      (new GgetWalletConnectURIByIdVarsBuilder()..update(updates))._build();

  _$GgetWalletConnectURIByIdVars._({required this.currencyPaymentInterface})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(currencyPaymentInterface,
        r'GgetWalletConnectURIByIdVars', 'currencyPaymentInterface');
  }

  @override
  GgetWalletConnectURIByIdVars rebuild(
          void Function(GgetWalletConnectURIByIdVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetWalletConnectURIByIdVarsBuilder toBuilder() =>
      new GgetWalletConnectURIByIdVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetWalletConnectURIByIdVars &&
        currencyPaymentInterface == other.currencyPaymentInterface;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currencyPaymentInterface.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GgetWalletConnectURIByIdVars')
          ..add('currencyPaymentInterface', currencyPaymentInterface))
        .toString();
  }
}

class GgetWalletConnectURIByIdVarsBuilder
    implements
        Builder<GgetWalletConnectURIByIdVars,
            GgetWalletConnectURIByIdVarsBuilder> {
  _$GgetWalletConnectURIByIdVars? _$v;

  String? _currencyPaymentInterface;
  String? get currencyPaymentInterface => _$this._currencyPaymentInterface;
  set currencyPaymentInterface(String? currencyPaymentInterface) =>
      _$this._currencyPaymentInterface = currencyPaymentInterface;

  GgetWalletConnectURIByIdVarsBuilder();

  GgetWalletConnectURIByIdVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyPaymentInterface = $v.currencyPaymentInterface;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetWalletConnectURIByIdVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetWalletConnectURIByIdVars;
  }

  @override
  void update(void Function(GgetWalletConnectURIByIdVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetWalletConnectURIByIdVars build() => _build();

  _$GgetWalletConnectURIByIdVars _build() {
    final _$result = _$v ??
        new _$GgetWalletConnectURIByIdVars._(
            currencyPaymentInterface: BuiltValueNullFieldError.checkNotNull(
                currencyPaymentInterface,
                r'GgetWalletConnectURIByIdVars',
                'currencyPaymentInterface'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
