// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_user_password.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GChangePasswordVars> _$gChangePasswordVarsSerializer =
    new _$GChangePasswordVarsSerializer();

class _$GChangePasswordVarsSerializer
    implements StructuredSerializer<GChangePasswordVars> {
  @override
  final Iterable<Type> types = const [
    GChangePasswordVars,
    _$GChangePasswordVars
  ];
  @override
  final String wireName = 'GChangePasswordVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GChangePasswordVars object,
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
  GChangePasswordVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GChangePasswordVarsBuilder();

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

class _$GChangePasswordVars extends GChangePasswordVars {
  @override
  final String old_password;
  @override
  final String new_password;

  factory _$GChangePasswordVars(
          [void Function(GChangePasswordVarsBuilder)? updates]) =>
      (new GChangePasswordVarsBuilder()..update(updates))._build();

  _$GChangePasswordVars._(
      {required this.old_password, required this.new_password})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        old_password, r'GChangePasswordVars', 'old_password');
    BuiltValueNullFieldError.checkNotNull(
        new_password, r'GChangePasswordVars', 'new_password');
  }

  @override
  GChangePasswordVars rebuild(
          void Function(GChangePasswordVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GChangePasswordVarsBuilder toBuilder() =>
      new GChangePasswordVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GChangePasswordVars &&
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
    return (newBuiltValueToStringHelper(r'GChangePasswordVars')
          ..add('old_password', old_password)
          ..add('new_password', new_password))
        .toString();
  }
}

class GChangePasswordVarsBuilder
    implements Builder<GChangePasswordVars, GChangePasswordVarsBuilder> {
  _$GChangePasswordVars? _$v;

  String? _old_password;
  String? get old_password => _$this._old_password;
  set old_password(String? old_password) => _$this._old_password = old_password;

  String? _new_password;
  String? get new_password => _$this._new_password;
  set new_password(String? new_password) => _$this._new_password = new_password;

  GChangePasswordVarsBuilder();

  GChangePasswordVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _old_password = $v.old_password;
      _new_password = $v.new_password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GChangePasswordVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GChangePasswordVars;
  }

  @override
  void update(void Function(GChangePasswordVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GChangePasswordVars build() => _build();

  _$GChangePasswordVars _build() {
    final _$result = _$v ??
        new _$GChangePasswordVars._(
            old_password: BuiltValueNullFieldError.checkNotNull(
                old_password, r'GChangePasswordVars', 'old_password'),
            new_password: BuiltValueNullFieldError.checkNotNull(
                new_password, r'GChangePasswordVars', 'new_password'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
