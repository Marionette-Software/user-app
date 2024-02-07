import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/choose_code_state.dart';
import 'package:user_app/application/kyc/send_code_state_provider.dart';
import 'package:user_app/application/phone/phone_state_provider.dart';
import 'package:user_app/application/user/actions/profile_action.dart';
import 'package:user_app/domain/general/request_status.dart';
import 'package:user_app/domain/phone/phone_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/profile/profile.dart';

class PhoneVerificationAction {
  phoneVerification({
    required BuildContext context,
    required WidgetRef ref,
    required GlobalKey<FormState> formAddNumberKey,
    required TextEditingController phoneNumberController,
    required TextEditingController codeController,
  }) {
    final phoneState = ref.read(phoneStateProvider.notifier);
    final sendCodeState = ref.read(sendCodeStateProvider.notifier);
    final sendCodeController = ref.watch(sendCodeStateProvider);
    final phoneCodeController = ref.watch(phoneCodeStateProvider);

    if (sendCodeController == false && phoneNumberController.text.length > 9) {
      if (formAddNumberKey.currentState!.validate()) {
        sendCodeState.state = true;
        String phone =
            '+$phoneCodeController${phoneNumberController.value.text.replaceAll(' ', '')}';
        ProfileActionsGeneral service = ProfileActionsGeneral();
        service.addPhone(phone: phone).then(
          (response) {
            if (response.status == RequestStatus.success) {
              phoneState.state = PhoneState.visible;

              final snackBar = SnackBar(
                elevation: 0,
                clipBehavior: Clip.none,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  titleFontSize: 30.sp,
                  messageFontSize: 20.sp,
                  title: tr('snack_bar_message.success.success'),
                  message:
                      '${tr('snack_bar_message.success.verification_code_was_sent_to')} $phone',
                  contentType: ContentType.success,
                ),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
            } else {
              phoneState.state = PhoneState.invisible;

              final snackBar = SnackBar(
                elevation: 0,
                clipBehavior: Clip.none,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  titleFontSize: 30.sp,
                  messageFontSize: 20.sp,
                  title: tr('snack_bar_message.errors.error'),
                  message: response.detail,
                  contentType: ContentType.failure,
                ),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
            }
          },
        );
      }
    } else {
      if (codeController.text.isNotEmpty) {
        String phone =
            '+$phoneCodeController${phoneNumberController.value.text.replaceAll(' ', '')}';
        ProfileActionsGeneral service = ProfileActionsGeneral();
        service
            .verifyPhone(
          phone: phone,
          code: codeController.value.text,
        )
            .then(
          (response) {
            if (response == RequestStatus.success) {
              final snackBar = SnackBar(
                elevation: 0,
                clipBehavior: Clip.none,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  titleFontSize: 30.sp,
                  messageFontSize: 20.sp,
                  title: tr('profile.phone_verification_success'),
                  message: '',
                  contentType: ContentType.success,
                ),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);

              context.go(Profile.routeName, extra: 2);
            } else {
              final snackBar = SnackBar(
                elevation: 0,
                clipBehavior: Clip.none,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  titleFontSize: 30.sp,
                  messageFontSize: 20.sp,
                  title: tr('snack_bar_message.errors.error'),
                  message: tr('snack_bar_message.errors.no_valid_code'),
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
        final snackBar = SnackBar(
          elevation: 0,
          clipBehavior: Clip.none,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            titleFontSize: 30.sp,
            messageFontSize: 20.sp,
            title: tr('snack_bar_message.errors.error'),
            message: tr('snack_bar_message.errors.please_fill_field'),
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    }
  }

  resetCode({
    required BuildContext context,
    required WidgetRef ref,
    required CountdownTimerController countdownTimerController,
    required PlatformTypeState platformType,
    required TextEditingController phoneNumberController,
    required TextEditingController codeController,
    required GlobalKey<FormState> formAddNumberKey,
  }) {
    final phoneState = ref.read(phoneStateProvider.notifier);
    final sendCodeState = ref.read(sendCodeStateProvider.notifier);
    final phoneCodeController = ref.watch(phoneCodeStateProvider);

    countdownTimerController.disposeTimer();
    countdownTimerController.endTime =
        DateTime.now().millisecondsSinceEpoch + 1000 * 5;
    countdownTimerController.start();

    if (formAddNumberKey.currentState!.validate()) {
      sendCodeState.state = true;
      String phone =
          '+$phoneCodeController${phoneNumberController.value.text.replaceAll(' ', '')}';
      ProfileActionsGeneral service = ProfileActionsGeneral();
      service.addPhone(phone: phone).then(
        (response) {
          if (response.status == RequestStatus.success) {
            phoneState.state = PhoneState.visible;

            final snackBar = SnackBar(
              elevation: 0,
              clipBehavior: Clip.none,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                titleFontSize: 30.sp,
                messageFontSize: 20.sp,
                title: tr('snack_bar_message.success.success'),
                message:
                    '${tr('snack_bar_message.success.verification_code_was_sent_to')} $phone',
                contentType: ContentType.success,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          } else {
            phoneState.state = PhoneState.invisible;

            final snackBar = SnackBar(
              elevation: 0,
              clipBehavior: Clip.none,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                titleFontSize: 30.sp,
                messageFontSize: 20.sp,
                title: tr('snack_bar_message.errors.error'),
                message: response.detail,
                contentType: ContentType.failure,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          }
        },
      );
    }
  }
}
