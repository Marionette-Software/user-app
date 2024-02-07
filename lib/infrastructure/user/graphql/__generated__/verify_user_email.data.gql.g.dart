// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_email.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GVerifyEmailTokenData> _$gVerifyEmailTokenDataSerializer =
    new _$GVerifyEmailTokenDataSerializer();

class _$GVerifyEmailTokenDataSerializer
    implements StructuredSerializer<GVerifyEmailTokenData> {
  @override
  final Iterable<Type> types = const [
    GVerifyEmailTokenData,
    _$GVerifyEmailTokenData
  ];
  @override
  final String wireName = 'GVerifyEmailTokenData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GVerifyEmailTokenData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.verifyEmail;
    if (value != null) {
      result
        ..add('verifyEmail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GVerifyEmailTokenData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GVerifyEmailTokenDataBuilder();

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
        case 'verifyEmail':
          result.verifyEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GVerifyEmailTokenData extends GVerifyEmailTokenData {
  @override
  final String G__typename;
  @override
  final String? verifyEmail;

  factory _$GVerifyEmailTokenData(
          [void Function(GVerifyEmailTokenDataBuilder)? updates]) =>
      (new GVerifyEmailTokenDataBuilder()..update(updates))._build();

  _$GVerifyEmailTokenData._({required this.G__typename, this.verifyEmail})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GVerifyEmailTokenData', 'G__typename');
  }

  @override
  GVerifyEmailTokenData rebuild(
          void Function(GVerifyEmailTokenDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GVerifyEmailTokenDataBuilder toBuilder() =>
      new GVerifyEmailTokenDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GVerifyEmailTokenData &&
        G__typename == other.G__typename &&
        verifyEmail == other.verifyEmail;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, verifyEmail.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GVerifyEmailTokenData')
          ..add('G__typename', G__typename)
          ..add('verifyEmail', verifyEmail))
        .toString();
  }
}

class GVerifyEmailTokenDataBuilder
    implements Builder<GVerifyEmailTokenData, GVerifyEmailTokenDataBuilder> {
  _$GVerifyEmailTokenData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _verifyEmail;
  String? get verifyEmail => _$this._verifyEmail;
  set verifyEmail(String? verifyEmail) => _$this._verifyEmail = verifyEmail;

  GVerifyEmailTokenDataBuilder() {
    GVerifyEmailTokenData._initializeBuilder(this);
  }

  GVerifyEmailTokenDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _verifyEmail = $v.verifyEmail;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GVerifyEmailTokenData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GVerifyEmailTokenData;
  }

  @override
  void update(void Function(GVerifyEmailTokenDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GVerifyEmailTokenData build() => _build();

  _$GVerifyEmailTokenData _build() {
    final _$result = _$v ??
        new _$GVerifyEmailTokenData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GVerifyEmailTokenData', 'G__typename'),
            verifyEmail: verifyEmail);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
