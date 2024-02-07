// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'recovery_password_request.data.gql.g.dart';

abstract class GRecoveryPasswordData
    implements Built<GRecoveryPasswordData, GRecoveryPasswordDataBuilder> {
  GRecoveryPasswordData._();

  factory GRecoveryPasswordData(
          [Function(GRecoveryPasswordDataBuilder b) updates]) =
      _$GRecoveryPasswordData;

  static void _initializeBuilder(GRecoveryPasswordDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get recoveryPassword;
  static Serializer<GRecoveryPasswordData> get serializer =>
      _$gRecoveryPasswordDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRecoveryPasswordData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRecoveryPasswordData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRecoveryPasswordData.serializer,
        json,
      );
}
