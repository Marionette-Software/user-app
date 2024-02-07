// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:user_app/infrastructure/__generated__/serializers.gql.dart'
    as _i1;

part 'sign_up_request.var.gql.g.dart';

abstract class GSignUpVars implements Built<GSignUpVars, GSignUpVarsBuilder> {
  GSignUpVars._();

  factory GSignUpVars([Function(GSignUpVarsBuilder b) updates]) = _$GSignUpVars;

  String get email;
  String get password;
  String? get referralId;
  String? get locale;
  static Serializer<GSignUpVars> get serializer => _$gSignUpVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSignUpVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSignUpVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSignUpVars.serializer,
        json,
      );
}
