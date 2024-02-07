// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_from_funds_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMoveFromAdvancedTradingFundsData>
    _$gMoveFromAdvancedTradingFundsDataSerializer =
    new _$GMoveFromAdvancedTradingFundsDataSerializer();

class _$GMoveFromAdvancedTradingFundsDataSerializer
    implements StructuredSerializer<GMoveFromAdvancedTradingFundsData> {
  @override
  final Iterable<Type> types = const [
    GMoveFromAdvancedTradingFundsData,
    _$GMoveFromAdvancedTradingFundsData
  ];
  @override
  final String wireName = 'GMoveFromAdvancedTradingFundsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GMoveFromAdvancedTradingFundsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.moveFromAdvancedTrading;
    if (value != null) {
      result
        ..add('moveFromAdvancedTrading')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GMoveFromAdvancedTradingFundsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMoveFromAdvancedTradingFundsDataBuilder();

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
        case 'moveFromAdvancedTrading':
          result.moveFromAdvancedTrading = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GMoveFromAdvancedTradingFundsData
    extends GMoveFromAdvancedTradingFundsData {
  @override
  final String G__typename;
  @override
  final String? moveFromAdvancedTrading;

  factory _$GMoveFromAdvancedTradingFundsData(
          [void Function(GMoveFromAdvancedTradingFundsDataBuilder)? updates]) =>
      (new GMoveFromAdvancedTradingFundsDataBuilder()..update(updates))
          ._build();

  _$GMoveFromAdvancedTradingFundsData._(
      {required this.G__typename, this.moveFromAdvancedTrading})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GMoveFromAdvancedTradingFundsData', 'G__typename');
  }

  @override
  GMoveFromAdvancedTradingFundsData rebuild(
          void Function(GMoveFromAdvancedTradingFundsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMoveFromAdvancedTradingFundsDataBuilder toBuilder() =>
      new GMoveFromAdvancedTradingFundsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMoveFromAdvancedTradingFundsData &&
        G__typename == other.G__typename &&
        moveFromAdvancedTrading == other.moveFromAdvancedTrading;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, moveFromAdvancedTrading.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GMoveFromAdvancedTradingFundsData')
          ..add('G__typename', G__typename)
          ..add('moveFromAdvancedTrading', moveFromAdvancedTrading))
        .toString();
  }
}

class GMoveFromAdvancedTradingFundsDataBuilder
    implements
        Builder<GMoveFromAdvancedTradingFundsData,
            GMoveFromAdvancedTradingFundsDataBuilder> {
  _$GMoveFromAdvancedTradingFundsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _moveFromAdvancedTrading;
  String? get moveFromAdvancedTrading => _$this._moveFromAdvancedTrading;
  set moveFromAdvancedTrading(String? moveFromAdvancedTrading) =>
      _$this._moveFromAdvancedTrading = moveFromAdvancedTrading;

  GMoveFromAdvancedTradingFundsDataBuilder() {
    GMoveFromAdvancedTradingFundsData._initializeBuilder(this);
  }

  GMoveFromAdvancedTradingFundsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _moveFromAdvancedTrading = $v.moveFromAdvancedTrading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMoveFromAdvancedTradingFundsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMoveFromAdvancedTradingFundsData;
  }

  @override
  void update(
      void Function(GMoveFromAdvancedTradingFundsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMoveFromAdvancedTradingFundsData build() => _build();

  _$GMoveFromAdvancedTradingFundsData _build() {
    final _$result = _$v ??
        new _$GMoveFromAdvancedTradingFundsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GMoveFromAdvancedTradingFundsData', 'G__typename'),
            moveFromAdvancedTrading: moveFromAdvancedTrading);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
