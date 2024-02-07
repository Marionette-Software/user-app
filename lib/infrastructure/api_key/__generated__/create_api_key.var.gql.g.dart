// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_api_key.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateUserApiKeyVars> _$gCreateUserApiKeyVarsSerializer =
    new _$GCreateUserApiKeyVarsSerializer();

class _$GCreateUserApiKeyVarsSerializer
    implements StructuredSerializer<GCreateUserApiKeyVars> {
  @override
  final Iterable<Type> types = const [
    GCreateUserApiKeyVars,
    _$GCreateUserApiKeyVars
  ];
  @override
  final String wireName = 'GCreateUserApiKeyVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateUserApiKeyVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'expires',
      serializers.serialize(object.expires, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.scope;
    if (value != null) {
      result
        ..add('scope')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.otp_code;
    if (value != null) {
      result
        ..add('otp_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GCreateUserApiKeyVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateUserApiKeyVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'expires':
          result.expires = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'scope':
          result.scope = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'otp_code':
          result.otp_code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateUserApiKeyVars extends GCreateUserApiKeyVars {
  @override
  final String? description;
  @override
  final int expires;
  @override
  final String? scope;
  @override
  final String? otp_code;

  factory _$GCreateUserApiKeyVars(
          [void Function(GCreateUserApiKeyVarsBuilder)? updates]) =>
      (new GCreateUserApiKeyVarsBuilder()..update(updates))._build();

  _$GCreateUserApiKeyVars._(
      {this.description, required this.expires, this.scope, this.otp_code})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        expires, r'GCreateUserApiKeyVars', 'expires');
  }

  @override
  GCreateUserApiKeyVars rebuild(
          void Function(GCreateUserApiKeyVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateUserApiKeyVarsBuilder toBuilder() =>
      new GCreateUserApiKeyVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateUserApiKeyVars &&
        description == other.description &&
        expires == other.expires &&
        scope == other.scope &&
        otp_code == other.otp_code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, expires.hashCode);
    _$hash = $jc(_$hash, scope.hashCode);
    _$hash = $jc(_$hash, otp_code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateUserApiKeyVars')
          ..add('description', description)
          ..add('expires', expires)
          ..add('scope', scope)
          ..add('otp_code', otp_code))
        .toString();
  }
}

class GCreateUserApiKeyVarsBuilder
    implements Builder<GCreateUserApiKeyVars, GCreateUserApiKeyVarsBuilder> {
  _$GCreateUserApiKeyVars? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _expires;
  int? get expires => _$this._expires;
  set expires(int? expires) => _$this._expires = expires;

  String? _scope;
  String? get scope => _$this._scope;
  set scope(String? scope) => _$this._scope = scope;

  String? _otp_code;
  String? get otp_code => _$this._otp_code;
  set otp_code(String? otp_code) => _$this._otp_code = otp_code;

  GCreateUserApiKeyVarsBuilder();

  GCreateUserApiKeyVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _expires = $v.expires;
      _scope = $v.scope;
      _otp_code = $v.otp_code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateUserApiKeyVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateUserApiKeyVars;
  }

  @override
  void update(void Function(GCreateUserApiKeyVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateUserApiKeyVars build() => _build();

  _$GCreateUserApiKeyVars _build() {
    final _$result = _$v ??
        new _$GCreateUserApiKeyVars._(
            description: description,
            expires: BuiltValueNullFieldError.checkNotNull(
                expires, r'GCreateUserApiKeyVars', 'expires'),
            scope: scope,
            otp_code: otp_code);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
