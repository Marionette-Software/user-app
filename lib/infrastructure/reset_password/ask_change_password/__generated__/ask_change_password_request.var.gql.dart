// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'ask_change_password_request.var.gql.g.dart';

abstract class GAskChangePasswordVars
    implements Built<GAskChangePasswordVars, GAskChangePasswordVarsBuilder> {
  GAskChangePasswordVars._();

  factory GAskChangePasswordVars(
          [Function(GAskChangePasswordVarsBuilder b) updates]) =
      _$GAskChangePasswordVars;

  String get email;
  static Serializer<GAskChangePasswordVars> get serializer =>
      _$gAskChangePasswordVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAskChangePasswordVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAskChangePasswordVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAskChangePasswordVars.serializer,
        json,
      );
}
