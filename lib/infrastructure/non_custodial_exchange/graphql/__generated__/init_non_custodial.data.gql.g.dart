// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_non_custodial.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GInitNonCustodialData> _$gInitNonCustodialDataSerializer =
    new _$GInitNonCustodialDataSerializer();

class _$GInitNonCustodialDataSerializer
    implements StructuredSerializer<GInitNonCustodialData> {
  @override
  final Iterable<Type> types = const [
    GInitNonCustodialData,
    _$GInitNonCustodialData
  ];
  @override
  final String wireName = 'GInitNonCustodialData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GInitNonCustodialData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.initNonCustodialExternalExchange;
    if (value != null) {
      result
        ..add('initNonCustodialExternalExchange')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GInitNonCustodialData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInitNonCustodialDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'initNonCustodialExternalExchange':
          result.initNonCustodialExternalExchange = serializers.deserialize(
              value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GInitNonCustodialData extends GInitNonCustodialData {
  @override
  final String G__typename;
  @override
  final String? initNonCustodialExternalExchange;

  factory _$GInitNonCustodialData(
          [void Function(GInitNonCustodialDataBuilder)? updates]) =>
      (new GInitNonCustodialDataBuilder()..update(updates))._build();

  _$GInitNonCustodialData._(
      {required this.G__typename, this.initNonCustodialExternalExchange})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GInitNonCustodialData', 'G__typename');
  }

  @override
  GInitNonCustodialData rebuild(
          void Function(GInitNonCustodialDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInitNonCustodialDataBuilder toBuilder() =>
      new GInitNonCustodialDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInitNonCustodialData &&
        G__typename == other.G__typename &&
        initNonCustodialExternalExchange ==
            other.initNonCustodialExternalExchange;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, initNonCustodialExternalExchange.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GInitNonCustodialData')
          ..add('G__typename', G__typename)
          ..add('initNonCustodialExternalExchange',
              initNonCustodialExternalExchange))
        .toString();
  }
}

class GInitNonCustodialDataBuilder
    implements Builder<GInitNonCustodialData, GInitNonCustodialDataBuilder> {
  _$GInitNonCustodialData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _initNonCustodialExternalExchange;
  String? get initNonCustodialExternalExchange =>
      _$this._initNonCustodialExternalExchange;
  set initNonCustodialExternalExchange(
          String? initNonCustodialExternalExchange) =>
      _$this._initNonCustodialExternalExchange =
          initNonCustodialExternalExchange;

  GInitNonCustodialDataBuilder() {
    GInitNonCustodialData._initializeBuilder(this);
  }

  GInitNonCustodialDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _initNonCustodialExternalExchange = $v.initNonCustodialExternalExchange;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInitNonCustodialData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInitNonCustodialData;
  }

  @override
  void update(void Function(GInitNonCustodialDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GInitNonCustodialData build() => _build();

  _$GInitNonCustodialData _build() {
    final _$result = _$v ??
        new _$GInitNonCustodialData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GInitNonCustodialData', 'G__typename'),
            initNonCustodialExternalExchange: initNonCustodialExternalExchange);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
