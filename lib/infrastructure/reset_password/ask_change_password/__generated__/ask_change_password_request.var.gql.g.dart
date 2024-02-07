// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_change_password_request.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAskChangePasswordVars> _$gAskChangePasswordVarsSerializer =
    new _$GAskChangePasswordVarsSerializer();

class _$GAskChangePasswordVarsSerializer
    implements StructuredSerializer<GAskChangePasswordVars> {
  @override
  final Iterable<Type> types = const [
    GAskChangePasswordVars,
    _$GAskChangePasswordVars
  ];
  @override
  final String wireName = 'GAskChangePasswordVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAskChangePasswordVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAskChangePasswordVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAskChangePasswordVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAskChangePasswordVars extends GAskChangePasswordVars {
  @override
  final String email;

  factory _$GAskChangePasswordVars(
          [void Function(GAskChangePasswordVarsBuilder)? updates]) =>
      (new GAskChangePasswordVarsBuilder()..update(updates))._build();

  _$GAskChangePasswordVars._({required this.email}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        email, r'GAskChangePasswordVars', 'email');
  }

  @override
  GAskChangePasswordVars rebuild(
          void Function(GAskChangePasswordVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAskChangePasswordVarsBuilder toBuilder() =>
      new GAskChangePasswordVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAskChangePasswordVars && email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAskChangePasswordVars')
          ..add('email', email))
        .toString();
  }
}

class GAskChangePasswordVarsBuilder
    implements Builder<GAskChangePasswordVars, GAskChangePasswordVarsBuilder> {
  _$GAskChangePasswordVars? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  GAskChangePasswordVarsBuilder();

  GAskChangePasswordVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAskChangePasswordVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAskChangePasswordVars;
  }

  @override
  void update(void Function(GAskChangePasswordVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAskChangePasswordVars build() => _build();

  _$GAskChangePasswordVars _build() {
    final _$result = _$v ??
        new _$GAskChangePasswordVars._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'GAskChangePasswordVars', 'email'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
