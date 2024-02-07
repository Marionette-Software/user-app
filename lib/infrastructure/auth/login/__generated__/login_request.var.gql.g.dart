// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSignInVars> _$gSignInVarsSerializer = new _$GSignInVarsSerializer();

class _$GSignInVarsSerializer implements StructuredSerializer<GSignInVars> {
  @override
  final Iterable<Type> types = const [GSignInVars, _$GSignInVars];
  @override
  final String wireName = 'GSignInVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GSignInVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GSignInVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSignInVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GSignInVars extends GSignInVars {
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? code;

  factory _$GSignInVars([void Function(GSignInVarsBuilder)? updates]) =>
      (new GSignInVarsBuilder()..update(updates))._build();

  _$GSignInVars._({this.email, this.password, this.code}) : super._();

  @override
  GSignInVars rebuild(void Function(GSignInVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSignInVarsBuilder toBuilder() => new GSignInVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSignInVars &&
        email == other.email &&
        password == other.password &&
        code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSignInVars')
          ..add('email', email)
          ..add('password', password)
          ..add('code', code))
        .toString();
  }
}

class GSignInVarsBuilder implements Builder<GSignInVars, GSignInVarsBuilder> {
  _$GSignInVars? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  GSignInVarsBuilder();

  GSignInVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _password = $v.password;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSignInVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSignInVars;
  }

  @override
  void update(void Function(GSignInVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSignInVars build() => _build();

  _$GSignInVars _build() {
    final _$result = _$v ??
        new _$GSignInVars._(email: email, password: password, code: code);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
