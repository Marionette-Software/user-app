// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_recipient.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateNonCustodialRecipientVars>
    _$gCreateNonCustodialRecipientVarsSerializer =
    new _$GCreateNonCustodialRecipientVarsSerializer();

class _$GCreateNonCustodialRecipientVarsSerializer
    implements StructuredSerializer<GCreateNonCustodialRecipientVars> {
  @override
  final Iterable<Type> types = const [
    GCreateNonCustodialRecipientVars,
    _$GCreateNonCustodialRecipientVars
  ];
  @override
  final String wireName = 'GCreateNonCustodialRecipientVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateNonCustodialRecipientVars object,
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
  GCreateNonCustodialRecipientVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateNonCustodialRecipientVarsBuilder();

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

class _$GCreateNonCustodialRecipientVars
    extends GCreateNonCustodialRecipientVars {
  @override
  final String paymentInterfaceId;
  @override
  final String currencyId;
  @override
  final String data;
  @override
  final String description;

  factory _$GCreateNonCustodialRecipientVars(
          [void Function(GCreateNonCustodialRecipientVarsBuilder)? updates]) =>
      (new GCreateNonCustodialRecipientVarsBuilder()..update(updates))._build();

  _$GCreateNonCustodialRecipientVars._(
      {required this.paymentInterfaceId,
      required this.currencyId,
      required this.data,
      required this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(paymentInterfaceId,
        r'GCreateNonCustodialRecipientVars', 'paymentInterfaceId');
    BuiltValueNullFieldError.checkNotNull(
        currencyId, r'GCreateNonCustodialRecipientVars', 'currencyId');
    BuiltValueNullFieldError.checkNotNull(
        data, r'GCreateNonCustodialRecipientVars', 'data');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GCreateNonCustodialRecipientVars', 'description');
  }

  @override
  GCreateNonCustodialRecipientVars rebuild(
          void Function(GCreateNonCustodialRecipientVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateNonCustodialRecipientVarsBuilder toBuilder() =>
      new GCreateNonCustodialRecipientVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateNonCustodialRecipientVars &&
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
    return (newBuiltValueToStringHelper(r'GCreateNonCustodialRecipientVars')
          ..add('paymentInterfaceId', paymentInterfaceId)
          ..add('currencyId', currencyId)
          ..add('data', data)
          ..add('description', description))
        .toString();
  }
}

class GCreateNonCustodialRecipientVarsBuilder
    implements
        Builder<GCreateNonCustodialRecipientVars,
            GCreateNonCustodialRecipientVarsBuilder> {
  _$GCreateNonCustodialRecipientVars? _$v;

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

  GCreateNonCustodialRecipientVarsBuilder();

  GCreateNonCustodialRecipientVarsBuilder get _$this {
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
  void replace(GCreateNonCustodialRecipientVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateNonCustodialRecipientVars;
  }

  @override
  void update(void Function(GCreateNonCustodialRecipientVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateNonCustodialRecipientVars build() => _build();

  _$GCreateNonCustodialRecipientVars _build() {
    final _$result = _$v ??
        new _$GCreateNonCustodialRecipientVars._(
            paymentInterfaceId: BuiltValueNullFieldError.checkNotNull(
                paymentInterfaceId,
                r'GCreateNonCustodialRecipientVars',
                'paymentInterfaceId'),
            currencyId: BuiltValueNullFieldError.checkNotNull(
                currencyId, r'GCreateNonCustodialRecipientVars', 'currencyId'),
            data: BuiltValueNullFieldError.checkNotNull(
                data, r'GCreateNonCustodialRecipientVars', 'data'),
            description: BuiltValueNullFieldError.checkNotNull(description,
                r'GCreateNonCustodialRecipientVars', 'description'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
