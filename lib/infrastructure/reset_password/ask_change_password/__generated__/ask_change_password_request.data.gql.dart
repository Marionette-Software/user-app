// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'ask_change_password_request.data.gql.g.dart';

abstract class GAskChangePasswordData
    implements Built<GAskChangePasswordData, GAskChangePasswordDataBuilder> {
  GAskChangePasswordData._();

  factory GAskChangePasswordData(
          [Function(GAskChangePasswordDataBuilder b) updates]) =
      _$GAskChangePasswordData;

  static void _initializeBuilder(GAskChangePasswordDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String? get askChangePassword;
  static Serializer<GAskChangePasswordData> get serializer =>
      _$gAskChangePasswordDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAskChangePasswordData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAskChangePasswordData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAskChangePasswordData.serializer,
        json,
      );
}
