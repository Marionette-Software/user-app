// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_email.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GResendEmailConfirmData> _$gResendEmailConfirmDataSerializer =
    new _$GResendEmailConfirmDataSerializer();

class _$GResendEmailConfirmDataSerializer
    implements StructuredSerializer<GResendEmailConfirmData> {
  @override
  final Iterable<Type> types = const [
    GResendEmailConfirmData,
    _$GResendEmailConfirmData
  ];
  @override
  final String wireName = 'GResendEmailConfirmData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GResendEmailConfirmData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.resendEmailConfirm;
    if (value != null) {
      result
        ..add('resendEmailConfirm')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GResendEmailConfirmData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GResendEmailConfirmDataBuilder();

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
        case 'resendEmailConfirm':
          result.resendEmailConfirm = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GResendEmailConfirmData extends GResendEmailConfirmData {
  @override
  final String G__typename;
  @override
  final String? resendEmailConfirm;

  factory _$GResendEmailConfirmData(
          [void Function(GResendEmailConfirmDataBuilder)? updates]) =>
      (new GResendEmailConfirmDataBuilder()..update(updates))._build();

  _$GResendEmailConfirmData._(
      {required this.G__typename, this.resendEmailConfirm})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GResendEmailConfirmData', 'G__typename');
  }

  @override
  GResendEmailConfirmData rebuild(
          void Function(GResendEmailConfirmDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GResendEmailConfirmDataBuilder toBuilder() =>
      new GResendEmailConfirmDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GResendEmailConfirmData &&
        G__typename == other.G__typename &&
        resendEmailConfirm == other.resendEmailConfirm;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, resendEmailConfirm.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GResendEmailConfirmData')
          ..add('G__typename', G__typename)
          ..add('resendEmailConfirm', resendEmailConfirm))
        .toString();
  }
}

class GResendEmailConfirmDataBuilder
    implements
        Builder<GResendEmailConfirmData, GResendEmailConfirmDataBuilder> {
  _$GResendEmailConfirmData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _resendEmailConfirm;
  String? get resendEmailConfirm => _$this._resendEmailConfirm;
  set resendEmailConfirm(String? resendEmailConfirm) =>
      _$this._resendEmailConfirm = resendEmailConfirm;

  GResendEmailConfirmDataBuilder() {
    GResendEmailConfirmData._initializeBuilder(this);
  }

  GResendEmailConfirmDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _resendEmailConfirm = $v.resendEmailConfirm;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GResendEmailConfirmData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GResendEmailConfirmData;
  }

  @override
  void update(void Function(GResendEmailConfirmDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GResendEmailConfirmData build() => _build();

  _$GResendEmailConfirmData _build() {
    final _$result = _$v ??
        new _$GResendEmailConfirmData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GResendEmailConfirmData', 'G__typename'),
            resendEmailConfirm: resendEmailConfirm);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
