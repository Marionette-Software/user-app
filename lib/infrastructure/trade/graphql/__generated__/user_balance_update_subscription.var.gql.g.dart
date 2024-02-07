// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_balance_update_subscription.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUserBalanceUpdatedVars> _$gGetUserBalanceUpdatedVarsSerializer =
    new _$GGetUserBalanceUpdatedVarsSerializer();

class _$GGetUserBalanceUpdatedVarsSerializer
    implements StructuredSerializer<GGetUserBalanceUpdatedVars> {
  @override
  final Iterable<Type> types = const [
    GGetUserBalanceUpdatedVars,
    _$GGetUserBalanceUpdatedVars
  ];
  @override
  final String wireName = 'GGetUserBalanceUpdatedVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserBalanceUpdatedVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetUserBalanceUpdatedVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserBalanceUpdatedVarsBuilder();

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

class _$GGetUserBalanceUpdatedVars extends GGetUserBalanceUpdatedVars {
  @override
  final String token;

  factory _$GGetUserBalanceUpdatedVars(
          [void Function(GGetUserBalanceUpdatedVarsBuilder)? updates]) =>
      (new GGetUserBalanceUpdatedVarsBuilder()..update(updates))._build();

  _$GGetUserBalanceUpdatedVars._({required this.token}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        token, r'GGetUserBalanceUpdatedVars', 'token');
  }

  @override
  GGetUserBalanceUpdatedVars rebuild(
          void Function(GGetUserBalanceUpdatedVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserBalanceUpdatedVarsBuilder toBuilder() =>
      new GGetUserBalanceUpdatedVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserBalanceUpdatedVars && token == other.token;
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
    return (newBuiltValueToStringHelper(r'GGetUserBalanceUpdatedVars')
          ..add('token', token))
        .toString();
  }
}

class GGetUserBalanceUpdatedVarsBuilder
    implements
        Builder<GGetUserBalanceUpdatedVars, GGetUserBalanceUpdatedVarsBuilder> {
  _$GGetUserBalanceUpdatedVars? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  GGetUserBalanceUpdatedVarsBuilder();

  GGetUserBalanceUpdatedVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserBalanceUpdatedVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserBalanceUpdatedVars;
  }

  @override
  void update(void Function(GGetUserBalanceUpdatedVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserBalanceUpdatedVars build() => _build();

  _$GGetUserBalanceUpdatedVars _build() {
    final _$result = _$v ??
        new _$GGetUserBalanceUpdatedVars._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'GGetUserBalanceUpdatedVars', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
