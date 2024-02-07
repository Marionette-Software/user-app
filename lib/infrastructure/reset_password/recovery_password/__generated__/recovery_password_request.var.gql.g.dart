// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recovery_password_request.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GRecoveryPasswordVars> _$gRecoveryPasswordVarsSerializer =
    new _$GRecoveryPasswordVarsSerializer();

class _$GRecoveryPasswordVarsSerializer
    implements StructuredSerializer<GRecoveryPasswordVars> {
  @override
  final Iterable<Type> types = const [
    GRecoveryPasswordVars,
    _$GRecoveryPasswordVars
  ];
  @override
  final String wireName = 'GRecoveryPasswordVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GRecoveryPasswordVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
      'newPassword',
      serializers.serialize(object.newPassword,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GRecoveryPasswordVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRecoveryPasswordVarsBuilder();

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
        case 'newPassword':
          result.newPassword = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GRecoveryPasswordVars extends GRecoveryPasswordVars {
  @override
  final String token;
  @override
  final String newPassword;

  factory _$GRecoveryPasswordVars(
          [void Function(GRecoveryPasswordVarsBuilder)? updates]) =>
      (new GRecoveryPasswordVarsBuilder()..update(updates))._build();

  _$GRecoveryPasswordVars._({required this.token, required this.newPassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        token, r'GRecoveryPasswordVars', 'token');
    BuiltValueNullFieldError.checkNotNull(
        newPassword, r'GRecoveryPasswordVars', 'newPassword');
  }

  @override
  GRecoveryPasswordVars rebuild(
          void Function(GRecoveryPasswordVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRecoveryPasswordVarsBuilder toBuilder() =>
      new GRecoveryPasswordVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRecoveryPasswordVars &&
        token == other.token &&
        newPassword == other.newPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, newPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GRecoveryPasswordVars')
          ..add('token', token)
          ..add('newPassword', newPassword))
        .toString();
  }
}

class GRecoveryPasswordVarsBuilder
    implements Builder<GRecoveryPasswordVars, GRecoveryPasswordVarsBuilder> {
  _$GRecoveryPasswordVars? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _newPassword;
  String? get newPassword => _$this._newPassword;
  set newPassword(String? newPassword) => _$this._newPassword = newPassword;

  GRecoveryPasswordVarsBuilder();

  GRecoveryPasswordVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _newPassword = $v.newPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRecoveryPasswordVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRecoveryPasswordVars;
  }

  @override
  void update(void Function(GRecoveryPasswordVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GRecoveryPasswordVars build() => _build();

  _$GRecoveryPasswordVars _build() {
    final _$result = _$v ??
        new _$GRecoveryPasswordVars._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'GRecoveryPasswordVars', 'token'),
            newPassword: BuiltValueNullFieldError.checkNotNull(
                newPassword, r'GRecoveryPasswordVars', 'newPassword'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
