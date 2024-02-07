// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'send_user_direct_deposit.data.gql.g.dart';

abstract class GsendUserDirectDepositData
    implements
        Built<GsendUserDirectDepositData, GsendUserDirectDepositDataBuilder> {
  GsendUserDirectDepositData._();

  factory GsendUserDirectDepositData(
          [Function(GsendUserDirectDepositDataBuilder b) updates]) =
      _$GsendUserDirectDepositData;

  static void _initializeBuilder(GsendUserDirectDepositDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get userDirectDeposit;
  static Serializer<GsendUserDirectDepositData> get serializer =>
      _$gsendUserDirectDepositDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GsendUserDirectDepositData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GsendUserDirectDepositData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GsendUserDirectDepositData.serializer,
        json,
      );
}
