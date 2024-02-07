import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/application/user/actions/profile_action.dart';
import 'package:user_app/domain/general/request_status.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/domain/auth/auth_state.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/auth/authentication.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/validate_password.dart';

class ChangePasswordAction {
  changePassword({
    required BuildContext context,
    required WidgetRef ref,
    required PlatformTypeState platformType,
    required GlobalKey<FormState> formKey,
    required ValueNotifier<LoadState> loaderState,
    required ValueNotifier<bool> errorOldPassword,
    required TextEditingController oldPasswordController,
    required TextEditingController newPasswordController,
    required TextEditingController newPasswordConfirmController,
  }) async {
    final authControllerRead = ref.read(authControllerStateProvider.notifier);

    if (formKey.currentState!.validate()) {
      loaderState.value = LoadState.loading;
      ProfileActionsGeneral service = ProfileActionsGeneral();
      await service
          .changePassword(
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
      )
          .then(
        (response) {
          if (response.status == RequestStatus.success) {
            loaderState.value = LoadState.notLoading;
            errorOldPassword.value = false;

            final snackBar = SnackBar(
              elevation: 0,
              padding: EdgeInsets.only(
                bottom:
                    // ignore: use_build_context_synchronously
                    MediaQuery.viewInsetsOf(context).bottom + 30
                      ..h,
              ),
              behavior: SnackBarBehavior.floating,
              clipBehavior: Clip.none,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                titleFontSize:
                    platformType == PlatformTypeState.mobile ? 20.sp : 30.sp,
                messageFontSize:
                    platformType == PlatformTypeState.mobile ? 15.sp : 20.sp,
                title: tr('snack_bar_message.success.success'),
                message: tr(
                    'snack_bar_message.success.password_changed_successfully'),
                contentType: ContentType.success,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);

            context.pop();
            context.go(Authentication.routeName);

            authControllerRead.state = AuthState.signIn;
          } else {
            loaderState.value = LoadState.notLoading;
            errorOldPassword.value = true;

            final snackBar = SnackBar(
              elevation: 0,
              padding: EdgeInsets.only(
                bottom:
                    // ignore: use_build_context_synchronously
                    MediaQuery.viewInsetsOf(context).bottom + 30
                      ..h,
              ),
              behavior: SnackBarBehavior.floating,
              clipBehavior: Clip.none,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                titleFontSize:
                    platformType == PlatformTypeState.mobile ? 20.sp : 30.sp,
                messageFontSize:
                    platformType == PlatformTypeState.mobile ? 15.sp : 20.sp,
                title: tr('snack_bar_message.errors.error'),
                message: tr('snack_bar_message.errors.incorrect_old_password'),
                contentType: ContentType.failure,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          }
        },
      );
    } else {
      int count = 0;
      String message = '';
      if (oldPasswordController.text.isEmpty) {
        message +=
            '- ${tr('snack_bar_message.errors.old_password_should_not_be_empty')}\n';
        count += 1;
      }
      if (newPasswordController.text.isEmpty) {
        message +=
            '- ${tr('snack_bar_message.errors.new_password_should_not_be_empty')}\n';
        count += 1;
      }
      if (isPasswordValid(password: newPasswordConfirmController.text)) {
        message += tr('snack_bar_message.errors.password_validate_params');
        count += 6;
      }
      if (newPasswordConfirmController.text.isEmpty) {
        message += '- ${tr('snack_bar_message.errors.password_not_match')}\n';
        count += 1;
      } else if (newPasswordController.text !=
          newPasswordConfirmController.text) {
        message += '- ${tr('snack_bar_message.errors.password_not_match')}\n';
        count += 1;
      }

      final snackBar = SnackBar(
        elevation: 0,
        padding: EdgeInsets.only(
          bottom:
              // ignore: use_build_context_synchronously
              MediaQuery.viewInsetsOf(context).bottom + 30
                ..h,
        ),
        behavior: SnackBarBehavior.floating,
        clipBehavior: Clip.none,
        backgroundColor: Colors.transparent,
        content: SizedBox(
          height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 110.h,
                tabletValue: 60,
                mobileValue: 50..h,
              ) +
              (20.h * count),
          child: AwesomeSnackbarContent(
            titleFontSize:
                platformType == PlatformTypeState.mobile ? 20.sp : 30.sp,
            messageFontSize:
                platformType == PlatformTypeState.mobile ? 15.sp : 20.sp,
            title: tr('snack_bar_message.errors.input_error'),
            message: message,
            contentType: ContentType.failure,
          ),
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }
}
