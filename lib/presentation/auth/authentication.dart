import 'package:flutter/material.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/auth/mobile/authentication_mobile.dart';
import 'components/auth_screen_components/authentication_screen.dart';

class Authentication extends StatelessWidget {
  const Authentication({
    this.refCode = '',
    Key? key,
  }) : super(key: key);

  static const routeName = '/authentication';
  final String refCode;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return AuthenticationScreen(
            refCode: refCode,
            platformType: PlatformTypeState.web,
          );
        } else {
          return AuthenticationMobile(
            refCode: refCode,
          );
        }
      },
    );
  }
}
