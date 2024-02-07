// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_stake.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCancelCurrencyStateVars> _$gCancelCurrencyStateVarsSerializer =
    new _$GCancelCurrencyStateVarsSerializer();

class _$GCancelCurrencyStateVarsSerializer
    implements StructuredSerializer<GCancelCurrencyStateVars> {
  @override
  final Iterable<Type> types = const [
    GCancelCurrencyStateVars,
    _$GCancelCurrencyStateVars
  ];
  @override
  final String wireName = 'GCancelCurrencyStateVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCancelCurrencyStateVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'currencyId',
      serializers.serialize(object.currencyId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCancelCurrencyStateVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCancelCurrencyStateVarsBuilder();

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

class _$GCancelCurrencyStateVars extends GCancelCurrencyStateVars {
  @override
  final String currencyId;

  factory _$GCancelCurrencyStateVars(
          [void Function(GCancelCurrencyStateVarsBuilder)? updates]) =>
      (new GCancelCurrencyStateVarsBuilder()..update(updates))._build();

  _$GCancelCurrencyStateVars._({required this.currencyId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currencyId, r'GCancelCurrencyStateVars', 'currencyId');
  }

  @override
  GCancelCurrencyStateVars rebuild(
          void Function(GCancelCurrencyStateVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCancelCurrencyStateVarsBuilder toBuilder() =>
      new GCancelCurrencyStateVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCancelCurrencyStateVars && currencyId == other.currencyId;
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
    return (newBuiltValueToStringHelper(r'GCancelCurrencyStateVars')
          ..add('currencyId', currencyId))
        .toString();
  }
}

class GCancelCurrencyStateVarsBuilder
    implements
        Builder<GCancelCurrencyStateVars, GCancelCurrencyStateVarsBuilder> {
  _$GCancelCurrencyStateVars? _$v;

  String? _currencyId;
  String? get currencyId => _$this._currencyId;
  set currencyId(String? currencyId) => _$this._currencyId = currencyId;

  GCancelCurrencyStateVarsBuilder();

  GCancelCurrencyStateVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyId = $v.currencyId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCancelCurrencyStateVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCancelCurrencyStateVars;
  }

  @override
  void update(void Function(GCancelCurrencyStateVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCancelCurrencyStateVars build() => _build();

  _$GCancelCurrencyStateVars _build() {
    final _$result = _$v ??
        new _$GCancelCurrencyStateVars._(
            currencyId: BuiltValueNullFieldError.checkNotNull(
                currencyId, r'GCancelCurrencyStateVars', 'currencyId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
