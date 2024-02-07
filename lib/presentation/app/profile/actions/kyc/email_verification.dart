import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/application/user/actions/profile_action.dart';
import 'package:user_app/domain/general/request_status.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';

class EmailVerificationAction {
  emailVerification(
      {required BuildContext context,
      required String email,
      required PlatformTypeState platformType}) async {
    ProfileActionsInterface service = ProfileActionsGeneral();

    await service.verifyEmail(email: email).then(
      (response) {
        if (response == RequestStatus.success) {
          final snackBar = SnackBar(
            elevation: 0,
            clipBehavior: Clip.none,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              titleFontSize:
                  platformType == PlatformTypeState.mobile ? 20.sp : 30.sp,
              messageFontSize:
                  platformType == PlatformTypeState.mobile ? 15.sp : 20.sp,
              title: tr('snack_bar_message.success.success'),
              message:
                  '${tr('snack_bar_message.success.email_was_sent_to_address')} $email',
              contentType: ContentType.success,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        } else {
          final snackBar = SnackBar(
            elevation: 0,
            clipBehavior: Clip.none,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              titleFontSize:
                  platformType == PlatformTypeState.mobile ? 20.sp : 30.sp,
              messageFontSize:
                  platformType == PlatformTypeState.mobile ? 15.sp : 20.sp,
              title: tr('snack_bar_message.errors.error'),
              message:
                  '${tr('snack_bar_message.errors.email_was_not_sent_to_address')} $email',
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
