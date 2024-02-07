// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_recipient_request.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateRecipientVars> _$gCreateRecipientVarsSerializer =
    new _$GCreateRecipientVarsSerializer();

class _$GCreateRecipientVarsSerializer
    implements StructuredSerializer<GCreateRecipientVars> {
  @override
  final Iterable<Type> types = const [
    GCreateRecipientVars,
    _$GCreateRecipientVars
  ];
  @override
  final String wireName = 'GCreateRecipientVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateRecipientVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'paymentInterfaceId',
      serializers.serialize(object.paymentInterfaceId,
          specifiedType: const FullType(String)),
      'currencyId',
      serializers.serialize(object.currencyId,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateRecipientVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateRecipientVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'paymentInterfaceId':
          result.paymentInterfaceId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'currencyId':
          result.currencyId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateRecipientVars extends GCreateRecipientVars {
  @override
  final String paymentInterfaceId;
  @override
  final String currencyId;
  @override
  final String data;
  @override
  final String description;

  factory _$GCreateRecipientVars(
          [void Function(GCreateRecipientVarsBuilder)? updates]) =>
      (new GCreateRecipientVarsBuilder()..update(updates))._build();

  _$GCreateRecipientVars._(
      {required this.paymentInterfaceId,
      required this.currencyId,
      required this.data,
      required this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        paymentInterfaceId, r'GCreateRecipientVars', 'paymentInterfaceId');
    BuiltValueNullFieldError.checkNotNull(
        currencyId, r'GCreateRecipientVars', 'currencyId');
    BuiltValueNullFieldError.checkNotNull(
        data, r'GCreateRecipientVars', 'data');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GCreateRecipientVars', 'description');
  }

  @override
  GCreateRecipientVars rebuild(
          void Function(GCreateRecipientVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateRecipientVarsBuilder toBuilder() =>
      new GCreateRecipientVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateRecipientVars &&
        paymentInterfaceId == other.paymentInterfaceId &&
        currencyId == other.currencyId &&
        data == other.data &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, paymentInterfaceId.hashCode);
    _$hash = $jc(_$hash, currencyId.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateRecipientVars')
          ..add('paymentInterfaceId', paymentInterfaceId)
          ..add('currencyId', currencyId)
          ..add('data', data)
          ..add('description', description))
        .toString();
  }
}

class GCreateRecipientVarsBuilder
    implements Builder<GCreateRecipientVars, GCreateRecipientVarsBuilder> {
  _$GCreateRecipientVars? _$v;

  String? _paymentInterfaceId;
  String? get paymentInterfaceId => _$this._paymentInterfaceId;
  set paymentInterfaceId(String? paymentInterfaceId) =>
      _$this._paymentInterfaceId = paymentInterfaceId;

  String? _currencyId;
  String? get currencyId => _$this._currencyId;
  set currencyId(String? currencyId) => _$this._currencyId = currencyId;

  String? _data;
  String? get data => _$this._data;
  set data(String? data) => _$this._data = data;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  GCreateRecipientVarsBuilder();

  GCreateRecipientVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _paymentInterfaceId = $v.paymentInterfaceId;
      _currencyId = $v.currencyId;
      _data = $v.data;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateRecipientVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateRecipientVars;
  }

  @override
  void update(void Function(GCreateRecipientVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateRecipientVars build() => _build();

  _$GCreateRecipientVars _build() {
    final _$result = _$v ??
        new _$GCreateRecipientVars._(
            paymentInterfaceId: BuiltValueNullFieldError.checkNotNull(
                paymentInterfaceId,
                r'GCreateRecipientVars',
                'paymentInterfaceId'),
            currencyId: BuiltValueNullFieldError.checkNotNull(
                currencyId, r'GCreateRecipientVars', 'currencyId'),
            data: BuiltValueNullFieldError.checkNotNull(
                data, r'GCreateRecipientVars', 'data'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'GCreateRecipientVars', 'description'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
