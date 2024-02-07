// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_staking_currency.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetStakingCurrencyVars> _$gGetStakingCurrencyVarsSerializer =
    new _$GGetStakingCurrencyVarsSerializer();

class _$GGetStakingCurrencyVarsSerializer
    implements StructuredSerializer<GGetStakingCurrencyVars> {
  @override
  final Iterable<Type> types = const [
    GGetStakingCurrencyVars,
    _$GGetStakingCurrencyVars
  ];
  @override
  final String wireName = 'GGetStakingCurrencyVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetStakingCurrencyVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetStakingCurrencyVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetStakingCurrencyVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetStakingCurrencyVars extends GGetStakingCurrencyVars {
  @override
  final String id;

  factory _$GGetStakingCurrencyVars(
          [void Function(GGetStakingCurrencyVarsBuilder)? updates]) =>
      (new GGetStakingCurrencyVarsBuilder()..update(updates))._build();

  _$GGetStakingCurrencyVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GGetStakingCurrencyVars', 'id');
  }

  @override
  GGetStakingCurrencyVars rebuild(
          void Function(GGetStakingCurrencyVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetStakingCurrencyVarsBuilder toBuilder() =>
      new GGetStakingCurrencyVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetStakingCurrencyVars && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetStakingCurrencyVars')
          ..add('id', id))
        .toString();
  }
}

class GGetStakingCurrencyVarsBuilder
    implements
        Builder<GGetStakingCurrencyVars, GGetStakingCurrencyVarsBuilder> {
  _$GGetStakingCurrencyVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GGetStakingCurrencyVarsBuilder();

  GGetStakingCurrencyVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetStakingCurrencyVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetStakingCurrencyVars;
  }

  @override
  void update(void Function(GGetStakingCurrencyVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetStakingCurrencyVars build() => _build();

  _$GGetStakingCurrencyVars _build() {
    final _$result = _$v ??
        new _$GGetStakingCurrencyVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GGetStakingCurrencyVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
