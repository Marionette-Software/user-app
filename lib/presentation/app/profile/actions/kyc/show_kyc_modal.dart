import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/send_code_state_provider.dart';
import 'package:user_app/application/kyc/send_document_state_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/user_get_request.data.gql.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/document_verification/document_verification.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/phone_verification/phone_verification.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/profile_verification/profile_verification.dart';
import 'package:user_app/presentation/components/main_show_modal_bottom_sheet.dart';
import 'package:user_app/presentation/constants/colors.dart';

class ShowKYCModalAction {
  showPhoneVerificationModal({
    required BuildContext context,
    required PlatformTypeState platformType,
    required WidgetRef ref,
  }) {
    final sendCodeState = ref.read(sendCodeStateProvider.notifier);
    final sendCodeController = ref.read(sendCodeStateProvider);

    if (platformType == PlatformTypeState.mobile) {
      mainShowModalBottomSheet(
        context: context,
        longShowModalBottom: false,
        content: Container(
          height: sendCodeController == true
              ? (320.0 + MediaQuery.of(context).viewInsets.bottom).h
              : (300.0 + MediaQuery.of(context).viewInsets.bottom) .h,
          color: Colors.transparent,
          child: PhoneVerification(
            platformType: platformType,
          ),
        ),
      ).then(
        (value) => {sendCodeState.state = false},
      );
    } else {
      showDialog(
        barrierColor: AppColors.placeHolderGrey,
        context: context,
        builder: (context) => ModalWindowWallet(
          titleSize: 0,
          title: '',
          content: PhoneVerification(
            platformType: platformType,
          ),
        ),
      ).then(
        (value) => {sendCodeState.state = false},
      );
    }
  }

  showIdentityVerificationModal({
    required BuildContext context,
    required WidgetRef ref,
    required PlatformTypeState platformType,
    required GGetUpdateUserData_user user,
  }) {
    final sendProfileInfoWatch = ref.watch(sendProfileInfoProvider.notifier);

    if (platformType == PlatformTypeState.mobile) {
      mainShowModalBottomSheet(
        context: context,
        longShowModalBottom: true,
        content: Container(
          color: Colors.transparent,
          child: user.profiles!.isEmpty && !sendProfileInfoWatch.state
              ? ProfileVerification(
                  platformType: platformType,
                )
              : DocumentVerification(
                  platformType: platformType,
                ),
        ),
      );
    } else {
      showDialog(
        barrierColor: AppColors.placeHolderGrey,
        context: context,
        builder: (context) => ModalWindowWallet(
          titleSize: 0,
          title: '',
          content: user.profiles!.isEmpty && !sendProfileInfoWatch.state
              ? ProfileVerification(
                  platformType: platformType,
                )
              : DocumentVerification(
                  platformType: platformType,
                ),
        ),
      );
    }
  }
}
