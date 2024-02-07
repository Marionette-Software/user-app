// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSignInData> _$gSignInDataSerializer = new _$GSignInDataSerializer();
Serializer<GSignInData_login> _$gSignInDataLoginSerializer =
    new _$GSignInData_loginSerializer();
Serializer<GSignInData_login_profiles> _$gSignInDataLoginProfilesSerializer =
    new _$GSignInData_login_profilesSerializer();

class _$GSignInDataSerializer implements StructuredSerializer<GSignInData> {
  @override
  final Iterable<Type> types = const [GSignInData, _$GSignInData];
  @override
  final String wireName = 'GSignInData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GSignInData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.login;
    if (value != null) {
      result
        ..add('login')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GSignInData_login)));
    }
    return result;
  }

  @override
  GSignInData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSignInDataBuilder();

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
        case 'login':
          result.login.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GSignInData_login))!
              as GSignInData_login);
          break;
      }
    }

    return result.build();
  }
}

class _$GSignInData_loginSerializer
    implements StructuredSerializer<GSignInData_login> {
  @override
  final Iterable<Type> types = const [GSignInData_login, _$GSignInData_login];
  @override
  final String wireName = 'GSignInData_login';

  @override
  Iterable<Object?> serialize(Serializers serializers, GSignInData_login object,
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
    value = object.enabled2fa;
    if (value != null) {
      result
        ..add('enabled2fa')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.profiles;
    if (value != null) {
      result
        ..add('profiles')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType.nullable(GSignInData_login_profiles)])));
    }
    return result;
  }

  @override
  GSignInData_login deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSignInData_loginBuilder();

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
        case 'enabled2fa':
          result.enabled2fa = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'profiles':
          result.profiles.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GSignInData_login_profiles)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GSignInData_login_profilesSerializer
    implements StructuredSerializer<GSignInData_login_profiles> {
  @override
  final Iterable<Type> types = const [
    GSignInData_login_profiles,
    _$GSignInData_login_profiles
  ];
  @override
  final String wireName = 'GSignInData_login_profiles';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSignInData_login_profiles object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.first_name;
    if (value != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.last_name;
    if (value != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GSignInData_login_profiles deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSignInData_login_profilesBuilder();

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
        case 'first_name':
          result.first_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_name':
          result.last_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GSignInData extends GSignInData {
  @override
  final String G__typename;
  @override
  final GSignInData_login? login;

  factory _$GSignInData([void Function(GSignInDataBuilder)? updates]) =>
      (new GSignInDataBuilder()..update(updates))._build();

  _$GSignInData._({required this.G__typename, this.login}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSignInData', 'G__typename');
  }

  @override
  GSignInData rebuild(void Function(GSignInDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSignInDataBuilder toBuilder() => new GSignInDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSignInData &&
        G__typename == other.G__typename &&
        login == other.login;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSignInData')
          ..add('G__typename', G__typename)
          ..add('login', login))
        .toString();
  }
}

class GSignInDataBuilder implements Builder<GSignInData, GSignInDataBuilder> {
  _$GSignInData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GSignInData_loginBuilder? _login;
  GSignInData_loginBuilder get login =>
      _$this._login ??= new GSignInData_loginBuilder();
  set login(GSignInData_loginBuilder? login) => _$this._login = login;

  GSignInDataBuilder() {
    GSignInData._initializeBuilder(this);
  }

  GSignInDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _login = $v.login?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSignInData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSignInData;
  }

  @override
  void update(void Function(GSignInDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSignInData build() => _build();

  _$GSignInData _build() {
    _$GSignInData _$result;
    try {
      _$result = _$v ??
          new _$GSignInData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GSignInData', 'G__typename'),
              login: _login?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'login';
        _login?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GSignInData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSignInData_login extends GSignInData_login {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final bool? enabled2fa;
  @override
  final String? token;
  @override
  final BuiltList<GSignInData_login_profiles?>? profiles;

  factory _$GSignInData_login(
          [void Function(GSignInData_loginBuilder)? updates]) =>
      (new GSignInData_loginBuilder()..update(updates))._build();

  _$GSignInData_login._(
      {required this.G__typename,
      this.id,
      this.enabled2fa,
      this.token,
      this.profiles})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSignInData_login', 'G__typename');
  }

  @override
  GSignInData_login rebuild(void Function(GSignInData_loginBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSignInData_loginBuilder toBuilder() =>
      new GSignInData_loginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSignInData_login &&
        G__typename == other.G__typename &&
        id == other.id &&
        enabled2fa == other.enabled2fa &&
        token == other.token &&
        profiles == other.profiles;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, enabled2fa.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, profiles.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSignInData_login')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('enabled2fa', enabled2fa)
          ..add('token', token)
          ..add('profiles', profiles))
        .toString();
  }
}

class GSignInData_loginBuilder
    implements Builder<GSignInData_login, GSignInData_loginBuilder> {
  _$GSignInData_login? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _enabled2fa;
  bool? get enabled2fa => _$this._enabled2fa;
  set enabled2fa(bool? enabled2fa) => _$this._enabled2fa = enabled2fa;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  ListBuilder<GSignInData_login_profiles?>? _profiles;
  ListBuilder<GSignInData_login_profiles?> get profiles =>
      _$this._profiles ??= new ListBuilder<GSignInData_login_profiles?>();
  set profiles(ListBuilder<GSignInData_login_profiles?>? profiles) =>
      _$this._profiles = profiles;

  GSignInData_loginBuilder() {
    GSignInData_login._initializeBuilder(this);
  }

  GSignInData_loginBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _enabled2fa = $v.enabled2fa;
      _token = $v.token;
      _profiles = $v.profiles?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSignInData_login other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSignInData_login;
  }

  @override
  void update(void Function(GSignInData_loginBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSignInData_login build() => _build();

  _$GSignInData_login _build() {
    _$GSignInData_login _$result;
    try {
      _$result = _$v ??
          new _$GSignInData_login._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GSignInData_login', 'G__typename'),
              id: id,
              enabled2fa: enabled2fa,
              token: token,
              profiles: _profiles?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'profiles';
        _profiles?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GSignInData_login', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSignInData_login_profiles extends GSignInData_login_profiles {
  @override
  final String G__typename;
  @override
  final String? first_name;
  @override
  final String? last_name;

  factory _$GSignInData_login_profiles(
          [void Function(GSignInData_login_profilesBuilder)? updates]) =>
      (new GSignInData_login_profilesBuilder()..update(updates))._build();

  _$GSignInData_login_profiles._(
      {required this.G__typename, this.first_name, this.last_name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSignInData_login_profiles', 'G__typename');
  }

  @override
  GSignInData_login_profiles rebuild(
          void Function(GSignInData_login_profilesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSignInData_login_profilesBuilder toBuilder() =>
      new GSignInData_login_profilesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSignInData_login_profiles &&
        G__typename == other.G__typename &&
        first_name == other.first_name &&
        last_name == other.last_name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, first_name.hashCode);
    _$hash = $jc(_$hash, last_name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSignInData_login_profiles')
          ..add('G__typename', G__typename)
          ..add('first_name', first_name)
          ..add('last_name', last_name))
        .toString();
  }
}

class GSignInData_login_profilesBuilder
    implements
        Builder<GSignInData_login_profiles, GSignInData_login_profilesBuilder> {
  _$GSignInData_login_profiles? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _first_name;
  String? get first_name => _$this._first_name;
  set first_name(String? first_name) => _$this._first_name = first_name;

  String? _last_name;
  String? get last_name => _$this._last_name;
  set last_name(String? last_name) => _$this._last_name = last_name;

  GSignInData_login_profilesBuilder() {
    GSignInData_login_profiles._initializeBuilder(this);
  }

  GSignInData_login_profilesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _first_name = $v.first_name;
      _last_name = $v.last_name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSignInData_login_profiles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSignInData_login_profiles;
  }

  @override
  void update(void Function(GSignInData_login_profilesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSignInData_login_profiles build() => _build();

  _$GSignInData_login_profiles _build() {
    final _$result = _$v ??
        new _$GSignInData_login_profiles._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GSignInData_login_profiles', 'G__typename'),
            first_name: first_name,
            last_name: last_name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
