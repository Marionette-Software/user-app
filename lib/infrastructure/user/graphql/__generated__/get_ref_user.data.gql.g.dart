// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ref_user.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetRefUserData> _$gGetRefUserDataSerializer =
    new _$GGetRefUserDataSerializer();
Serializer<GGetRefUserData_refUser> _$gGetRefUserDataRefUserSerializer =
    new _$GGetRefUserData_refUserSerializer();
Serializer<GGetRefUserData_refUser_referralsByLevel>
    _$gGetRefUserDataRefUserReferralsByLevelSerializer =
    new _$GGetRefUserData_refUser_referralsByLevelSerializer();

class _$GGetRefUserDataSerializer
    implements StructuredSerializer<GGetRefUserData> {
  @override
  final Iterable<Type> types = const [GGetRefUserData, _$GGetRefUserData];
  @override
  final String wireName = 'GGetRefUserData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetRefUserData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.refUser;
    if (value != null) {
      result
        ..add('refUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetRefUserData_refUser)));
    }
    return result;
  }

  @override
  GGetRefUserData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetRefUserDataBuilder();

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
        case 'refUser':
          result.refUser.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GGetRefUserData_refUser))!
              as GGetRefUserData_refUser);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetRefUserData_refUserSerializer
    implements StructuredSerializer<GGetRefUserData_refUser> {
  @override
  final Iterable<Type> types = const [
    GGetRefUserData_refUser,
    _$GGetRefUserData_refUser
  ];
  @override
  final String wireName = 'GGetRefUserData_refUser';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetRefUserData_refUser object,
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
    value = object.refCode;
    if (value != null) {
      result
        ..add('refCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.referralsByLevel;
    if (value != null) {
      result
        ..add('referralsByLevel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GGetRefUserData_refUser_referralsByLevel)
            ])));
    }
    return result;
  }

  @override
  GGetRefUserData_refUser deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetRefUserData_refUserBuilder();

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
        case 'refCode':
          result.refCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'referralsByLevel':
          result.referralsByLevel.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GGetRefUserData_refUser_referralsByLevel)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetRefUserData_refUser_referralsByLevelSerializer
    implements StructuredSerializer<GGetRefUserData_refUser_referralsByLevel> {
  @override
  final Iterable<Type> types = const [
    GGetRefUserData_refUser_referralsByLevel,
    _$GGetRefUserData_refUser_referralsByLevel
  ];
  @override
  final String wireName = 'GGetRefUserData_refUser_referralsByLevel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetRefUserData_refUser_referralsByLevel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.level;
    if (value != null) {
      result
        ..add('level')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.count;
    if (value != null) {
      result
        ..add('count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GGetRefUserData_refUser_referralsByLevel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetRefUserData_refUser_referralsByLevelBuilder();

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
        case 'level':
          result.level = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetRefUserData extends GGetRefUserData {
  @override
  final String G__typename;
  @override
  final GGetRefUserData_refUser? refUser;

  factory _$GGetRefUserData([void Function(GGetRefUserDataBuilder)? updates]) =>
      (new GGetRefUserDataBuilder()..update(updates))._build();

  _$GGetRefUserData._({required this.G__typename, this.refUser}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetRefUserData', 'G__typename');
  }

  @override
  GGetRefUserData rebuild(void Function(GGetRefUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetRefUserDataBuilder toBuilder() =>
      new GGetRefUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetRefUserData &&
        G__typename == other.G__typename &&
        refUser == other.refUser;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, refUser.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetRefUserData')
          ..add('G__typename', G__typename)
          ..add('refUser', refUser))
        .toString();
  }
}

class GGetRefUserDataBuilder
    implements Builder<GGetRefUserData, GGetRefUserDataBuilder> {
  _$GGetRefUserData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetRefUserData_refUserBuilder? _refUser;
  GGetRefUserData_refUserBuilder get refUser =>
      _$this._refUser ??= new GGetRefUserData_refUserBuilder();
  set refUser(GGetRefUserData_refUserBuilder? refUser) =>
      _$this._refUser = refUser;

  GGetRefUserDataBuilder() {
    GGetRefUserData._initializeBuilder(this);
  }

  GGetRefUserDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _refUser = $v.refUser?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetRefUserData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetRefUserData;
  }

  @override
  void update(void Function(GGetRefUserDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetRefUserData build() => _build();

  _$GGetRefUserData _build() {
    _$GGetRefUserData _$result;
    try {
      _$result = _$v ??
          new _$GGetRefUserData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetRefUserData', 'G__typename'),
              refUser: _refUser?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'refUser';
        _refUser?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetRefUserData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetRefUserData_refUser extends GGetRefUserData_refUser {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? refCode;
  @override
  final BuiltList<GGetRefUserData_refUser_referralsByLevel?>? referralsByLevel;

  factory _$GGetRefUserData_refUser(
          [void Function(GGetRefUserData_refUserBuilder)? updates]) =>
      (new GGetRefUserData_refUserBuilder()..update(updates))._build();

  _$GGetRefUserData_refUser._(
      {required this.G__typename, this.id, this.refCode, this.referralsByLevel})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetRefUserData_refUser', 'G__typename');
  }

  @override
  GGetRefUserData_refUser rebuild(
          void Function(GGetRefUserData_refUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetRefUserData_refUserBuilder toBuilder() =>
      new GGetRefUserData_refUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetRefUserData_refUser &&
        G__typename == other.G__typename &&
        id == other.id &&
        refCode == other.refCode &&
        referralsByLevel == other.referralsByLevel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, refCode.hashCode);
    _$hash = $jc(_$hash, referralsByLevel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetRefUserData_refUser')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('refCode', refCode)
          ..add('referralsByLevel', referralsByLevel))
        .toString();
  }
}

class GGetRefUserData_refUserBuilder
    implements
        Builder<GGetRefUserData_refUser, GGetRefUserData_refUserBuilder> {
  _$GGetRefUserData_refUser? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _refCode;
  String? get refCode => _$this._refCode;
  set refCode(String? refCode) => _$this._refCode = refCode;

  ListBuilder<GGetRefUserData_refUser_referralsByLevel?>? _referralsByLevel;
  ListBuilder<GGetRefUserData_refUser_referralsByLevel?> get referralsByLevel =>
      _$this._referralsByLevel ??=
          new ListBuilder<GGetRefUserData_refUser_referralsByLevel?>();
  set referralsByLevel(
          ListBuilder<GGetRefUserData_refUser_referralsByLevel?>?
              referralsByLevel) =>
      _$this._referralsByLevel = referralsByLevel;

  GGetRefUserData_refUserBuilder() {
    GGetRefUserData_refUser._initializeBuilder(this);
  }

  GGetRefUserData_refUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _refCode = $v.refCode;
      _referralsByLevel = $v.referralsByLevel?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetRefUserData_refUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetRefUserData_refUser;
  }

  @override
  void update(void Function(GGetRefUserData_refUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetRefUserData_refUser build() => _build();

  _$GGetRefUserData_refUser _build() {
    _$GGetRefUserData_refUser _$result;
    try {
      _$result = _$v ??
          new _$GGetRefUserData_refUser._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetRefUserData_refUser', 'G__typename'),
              id: id,
              refCode: refCode,
              referralsByLevel: _referralsByLevel?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'referralsByLevel';
        _referralsByLevel?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetRefUserData_refUser', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetRefUserData_refUser_referralsByLevel
    extends GGetRefUserData_refUser_referralsByLevel {
  @override
  final String G__typename;
  @override
  final int? level;
  @override
  final int? count;

  factory _$GGetRefUserData_refUser_referralsByLevel(
          [void Function(GGetRefUserData_refUser_referralsByLevelBuilder)?
              updates]) =>
      (new GGetRefUserData_refUser_referralsByLevelBuilder()..update(updates))
          ._build();

  _$GGetRefUserData_refUser_referralsByLevel._(
      {required this.G__typename, this.level, this.count})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetRefUserData_refUser_referralsByLevel', 'G__typename');
  }

  @override
  GGetRefUserData_refUser_referralsByLevel rebuild(
          void Function(GGetRefUserData_refUser_referralsByLevelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetRefUserData_refUser_referralsByLevelBuilder toBuilder() =>
      new GGetRefUserData_refUser_referralsByLevelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetRefUserData_refUser_referralsByLevel &&
        G__typename == other.G__typename &&
        level == other.level &&
        count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, level.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetRefUserData_refUser_referralsByLevel')
          ..add('G__typename', G__typename)
          ..add('level', level)
          ..add('count', count))
        .toString();
  }
}

class GGetRefUserData_refUser_referralsByLevelBuilder
    implements
        Builder<GGetRefUserData_refUser_referralsByLevel,
            GGetRefUserData_refUser_referralsByLevelBuilder> {
  _$GGetRefUserData_refUser_referralsByLevel? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  GGetRefUserData_refUser_referralsByLevelBuilder() {
    GGetRefUserData_refUser_referralsByLevel._initializeBuilder(this);
  }

  GGetRefUserData_refUser_referralsByLevelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _level = $v.level;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetRefUserData_refUser_referralsByLevel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetRefUserData_refUser_referralsByLevel;
  }

  @override
  void update(
      void Function(GGetRefUserData_refUser_referralsByLevelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetRefUserData_refUser_referralsByLevel build() => _build();

  _$GGetRefUserData_refUser_referralsByLevel _build() {
    final _$result = _$v ??
        new _$GGetRefUserData_refUser_referralsByLevel._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetRefUserData_refUser_referralsByLevel', 'G__typename'),
            level: level,
            count: count);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
