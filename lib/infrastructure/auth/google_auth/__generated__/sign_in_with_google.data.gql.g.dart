// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_with_google.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSignUpWithGoogleData> _$gSignUpWithGoogleDataSerializer =
    new _$GSignUpWithGoogleDataSerializer();
Serializer<GSignUpWithGoogleData_signWithGoogle>
    _$gSignUpWithGoogleDataSignWithGoogleSerializer =
    new _$GSignUpWithGoogleData_signWithGoogleSerializer();

class _$GSignUpWithGoogleDataSerializer
    implements StructuredSerializer<GSignUpWithGoogleData> {
  @override
  final Iterable<Type> types = const [
    GSignUpWithGoogleData,
    _$GSignUpWithGoogleData
  ];
  @override
  final String wireName = 'GSignUpWithGoogleData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSignUpWithGoogleData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.signWithGoogle;
    if (value != null) {
      result
        ..add('signWithGoogle')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GSignUpWithGoogleData_signWithGoogle)));
    }
    return result;
  }

  @override
  GSignUpWithGoogleData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSignUpWithGoogleDataBuilder();

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
        case 'signWithGoogle':
          result.signWithGoogle.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GSignUpWithGoogleData_signWithGoogle))!
              as GSignUpWithGoogleData_signWithGoogle);
          break;
      }
    }

    return result.build();
  }
}

class _$GSignUpWithGoogleData_signWithGoogleSerializer
    implements StructuredSerializer<GSignUpWithGoogleData_signWithGoogle> {
  @override
  final Iterable<Type> types = const [
    GSignUpWithGoogleData_signWithGoogle,
    _$GSignUpWithGoogleData_signWithGoogle
  ];
  @override
  final String wireName = 'GSignUpWithGoogleData_signWithGoogle';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSignUpWithGoogleData_signWithGoogle object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
    return result;
  }

  @override
  GSignUpWithGoogleData_signWithGoogle deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSignUpWithGoogleData_signWithGoogleBuilder();

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
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GSignUpWithGoogleData extends GSignUpWithGoogleData {
  @override
  final String G__typename;
  @override
  final GSignUpWithGoogleData_signWithGoogle? signWithGoogle;

  factory _$GSignUpWithGoogleData(
          [void Function(GSignUpWithGoogleDataBuilder)? updates]) =>
      (new GSignUpWithGoogleDataBuilder()..update(updates))._build();

  _$GSignUpWithGoogleData._({required this.G__typename, this.signWithGoogle})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSignUpWithGoogleData', 'G__typename');
  }

  @override
  GSignUpWithGoogleData rebuild(
          void Function(GSignUpWithGoogleDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSignUpWithGoogleDataBuilder toBuilder() =>
      new GSignUpWithGoogleDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSignUpWithGoogleData &&
        G__typename == other.G__typename &&
        signWithGoogle == other.signWithGoogle;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, signWithGoogle.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSignUpWithGoogleData')
          ..add('G__typename', G__typename)
          ..add('signWithGoogle', signWithGoogle))
        .toString();
  }
}

class GSignUpWithGoogleDataBuilder
    implements Builder<GSignUpWithGoogleData, GSignUpWithGoogleDataBuilder> {
  _$GSignUpWithGoogleData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GSignUpWithGoogleData_signWithGoogleBuilder? _signWithGoogle;
  GSignUpWithGoogleData_signWithGoogleBuilder get signWithGoogle =>
      _$this._signWithGoogle ??=
          new GSignUpWithGoogleData_signWithGoogleBuilder();
  set signWithGoogle(
          GSignUpWithGoogleData_signWithGoogleBuilder? signWithGoogle) =>
      _$this._signWithGoogle = signWithGoogle;

  GSignUpWithGoogleDataBuilder() {
    GSignUpWithGoogleData._initializeBuilder(this);
  }

  GSignUpWithGoogleDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _signWithGoogle = $v.signWithGoogle?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSignUpWithGoogleData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSignUpWithGoogleData;
  }

  @override
  void update(void Function(GSignUpWithGoogleDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSignUpWithGoogleData build() => _build();

  _$GSignUpWithGoogleData _build() {
    _$GSignUpWithGoogleData _$result;
    try {
      _$result = _$v ??
          new _$GSignUpWithGoogleData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GSignUpWithGoogleData', 'G__typename'),
              signWithGoogle: _signWithGoogle?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'signWithGoogle';
        _signWithGoogle?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GSignUpWithGoogleData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSignUpWithGoogleData_signWithGoogle
    extends GSignUpWithGoogleData_signWithGoogle {
  @override
  final String G__typename;
  @override
  final String? token;
  @override
  final String? id;
  @override
  final String? email;

  factory _$GSignUpWithGoogleData_signWithGoogle(
          [void Function(GSignUpWithGoogleData_signWithGoogleBuilder)?
              updates]) =>
      (new GSignUpWithGoogleData_signWithGoogleBuilder()..update(updates))
          ._build();

  _$GSignUpWithGoogleData_signWithGoogle._(
      {required this.G__typename, this.token, this.id, this.email})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSignUpWithGoogleData_signWithGoogle', 'G__typename');
  }

  @override
  GSignUpWithGoogleData_signWithGoogle rebuild(
          void Function(GSignUpWithGoogleData_signWithGoogleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSignUpWithGoogleData_signWithGoogleBuilder toBuilder() =>
      new GSignUpWithGoogleData_signWithGoogleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSignUpWithGoogleData_signWithGoogle &&
        G__typename == other.G__typename &&
        token == other.token &&
        id == other.id &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSignUpWithGoogleData_signWithGoogle')
          ..add('G__typename', G__typename)
          ..add('token', token)
          ..add('id', id)
          ..add('email', email))
        .toString();
  }
}

class GSignUpWithGoogleData_signWithGoogleBuilder
    implements
        Builder<GSignUpWithGoogleData_signWithGoogle,
            GSignUpWithGoogleData_signWithGoogleBuilder> {
  _$GSignUpWithGoogleData_signWithGoogle? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  GSignUpWithGoogleData_signWithGoogleBuilder() {
    GSignUpWithGoogleData_signWithGoogle._initializeBuilder(this);
  }

  GSignUpWithGoogleData_signWithGoogleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _token = $v.token;
      _id = $v.id;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSignUpWithGoogleData_signWithGoogle other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSignUpWithGoogleData_signWithGoogle;
  }

  @override
  void update(
      void Function(GSignUpWithGoogleData_signWithGoogleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSignUpWithGoogleData_signWithGoogle build() => _build();

  _$GSignUpWithGoogleData_signWithGoogle _build() {
    final _$result = _$v ??
        new _$GSignUpWithGoogleData_signWithGoogle._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GSignUpWithGoogleData_signWithGoogle', 'G__typename'),
            token: token,
            id: id,
            email: email);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
