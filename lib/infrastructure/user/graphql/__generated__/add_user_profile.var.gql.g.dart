// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_profile.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAddUserProfileVars> _$gAddUserProfileVarsSerializer =
    new _$GAddUserProfileVarsSerializer();

class _$GAddUserProfileVarsSerializer
    implements StructuredSerializer<GAddUserProfileVars> {
  @override
  final Iterable<Type> types = const [
    GAddUserProfileVars,
    _$GAddUserProfileVars
  ];
  @override
  final String wireName = 'GAddUserProfileVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAddUserProfileVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'first_name',
      serializers.serialize(object.first_name,
          specifiedType: const FullType(String)),
      'last_name',
      serializers.serialize(object.last_name,
          specifiedType: const FullType(String)),
      'birth',
      serializers.serialize(object.birth,
          specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'city',
      serializers.serialize(object.city, specifiedType: const FullType(String)),
      'country',
      serializers.serialize(object.country,
          specifiedType: const FullType(String)),
      'postcode',
      serializers.serialize(object.postcode,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAddUserProfileVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddUserProfileVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'first_name':
          result.first_name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'last_name':
          result.last_name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'birth':
          result.birth = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'postcode':
          result.postcode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAddUserProfileVars extends GAddUserProfileVars {
  @override
  final String first_name;
  @override
  final String last_name;
  @override
  final String birth;
  @override
  final String address;
  @override
  final String city;
  @override
  final String country;
  @override
  final String postcode;

  factory _$GAddUserProfileVars(
          [void Function(GAddUserProfileVarsBuilder)? updates]) =>
      (new GAddUserProfileVarsBuilder()..update(updates))._build();

  _$GAddUserProfileVars._(
      {required this.first_name,
      required this.last_name,
      required this.birth,
      required this.address,
      required this.city,
      required this.country,
      required this.postcode})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        first_name, r'GAddUserProfileVars', 'first_name');
    BuiltValueNullFieldError.checkNotNull(
        last_name, r'GAddUserProfileVars', 'last_name');
    BuiltValueNullFieldError.checkNotNull(
        birth, r'GAddUserProfileVars', 'birth');
    BuiltValueNullFieldError.checkNotNull(
        address, r'GAddUserProfileVars', 'address');
    BuiltValueNullFieldError.checkNotNull(city, r'GAddUserProfileVars', 'city');
    BuiltValueNullFieldError.checkNotNull(
        country, r'GAddUserProfileVars', 'country');
    BuiltValueNullFieldError.checkNotNull(
        postcode, r'GAddUserProfileVars', 'postcode');
  }

  @override
  GAddUserProfileVars rebuild(
          void Function(GAddUserProfileVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddUserProfileVarsBuilder toBuilder() =>
      new GAddUserProfileVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddUserProfileVars &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        birth == other.birth &&
        address == other.address &&
        city == other.city &&
        country == other.country &&
        postcode == other.postcode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, first_name.hashCode);
    _$hash = $jc(_$hash, last_name.hashCode);
    _$hash = $jc(_$hash, birth.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, postcode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAddUserProfileVars')
          ..add('first_name', first_name)
          ..add('last_name', last_name)
          ..add('birth', birth)
          ..add('address', address)
          ..add('city', city)
          ..add('country', country)
          ..add('postcode', postcode))
        .toString();
  }
}

class GAddUserProfileVarsBuilder
    implements Builder<GAddUserProfileVars, GAddUserProfileVarsBuilder> {
  _$GAddUserProfileVars? _$v;

  String? _first_name;
  String? get first_name => _$this._first_name;
  set first_name(String? first_name) => _$this._first_name = first_name;

  String? _last_name;
  String? get last_name => _$this._last_name;
  set last_name(String? last_name) => _$this._last_name = last_name;

  String? _birth;
  String? get birth => _$this._birth;
  set birth(String? birth) => _$this._birth = birth;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  String? _postcode;
  String? get postcode => _$this._postcode;
  set postcode(String? postcode) => _$this._postcode = postcode;

  GAddUserProfileVarsBuilder();

  GAddUserProfileVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _first_name = $v.first_name;
      _last_name = $v.last_name;
      _birth = $v.birth;
      _address = $v.address;
      _city = $v.city;
      _country = $v.country;
      _postcode = $v.postcode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddUserProfileVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddUserProfileVars;
  }

  @override
  void update(void Function(GAddUserProfileVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddUserProfileVars build() => _build();

  _$GAddUserProfileVars _build() {
    final _$result = _$v ??
        new _$GAddUserProfileVars._(
            first_name: BuiltValueNullFieldError.checkNotNull(
                first_name, r'GAddUserProfileVars', 'first_name'),
            last_name: BuiltValueNullFieldError.checkNotNull(
                last_name, r'GAddUserProfileVars', 'last_name'),
            birth: BuiltValueNullFieldError.checkNotNull(
                birth, r'GAddUserProfileVars', 'birth'),
            address: BuiltValueNullFieldError.checkNotNull(
                address, r'GAddUserProfileVars', 'address'),
            city: BuiltValueNullFieldError.checkNotNull(
                city, r'GAddUserProfileVars', 'city'),
            country: BuiltValueNullFieldError.checkNotNull(
                country, r'GAddUserProfileVars', 'country'),
            postcode: BuiltValueNullFieldError.checkNotNull(
                postcode, r'GAddUserProfileVars', 'postcode'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
