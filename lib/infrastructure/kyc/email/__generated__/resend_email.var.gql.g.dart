// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_email.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GResendEmailConfirmVars> _$gResendEmailConfirmVarsSerializer =
    new _$GResendEmailConfirmVarsSerializer();

class _$GResendEmailConfirmVarsSerializer
    implements StructuredSerializer<GResendEmailConfirmVars> {
  @override
  final Iterable<Type> types = const [
    GResendEmailConfirmVars,
    _$GResendEmailConfirmVars
  ];
  @override
  final String wireName = 'GResendEmailConfirmVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GResendEmailConfirmVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GResendEmailConfirmVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GResendEmailConfirmVarsBuilder();

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

class _$GResendEmailConfirmVars extends GResendEmailConfirmVars {
  @override
  final String email;

  factory _$GResendEmailConfirmVars(
          [void Function(GResendEmailConfirmVarsBuilder)? updates]) =>
      (new GResendEmailConfirmVarsBuilder()..update(updates))._build();

  _$GResendEmailConfirmVars._({required this.email}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        email, r'GResendEmailConfirmVars', 'email');
  }

  @override
  GResendEmailConfirmVars rebuild(
          void Function(GResendEmailConfirmVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GResendEmailConfirmVarsBuilder toBuilder() =>
      new GResendEmailConfirmVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GResendEmailConfirmVars && email == other.email;
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
    return (newBuiltValueToStringHelper(r'GResendEmailConfirmVars')
          ..add('email', email))
        .toString();
  }
}

class GResendEmailConfirmVarsBuilder
    implements
        Builder<GResendEmailConfirmVars, GResendEmailConfirmVarsBuilder> {
  _$GResendEmailConfirmVars? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  GResendEmailConfirmVarsBuilder();

  GResendEmailConfirmVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GResendEmailConfirmVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GResendEmailConfirmVars;
  }

  @override
  void update(void Function(GResendEmailConfirmVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GResendEmailConfirmVars build() => _build();

  _$GResendEmailConfirmVars _build() {
    final _$result = _$v ??
        new _$GResendEmailConfirmVars._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'GResendEmailConfirmVars', 'email'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
