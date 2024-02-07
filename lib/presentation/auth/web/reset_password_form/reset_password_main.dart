import 'package:flutter/material.dart';
import 'package:user_app/presentation/auth/mobile/authentication_mobile.dart';
import 'package:user_app/presentation/auth/web/reset_password_form/reset_password.dart';

class ResetPasswordMain extends StatelessWidget {
  const ResetPasswordMain({
    required this.resetToken,
    Key? key,
  }) : super(key: key);
  final String resetToken;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return ResetPasswordWeb(
            resetToken: resetToken,
          );
        } else {
          return AuthenticationMobile(
            resetToken: resetToken,
            isResetPassword: true,
          );
        }
      },
    );
  }
}
