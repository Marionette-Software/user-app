// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_history_by_wallet.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUserHistoryByIdVars> _$gGetUserHistoryByIdVarsSerializer =
    new _$GGetUserHistoryByIdVarsSerializer();

class _$GGetUserHistoryByIdVarsSerializer
    implements StructuredSerializer<GGetUserHistoryByIdVars> {
  @override
  final Iterable<Type> types = const [
    GGetUserHistoryByIdVars,
    _$GGetUserHistoryByIdVars
  ];
  @override
  final String wireName = 'GGetUserHistoryByIdVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserHistoryByIdVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'currencyId',
      serializers.serialize(object.currencyId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetUserHistoryByIdVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserHistoryByIdVarsBuilder();

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

class _$GGetUserHistoryByIdVars extends GGetUserHistoryByIdVars {
  @override
  final String currencyId;

  factory _$GGetUserHistoryByIdVars(
          [void Function(GGetUserHistoryByIdVarsBuilder)? updates]) =>
      (new GGetUserHistoryByIdVarsBuilder()..update(updates))._build();

  _$GGetUserHistoryByIdVars._({required this.currencyId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currencyId, r'GGetUserHistoryByIdVars', 'currencyId');
  }

  @override
  GGetUserHistoryByIdVars rebuild(
          void Function(GGetUserHistoryByIdVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserHistoryByIdVarsBuilder toBuilder() =>
      new GGetUserHistoryByIdVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserHistoryByIdVars && currencyId == other.currencyId;
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
    return (newBuiltValueToStringHelper(r'GGetUserHistoryByIdVars')
          ..add('currencyId', currencyId))
        .toString();
  }
}

class GGetUserHistoryByIdVarsBuilder
    implements
        Builder<GGetUserHistoryByIdVars, GGetUserHistoryByIdVarsBuilder> {
  _$GGetUserHistoryByIdVars? _$v;

  String? _currencyId;
  String? get currencyId => _$this._currencyId;
  set currencyId(String? currencyId) => _$this._currencyId = currencyId;

  GGetUserHistoryByIdVarsBuilder();

  GGetUserHistoryByIdVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyId = $v.currencyId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserHistoryByIdVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserHistoryByIdVars;
  }

  @override
  void update(void Function(GGetUserHistoryByIdVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserHistoryByIdVars build() => _build();

  _$GGetUserHistoryByIdVars _build() {
    final _$result = _$v ??
        new _$GGetUserHistoryByIdVars._(
            currencyId: BuiltValueNullFieldError.checkNotNull(
                currencyId, r'GGetUserHistoryByIdVars', 'currencyId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
