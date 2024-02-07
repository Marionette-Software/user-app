import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/two_fa/two_fa_state_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/two_fa/two_fa_service.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/settings_tab/components/change_password.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/settings_tab/components/two_fa/disable_two_fa.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/settings_tab/components/two_fa/enable_two_fa.dart';
import 'package:user_app/presentation/components/main_show_modal_bottom_sheet.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:webviewx/webviewx.dart';

class ShowProfileModalAction {
  showTwoFaModal({
    required BuildContext context,
    required WidgetRef ref,
    required PlatformTypeState platformType,
  }) async {
    final twoFAWatch = ref.watch(twoFaProvider);

    await TwoFaService().getTwoFaDetails().then(
      (response) {
        twoFAWatch == false
            ? (platformType == PlatformTypeState.mobile)
                ? mainShowModalBottomSheet(
                    context: context,
                    longShowModalBottom: false,
                    content: Container(
                      color: Colors.transparent,
                      child: EnableTwoFa(
                        platformType: platformType,
                        res: response,
                      ),
                    ),
                  )
                : showDialog(
                    barrierColor: AppColors.placeHolderGrey,
                    context: context,
                    builder: (context) => WebViewAware(
                      child: ModalWindowWallet(
                        titleSize: 30,
                        title: '',
                        content: EnableTwoFa(
                          res: response,
                          platformType: platformType,
                        ),
                      ),
                    ),
                  )
            : (platformType == PlatformTypeState.mobile)
                ? mainShowModalBottomSheet(
                    context: context,
                    longShowModalBottom: false,
                    content: Container(
                      color: Colors.transparent,
                      child: DisableTwoFa(
                        platformType: platformType,
                      ),
                    ),
                  )
                : showDialog(
                    barrierColor: AppColors.placeHolderGrey,
                    context: context,
                    builder: (context) => WebViewAware(
                      child: ModalWindowWallet(
                        title: '',
                        titleSize: 30,
                        content: DisableTwoFa(
                          platformType: platformType,
                        ),
                      ),
                    ),
                  );
      },
    );
  }

  showChangePasswordModal({
    required BuildContext context,
    required PlatformTypeState platformType,
  }) {
    if (platformType == PlatformTypeState.mobile) {
      mainShowModalBottomSheet(
        context: context,
        longShowModalBottom: false,
        content: ChangePasswordForm(
          platformType: platformType,
        ),
      );
    } else {
      showDialog(
        barrierColor: AppColors.placeHolderGrey,
        context: context,
        builder: (context) => WebViewAware(
          child: ModalWindowWallet(
            titleSize: 30,
            title: '',
            content: ChangePasswordForm(
              platformType: platformType,
            ),
          ),
        ),
      );
    }
  }
}
