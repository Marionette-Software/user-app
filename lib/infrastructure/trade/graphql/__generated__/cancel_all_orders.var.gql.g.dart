// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_all_orders.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCancelAllOrdersVars> _$gCancelAllOrdersVarsSerializer =
    new _$GCancelAllOrdersVarsSerializer();

class _$GCancelAllOrdersVarsSerializer
    implements StructuredSerializer<GCancelAllOrdersVars> {
  @override
  final Iterable<Type> types = const [
    GCancelAllOrdersVars,
    _$GCancelAllOrdersVars
  ];
  @override
  final String wireName = 'GCancelAllOrdersVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCancelAllOrdersVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'market',
      serializers.serialize(object.market,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCancelAllOrdersVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCancelAllOrdersVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'market':
          result.market = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCancelAllOrdersVars extends GCancelAllOrdersVars {
  @override
  final String market;

  factory _$GCancelAllOrdersVars(
          [void Function(GCancelAllOrdersVarsBuilder)? updates]) =>
      (new GCancelAllOrdersVarsBuilder()..update(updates))._build();

  _$GCancelAllOrdersVars._({required this.market}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        market, r'GCancelAllOrdersVars', 'market');
  }

  @override
  GCancelAllOrdersVars rebuild(
          void Function(GCancelAllOrdersVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCancelAllOrdersVarsBuilder toBuilder() =>
      new GCancelAllOrdersVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCancelAllOrdersVars && market == other.market;
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
    return (newBuiltValueToStringHelper(r'GCancelAllOrdersVars')
          ..add('market', market))
        .toString();
  }
}

class GCancelAllOrdersVarsBuilder
    implements Builder<GCancelAllOrdersVars, GCancelAllOrdersVarsBuilder> {
  _$GCancelAllOrdersVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  GCancelAllOrdersVarsBuilder();

  GCancelAllOrdersVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCancelAllOrdersVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCancelAllOrdersVars;
  }

  @override
  void update(void Function(GCancelAllOrdersVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCancelAllOrdersVars build() => _build();

  _$GCancelAllOrdersVars _build() {
    final _$result = _$v ??
        new _$GCancelAllOrdersVars._(
            market: BuiltValueNullFieldError.checkNotNull(
                market, r'GCancelAllOrdersVars', 'market'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
