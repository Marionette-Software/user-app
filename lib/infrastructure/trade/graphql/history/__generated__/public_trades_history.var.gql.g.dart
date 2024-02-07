// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_trades_history.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetPublicTradesHistoryVars>
    _$gGetPublicTradesHistoryVarsSerializer =
    new _$GGetPublicTradesHistoryVarsSerializer();

class _$GGetPublicTradesHistoryVarsSerializer
    implements StructuredSerializer<GGetPublicTradesHistoryVars> {
  @override
  final Iterable<Type> types = const [
    GGetPublicTradesHistoryVars,
    _$GGetPublicTradesHistoryVars
  ];
  @override
  final String wireName = 'GGetPublicTradesHistoryVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetPublicTradesHistoryVars object,
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
  GGetPublicTradesHistoryVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetPublicTradesHistoryVarsBuilder();

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

class _$GGetPublicTradesHistoryVars extends GGetPublicTradesHistoryVars {
  @override
  final String? market;

  factory _$GGetPublicTradesHistoryVars(
          [void Function(GGetPublicTradesHistoryVarsBuilder)? updates]) =>
      (new GGetPublicTradesHistoryVarsBuilder()..update(updates))._build();

  _$GGetPublicTradesHistoryVars._({this.market}) : super._();

  @override
  GGetPublicTradesHistoryVars rebuild(
          void Function(GGetPublicTradesHistoryVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetPublicTradesHistoryVarsBuilder toBuilder() =>
      new GGetPublicTradesHistoryVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetPublicTradesHistoryVars && market == other.market;
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
    return (newBuiltValueToStringHelper(r'GGetPublicTradesHistoryVars')
          ..add('market', market))
        .toString();
  }
}

class GGetPublicTradesHistoryVarsBuilder
    implements
        Builder<GGetPublicTradesHistoryVars,
            GGetPublicTradesHistoryVarsBuilder> {
  _$GGetPublicTradesHistoryVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  GGetPublicTradesHistoryVarsBuilder();

  GGetPublicTradesHistoryVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetPublicTradesHistoryVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetPublicTradesHistoryVars;
  }

  @override
  void update(void Function(GGetPublicTradesHistoryVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetPublicTradesHistoryVars build() => _build();

  _$GGetPublicTradesHistoryVars _build() {
    final _$result = _$v ?? new _$GGetPublicTradesHistoryVars._(market: market);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
