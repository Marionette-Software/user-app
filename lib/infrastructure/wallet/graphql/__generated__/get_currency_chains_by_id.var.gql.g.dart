// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_currency_chains_by_id.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetCurrencyChainsDataVars> _$gGetCurrencyChainsDataVarsSerializer =
    new _$GGetCurrencyChainsDataVarsSerializer();

class _$GGetCurrencyChainsDataVarsSerializer
    implements StructuredSerializer<GGetCurrencyChainsDataVars> {
  @override
  final Iterable<Type> types = const [
    GGetCurrencyChainsDataVars,
    _$GGetCurrencyChainsDataVars
  ];
  @override
  final String wireName = 'GGetCurrencyChainsDataVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetCurrencyChainsDataVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'currencyId',
      serializers.serialize(object.currencyId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetCurrencyChainsDataVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetCurrencyChainsDataVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'currencyId':
          result.currencyId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetCurrencyChainsDataVars extends GGetCurrencyChainsDataVars {
  @override
  final String currencyId;

  factory _$GGetCurrencyChainsDataVars(
          [void Function(GGetCurrencyChainsDataVarsBuilder)? updates]) =>
      (new GGetCurrencyChainsDataVarsBuilder()..update(updates))._build();

  _$GGetCurrencyChainsDataVars._({required this.currencyId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currencyId, r'GGetCurrencyChainsDataVars', 'currencyId');
  }

  @override
  GGetCurrencyChainsDataVars rebuild(
          void Function(GGetCurrencyChainsDataVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetCurrencyChainsDataVarsBuilder toBuilder() =>
      new GGetCurrencyChainsDataVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetCurrencyChainsDataVars &&
        currencyId == other.currencyId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currencyId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetCurrencyChainsDataVars')
          ..add('currencyId', currencyId))
        .toString();
  }
}

class GGetCurrencyChainsDataVarsBuilder
    implements
        Builder<GGetCurrencyChainsDataVars, GGetCurrencyChainsDataVarsBuilder> {
  _$GGetCurrencyChainsDataVars? _$v;

  String? _currencyId;
  String? get currencyId => _$this._currencyId;
  set currencyId(String? currencyId) => _$this._currencyId = currencyId;

  GGetCurrencyChainsDataVarsBuilder();

  GGetCurrencyChainsDataVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyId = $v.currencyId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetCurrencyChainsDataVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetCurrencyChainsDataVars;
  }

  @override
  void update(void Function(GGetCurrencyChainsDataVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetCurrencyChainsDataVars build() => _build();

  _$GGetCurrencyChainsDataVars _build() {
    final _$result = _$v ??
        new _$GGetCurrencyChainsDataVars._(
            currencyId: BuiltValueNullFieldError.checkNotNull(
                currencyId, r'GGetCurrencyChainsDataVars', 'currencyId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
