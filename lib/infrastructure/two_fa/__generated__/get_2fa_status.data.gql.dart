// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'get_2fa_status.data.gql.g.dart';

abstract class GGet2FaStatusData
    implements Built<GGet2FaStatusData, GGet2FaStatusDataBuilder> {
  GGet2FaStatusData._();

  factory GGet2FaStatusData([Function(GGet2FaStatusDataBuilder b) updates]) =
      _$GGet2FaStatusData;

  static void _initializeBuilder(GGet2FaStatusDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GGet2FaStatusData_user? get user;
  static Serializer<GGet2FaStatusData> get serializer =>
      _$gGet2FaStatusDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGet2FaStatusData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGet2FaStatusData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGet2FaStatusData.serializer,
        json,
      );
}

abstract class GGet2FaStatusData_user
    implements Built<GGet2FaStatusData_user, GGet2FaStatusData_userBuilder> {
  GGet2FaStatusData_user._();

  factory GGet2FaStatusData_user(
          [Function(GGet2FaStatusData_userBuilder b) updates]) =
      _$GGet2FaStatusData_user;

  static void _initializeBuilder(GGet2FaStatusData_userBuilder b) =>
      b..G__typename = 'User';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool? get enabled2fa;
  static Serializer<GGet2FaStatusData_user> get serializer =>
      _$gGet2FaStatusDataUserSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGet2FaStatusData_user.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGet2FaStatusData_user? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGet2FaStatusData_user.serializer,
        json,
      );
}
