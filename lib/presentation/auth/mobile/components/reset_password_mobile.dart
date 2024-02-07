import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/domain/auth/auth_state.dart';

class ResetPasswordMobile extends HookConsumerWidget {
  const ResetPasswordMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authMobileControllerStateProvider.notifier);
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        child: Text(
          '${tr('authorization.forgot_password')}?',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColorLight,
                letterSpacing: -1.sp,
                fontSize: getSizeFromPlatformType(
                  platformType: PlatformTypeState.mobile,
                  webValue: 20,
                  tabletValue: 18,
                  mobileValue: 15,
                ).sp,
              ),
        ),
        onTap: () {
          authController.state = AuthState.forgotPassword;
        },
      ),
    );
  }
}
