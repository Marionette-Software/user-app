import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/application/auth/actions/auth_actions.dart';
import 'package:user_app/domain/auth/auth_state.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/request_status.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/navigation_bar/bottom_navigation_index.dart';
import 'package:user_app/presentation/auth/authentication.dart';

class LogOutAction {
  logOut({
    required WidgetRef ref,
    required BuildContext context,
    required ValueNotifier<LoadState> loaderState,
  }) {
    final authController = ref.watch(authControllerStateProvider.notifier);

    AuthActionsGeneral authActions = AuthActionsGeneral();
    authActions.logout().then(
      (response) {
        if (response == RequestStatus.success) {
          loaderState.value = LoadState.notLoading;
          authController.state = AuthState.signIn;

          var box = Hive.box<BottomNavigationIndexData>(
              Constants.bottomNavigationIndex);
          box.putAt(0, BottomNavigationIndexData(selectedIndex: 0));

          context.go(Authentication.routeName);
        } else {
          loaderState.value = LoadState.notLoading;

          final snackBar = SnackBar(
            elevation: 0,
            clipBehavior: Clip.none,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              titleFontSize: 30.sp,
              messageFontSize: 20.sp,
              title: tr('snack_bar_message.errors.error'),
              message: tr('snack_bar_message.errors.something_went_wrong'),
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
