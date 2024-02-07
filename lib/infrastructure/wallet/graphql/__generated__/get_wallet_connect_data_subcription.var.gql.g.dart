// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wallet_connect_data_subcription.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GconnectToWalletVars> _$gconnectToWalletVarsSerializer =
    new _$GconnectToWalletVarsSerializer();

class _$GconnectToWalletVarsSerializer
    implements StructuredSerializer<GconnectToWalletVars> {
  @override
  final Iterable<Type> types = const [
    GconnectToWalletVars,
    _$GconnectToWalletVars
  ];
  @override
  final String wireName = 'GconnectToWalletVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GconnectToWalletVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GconnectToWalletVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GconnectToWalletVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GconnectToWalletVars extends GconnectToWalletVars {
  @override
  final String token;

  factory _$GconnectToWalletVars(
          [void Function(GconnectToWalletVarsBuilder)? updates]) =>
      (new GconnectToWalletVarsBuilder()..update(updates))._build();

  _$GconnectToWalletVars._({required this.token}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        token, r'GconnectToWalletVars', 'token');
  }

  @override
  GconnectToWalletVars rebuild(
          void Function(GconnectToWalletVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GconnectToWalletVarsBuilder toBuilder() =>
      new GconnectToWalletVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GconnectToWalletVars && token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GconnectToWalletVars')
          ..add('token', token))
        .toString();
  }
}

class GconnectToWalletVarsBuilder
    implements Builder<GconnectToWalletVars, GconnectToWalletVarsBuilder> {
  _$GconnectToWalletVars? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  GconnectToWalletVarsBuilder();

  GconnectToWalletVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GconnectToWalletVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GconnectToWalletVars;
  }

  @override
  void update(void Function(GconnectToWalletVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GconnectToWalletVars build() => _build();

  _$GconnectToWalletVars _build() {
    final _$result = _$v ??
        new _$GconnectToWalletVars._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'GconnectToWalletVars', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
