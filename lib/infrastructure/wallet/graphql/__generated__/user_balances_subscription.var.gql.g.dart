// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_balances_subscription.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserBalancesVars> _$gUserBalancesVarsSerializer =
    new _$GUserBalancesVarsSerializer();

class _$GUserBalancesVarsSerializer
    implements StructuredSerializer<GUserBalancesVars> {
  @override
  final Iterable<Type> types = const [GUserBalancesVars, _$GUserBalancesVars];
  @override
  final String wireName = 'GUserBalancesVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserBalancesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUserBalancesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserBalancesVarsBuilder();

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

class _$GUserBalancesVars extends GUserBalancesVars {
  @override
  final String token;

  factory _$GUserBalancesVars(
          [void Function(GUserBalancesVarsBuilder)? updates]) =>
      (new GUserBalancesVarsBuilder()..update(updates))._build();

  _$GUserBalancesVars._({required this.token}) : super._() {
    BuiltValueNullFieldError.checkNotNull(token, r'GUserBalancesVars', 'token');
  }

  @override
  GUserBalancesVars rebuild(void Function(GUserBalancesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserBalancesVarsBuilder toBuilder() =>
      new GUserBalancesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserBalancesVars && token == other.token;
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
    return (newBuiltValueToStringHelper(r'GUserBalancesVars')
          ..add('token', token))
        .toString();
  }
}

class GUserBalancesVarsBuilder
    implements Builder<GUserBalancesVars, GUserBalancesVarsBuilder> {
  _$GUserBalancesVars? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  GUserBalancesVarsBuilder();

  GUserBalancesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserBalancesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserBalancesVars;
  }

  @override
  void update(void Function(GUserBalancesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserBalancesVars build() => _build();

  _$GUserBalancesVars _build() {
    final _$result = _$v ??
        new _$GUserBalancesVars._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'GUserBalancesVars', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
