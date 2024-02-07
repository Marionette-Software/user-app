// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_api_key.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateUserApiKeyData> _$gCreateUserApiKeyDataSerializer =
    new _$GCreateUserApiKeyDataSerializer();
Serializer<GCreateUserApiKeyData_createApiKey>
    _$gCreateUserApiKeyDataCreateApiKeySerializer =
    new _$GCreateUserApiKeyData_createApiKeySerializer();

class _$GCreateUserApiKeyDataSerializer
    implements StructuredSerializer<GCreateUserApiKeyData> {
  @override
  final Iterable<Type> types = const [
    GCreateUserApiKeyData,
    _$GCreateUserApiKeyData
  ];
  @override
  final String wireName = 'GCreateUserApiKeyData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateUserApiKeyData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.createApiKey;
    if (value != null) {
      result
        ..add('createApiKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GCreateUserApiKeyData_createApiKey)));
    }
    return result;
  }

  @override
  GCreateUserApiKeyData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateUserApiKeyDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'createApiKey':
          result.createApiKey.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GCreateUserApiKeyData_createApiKey))!
              as GCreateUserApiKeyData_createApiKey);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateUserApiKeyData_createApiKeySerializer
    implements StructuredSerializer<GCreateUserApiKeyData_createApiKey> {
  @override
  final Iterable<Type> types = const [
    GCreateUserApiKeyData_createApiKey,
    _$GCreateUserApiKeyData_createApiKey
  ];
  @override
  final String wireName = 'GCreateUserApiKeyData_createApiKey';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateUserApiKeyData_createApiKey object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
    value = object.expires;
    if (value != null) {
      result
        ..add('expires')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GCreateUserApiKeyData_createApiKey deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateUserApiKeyData_createApiKeyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'scope':
          result.scope = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'expires':
          result.expires = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateUserApiKeyData extends GCreateUserApiKeyData {
  @override
  final String G__typename;
  @override
  final GCreateUserApiKeyData_createApiKey? createApiKey;

  factory _$GCreateUserApiKeyData(
          [void Function(GCreateUserApiKeyDataBuilder)? updates]) =>
      (new GCreateUserApiKeyDataBuilder()..update(updates))._build();

  _$GCreateUserApiKeyData._({required this.G__typename, this.createApiKey})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateUserApiKeyData', 'G__typename');
  }

  @override
  GCreateUserApiKeyData rebuild(
          void Function(GCreateUserApiKeyDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateUserApiKeyDataBuilder toBuilder() =>
      new GCreateUserApiKeyDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateUserApiKeyData &&
        G__typename == other.G__typename &&
        createApiKey == other.createApiKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createApiKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateUserApiKeyData')
          ..add('G__typename', G__typename)
          ..add('createApiKey', createApiKey))
        .toString();
  }
}

class GCreateUserApiKeyDataBuilder
    implements Builder<GCreateUserApiKeyData, GCreateUserApiKeyDataBuilder> {
  _$GCreateUserApiKeyData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateUserApiKeyData_createApiKeyBuilder? _createApiKey;
  GCreateUserApiKeyData_createApiKeyBuilder get createApiKey =>
      _$this._createApiKey ??= new GCreateUserApiKeyData_createApiKeyBuilder();
  set createApiKey(GCreateUserApiKeyData_createApiKeyBuilder? createApiKey) =>
      _$this._createApiKey = createApiKey;

  GCreateUserApiKeyDataBuilder() {
    GCreateUserApiKeyData._initializeBuilder(this);
  }

  GCreateUserApiKeyDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createApiKey = $v.createApiKey?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateUserApiKeyData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateUserApiKeyData;
  }

  @override
  void update(void Function(GCreateUserApiKeyDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateUserApiKeyData build() => _build();

  _$GCreateUserApiKeyData _build() {
    _$GCreateUserApiKeyData _$result;
    try {
      _$result = _$v ??
          new _$GCreateUserApiKeyData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateUserApiKeyData', 'G__typename'),
              createApiKey: _createApiKey?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createApiKey';
        _createApiKey?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateUserApiKeyData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateUserApiKeyData_createApiKey
    extends GCreateUserApiKeyData_createApiKey {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? description;
  @override
  final String? scope;
  @override
  final int? expires;
  @override
  final String? token;

  factory _$GCreateUserApiKeyData_createApiKey(
          [void Function(GCreateUserApiKeyData_createApiKeyBuilder)?
              updates]) =>
      (new GCreateUserApiKeyData_createApiKeyBuilder()..update(updates))
          ._build();

  _$GCreateUserApiKeyData_createApiKey._(
      {required this.G__typename,
      this.id,
      this.description,
      this.scope,
      this.expires,
      this.token})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateUserApiKeyData_createApiKey', 'G__typename');
  }

  @override
  GCreateUserApiKeyData_createApiKey rebuild(
          void Function(GCreateUserApiKeyData_createApiKeyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateUserApiKeyData_createApiKeyBuilder toBuilder() =>
      new GCreateUserApiKeyData_createApiKeyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateUserApiKeyData_createApiKey &&
        G__typename == other.G__typename &&
        id == other.id &&
        description == other.description &&
        scope == other.scope &&
        expires == other.expires &&
        token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, scope.hashCode);
    _$hash = $jc(_$hash, expires.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateUserApiKeyData_createApiKey')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('description', description)
          ..add('scope', scope)
          ..add('expires', expires)
          ..add('token', token))
        .toString();
  }
}

class GCreateUserApiKeyData_createApiKeyBuilder
    implements
        Builder<GCreateUserApiKeyData_createApiKey,
            GCreateUserApiKeyData_createApiKeyBuilder> {
  _$GCreateUserApiKeyData_createApiKey? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _scope;
  String? get scope => _$this._scope;
  set scope(String? scope) => _$this._scope = scope;

  int? _expires;
  int? get expires => _$this._expires;
  set expires(int? expires) => _$this._expires = expires;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  GCreateUserApiKeyData_createApiKeyBuilder() {
    GCreateUserApiKeyData_createApiKey._initializeBuilder(this);
  }

  GCreateUserApiKeyData_createApiKeyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _description = $v.description;
      _scope = $v.scope;
      _expires = $v.expires;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateUserApiKeyData_createApiKey other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateUserApiKeyData_createApiKey;
  }

  @override
  void update(
      void Function(GCreateUserApiKeyData_createApiKeyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateUserApiKeyData_createApiKey build() => _build();

  _$GCreateUserApiKeyData_createApiKey _build() {
    final _$result = _$v ??
        new _$GCreateUserApiKeyData_createApiKey._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GCreateUserApiKeyData_createApiKey', 'G__typename'),
            id: id,
            description: description,
            scope: scope,
            expires: expires,
            token: token);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
