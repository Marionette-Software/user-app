// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_api_key.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteApiKeyActionVars> _$gDeleteApiKeyActionVarsSerializer =
    new _$GDeleteApiKeyActionVarsSerializer();

class _$GDeleteApiKeyActionVarsSerializer
    implements StructuredSerializer<GDeleteApiKeyActionVars> {
  @override
  final Iterable<Type> types = const [
    GDeleteApiKeyActionVars,
    _$GDeleteApiKeyActionVars
  ];
  @override
  final String wireName = 'GDeleteApiKeyActionVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteApiKeyActionVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.otp_code;
    if (value != null) {
      result
        ..add('otp_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GDeleteApiKeyActionVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteApiKeyActionVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'otp_code':
          result.otp_code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteApiKeyActionVars extends GDeleteApiKeyActionVars {
  @override
  final String id;
  @override
  final String? otp_code;

  factory _$GDeleteApiKeyActionVars(
          [void Function(GDeleteApiKeyActionVarsBuilder)? updates]) =>
      (new GDeleteApiKeyActionVarsBuilder()..update(updates))._build();

  _$GDeleteApiKeyActionVars._({required this.id, this.otp_code}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GDeleteApiKeyActionVars', 'id');
  }

  @override
  GDeleteApiKeyActionVars rebuild(
          void Function(GDeleteApiKeyActionVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteApiKeyActionVarsBuilder toBuilder() =>
      new GDeleteApiKeyActionVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteApiKeyActionVars &&
        id == other.id &&
        otp_code == other.otp_code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, otp_code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteApiKeyActionVars')
          ..add('id', id)
          ..add('otp_code', otp_code))
        .toString();
  }
}

class GDeleteApiKeyActionVarsBuilder
    implements
        Builder<GDeleteApiKeyActionVars, GDeleteApiKeyActionVarsBuilder> {
  _$GDeleteApiKeyActionVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _otp_code;
  String? get otp_code => _$this._otp_code;
  set otp_code(String? otp_code) => _$this._otp_code = otp_code;

  GDeleteApiKeyActionVarsBuilder();

  GDeleteApiKeyActionVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _otp_code = $v.otp_code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteApiKeyActionVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteApiKeyActionVars;
  }

  @override
  void update(void Function(GDeleteApiKeyActionVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteApiKeyActionVars build() => _build();

  _$GDeleteApiKeyActionVars _build() {
    final _$result = _$v ??
        new _$GDeleteApiKeyActionVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDeleteApiKeyActionVars', 'id'),
            otp_code: otp_code);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
