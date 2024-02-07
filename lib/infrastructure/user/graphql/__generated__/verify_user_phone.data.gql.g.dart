// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_phone.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GVerifyUserPhoneNumberData> _$gVerifyUserPhoneNumberDataSerializer =
    new _$GVerifyUserPhoneNumberDataSerializer();

class _$GVerifyUserPhoneNumberDataSerializer
    implements StructuredSerializer<GVerifyUserPhoneNumberData> {
  @override
  final Iterable<Type> types = const [
    GVerifyUserPhoneNumberData,
    _$GVerifyUserPhoneNumberData
  ];
  @override
  final String wireName = 'GVerifyUserPhoneNumberData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GVerifyUserPhoneNumberData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.verifyPhone;
    if (value != null) {
      result
        ..add('verifyPhone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GVerifyUserPhoneNumberData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GVerifyUserPhoneNumberDataBuilder();

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
        case 'verifyPhone':
          result.verifyPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GVerifyUserPhoneNumberData extends GVerifyUserPhoneNumberData {
  @override
  final String G__typename;
  @override
  final String? verifyPhone;

  factory _$GVerifyUserPhoneNumberData(
          [void Function(GVerifyUserPhoneNumberDataBuilder)? updates]) =>
      (new GVerifyUserPhoneNumberDataBuilder()..update(updates))._build();

  _$GVerifyUserPhoneNumberData._({required this.G__typename, this.verifyPhone})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GVerifyUserPhoneNumberData', 'G__typename');
  }

  @override
  GVerifyUserPhoneNumberData rebuild(
          void Function(GVerifyUserPhoneNumberDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GVerifyUserPhoneNumberDataBuilder toBuilder() =>
      new GVerifyUserPhoneNumberDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GVerifyUserPhoneNumberData &&
        G__typename == other.G__typename &&
        verifyPhone == other.verifyPhone;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, verifyPhone.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GVerifyUserPhoneNumberData')
          ..add('G__typename', G__typename)
          ..add('verifyPhone', verifyPhone))
        .toString();
  }
}

class GVerifyUserPhoneNumberDataBuilder
    implements
        Builder<GVerifyUserPhoneNumberData, GVerifyUserPhoneNumberDataBuilder> {
  _$GVerifyUserPhoneNumberData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _verifyPhone;
  String? get verifyPhone => _$this._verifyPhone;
  set verifyPhone(String? verifyPhone) => _$this._verifyPhone = verifyPhone;

  GVerifyUserPhoneNumberDataBuilder() {
    GVerifyUserPhoneNumberData._initializeBuilder(this);
  }

  GVerifyUserPhoneNumberDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _verifyPhone = $v.verifyPhone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GVerifyUserPhoneNumberData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GVerifyUserPhoneNumberData;
  }

  @override
  void update(void Function(GVerifyUserPhoneNumberDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GVerifyUserPhoneNumberData build() => _build();

  _$GVerifyUserPhoneNumberData _build() {
    final _$result = _$v ??
        new _$GVerifyUserPhoneNumberData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GVerifyUserPhoneNumberData', 'G__typename'),
            verifyPhone: verifyPhone);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
