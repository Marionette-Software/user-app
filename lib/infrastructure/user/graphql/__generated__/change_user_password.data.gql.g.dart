// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_user_password.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GChangePasswordData> _$gChangePasswordDataSerializer =
    new _$GChangePasswordDataSerializer();

class _$GChangePasswordDataSerializer
    implements StructuredSerializer<GChangePasswordData> {
  @override
  final Iterable<Type> types = const [
    GChangePasswordData,
    _$GChangePasswordData
  ];
  @override
  final String wireName = 'GChangePasswordData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GChangePasswordData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.changePassword;
    if (value != null) {
      result
        ..add('changePassword')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GChangePasswordData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GChangePasswordDataBuilder();

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
        case 'changePassword':
          result.changePassword = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GChangePasswordData extends GChangePasswordData {
  @override
  final String G__typename;
  @override
  final String? changePassword;

  factory _$GChangePasswordData(
          [void Function(GChangePasswordDataBuilder)? updates]) =>
      (new GChangePasswordDataBuilder()..update(updates))._build();

  _$GChangePasswordData._({required this.G__typename, this.changePassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GChangePasswordData', 'G__typename');
  }

  @override
  GChangePasswordData rebuild(
          void Function(GChangePasswordDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GChangePasswordDataBuilder toBuilder() =>
      new GChangePasswordDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GChangePasswordData &&
        G__typename == other.G__typename &&
        changePassword == other.changePassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, changePassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GChangePasswordData')
          ..add('G__typename', G__typename)
          ..add('changePassword', changePassword))
        .toString();
  }
}

class GChangePasswordDataBuilder
    implements Builder<GChangePasswordData, GChangePasswordDataBuilder> {
  _$GChangePasswordData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _changePassword;
  String? get changePassword => _$this._changePassword;
  set changePassword(String? changePassword) =>
      _$this._changePassword = changePassword;

  GChangePasswordDataBuilder() {
    GChangePasswordData._initializeBuilder(this);
  }

  GChangePasswordDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _changePassword = $v.changePassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GChangePasswordData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GChangePasswordData;
  }

  @override
  void update(void Function(GChangePasswordDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GChangePasswordData build() => _build();

  _$GChangePasswordData _build() {
    final _$result = _$v ??
        new _$GChangePasswordData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GChangePasswordData', 'G__typename'),
            changePassword: changePassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
