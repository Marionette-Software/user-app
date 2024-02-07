// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_currency_for_filter_history.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetCurrencyForFilterHistoryVars>
    _$gGetCurrencyForFilterHistoryVarsSerializer =
    new _$GGetCurrencyForFilterHistoryVarsSerializer();

class _$GGetCurrencyForFilterHistoryVarsSerializer
    implements StructuredSerializer<GGetCurrencyForFilterHistoryVars> {
  @override
  final Iterable<Type> types = const [
    GGetCurrencyForFilterHistoryVars,
    _$GGetCurrencyForFilterHistoryVars
  ];
  @override
  final String wireName = 'GGetCurrencyForFilterHistoryVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetCurrencyForFilterHistoryVars object,
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
  GGetCurrencyForFilterHistoryVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetCurrencyForFilterHistoryVarsBuilder();

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

class _$GGetCurrencyForFilterHistoryVars
    extends GGetCurrencyForFilterHistoryVars {
  @override
  final String? id;

  factory _$GGetCurrencyForFilterHistoryVars(
          [void Function(GGetCurrencyForFilterHistoryVarsBuilder)? updates]) =>
      (new GGetCurrencyForFilterHistoryVarsBuilder()..update(updates))._build();

  _$GGetCurrencyForFilterHistoryVars._({this.id}) : super._();

  @override
  GGetCurrencyForFilterHistoryVars rebuild(
          void Function(GGetCurrencyForFilterHistoryVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetCurrencyForFilterHistoryVarsBuilder toBuilder() =>
      new GGetCurrencyForFilterHistoryVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetCurrencyForFilterHistoryVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GGetCurrencyForFilterHistoryVars')
          ..add('id', id))
        .toString();
  }
}

class GGetCurrencyForFilterHistoryVarsBuilder
    implements
        Builder<GGetCurrencyForFilterHistoryVars,
            GGetCurrencyForFilterHistoryVarsBuilder> {
  _$GGetCurrencyForFilterHistoryVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GGetCurrencyForFilterHistoryVarsBuilder();

  GGetCurrencyForFilterHistoryVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetCurrencyForFilterHistoryVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetCurrencyForFilterHistoryVars;
  }

  @override
  void update(void Function(GGetCurrencyForFilterHistoryVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetCurrencyForFilterHistoryVars build() => _build();

  _$GGetCurrencyForFilterHistoryVars _build() {
    final _$result = _$v ?? new _$GGetCurrencyForFilterHistoryVars._(id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
