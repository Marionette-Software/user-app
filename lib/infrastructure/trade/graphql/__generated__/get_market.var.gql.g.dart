// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_market.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetMarketVars> _$gGetMarketVarsSerializer =
    new _$GGetMarketVarsSerializer();

class _$GGetMarketVarsSerializer
    implements StructuredSerializer<GGetMarketVars> {
  @override
  final Iterable<Type> types = const [GGetMarketVars, _$GGetMarketVars];
  @override
  final String wireName = 'GGetMarketVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetMarketVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetMarketVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetMarketVarsBuilder();

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

class _$GGetMarketVars extends GGetMarketVars {
  @override
  final String id;

  factory _$GGetMarketVars([void Function(GGetMarketVarsBuilder)? updates]) =>
      (new GGetMarketVarsBuilder()..update(updates))._build();

  _$GGetMarketVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GGetMarketVars', 'id');
  }

  @override
  GGetMarketVars rebuild(void Function(GGetMarketVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetMarketVarsBuilder toBuilder() =>
      new GGetMarketVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetMarketVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GGetMarketVars')..add('id', id))
        .toString();
  }
}

class GGetMarketVarsBuilder
    implements Builder<GGetMarketVars, GGetMarketVarsBuilder> {
  _$GGetMarketVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GGetMarketVarsBuilder();

  GGetMarketVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetMarketVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetMarketVars;
  }

  @override
  void update(void Function(GGetMarketVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetMarketVars build() => _build();

  _$GGetMarketVars _build() {
    final _$result = _$v ??
        new _$GGetMarketVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GGetMarketVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
