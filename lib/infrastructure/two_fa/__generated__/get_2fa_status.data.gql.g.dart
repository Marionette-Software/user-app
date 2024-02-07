// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_2fa_status.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGet2FaStatusData> _$gGet2FaStatusDataSerializer =
    new _$GGet2FaStatusDataSerializer();
Serializer<GGet2FaStatusData_user> _$gGet2FaStatusDataUserSerializer =
    new _$GGet2FaStatusData_userSerializer();

class _$GGet2FaStatusDataSerializer
    implements StructuredSerializer<GGet2FaStatusData> {
  @override
  final Iterable<Type> types = const [GGet2FaStatusData, _$GGet2FaStatusData];
  @override
  final String wireName = 'GGet2FaStatusData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGet2FaStatusData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGet2FaStatusData_user)));
    }
    return result;
  }

  @override
  GGet2FaStatusData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGet2FaStatusDataBuilder();

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
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GGet2FaStatusData_user))!
              as GGet2FaStatusData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GGet2FaStatusData_userSerializer
    implements StructuredSerializer<GGet2FaStatusData_user> {
  @override
  final Iterable<Type> types = const [
    GGet2FaStatusData_user,
    _$GGet2FaStatusData_user
  ];
  @override
  final String wireName = 'GGet2FaStatusData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGet2FaStatusData_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.enabled2fa;
    if (value != null) {
      result
        ..add('enabled2fa')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GGet2FaStatusData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGet2FaStatusData_userBuilder();

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
        case 'enabled2fa':
          result.enabled2fa = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGet2FaStatusData extends GGet2FaStatusData {
  @override
  final String G__typename;
  @override
  final GGet2FaStatusData_user? user;

  factory _$GGet2FaStatusData(
          [void Function(GGet2FaStatusDataBuilder)? updates]) =>
      (new GGet2FaStatusDataBuilder()..update(updates))._build();

  _$GGet2FaStatusData._({required this.G__typename, this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGet2FaStatusData', 'G__typename');
  }

  @override
  GGet2FaStatusData rebuild(void Function(GGet2FaStatusDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGet2FaStatusDataBuilder toBuilder() =>
      new GGet2FaStatusDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGet2FaStatusData &&
        G__typename == other.G__typename &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGet2FaStatusData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GGet2FaStatusDataBuilder
    implements Builder<GGet2FaStatusData, GGet2FaStatusDataBuilder> {
  _$GGet2FaStatusData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGet2FaStatusData_userBuilder? _user;
  GGet2FaStatusData_userBuilder get user =>
      _$this._user ??= new GGet2FaStatusData_userBuilder();
  set user(GGet2FaStatusData_userBuilder? user) => _$this._user = user;

  GGet2FaStatusDataBuilder() {
    GGet2FaStatusData._initializeBuilder(this);
  }

  GGet2FaStatusDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGet2FaStatusData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGet2FaStatusData;
  }

  @override
  void update(void Function(GGet2FaStatusDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGet2FaStatusData build() => _build();

  _$GGet2FaStatusData _build() {
    _$GGet2FaStatusData _$result;
    try {
      _$result = _$v ??
          new _$GGet2FaStatusData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGet2FaStatusData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGet2FaStatusData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGet2FaStatusData_user extends GGet2FaStatusData_user {
  @override
  final String G__typename;
  @override
  final bool? enabled2fa;

  factory _$GGet2FaStatusData_user(
          [void Function(GGet2FaStatusData_userBuilder)? updates]) =>
      (new GGet2FaStatusData_userBuilder()..update(updates))._build();

  _$GGet2FaStatusData_user._({required this.G__typename, this.enabled2fa})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGet2FaStatusData_user', 'G__typename');
  }

  @override
  GGet2FaStatusData_user rebuild(
          void Function(GGet2FaStatusData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGet2FaStatusData_userBuilder toBuilder() =>
      new GGet2FaStatusData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGet2FaStatusData_user &&
        G__typename == other.G__typename &&
        enabled2fa == other.enabled2fa;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, enabled2fa.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGet2FaStatusData_user')
          ..add('G__typename', G__typename)
          ..add('enabled2fa', enabled2fa))
        .toString();
  }
}

class GGet2FaStatusData_userBuilder
    implements Builder<GGet2FaStatusData_user, GGet2FaStatusData_userBuilder> {
  _$GGet2FaStatusData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _enabled2fa;
  bool? get enabled2fa => _$this._enabled2fa;
  set enabled2fa(bool? enabled2fa) => _$this._enabled2fa = enabled2fa;

  GGet2FaStatusData_userBuilder() {
    GGet2FaStatusData_user._initializeBuilder(this);
  }

  GGet2FaStatusData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _enabled2fa = $v.enabled2fa;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGet2FaStatusData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGet2FaStatusData_user;
  }

  @override
  void update(void Function(GGet2FaStatusData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGet2FaStatusData_user build() => _build();

  _$GGet2FaStatusData_user _build() {
    final _$result = _$v ??
        new _$GGet2FaStatusData_user._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GGet2FaStatusData_user', 'G__typename'),
            enabled2fa: enabled2fa);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
