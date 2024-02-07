import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/two_fa/two_fa_state_provider.dart';
import 'package:user_app/application/user/actions/profile_action.dart';
import 'package:user_app/domain/general/request_status.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';

class TwoFaAction {
  disableTwoFa({
    required String value,
    required BuildContext context,
    required WidgetRef ref,
    required PlatformTypeState platformType,
  }) async {
    final twoFAyState = ref.read(twoFaProvider.notifier);

    if (value.length == 6) {
      ProfileActionsInterface service = ProfileActionsGeneral();
      await service.twoFAEnable(pin: value).then(
        (result) {
          if (result == RequestStatus.success) {
            twoFAyState.state = false;

            context.pop();

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
                    'snack_bar_message.success.2fa_is_successfully_disabled'),
                contentType: ContentType.success,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          } else {
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
                message: tr('snack_bar_message.errors.code_is_wrong'),
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

  enableTwoFa({
    required String value,
    required BuildContext context,
    required WidgetRef ref,
    required PlatformTypeState platformType,
  }) async {
    final twoFAyState = ref.read(twoFaProvider.notifier);

    if (value.length == (6)) {
      ProfileActionsInterface service = ProfileActionsGeneral();
      await service.twoFAEnable(pin: value).then(
        (result) {
          if (result == RequestStatus.success) {
            twoFAyState.state = true;

            context.pop();

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
                message:
                    tr('snack_bar_message.success.2fa_successfully_enabled'),
                contentType: ContentType.success,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          } else {
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
                message: tr('snack_bar_message.errors.code_is_wrong'),
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
