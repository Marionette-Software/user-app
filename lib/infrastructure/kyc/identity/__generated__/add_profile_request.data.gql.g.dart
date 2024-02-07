// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_profile_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAddProfileData> _$gAddProfileDataSerializer =
    new _$GAddProfileDataSerializer();

class _$GAddProfileDataSerializer
    implements StructuredSerializer<GAddProfileData> {
  @override
  final Iterable<Type> types = const [GAddProfileData, _$GAddProfileData];
  @override
  final String wireName = 'GAddProfileData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAddProfileData object,
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
  GAddProfileData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddProfileDataBuilder();

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

class _$GAddProfileData extends GAddProfileData {
  @override
  final String G__typename;
  @override
  final String? addProfile;

  factory _$GAddProfileData([void Function(GAddProfileDataBuilder)? updates]) =>
      (new GAddProfileDataBuilder()..update(updates))._build();

  _$GAddProfileData._({required this.G__typename, this.addProfile})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAddProfileData', 'G__typename');
  }

  @override
  GAddProfileData rebuild(void Function(GAddProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddProfileDataBuilder toBuilder() =>
      new GAddProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddProfileData &&
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
    return (newBuiltValueToStringHelper(r'GAddProfileData')
          ..add('G__typename', G__typename)
          ..add('addProfile', addProfile))
        .toString();
  }
}

class GAddProfileDataBuilder
    implements Builder<GAddProfileData, GAddProfileDataBuilder> {
  _$GAddProfileData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _addProfile;
  String? get addProfile => _$this._addProfile;
  set addProfile(String? addProfile) => _$this._addProfile = addProfile;

  GAddProfileDataBuilder() {
    GAddProfileData._initializeBuilder(this);
  }

  GAddProfileDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _addProfile = $v.addProfile;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddProfileData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddProfileData;
  }

  @override
  void update(void Function(GAddProfileDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddProfileData build() => _build();

  _$GAddProfileData _build() {
    final _$result = _$v ??
        new _$GAddProfileData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GAddProfileData', 'G__typename'),
            addProfile: addProfile);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
