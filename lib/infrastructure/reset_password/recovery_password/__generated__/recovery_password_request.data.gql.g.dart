// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recovery_password_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GRecoveryPasswordData> _$gRecoveryPasswordDataSerializer =
    new _$GRecoveryPasswordDataSerializer();

class _$GRecoveryPasswordDataSerializer
    implements StructuredSerializer<GRecoveryPasswordData> {
  @override
  final Iterable<Type> types = const [
    GRecoveryPasswordData,
    _$GRecoveryPasswordData
  ];
  @override
  final String wireName = 'GRecoveryPasswordData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GRecoveryPasswordData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.recoveryPassword;
    if (value != null) {
      result
        ..add('recoveryPassword')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GRecoveryPasswordData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRecoveryPasswordDataBuilder();

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
        case 'recoveryPassword':
          result.recoveryPassword = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GRecoveryPasswordData extends GRecoveryPasswordData {
  @override
  final String G__typename;
  @override
  final String? recoveryPassword;

  factory _$GRecoveryPasswordData(
          [void Function(GRecoveryPasswordDataBuilder)? updates]) =>
      (new GRecoveryPasswordDataBuilder()..update(updates))._build();

  _$GRecoveryPasswordData._({required this.G__typename, this.recoveryPassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GRecoveryPasswordData', 'G__typename');
  }

  @override
  GRecoveryPasswordData rebuild(
          void Function(GRecoveryPasswordDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRecoveryPasswordDataBuilder toBuilder() =>
      new GRecoveryPasswordDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRecoveryPasswordData &&
        G__typename == other.G__typename &&
        recoveryPassword == other.recoveryPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, recoveryPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GRecoveryPasswordData')
          ..add('G__typename', G__typename)
          ..add('recoveryPassword', recoveryPassword))
        .toString();
  }
}

class GRecoveryPasswordDataBuilder
    implements Builder<GRecoveryPasswordData, GRecoveryPasswordDataBuilder> {
  _$GRecoveryPasswordData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _recoveryPassword;
  String? get recoveryPassword => _$this._recoveryPassword;
  set recoveryPassword(String? recoveryPassword) =>
      _$this._recoveryPassword = recoveryPassword;

  GRecoveryPasswordDataBuilder() {
    GRecoveryPasswordData._initializeBuilder(this);
  }

  GRecoveryPasswordDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _recoveryPassword = $v.recoveryPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRecoveryPasswordData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRecoveryPasswordData;
  }

  @override
  void update(void Function(GRecoveryPasswordDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GRecoveryPasswordData build() => _build();

  _$GRecoveryPasswordData _build() {
    final _$result = _$v ??
        new _$GRecoveryPasswordData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GRecoveryPasswordData', 'G__typename'),
            recoveryPassword: recoveryPassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
