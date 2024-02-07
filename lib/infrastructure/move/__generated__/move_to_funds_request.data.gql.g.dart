// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_to_funds_request.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMoveToAdvancedTradingFundsData>
    _$gMoveToAdvancedTradingFundsDataSerializer =
    new _$GMoveToAdvancedTradingFundsDataSerializer();

class _$GMoveToAdvancedTradingFundsDataSerializer
    implements StructuredSerializer<GMoveToAdvancedTradingFundsData> {
  @override
  final Iterable<Type> types = const [
    GMoveToAdvancedTradingFundsData,
    _$GMoveToAdvancedTradingFundsData
  ];
  @override
  final String wireName = 'GMoveToAdvancedTradingFundsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GMoveToAdvancedTradingFundsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.moveToAdvancedTrading;
    if (value != null) {
      result
        ..add('moveToAdvancedTrading')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GMoveToAdvancedTradingFundsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMoveToAdvancedTradingFundsDataBuilder();

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
        case 'moveToAdvancedTrading':
          result.moveToAdvancedTrading = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GMoveToAdvancedTradingFundsData
    extends GMoveToAdvancedTradingFundsData {
  @override
  final String G__typename;
  @override
  final String? moveToAdvancedTrading;

  factory _$GMoveToAdvancedTradingFundsData(
          [void Function(GMoveToAdvancedTradingFundsDataBuilder)? updates]) =>
      (new GMoveToAdvancedTradingFundsDataBuilder()..update(updates))._build();

  _$GMoveToAdvancedTradingFundsData._(
      {required this.G__typename, this.moveToAdvancedTrading})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GMoveToAdvancedTradingFundsData', 'G__typename');
  }

  @override
  GMoveToAdvancedTradingFundsData rebuild(
          void Function(GMoveToAdvancedTradingFundsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMoveToAdvancedTradingFundsDataBuilder toBuilder() =>
      new GMoveToAdvancedTradingFundsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMoveToAdvancedTradingFundsData &&
        G__typename == other.G__typename &&
        moveToAdvancedTrading == other.moveToAdvancedTrading;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, moveToAdvancedTrading.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GMoveToAdvancedTradingFundsData')
          ..add('G__typename', G__typename)
          ..add('moveToAdvancedTrading', moveToAdvancedTrading))
        .toString();
  }
}

class GMoveToAdvancedTradingFundsDataBuilder
    implements
        Builder<GMoveToAdvancedTradingFundsData,
            GMoveToAdvancedTradingFundsDataBuilder> {
  _$GMoveToAdvancedTradingFundsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _moveToAdvancedTrading;
  String? get moveToAdvancedTrading => _$this._moveToAdvancedTrading;
  set moveToAdvancedTrading(String? moveToAdvancedTrading) =>
      _$this._moveToAdvancedTrading = moveToAdvancedTrading;

  GMoveToAdvancedTradingFundsDataBuilder() {
    GMoveToAdvancedTradingFundsData._initializeBuilder(this);
  }

  GMoveToAdvancedTradingFundsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _moveToAdvancedTrading = $v.moveToAdvancedTrading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMoveToAdvancedTradingFundsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMoveToAdvancedTradingFundsData;
  }

  @override
  void update(void Function(GMoveToAdvancedTradingFundsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMoveToAdvancedTradingFundsData build() => _build();

  _$GMoveToAdvancedTradingFundsData _build() {
    final _$result = _$v ??
        new _$GMoveToAdvancedTradingFundsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GMoveToAdvancedTradingFundsData', 'G__typename'),
            moveToAdvancedTrading: moveToAdvancedTrading);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
