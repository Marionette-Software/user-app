// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_orders.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetUseOrdersVars> _$gGetUseOrdersVarsSerializer =
    new _$GGetUseOrdersVarsSerializer();

class _$GGetUseOrdersVarsSerializer
    implements StructuredSerializer<GGetUseOrdersVars> {
  @override
  final Iterable<Type> types = const [GGetUseOrdersVars, _$GGetUseOrdersVars];
  @override
  final String wireName = 'GGetUseOrdersVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetUseOrdersVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.market;
    if (value != null) {
      result
        ..add('market')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.page;
    if (value != null) {
      result
        ..add('page')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.limit;
    if (value != null) {
      result
        ..add('limit')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GGetUseOrdersVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetUseOrdersVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'market':
          result.market = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetUseOrdersVars extends GGetUseOrdersVars {
  @override
  final String? market;
  @override
  final String? status;
  @override
  final int? page;
  @override
  final int? limit;

  factory _$GGetUseOrdersVars(
          [void Function(GGetUseOrdersVarsBuilder)? updates]) =>
      (new GGetUseOrdersVarsBuilder()..update(updates))._build();

  _$GGetUseOrdersVars._({this.market, this.status, this.page, this.limit})
      : super._();

  @override
  GGetUseOrdersVars rebuild(void Function(GGetUseOrdersVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetUseOrdersVarsBuilder toBuilder() =>
      new GGetUseOrdersVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetUseOrdersVars &&
        market == other.market &&
        status == other.status &&
        page == other.page &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, market.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetUseOrdersVars')
          ..add('market', market)
          ..add('status', status)
          ..add('page', page)
          ..add('limit', limit))
        .toString();
  }
}

class GGetUseOrdersVarsBuilder
    implements Builder<GGetUseOrdersVars, GGetUseOrdersVarsBuilder> {
  _$GGetUseOrdersVars? _$v;

  String? _market;
  String? get market => _$this._market;
  set market(String? market) => _$this._market = market;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GGetUseOrdersVarsBuilder();

  GGetUseOrdersVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _market = $v.market;
      _status = $v.status;
      _page = $v.page;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetUseOrdersVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetUseOrdersVars;
  }

  @override
  void update(void Function(GGetUseOrdersVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetUseOrdersVars build() => _build();

  _$GGetUseOrdersVars _build() {
    final _$result = _$v ??
        new _$GGetUseOrdersVars._(
            market: market, status: status, page: page, limit: limit);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
