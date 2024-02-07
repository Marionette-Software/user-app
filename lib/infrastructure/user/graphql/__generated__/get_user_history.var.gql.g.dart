// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_history.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUserHistoryVars> _$gGetUserHistoryVarsSerializer =
    new _$GGetUserHistoryVarsSerializer();

class _$GGetUserHistoryVarsSerializer
    implements StructuredSerializer<GGetUserHistoryVars> {
  @override
  final Iterable<Type> types = const [
    GGetUserHistoryVars,
    _$GGetUserHistoryVars
  ];
  @override
  final String wireName = 'GGetUserHistoryVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetUserHistoryVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.currencyId;
    if (value != null) {
      result
        ..add('currencyId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.limit;
    if (value != null) {
      result
        ..add('limit')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.page;
    if (value != null) {
      result
        ..add('page')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.from;
    if (value != null) {
      result
        ..add('from')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.to;
    if (value != null) {
      result
        ..add('to')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetUserHistoryVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUserHistoryVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'currencyId':
          result.currencyId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'from':
          result.from = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'to':
          result.to = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUserHistoryVars extends GGetUserHistoryVars {
  @override
  final String? currencyId;
  @override
  final int? limit;
  @override
  final int? page;
  @override
  final String? type;
  @override
  final String? from;
  @override
  final String? to;

  factory _$GGetUserHistoryVars(
          [void Function(GGetUserHistoryVarsBuilder)? updates]) =>
      (new GGetUserHistoryVarsBuilder()..update(updates))._build();

  _$GGetUserHistoryVars._(
      {this.currencyId, this.limit, this.page, this.type, this.from, this.to})
      : super._();

  @override
  GGetUserHistoryVars rebuild(
          void Function(GGetUserHistoryVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUserHistoryVarsBuilder toBuilder() =>
      new GGetUserHistoryVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUserHistoryVars &&
        currencyId == other.currencyId &&
        limit == other.limit &&
        page == other.page &&
        type == other.type &&
        from == other.from &&
        to == other.to;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currencyId.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, from.hashCode);
    _$hash = $jc(_$hash, to.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUserHistoryVars')
          ..add('currencyId', currencyId)
          ..add('limit', limit)
          ..add('page', page)
          ..add('type', type)
          ..add('from', from)
          ..add('to', to))
        .toString();
  }
}

class GGetUserHistoryVarsBuilder
    implements Builder<GGetUserHistoryVars, GGetUserHistoryVarsBuilder> {
  _$GGetUserHistoryVars? _$v;

  String? _currencyId;
  String? get currencyId => _$this._currencyId;
  set currencyId(String? currencyId) => _$this._currencyId = currencyId;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _from;
  String? get from => _$this._from;
  set from(String? from) => _$this._from = from;

  String? _to;
  String? get to => _$this._to;
  set to(String? to) => _$this._to = to;

  GGetUserHistoryVarsBuilder();

  GGetUserHistoryVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyId = $v.currencyId;
      _limit = $v.limit;
      _page = $v.page;
      _type = $v.type;
      _from = $v.from;
      _to = $v.to;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUserHistoryVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUserHistoryVars;
  }

  @override
  void update(void Function(GGetUserHistoryVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUserHistoryVars build() => _build();

  _$GGetUserHistoryVars _build() {
    final _$result = _$v ??
        new _$GGetUserHistoryVars._(
            currencyId: currencyId,
            limit: limit,
            page: page,
            type: type,
            from: from,
            to: to);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
