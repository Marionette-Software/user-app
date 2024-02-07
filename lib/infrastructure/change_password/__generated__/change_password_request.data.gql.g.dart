// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GChangeMyPasswordData> _$gChangeMyPasswordDataSerializer =
    new _$GChangeMyPasswordDataSerializer();

class _$GChangeMyPasswordDataSerializer
    implements StructuredSerializer<GChangeMyPasswordData> {
  @override
  final Iterable<Type> types = const [
    GChangeMyPasswordData,
    _$GChangeMyPasswordData
  ];
  @override
  final String wireName = 'GChangeMyPasswordData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GChangeMyPasswordData object,
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
  GChangeMyPasswordData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GChangeMyPasswordDataBuilder();

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

class _$GChangeMyPasswordData extends GChangeMyPasswordData {
  @override
  final String G__typename;
  @override
  final String? changePassword;

  factory _$GChangeMyPasswordData(
          [void Function(GChangeMyPasswordDataBuilder)? updates]) =>
      (new GChangeMyPasswordDataBuilder()..update(updates))._build();

  _$GChangeMyPasswordData._({required this.G__typename, this.changePassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GChangeMyPasswordData', 'G__typename');
  }

  @override
  GChangeMyPasswordData rebuild(
          void Function(GChangeMyPasswordDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GChangeMyPasswordDataBuilder toBuilder() =>
      new GChangeMyPasswordDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GChangeMyPasswordData &&
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
    return (newBuiltValueToStringHelper(r'GChangeMyPasswordData')
          ..add('G__typename', G__typename)
          ..add('changePassword', changePassword))
        .toString();
  }
}

class GChangeMyPasswordDataBuilder
    implements Builder<GChangeMyPasswordData, GChangeMyPasswordDataBuilder> {
  _$GChangeMyPasswordData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _changePassword;
  String? get changePassword => _$this._changePassword;
  set changePassword(String? changePassword) =>
      _$this._changePassword = changePassword;

  GChangeMyPasswordDataBuilder() {
    GChangeMyPasswordData._initializeBuilder(this);
  }

  GChangeMyPasswordDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _changePassword = $v.changePassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GChangeMyPasswordData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GChangeMyPasswordData;
  }

  @override
  void update(void Function(GChangeMyPasswordDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GChangeMyPasswordData build() => _build();

  _$GChangeMyPasswordData _build() {
    final _$result = _$v ??
        new _$GChangeMyPasswordData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GChangeMyPasswordData', 'G__typename'),
            changePassword: changePassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
