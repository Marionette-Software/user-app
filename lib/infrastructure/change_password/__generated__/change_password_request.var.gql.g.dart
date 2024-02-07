// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GChangeMyPasswordVars> _$gChangeMyPasswordVarsSerializer =
    new _$GChangeMyPasswordVarsSerializer();

class _$GChangeMyPasswordVarsSerializer
    implements StructuredSerializer<GChangeMyPasswordVars> {
  @override
  final Iterable<Type> types = const [
    GChangeMyPasswordVars,
    _$GChangeMyPasswordVars
  ];
  @override
  final String wireName = 'GChangeMyPasswordVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GChangeMyPasswordVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'old_password',
      serializers.serialize(object.old_password,
          specifiedType: const FullType(String)),
      'new_password',
      serializers.serialize(object.new_password,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GChangeMyPasswordVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GChangeMyPasswordVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'old_password':
          result.old_password = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'new_password':
          result.new_password = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GChangeMyPasswordVars extends GChangeMyPasswordVars {
  @override
  final String old_password;
  @override
  final String new_password;

  factory _$GChangeMyPasswordVars(
          [void Function(GChangeMyPasswordVarsBuilder)? updates]) =>
      (new GChangeMyPasswordVarsBuilder()..update(updates))._build();

  _$GChangeMyPasswordVars._(
      {required this.old_password, required this.new_password})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        old_password, r'GChangeMyPasswordVars', 'old_password');
    BuiltValueNullFieldError.checkNotNull(
        new_password, r'GChangeMyPasswordVars', 'new_password');
  }

  @override
  GChangeMyPasswordVars rebuild(
          void Function(GChangeMyPasswordVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GChangeMyPasswordVarsBuilder toBuilder() =>
      new GChangeMyPasswordVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GChangeMyPasswordVars &&
        old_password == other.old_password &&
        new_password == other.new_password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, old_password.hashCode);
    _$hash = $jc(_$hash, new_password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GChangeMyPasswordVars')
          ..add('old_password', old_password)
          ..add('new_password', new_password))
        .toString();
  }
}

class GChangeMyPasswordVarsBuilder
    implements Builder<GChangeMyPasswordVars, GChangeMyPasswordVarsBuilder> {
  _$GChangeMyPasswordVars? _$v;

  String? _old_password;
  String? get old_password => _$this._old_password;
  set old_password(String? old_password) => _$this._old_password = old_password;

  String? _new_password;
  String? get new_password => _$this._new_password;
  set new_password(String? new_password) => _$this._new_password = new_password;

  GChangeMyPasswordVarsBuilder();

  GChangeMyPasswordVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _old_password = $v.old_password;
      _new_password = $v.new_password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GChangeMyPasswordVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GChangeMyPasswordVars;
  }

  @override
  void update(void Function(GChangeMyPasswordVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GChangeMyPasswordVars build() => _build();

  _$GChangeMyPasswordVars _build() {
    final _$result = _$v ??
        new _$GChangeMyPasswordVars._(
            old_password: BuiltValueNullFieldError.checkNotNull(
                old_password, r'GChangeMyPasswordVars', 'old_password'),
            new_password: BuiltValueNullFieldError.checkNotNull(
                new_password, r'GChangeMyPasswordVars', 'new_password'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
