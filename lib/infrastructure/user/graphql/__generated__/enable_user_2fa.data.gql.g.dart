// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enable_user_2fa.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTurnOn2FAData> _$gTurnOn2FADataSerializer =
    new _$GTurnOn2FADataSerializer();

class _$GTurnOn2FADataSerializer
    implements StructuredSerializer<GTurnOn2FAData> {
  @override
  final Iterable<Type> types = const [GTurnOn2FAData, _$GTurnOn2FAData];
  @override
  final String wireName = 'GTurnOn2FAData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTurnOn2FAData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.turnOn2FA;
    if (value != null) {
      result
        ..add('turnOn2FA')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GTurnOn2FAData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTurnOn2FADataBuilder();

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
        case 'turnOn2FA':
          result.turnOn2FA = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GTurnOn2FAData extends GTurnOn2FAData {
  @override
  final String G__typename;
  @override
  final String? turnOn2FA;

  factory _$GTurnOn2FAData([void Function(GTurnOn2FADataBuilder)? updates]) =>
      (new GTurnOn2FADataBuilder()..update(updates))._build();

  _$GTurnOn2FAData._({required this.G__typename, this.turnOn2FA}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GTurnOn2FAData', 'G__typename');
  }

  @override
  GTurnOn2FAData rebuild(void Function(GTurnOn2FADataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTurnOn2FADataBuilder toBuilder() =>
      new GTurnOn2FADataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTurnOn2FAData &&
        G__typename == other.G__typename &&
        turnOn2FA == other.turnOn2FA;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, turnOn2FA.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTurnOn2FAData')
          ..add('G__typename', G__typename)
          ..add('turnOn2FA', turnOn2FA))
        .toString();
  }
}

class GTurnOn2FADataBuilder
    implements Builder<GTurnOn2FAData, GTurnOn2FADataBuilder> {
  _$GTurnOn2FAData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _turnOn2FA;
  String? get turnOn2FA => _$this._turnOn2FA;
  set turnOn2FA(String? turnOn2FA) => _$this._turnOn2FA = turnOn2FA;

  GTurnOn2FADataBuilder() {
    GTurnOn2FAData._initializeBuilder(this);
  }

  GTurnOn2FADataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _turnOn2FA = $v.turnOn2FA;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTurnOn2FAData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTurnOn2FAData;
  }

  @override
  void update(void Function(GTurnOn2FADataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTurnOn2FAData build() => _build();

  _$GTurnOn2FAData _build() {
    final _$result = _$v ??
        new _$GTurnOn2FAData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GTurnOn2FAData', 'G__typename'),
            turnOn2FA: turnOn2FA);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
