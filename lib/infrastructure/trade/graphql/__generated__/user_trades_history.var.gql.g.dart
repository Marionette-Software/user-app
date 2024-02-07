// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_trades_history.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUserTradesHistoryVars> _$gGetUserTradesHistoryVarsSerializer =
    new _$GGetUserTradesHistoryVarsSerializer();

class _$GGetUserTradesHistoryVarsSerializer
    implements StructuredSerializer<GGetUserTradesHistoryVars> {
  @override
  final Iterable<Type> types = const [
    GGetUserTradesHistoryVars,
    _$GGetUserTradesHistoryVars
  ];
  @override
  final String wireName = 'GGetUserTradesHistoryVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserTradesHistoryVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.market;
    if (value != null) {
      result
        ..add('market')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetUserTradesHistoryVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserTradesHistoryVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'market':
          result.market = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserTradesHistoryVars extends GGetUserTradesHistoryVars {
  @override
  final String? market;

  factory _$GGetUserTradesHistoryVars(
          [void Function(GGetUserTradesHistoryVarsBuilder)? updates]) =>
      (new GGetUserTradesHistoryVarsBuilder()..update(updates))._build();

  _$GGetUserTradesHistoryVars._({this.market}) : super._();

  @override
  GGetUserTradesHistoryVars rebuild(
          void Function(GGetUserTradesHistoryVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserTradesHistoryVarsBuilder toBuilder() =>
      new GGetUserTradesHistoryVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserTradesHistoryVars && market == other.market;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, market.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserTradesHistoryVars')
          ..add('market', market))
        .toString();
  }
}

class GGetUserTradesHistoryVarsBuilder
    implements
        Builder<GGetUserTradesHistoryVars, GGetUserTradesHistoryVarsBuilder> {
  _$GGetUserTradesHistoryVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  GGetUserTradesHistoryVarsBuilder();

  GGetUserTradesHistoryVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserTradesHistoryVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserTradesHistoryVars;
  }

  @override
  void update(void Function(GGetUserTradesHistoryVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserTradesHistoryVars build() => _build();

  _$GGetUserTradesHistoryVars _build() {
    final _$result = _$v ?? new _$GGetUserTradesHistoryVars._(market: market);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
