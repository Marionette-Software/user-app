// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enable_user_2fa.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTurnOn2FAVars> _$gTurnOn2FAVarsSerializer =
    new _$GTurnOn2FAVarsSerializer();

class _$GTurnOn2FAVarsSerializer
    implements StructuredSerializer<GTurnOn2FAVars> {
  @override
  final Iterable<Type> types = const [GTurnOn2FAVars, _$GTurnOn2FAVars];
  @override
  final String wireName = 'GTurnOn2FAVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTurnOn2FAVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GTurnOn2FAVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTurnOn2FAVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GTurnOn2FAVars extends GTurnOn2FAVars {
  @override
  final String code;

  factory _$GTurnOn2FAVars([void Function(GTurnOn2FAVarsBuilder)? updates]) =>
      (new GTurnOn2FAVarsBuilder()..update(updates))._build();

  _$GTurnOn2FAVars._({required this.code}) : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'GTurnOn2FAVars', 'code');
  }

  @override
  GTurnOn2FAVars rebuild(void Function(GTurnOn2FAVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTurnOn2FAVarsBuilder toBuilder() =>
      new GTurnOn2FAVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTurnOn2FAVars && code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTurnOn2FAVars')..add('code', code))
        .toString();
  }
}

class GTurnOn2FAVarsBuilder
    implements Builder<GTurnOn2FAVars, GTurnOn2FAVarsBuilder> {
  _$GTurnOn2FAVars? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  GTurnOn2FAVarsBuilder();

  GTurnOn2FAVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTurnOn2FAVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTurnOn2FAVars;
  }

  @override
  void update(void Function(GTurnOn2FAVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTurnOn2FAVars build() => _build();

  _$GTurnOn2FAVars _build() {
    final _$result = _$v ??
        new _$GTurnOn2FAVars._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'GTurnOn2FAVars', 'code'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
