// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_all_balance_subscription.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserAllBalanceVars> _$gUserAllBalanceVarsSerializer =
    new _$GUserAllBalanceVarsSerializer();

class _$GUserAllBalanceVarsSerializer
    implements StructuredSerializer<GUserAllBalanceVars> {
  @override
  final Iterable<Type> types = const [
    GUserAllBalanceVars,
    _$GUserAllBalanceVars
  ];
  @override
  final String wireName = 'GUserAllBalanceVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserAllBalanceVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUserAllBalanceVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserAllBalanceVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserAllBalanceVars extends GUserAllBalanceVars {
  @override
  final String token;

  factory _$GUserAllBalanceVars(
          [void Function(GUserAllBalanceVarsBuilder)? updates]) =>
      (new GUserAllBalanceVarsBuilder()..update(updates))._build();

  _$GUserAllBalanceVars._({required this.token}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        token, r'GUserAllBalanceVars', 'token');
  }

  @override
  GUserAllBalanceVars rebuild(
          void Function(GUserAllBalanceVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserAllBalanceVarsBuilder toBuilder() =>
      new GUserAllBalanceVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserAllBalanceVars && token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserAllBalanceVars')
          ..add('token', token))
        .toString();
  }
}

class GUserAllBalanceVarsBuilder
    implements Builder<GUserAllBalanceVars, GUserAllBalanceVarsBuilder> {
  _$GUserAllBalanceVars? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  GUserAllBalanceVarsBuilder();

  GUserAllBalanceVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserAllBalanceVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserAllBalanceVars;
  }

  @override
  void update(void Function(GUserAllBalanceVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserAllBalanceVars build() => _build();

  _$GUserAllBalanceVars _build() {
    final _$result = _$v ??
        new _$GUserAllBalanceVars._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'GUserAllBalanceVars', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
