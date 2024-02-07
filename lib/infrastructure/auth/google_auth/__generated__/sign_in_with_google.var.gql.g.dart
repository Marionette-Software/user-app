// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_with_google.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSignUpWithGoogleVars> _$gSignUpWithGoogleVarsSerializer =
    new _$GSignUpWithGoogleVarsSerializer();

class _$GSignUpWithGoogleVarsSerializer
    implements StructuredSerializer<GSignUpWithGoogleVars> {
  @override
  final Iterable<Type> types = const [
    GSignUpWithGoogleVars,
    _$GSignUpWithGoogleVars
  ];
  @override
  final String wireName = 'GSignUpWithGoogleVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSignUpWithGoogleVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.referralId;
    if (value != null) {
      result
        ..add('referralId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GSignUpWithGoogleVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSignUpWithGoogleVarsBuilder();

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
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'referralId':
          result.referralId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GSignUpWithGoogleVars extends GSignUpWithGoogleVars {
  @override
  final String token;
  @override
  final String? code;
  @override
  final String? referralId;

  factory _$GSignUpWithGoogleVars(
          [void Function(GSignUpWithGoogleVarsBuilder)? updates]) =>
      (new GSignUpWithGoogleVarsBuilder()..update(updates))._build();

  _$GSignUpWithGoogleVars._({required this.token, this.code, this.referralId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        token, r'GSignUpWithGoogleVars', 'token');
  }

  @override
  GSignUpWithGoogleVars rebuild(
          void Function(GSignUpWithGoogleVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSignUpWithGoogleVarsBuilder toBuilder() =>
      new GSignUpWithGoogleVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSignUpWithGoogleVars &&
        token == other.token &&
        code == other.code &&
        referralId == other.referralId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, referralId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSignUpWithGoogleVars')
          ..add('token', token)
          ..add('code', code)
          ..add('referralId', referralId))
        .toString();
  }
}

class GSignUpWithGoogleVarsBuilder
    implements Builder<GSignUpWithGoogleVars, GSignUpWithGoogleVarsBuilder> {
  _$GSignUpWithGoogleVars? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _referralId;
  String? get referralId => _$this._referralId;
  set referralId(String? referralId) => _$this._referralId = referralId;

  GSignUpWithGoogleVarsBuilder();

  GSignUpWithGoogleVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _code = $v.code;
      _referralId = $v.referralId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSignUpWithGoogleVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSignUpWithGoogleVars;
  }

  @override
  void update(void Function(GSignUpWithGoogleVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSignUpWithGoogleVars build() => _build();

  _$GSignUpWithGoogleVars _build() {
    final _$result = _$v ??
        new _$GSignUpWithGoogleVars._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'GSignUpWithGoogleVars', 'token'),
            code: code,
            referralId: referralId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
