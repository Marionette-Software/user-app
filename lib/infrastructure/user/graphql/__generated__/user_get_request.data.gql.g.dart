// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_get_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUpdateUserData> _$gGetUpdateUserDataSerializer =
    new _$GGetUpdateUserDataSerializer();
Serializer<GGetUpdateUserData_user> _$gGetUpdateUserDataUserSerializer =
    new _$GGetUpdateUserData_userSerializer();
Serializer<GGetUpdateUserData_user_documents>
    _$gGetUpdateUserDataUserDocumentsSerializer =
    new _$GGetUpdateUserData_user_documentsSerializer();
Serializer<GGetUpdateUserData_user_labels>
    _$gGetUpdateUserDataUserLabelsSerializer =
    new _$GGetUpdateUserData_user_labelsSerializer();
Serializer<GGetUpdateUserData_user_phones>
    _$gGetUpdateUserDataUserPhonesSerializer =
    new _$GGetUpdateUserData_user_phonesSerializer();
Serializer<GGetUpdateUserData_user_profiles>
    _$gGetUpdateUserDataUserProfilesSerializer =
    new _$GGetUpdateUserData_user_profilesSerializer();

class _$GGetUpdateUserDataSerializer
    implements StructuredSerializer<GGetUpdateUserData> {
  @override
  final Iterable<Type> types = const [GGetUpdateUserData, _$GGetUpdateUserData];
  @override
  final String wireName = 'GGetUpdateUserData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUpdateUserData object,
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
            specifiedType: const FullType(GGetUpdateUserData_user)));
    }
    return result;
  }

  @override
  GGetUpdateUserData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUpdateUserDataBuilder();

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
                  specifiedType: const FullType(GGetUpdateUserData_user))!
              as GGetUpdateUserData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUpdateUserData_userSerializer
    implements StructuredSerializer<GGetUpdateUserData_user> {
  @override
  final Iterable<Type> types = const [
    GGetUpdateUserData_user,
    _$GGetUpdateUserData_user
  ];
  @override
  final String wireName = 'GGetUpdateUserData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUpdateUserData_user object,
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
    value = object.email;
    if (value != null) {
      result
        ..add('email')
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
    value = object.role;
    if (value != null) {
      result
        ..add('role')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email_verified;
    if (value != null) {
      result
        ..add('email_verified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.phone_verified;
    if (value != null) {
      result
        ..add('phone_verified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.profile_verified;
    if (value != null) {
      result
        ..add('profile_verified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.documents;
    if (value != null) {
      result
        ..add('documents')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GGetUpdateUserData_user_documents)
            ])));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.labels;
    if (value != null) {
      result
        ..add('labels')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GGetUpdateUserData_user_labels)
            ])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updatedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phones;
    if (value != null) {
      result
        ..add('phones')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GGetUpdateUserData_user_phones)
            ])));
    }
    value = object.profiles;
    if (value != null) {
      result
        ..add('profiles')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GGetUpdateUserData_user_profiles)
            ])));
    }
    return result;
  }

  @override
  GGetUpdateUserData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUpdateUserData_userBuilder();

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
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'enabled2fa':
          result.enabled2fa = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email_verified':
          result.email_verified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'phone_verified':
          result.phone_verified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'profile_verified':
          result.profile_verified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'documents':
          result.documents.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GGetUpdateUserData_user_documents)
              ]))! as BuiltList<Object?>);
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'labels':
          result.labels.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GGetUpdateUserData_user_labels)
              ]))! as BuiltList<Object?>);
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phones':
          result.phones.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GGetUpdateUserData_user_phones)
              ]))! as BuiltList<Object?>);
          break;
        case 'profiles':
          result.profiles.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(GGetUpdateUserData_user_profiles)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUpdateUserData_user_documentsSerializer
    implements StructuredSerializer<GGetUpdateUserData_user_documents> {
  @override
  final Iterable<Type> types = const [
    GGetUpdateUserData_user_documents,
    _$GGetUpdateUserData_user_documents
  ];
  @override
  final String wireName = 'GGetUpdateUserData_user_documents';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUpdateUserData_user_documents object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.doc_type;
    if (value != null) {
      result
        ..add('doc_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doc_number;
    if (value != null) {
      result
        ..add('doc_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doc_expire;
    if (value != null) {
      result
        ..add('doc_expire')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetUpdateUserData_user_documents deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUpdateUserData_user_documentsBuilder();

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
        case 'doc_type':
          result.doc_type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doc_number':
          result.doc_number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doc_expire':
          result.doc_expire = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUpdateUserData_user_labelsSerializer
    implements StructuredSerializer<GGetUpdateUserData_user_labels> {
  @override
  final Iterable<Type> types = const [
    GGetUpdateUserData_user_labels,
    _$GGetUpdateUserData_user_labels
  ];
  @override
  final String wireName = 'GGetUpdateUserData_user_labels';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUpdateUserData_user_labels object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.key;
    if (value != null) {
      result
        ..add('key')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.value;
    if (value != null) {
      result
        ..add('value')
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
    return result;
  }

  @override
  GGetUpdateUserData_user_labels deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUpdateUserData_user_labelsBuilder();

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
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'scope':
          result.scope = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUpdateUserData_user_phonesSerializer
    implements StructuredSerializer<GGetUpdateUserData_user_phones> {
  @override
  final Iterable<Type> types = const [
    GGetUpdateUserData_user_phones,
    _$GGetUpdateUserData_user_phones
  ];
  @override
  final String wireName = 'GGetUpdateUserData_user_phones';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUpdateUserData_user_phones object,
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
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.verified;
    if (value != null) {
      result
        ..add('verified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GGetUpdateUserData_user_phones deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUpdateUserData_user_phonesBuilder();

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
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'verified':
          result.verified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUpdateUserData_user_profilesSerializer
    implements StructuredSerializer<GGetUpdateUserData_user_profiles> {
  @override
  final Iterable<Type> types = const [
    GGetUpdateUserData_user_profiles,
    _$GGetUpdateUserData_user_profiles
  ];
  @override
  final String wireName = 'GGetUpdateUserData_user_profiles';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUpdateUserData_user_profiles object,
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
    value = object.birth;
    if (value != null) {
      result
        ..add('birth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postcode;
    if (value != null) {
      result
        ..add('postcode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetUpdateUserData_user_profiles deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUpdateUserData_user_profilesBuilder();

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
        case 'birth':
          result.birth = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'postcode':
          result.postcode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUpdateUserData extends GGetUpdateUserData {
  @override
  final String G__typename;
  @override
  final GGetUpdateUserData_user? user;

  factory _$GGetUpdateUserData(
          [void Function(GGetUpdateUserDataBuilder)? updates]) =>
      (new GGetUpdateUserDataBuilder()..update(updates))._build();

  _$GGetUpdateUserData._({required this.G__typename, this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUpdateUserData', 'G__typename');
  }

  @override
  GGetUpdateUserData rebuild(
          void Function(GGetUpdateUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUpdateUserDataBuilder toBuilder() =>
      new GGetUpdateUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUpdateUserData &&
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
    return (newBuiltValueToStringHelper(r'GGetUpdateUserData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GGetUpdateUserDataBuilder
    implements Builder<GGetUpdateUserData, GGetUpdateUserDataBuilder> {
  _$GGetUpdateUserData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetUpdateUserData_userBuilder? _user;
  GGetUpdateUserData_userBuilder get user =>
      _$this._user ??= new GGetUpdateUserData_userBuilder();
  set user(GGetUpdateUserData_userBuilder? user) => _$this._user = user;

  GGetUpdateUserDataBuilder() {
    GGetUpdateUserData._initializeBuilder(this);
  }

  GGetUpdateUserDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUpdateUserData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUpdateUserData;
  }

  @override
  void update(void Function(GGetUpdateUserDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUpdateUserData build() => _build();

  _$GGetUpdateUserData _build() {
    _$GGetUpdateUserData _$result;
    try {
      _$result = _$v ??
          new _$GGetUpdateUserData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetUpdateUserData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUpdateUserData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUpdateUserData_user extends GGetUpdateUserData_user {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? email;
  @override
  final bool? enabled2fa;
  @override
  final String? role;
  @override
  final bool? email_verified;
  @override
  final bool? phone_verified;
  @override
  final bool? profile_verified;
  @override
  final BuiltList<GGetUpdateUserData_user_documents?>? documents;
  @override
  final String? state;
  @override
  final String? token;
  @override
  final BuiltList<GGetUpdateUserData_user_labels?>? labels;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final BuiltList<GGetUpdateUserData_user_phones?>? phones;
  @override
  final BuiltList<GGetUpdateUserData_user_profiles?>? profiles;

  factory _$GGetUpdateUserData_user(
          [void Function(GGetUpdateUserData_userBuilder)? updates]) =>
      (new GGetUpdateUserData_userBuilder()..update(updates))._build();

  _$GGetUpdateUserData_user._(
      {required this.G__typename,
      this.id,
      this.email,
      this.enabled2fa,
      this.role,
      this.email_verified,
      this.phone_verified,
      this.profile_verified,
      this.documents,
      this.state,
      this.token,
      this.labels,
      this.createdAt,
      this.updatedAt,
      this.phones,
      this.profiles})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUpdateUserData_user', 'G__typename');
  }

  @override
  GGetUpdateUserData_user rebuild(
          void Function(GGetUpdateUserData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUpdateUserData_userBuilder toBuilder() =>
      new GGetUpdateUserData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUpdateUserData_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        email == other.email &&
        enabled2fa == other.enabled2fa &&
        role == other.role &&
        email_verified == other.email_verified &&
        phone_verified == other.phone_verified &&
        profile_verified == other.profile_verified &&
        documents == other.documents &&
        state == other.state &&
        token == other.token &&
        labels == other.labels &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        phones == other.phones &&
        profiles == other.profiles;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, enabled2fa.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, email_verified.hashCode);
    _$hash = $jc(_$hash, phone_verified.hashCode);
    _$hash = $jc(_$hash, profile_verified.hashCode);
    _$hash = $jc(_$hash, documents.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, labels.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, phones.hashCode);
    _$hash = $jc(_$hash, profiles.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUpdateUserData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('email', email)
          ..add('enabled2fa', enabled2fa)
          ..add('role', role)
          ..add('email_verified', email_verified)
          ..add('phone_verified', phone_verified)
          ..add('profile_verified', profile_verified)
          ..add('documents', documents)
          ..add('state', state)
          ..add('token', token)
          ..add('labels', labels)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('phones', phones)
          ..add('profiles', profiles))
        .toString();
  }
}

class GGetUpdateUserData_userBuilder
    implements
        Builder<GGetUpdateUserData_user, GGetUpdateUserData_userBuilder> {
  _$GGetUpdateUserData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  bool? _enabled2fa;
  bool? get enabled2fa => _$this._enabled2fa;
  set enabled2fa(bool? enabled2fa) => _$this._enabled2fa = enabled2fa;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  bool? _email_verified;
  bool? get email_verified => _$this._email_verified;
  set email_verified(bool? email_verified) =>
      _$this._email_verified = email_verified;

  bool? _phone_verified;
  bool? get phone_verified => _$this._phone_verified;
  set phone_verified(bool? phone_verified) =>
      _$this._phone_verified = phone_verified;

  bool? _profile_verified;
  bool? get profile_verified => _$this._profile_verified;
  set profile_verified(bool? profile_verified) =>
      _$this._profile_verified = profile_verified;

  ListBuilder<GGetUpdateUserData_user_documents?>? _documents;
  ListBuilder<GGetUpdateUserData_user_documents?> get documents =>
      _$this._documents ??=
          new ListBuilder<GGetUpdateUserData_user_documents?>();
  set documents(ListBuilder<GGetUpdateUserData_user_documents?>? documents) =>
      _$this._documents = documents;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  ListBuilder<GGetUpdateUserData_user_labels?>? _labels;
  ListBuilder<GGetUpdateUserData_user_labels?> get labels =>
      _$this._labels ??= new ListBuilder<GGetUpdateUserData_user_labels?>();
  set labels(ListBuilder<GGetUpdateUserData_user_labels?>? labels) =>
      _$this._labels = labels;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<GGetUpdateUserData_user_phones?>? _phones;
  ListBuilder<GGetUpdateUserData_user_phones?> get phones =>
      _$this._phones ??= new ListBuilder<GGetUpdateUserData_user_phones?>();
  set phones(ListBuilder<GGetUpdateUserData_user_phones?>? phones) =>
      _$this._phones = phones;

  ListBuilder<GGetUpdateUserData_user_profiles?>? _profiles;
  ListBuilder<GGetUpdateUserData_user_profiles?> get profiles =>
      _$this._profiles ??= new ListBuilder<GGetUpdateUserData_user_profiles?>();
  set profiles(ListBuilder<GGetUpdateUserData_user_profiles?>? profiles) =>
      _$this._profiles = profiles;

  GGetUpdateUserData_userBuilder() {
    GGetUpdateUserData_user._initializeBuilder(this);
  }

  GGetUpdateUserData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _email = $v.email;
      _enabled2fa = $v.enabled2fa;
      _role = $v.role;
      _email_verified = $v.email_verified;
      _phone_verified = $v.phone_verified;
      _profile_verified = $v.profile_verified;
      _documents = $v.documents?.toBuilder();
      _state = $v.state;
      _token = $v.token;
      _labels = $v.labels?.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _phones = $v.phones?.toBuilder();
      _profiles = $v.profiles?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUpdateUserData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUpdateUserData_user;
  }

  @override
  void update(void Function(GGetUpdateUserData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUpdateUserData_user build() => _build();

  _$GGetUpdateUserData_user _build() {
    _$GGetUpdateUserData_user _$result;
    try {
      _$result = _$v ??
          new _$GGetUpdateUserData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetUpdateUserData_user', 'G__typename'),
              id: id,
              email: email,
              enabled2fa: enabled2fa,
              role: role,
              email_verified: email_verified,
              phone_verified: phone_verified,
              profile_verified: profile_verified,
              documents: _documents?.build(),
              state: state,
              token: token,
              labels: _labels?.build(),
              createdAt: createdAt,
              updatedAt: updatedAt,
              phones: _phones?.build(),
              profiles: _profiles?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'documents';
        _documents?.build();

        _$failedField = 'labels';
        _labels?.build();

        _$failedField = 'phones';
        _phones?.build();
        _$failedField = 'profiles';
        _profiles?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetUpdateUserData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetUpdateUserData_user_documents
    extends GGetUpdateUserData_user_documents {
  @override
  final String G__typename;
  @override
  final String? doc_type;
  @override
  final String? doc_number;
  @override
  final String? doc_expire;
  @override
  final String? url;

  factory _$GGetUpdateUserData_user_documents(
          [void Function(GGetUpdateUserData_user_documentsBuilder)? updates]) =>
      (new GGetUpdateUserData_user_documentsBuilder()..update(updates))
          ._build();

  _$GGetUpdateUserData_user_documents._(
      {required this.G__typename,
      this.doc_type,
      this.doc_number,
      this.doc_expire,
      this.url})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUpdateUserData_user_documents', 'G__typename');
  }

  @override
  GGetUpdateUserData_user_documents rebuild(
          void Function(GGetUpdateUserData_user_documentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUpdateUserData_user_documentsBuilder toBuilder() =>
      new GGetUpdateUserData_user_documentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUpdateUserData_user_documents &&
        G__typename == other.G__typename &&
        doc_type == other.doc_type &&
        doc_number == other.doc_number &&
        doc_expire == other.doc_expire &&
        url == other.url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, doc_type.hashCode);
    _$hash = $jc(_$hash, doc_number.hashCode);
    _$hash = $jc(_$hash, doc_expire.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUpdateUserData_user_documents')
          ..add('G__typename', G__typename)
          ..add('doc_type', doc_type)
          ..add('doc_number', doc_number)
          ..add('doc_expire', doc_expire)
          ..add('url', url))
        .toString();
  }
}

class GGetUpdateUserData_user_documentsBuilder
    implements
        Builder<GGetUpdateUserData_user_documents,
            GGetUpdateUserData_user_documentsBuilder> {
  _$GGetUpdateUserData_user_documents? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _doc_type;
  String? get doc_type => _$this._doc_type;
  set doc_type(String? doc_type) => _$this._doc_type = doc_type;

  String? _doc_number;
  String? get doc_number => _$this._doc_number;
  set doc_number(String? doc_number) => _$this._doc_number = doc_number;

  String? _doc_expire;
  String? get doc_expire => _$this._doc_expire;
  set doc_expire(String? doc_expire) => _$this._doc_expire = doc_expire;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  GGetUpdateUserData_user_documentsBuilder() {
    GGetUpdateUserData_user_documents._initializeBuilder(this);
  }

  GGetUpdateUserData_user_documentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _doc_type = $v.doc_type;
      _doc_number = $v.doc_number;
      _doc_expire = $v.doc_expire;
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUpdateUserData_user_documents other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUpdateUserData_user_documents;
  }

  @override
  void update(
      void Function(GGetUpdateUserData_user_documentsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUpdateUserData_user_documents build() => _build();

  _$GGetUpdateUserData_user_documents _build() {
    final _$result = _$v ??
        new _$GGetUpdateUserData_user_documents._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetUpdateUserData_user_documents', 'G__typename'),
            doc_type: doc_type,
            doc_number: doc_number,
            doc_expire: doc_expire,
            url: url);
    replace(_$result);
    return _$result;
  }
}

class _$GGetUpdateUserData_user_labels extends GGetUpdateUserData_user_labels {
  @override
  final String G__typename;
  @override
  final String? key;
  @override
  final String? value;
  @override
  final String? scope;

  factory _$GGetUpdateUserData_user_labels(
          [void Function(GGetUpdateUserData_user_labelsBuilder)? updates]) =>
      (new GGetUpdateUserData_user_labelsBuilder()..update(updates))._build();

  _$GGetUpdateUserData_user_labels._(
      {required this.G__typename, this.key, this.value, this.scope})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUpdateUserData_user_labels', 'G__typename');
  }

  @override
  GGetUpdateUserData_user_labels rebuild(
          void Function(GGetUpdateUserData_user_labelsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUpdateUserData_user_labelsBuilder toBuilder() =>
      new GGetUpdateUserData_user_labelsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUpdateUserData_user_labels &&
        G__typename == other.G__typename &&
        key == other.key &&
        value == other.value &&
        scope == other.scope;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, scope.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUpdateUserData_user_labels')
          ..add('G__typename', G__typename)
          ..add('key', key)
          ..add('value', value)
          ..add('scope', scope))
        .toString();
  }
}

class GGetUpdateUserData_user_labelsBuilder
    implements
        Builder<GGetUpdateUserData_user_labels,
            GGetUpdateUserData_user_labelsBuilder> {
  _$GGetUpdateUserData_user_labels? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  String? _scope;
  String? get scope => _$this._scope;
  set scope(String? scope) => _$this._scope = scope;

  GGetUpdateUserData_user_labelsBuilder() {
    GGetUpdateUserData_user_labels._initializeBuilder(this);
  }

  GGetUpdateUserData_user_labelsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _key = $v.key;
      _value = $v.value;
      _scope = $v.scope;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUpdateUserData_user_labels other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUpdateUserData_user_labels;
  }

  @override
  void update(void Function(GGetUpdateUserData_user_labelsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUpdateUserData_user_labels build() => _build();

  _$GGetUpdateUserData_user_labels _build() {
    final _$result = _$v ??
        new _$GGetUpdateUserData_user_labels._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GGetUpdateUserData_user_labels', 'G__typename'),
            key: key,
            value: value,
            scope: scope);
    replace(_$result);
    return _$result;
  }
}

class _$GGetUpdateUserData_user_phones extends GGetUpdateUserData_user_phones {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final String? phone;
  @override
  final bool? verified;

  factory _$GGetUpdateUserData_user_phones(
          [void Function(GGetUpdateUserData_user_phonesBuilder)? updates]) =>
      (new GGetUpdateUserData_user_phonesBuilder()..update(updates))._build();

  _$GGetUpdateUserData_user_phones._(
      {required this.G__typename, this.id, this.phone, this.verified})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUpdateUserData_user_phones', 'G__typename');
  }

  @override
  GGetUpdateUserData_user_phones rebuild(
          void Function(GGetUpdateUserData_user_phonesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUpdateUserData_user_phonesBuilder toBuilder() =>
      new GGetUpdateUserData_user_phonesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUpdateUserData_user_phones &&
        G__typename == other.G__typename &&
        id == other.id &&
        phone == other.phone &&
        verified == other.verified;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, verified.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUpdateUserData_user_phones')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('phone', phone)
          ..add('verified', verified))
        .toString();
  }
}

class GGetUpdateUserData_user_phonesBuilder
    implements
        Builder<GGetUpdateUserData_user_phones,
            GGetUpdateUserData_user_phonesBuilder> {
  _$GGetUpdateUserData_user_phones? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  bool? _verified;
  bool? get verified => _$this._verified;
  set verified(bool? verified) => _$this._verified = verified;

  GGetUpdateUserData_user_phonesBuilder() {
    GGetUpdateUserData_user_phones._initializeBuilder(this);
  }

  GGetUpdateUserData_user_phonesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _phone = $v.phone;
      _verified = $v.verified;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUpdateUserData_user_phones other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUpdateUserData_user_phones;
  }

  @override
  void update(void Function(GGetUpdateUserData_user_phonesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUpdateUserData_user_phones build() => _build();

  _$GGetUpdateUserData_user_phones _build() {
    final _$result = _$v ??
        new _$GGetUpdateUserData_user_phones._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GGetUpdateUserData_user_phones', 'G__typename'),
            id: id,
            phone: phone,
            verified: verified);
    replace(_$result);
    return _$result;
  }
}

class _$GGetUpdateUserData_user_profiles
    extends GGetUpdateUserData_user_profiles {
  @override
  final String G__typename;
  @override
  final String? first_name;
  @override
  final String? last_name;
  @override
  final String? birth;
  @override
  final String? address;
  @override
  final String? postcode;
  @override
  final String? city;
  @override
  final String? country;

  factory _$GGetUpdateUserData_user_profiles(
          [void Function(GGetUpdateUserData_user_profilesBuilder)? updates]) =>
      (new GGetUpdateUserData_user_profilesBuilder()..update(updates))._build();

  _$GGetUpdateUserData_user_profiles._(
      {required this.G__typename,
      this.first_name,
      this.last_name,
      this.birth,
      this.address,
      this.postcode,
      this.city,
      this.country})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetUpdateUserData_user_profiles', 'G__typename');
  }

  @override
  GGetUpdateUserData_user_profiles rebuild(
          void Function(GGetUpdateUserData_user_profilesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUpdateUserData_user_profilesBuilder toBuilder() =>
      new GGetUpdateUserData_user_profilesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUpdateUserData_user_profiles &&
        G__typename == other.G__typename &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        birth == other.birth &&
        address == other.address &&
        postcode == other.postcode &&
        city == other.city &&
        country == other.country;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, first_name.hashCode);
    _$hash = $jc(_$hash, last_name.hashCode);
    _$hash = $jc(_$hash, birth.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, postcode.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUpdateUserData_user_profiles')
          ..add('G__typename', G__typename)
          ..add('first_name', first_name)
          ..add('last_name', last_name)
          ..add('birth', birth)
          ..add('address', address)
          ..add('postcode', postcode)
          ..add('city', city)
          ..add('country', country))
        .toString();
  }
}

class GGetUpdateUserData_user_profilesBuilder
    implements
        Builder<GGetUpdateUserData_user_profiles,
            GGetUpdateUserData_user_profilesBuilder> {
  _$GGetUpdateUserData_user_profiles? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

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

  String? _postcode;
  String? get postcode => _$this._postcode;
  set postcode(String? postcode) => _$this._postcode = postcode;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  GGetUpdateUserData_user_profilesBuilder() {
    GGetUpdateUserData_user_profiles._initializeBuilder(this);
  }

  GGetUpdateUserData_user_profilesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _first_name = $v.first_name;
      _last_name = $v.last_name;
      _birth = $v.birth;
      _address = $v.address;
      _postcode = $v.postcode;
      _city = $v.city;
      _country = $v.country;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUpdateUserData_user_profiles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUpdateUserData_user_profiles;
  }

  @override
  void update(void Function(GGetUpdateUserData_user_profilesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUpdateUserData_user_profiles build() => _build();

  _$GGetUpdateUserData_user_profiles _build() {
    final _$result = _$v ??
        new _$GGetUpdateUserData_user_profiles._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetUpdateUserData_user_profiles', 'G__typename'),
            first_name: first_name,
            last_name: last_name,
            birth: birth,
            address: address,
            postcode: postcode,
            city: city,
            country: country);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
