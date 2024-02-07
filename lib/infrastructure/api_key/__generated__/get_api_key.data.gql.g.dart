// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_key.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetApiKeysData> _$gGetApiKeysDataSerializer =
    new _$GGetApiKeysDataSerializer();
Serializer<GGetApiKeysData_apiKeys> _$gGetApiKeysDataApiKeysSerializer =
    new _$GGetApiKeysData_apiKeysSerializer();

class _$GGetApiKeysDataSerializer
    implements StructuredSerializer<GGetApiKeysData> {
  @override
  final Iterable<Type> types = const [GGetApiKeysData, _$GGetApiKeysData];
  @override
  final String wireName = 'GGetApiKeysData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetApiKeysData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.apiKeys;
    if (value != null) {
      result
        ..add('apiKeys')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType.nullable(GGetApiKeysData_apiKeys)])));
    }
    return result;
  }

  @override
  GGetApiKeysData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetApiKeysDataBuilder();

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
        case 'apiKeys':
          result.apiKeys.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GGetApiKeysData_apiKeys)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetApiKeysData_apiKeysSerializer
    implements StructuredSerializer<GGetApiKeysData_apiKeys> {
  @override
  final Iterable<Type> types = const [
    GGetApiKeysData_apiKeys,
    _$GGetApiKeysData_apiKeys
  ];
  @override
  final String wireName = 'GGetApiKeysData_apiKeys';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetApiKeysData_apiKeys object,
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
  GGetApiKeysData_apiKeys deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetApiKeysData_apiKeysBuilder();

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

class _$GGetApiKeysData extends GGetApiKeysData {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetApiKeysData_apiKeys?>? apiKeys;

  factory _$GGetApiKeysData([void Function(GGetApiKeysDataBuilder)? updates]) =>
      (new GGetApiKeysDataBuilder()..update(updates))._build();

  _$GGetApiKeysData._({required this.G__typename, this.apiKeys}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetApiKeysData', 'G__typename');
  }

  @override
  GGetApiKeysData rebuild(void Function(GGetApiKeysDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetApiKeysDataBuilder toBuilder() =>
      new GGetApiKeysDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetApiKeysData &&
        G__typename == other.G__typename &&
        apiKeys == other.apiKeys;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, apiKeys.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetApiKeysData')
          ..add('G__typename', G__typename)
          ..add('apiKeys', apiKeys))
        .toString();
  }
}

class GGetApiKeysDataBuilder
    implements Builder<GGetApiKeysData, GGetApiKeysDataBuilder> {
  _$GGetApiKeysData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetApiKeysData_apiKeys?>? _apiKeys;
  ListBuilder<GGetApiKeysData_apiKeys?> get apiKeys =>
      _$this._apiKeys ??= new ListBuilder<GGetApiKeysData_apiKeys?>();
  set apiKeys(ListBuilder<GGetApiKeysData_apiKeys?>? apiKeys) =>
      _$this._apiKeys = apiKeys;

  GGetApiKeysDataBuilder() {
    GGetApiKeysData._initializeBuilder(this);
  }

  GGetApiKeysDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _apiKeys = $v.apiKeys?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetApiKeysData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetApiKeysData;
  }

  @override
  void update(void Function(GGetApiKeysDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetApiKeysData build() => _build();

  _$GGetApiKeysData _build() {
    _$GGetApiKeysData _$result;
    try {
      _$result = _$v ??
          new _$GGetApiKeysData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetApiKeysData', 'G__typename'),
              apiKeys: _apiKeys?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apiKeys';
        _apiKeys?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetApiKeysData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetApiKeysData_apiKeys extends GGetApiKeysData_apiKeys {
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

  factory _$GGetApiKeysData_apiKeys(
          [void Function(GGetApiKeysData_apiKeysBuilder)? updates]) =>
      (new GGetApiKeysData_apiKeysBuilder()..update(updates))._build();

  _$GGetApiKeysData_apiKeys._(
      {required this.G__typename,
      this.id,
      this.description,
      this.scope,
      this.expires,
      this.token})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetApiKeysData_apiKeys', 'G__typename');
  }

  @override
  GGetApiKeysData_apiKeys rebuild(
          void Function(GGetApiKeysData_apiKeysBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetApiKeysData_apiKeysBuilder toBuilder() =>
      new GGetApiKeysData_apiKeysBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetApiKeysData_apiKeys &&
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
    return (newBuiltValueToStringHelper(r'GGetApiKeysData_apiKeys')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('description', description)
          ..add('scope', scope)
          ..add('expires', expires)
          ..add('token', token))
        .toString();
  }
}

class GGetApiKeysData_apiKeysBuilder
    implements
        Builder<GGetApiKeysData_apiKeys, GGetApiKeysData_apiKeysBuilder> {
  _$GGetApiKeysData_apiKeys? _$v;

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

  GGetApiKeysData_apiKeysBuilder() {
    GGetApiKeysData_apiKeys._initializeBuilder(this);
  }

  GGetApiKeysData_apiKeysBuilder get _$this {
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
  void replace(GGetApiKeysData_apiKeys other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetApiKeysData_apiKeys;
  }

  @override
  void update(void Function(GGetApiKeysData_apiKeysBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetApiKeysData_apiKeys build() => _build();

  _$GGetApiKeysData_apiKeys _build() {
    final _$result = _$v ??
        new _$GGetApiKeysData_apiKeys._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GGetApiKeysData_apiKeys', 'G__typename'),
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
