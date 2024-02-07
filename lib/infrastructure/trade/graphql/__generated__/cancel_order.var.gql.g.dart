// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_order.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCancelOrderActionVars> _$gCancelOrderActionVarsSerializer =
    new _$GCancelOrderActionVarsSerializer();

class _$GCancelOrderActionVarsSerializer
    implements StructuredSerializer<GCancelOrderActionVars> {
  @override
  final Iterable<Type> types = const [
    GCancelOrderActionVars,
    _$GCancelOrderActionVars
  ];
  @override
  final String wireName = 'GCancelOrderActionVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCancelOrderActionVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCancelOrderActionVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCancelOrderActionVarsBuilder();

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

class _$GCancelOrderActionVars extends GCancelOrderActionVars {
  @override
  final String id;

  factory _$GCancelOrderActionVars(
          [void Function(GCancelOrderActionVarsBuilder)? updates]) =>
      (new GCancelOrderActionVarsBuilder()..update(updates))._build();

  _$GCancelOrderActionVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GCancelOrderActionVars', 'id');
  }

  @override
  GCancelOrderActionVars rebuild(
          void Function(GCancelOrderActionVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCancelOrderActionVarsBuilder toBuilder() =>
      new GCancelOrderActionVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCancelOrderActionVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GCancelOrderActionVars')
          ..add('id', id))
        .toString();
  }
}

class GCancelOrderActionVarsBuilder
    implements Builder<GCancelOrderActionVars, GCancelOrderActionVarsBuilder> {
  _$GCancelOrderActionVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GCancelOrderActionVarsBuilder();

  GCancelOrderActionVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCancelOrderActionVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCancelOrderActionVars;
  }

  @override
  void update(void Function(GCancelOrderActionVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCancelOrderActionVars build() => _build();

  _$GCancelOrderActionVars _build() {
    final _$result = _$v ??
        new _$GCancelOrderActionVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCancelOrderActionVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
