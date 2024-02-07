// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_balances.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUserBalancesVars> _$gGetUserBalancesVarsSerializer =
    new _$GGetUserBalancesVarsSerializer();

class _$GGetUserBalancesVarsSerializer
    implements StructuredSerializer<GGetUserBalancesVars> {
  @override
  final Iterable<Type> types = const [
    GGetUserBalancesVars,
    _$GGetUserBalancesVars
  ];
  @override
  final String wireName = 'GGetUserBalancesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserBalancesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetUserBalancesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserBalancesVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserBalancesVars extends GGetUserBalancesVars {
  @override
  final String? id;

  factory _$GGetUserBalancesVars(
          [void Function(GGetUserBalancesVarsBuilder)? updates]) =>
      (new GGetUserBalancesVarsBuilder()..update(updates))._build();

  _$GGetUserBalancesVars._({this.id}) : super._();

  @override
  GGetUserBalancesVars rebuild(
          void Function(GGetUserBalancesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserBalancesVarsBuilder toBuilder() =>
      new GGetUserBalancesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserBalancesVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GGetUserBalancesVars')..add('id', id))
        .toString();
  }
}

class GGetUserBalancesVarsBuilder
    implements Builder<GGetUserBalancesVars, GGetUserBalancesVarsBuilder> {
  _$GGetUserBalancesVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GGetUserBalancesVarsBuilder();

  GGetUserBalancesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserBalancesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserBalancesVars;
  }

  @override
  void update(void Function(GGetUserBalancesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserBalancesVars build() => _build();

  _$GGetUserBalancesVars _build() {
    final _$result = _$v ?? new _$GGetUserBalancesVars._(id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
