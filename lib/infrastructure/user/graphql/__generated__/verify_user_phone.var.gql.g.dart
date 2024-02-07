// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_phone.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GVerifyUserPhoneNumberVars> _$gVerifyUserPhoneNumberVarsSerializer =
    new _$GVerifyUserPhoneNumberVarsSerializer();

class _$GVerifyUserPhoneNumberVarsSerializer
    implements StructuredSerializer<GVerifyUserPhoneNumberVars> {
  @override
  final Iterable<Type> types = const [
    GVerifyUserPhoneNumberVars,
    _$GVerifyUserPhoneNumberVars
  ];
  @override
  final String wireName = 'GVerifyUserPhoneNumberVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GVerifyUserPhoneNumberVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GVerifyUserPhoneNumberVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GVerifyUserPhoneNumberVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GVerifyUserPhoneNumberVars extends GVerifyUserPhoneNumberVars {
  @override
  final String phone;
  @override
  final String code;

  factory _$GVerifyUserPhoneNumberVars(
          [void Function(GVerifyUserPhoneNumberVarsBuilder)? updates]) =>
      (new GVerifyUserPhoneNumberVarsBuilder()..update(updates))._build();

  _$GVerifyUserPhoneNumberVars._({required this.phone, required this.code})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        phone, r'GVerifyUserPhoneNumberVars', 'phone');
    BuiltValueNullFieldError.checkNotNull(
        code, r'GVerifyUserPhoneNumberVars', 'code');
  }

  @override
  GVerifyUserPhoneNumberVars rebuild(
          void Function(GVerifyUserPhoneNumberVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GVerifyUserPhoneNumberVarsBuilder toBuilder() =>
      new GVerifyUserPhoneNumberVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GVerifyUserPhoneNumberVars &&
        phone == other.phone &&
        code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GVerifyUserPhoneNumberVars')
          ..add('phone', phone)
          ..add('code', code))
        .toString();
  }
}

class GVerifyUserPhoneNumberVarsBuilder
    implements
        Builder<GVerifyUserPhoneNumberVars, GVerifyUserPhoneNumberVarsBuilder> {
  _$GVerifyUserPhoneNumberVars? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  GVerifyUserPhoneNumberVarsBuilder();

  GVerifyUserPhoneNumberVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GVerifyUserPhoneNumberVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GVerifyUserPhoneNumberVars;
  }

  @override
  void update(void Function(GVerifyUserPhoneNumberVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GVerifyUserPhoneNumberVars build() => _build();

  _$GVerifyUserPhoneNumberVars _build() {
    final _$result = _$v ??
        new _$GVerifyUserPhoneNumberVars._(
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'GVerifyUserPhoneNumberVars', 'phone'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'GVerifyUserPhoneNumberVars', 'code'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
