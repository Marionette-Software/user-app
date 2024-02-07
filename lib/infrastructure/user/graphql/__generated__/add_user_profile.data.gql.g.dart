// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_profile.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAddUserProfileData> _$gAddUserProfileDataSerializer =
    new _$GAddUserProfileDataSerializer();

class _$GAddUserProfileDataSerializer
    implements StructuredSerializer<GAddUserProfileData> {
  @override
  final Iterable<Type> types = const [
    GAddUserProfileData,
    _$GAddUserProfileData
  ];
  @override
  final String wireName = 'GAddUserProfileData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAddUserProfileData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.addProfile;
    if (value != null) {
      result
        ..add('addProfile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GAddUserProfileData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddUserProfileDataBuilder();

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
        case 'addProfile':
          result.addProfile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GAddUserProfileData extends GAddUserProfileData {
  @override
  final String G__typename;
  @override
  final String? addProfile;

  factory _$GAddUserProfileData(
          [void Function(GAddUserProfileDataBuilder)? updates]) =>
      (new GAddUserProfileDataBuilder()..update(updates))._build();

  _$GAddUserProfileData._({required this.G__typename, this.addProfile})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAddUserProfileData', 'G__typename');
  }

  @override
  GAddUserProfileData rebuild(
          void Function(GAddUserProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddUserProfileDataBuilder toBuilder() =>
      new GAddUserProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddUserProfileData &&
        G__typename == other.G__typename &&
        addProfile == other.addProfile;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, addProfile.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAddUserProfileData')
          ..add('G__typename', G__typename)
          ..add('addProfile', addProfile))
        .toString();
  }
}

class GAddUserProfileDataBuilder
    implements Builder<GAddUserProfileData, GAddUserProfileDataBuilder> {
  _$GAddUserProfileData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _addProfile;
  String? get addProfile => _$this._addProfile;
  set addProfile(String? addProfile) => _$this._addProfile = addProfile;

  GAddUserProfileDataBuilder() {
    GAddUserProfileData._initializeBuilder(this);
  }

  GAddUserProfileDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _addProfile = $v.addProfile;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddUserProfileData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddUserProfileData;
  }

  @override
  void update(void Function(GAddUserProfileDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddUserProfileData build() => _build();

  _$GAddUserProfileData _build() {
    final _$result = _$v ??
        new _$GAddUserProfileData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GAddUserProfileData', 'G__typename'),
            addProfile: addProfile);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
