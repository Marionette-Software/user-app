// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_email.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GVerifyEmailTokenVars> _$gVerifyEmailTokenVarsSerializer =
    new _$GVerifyEmailTokenVarsSerializer();

class _$GVerifyEmailTokenVarsSerializer
    implements StructuredSerializer<GVerifyEmailTokenVars> {
  @override
  final Iterable<Type> types = const [
    GVerifyEmailTokenVars,
    _$GVerifyEmailTokenVars
  ];
  @override
  final String wireName = 'GVerifyEmailTokenVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GVerifyEmailTokenVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.isFront;
    if (value != null) {
      result
        ..add('isFront')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GVerifyEmailTokenVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GVerifyEmailTokenVarsBuilder();

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
        case 'isFront':
          result.isFront = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GVerifyEmailTokenVars extends GVerifyEmailTokenVars {
  @override
  final String token;
  @override
  final bool? isFront;

  factory _$GVerifyEmailTokenVars(
          [void Function(GVerifyEmailTokenVarsBuilder)? updates]) =>
      (new GVerifyEmailTokenVarsBuilder()..update(updates))._build();

  _$GVerifyEmailTokenVars._({required this.token, this.isFront}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        token, r'GVerifyEmailTokenVars', 'token');
  }

  @override
  GVerifyEmailTokenVars rebuild(
          void Function(GVerifyEmailTokenVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GVerifyEmailTokenVarsBuilder toBuilder() =>
      new GVerifyEmailTokenVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GVerifyEmailTokenVars &&
        token == other.token &&
        isFront == other.isFront;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, isFront.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GVerifyEmailTokenVars')
          ..add('token', token)
          ..add('isFront', isFront))
        .toString();
  }
}

class GVerifyEmailTokenVarsBuilder
    implements Builder<GVerifyEmailTokenVars, GVerifyEmailTokenVarsBuilder> {
  _$GVerifyEmailTokenVars? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  bool? _isFront;
  bool? get isFront => _$this._isFront;
  set isFront(bool? isFront) => _$this._isFront = isFront;

  GVerifyEmailTokenVarsBuilder();

  GVerifyEmailTokenVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _isFront = $v.isFront;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GVerifyEmailTokenVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GVerifyEmailTokenVars;
  }

  @override
  void update(void Function(GVerifyEmailTokenVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GVerifyEmailTokenVars build() => _build();

  _$GVerifyEmailTokenVars _build() {
    final _$result = _$v ??
        new _$GVerifyEmailTokenVars._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'GVerifyEmailTokenVars', 'token'),
            isFront: isFront);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
