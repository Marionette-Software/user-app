import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/identity_state_provider.dart';
import 'package:user_app/application/kyc/send_document_state_provider.dart';
import 'package:user_app/application/user/actions/profile_action.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/request_status.dart';
import 'package:user_app/domain/general/request_status_with_detail.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/document_verification/document_verification.dart';
import 'package:user_app/presentation/app/profile/mobile/components/kyc/document_verification/document_verification_form.dart';
import 'package:user_app/presentation/constants/colors.dart';

class ProfileVerificationAction {
  profileVerification({
    required WidgetRef ref,
    required GlobalKey<FormState> formKey,
    required BuildContext context,
    required PlatformTypeState platformType,
    required ValueNotifier<LoadState> loaderState,
    required ValueNotifier<bool> validateErrorCountry,
  }) async {
    final identityState = ref.read(identityStateNotifierProvider.notifier);

    final sendProfileInfoRead = ref.read(sendProfileInfoProvider.notifier);
    final identityStateWatch = ref.watch(identityStateNotifierProvider);
    validateErrorCountry.value =
        identityStateWatch.country.isEmpty ? true : false;

    if (formKey.currentState!.validate()) {
      var userBox = Hive.box<UserConfigData>(Constants.userConfig);
      UserConfigData userData = userBox.getAt(0)!;
      identityState.updateToken(userData.token!);

      loaderState.value = LoadState.loading;

      RequestStatusWithDetail response = await ProfileActionsGeneral()
          .identityProfile(identity: identityStateWatch);

      if (response.status == RequestStatus.success) {
        sendProfileInfoRead.state = true;

        loaderState.value = LoadState.notLoading;
        context.pop();

        if (platformType == PlatformTypeState.mobile) {
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DocumentVerificationFormMobile(),
            ),
          );

          ;
        } else {
          // ignore: use_build_context_synchronously
          showDialog(
            barrierColor: AppColors.placeHolderGrey,
            context: context,
            builder: (context) => ModalWindowWallet(
              titleSize: 0,
              title: '',
              content: DocumentVerification(
                platformType: platformType,
              ),
            ),
          );
        }
      } else {
        sendProfileInfoRead.state = false;

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
            message: response.detail,
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    } else {
      int count = 0;
      String message = '';
      if (identityStateWatch.firstName.isEmpty) {
        message += '- "${tr(
          'profile.identity_first_name',
        )}" ${tr('snack_bar_message.errors.should_not_be_empty')}\n';
        count += 1;
      }
      if (identityStateWatch.lastName.isEmpty) {
        message += '- "${tr(
          'profile.identity_last_name',
        )}" ${tr('snack_bar_message.errors.should_not_be_empty')}\n';
        count += 1;
      }

      if (identityStateWatch.dateOfBirth.isEmpty) {
        message += '- "${tr(
          'profile.identity_date_of_birth',
        )}" ${tr('snack_bar_message.errors.should_not_be_empty')}\n';
        count += 1;
      }

      if (identityStateWatch.country.isEmpty) {
        message += '- "${tr(
          'profile.country_of_residence',
        )}" ${tr('snack_bar_message.errors.should_not_be_empty')}\n';
        count += 1;
      }

      if (identityStateWatch.city.isEmpty) {
        message += '- "${tr(
          'profile.identity_city',
        )}" ${tr('snack_bar_message.errors.should_not_be_empty')}\n';
        count += 1;
      }

      if (identityStateWatch.address.isEmpty) {
        message += '- "${tr(
          'profile.identity_residential_address',
        )}" ${tr('snack_bar_message.errors.should_not_be_empty')}\n';
        count += 1;
      }

      if (identityStateWatch.postcode.isEmpty) {
        message += '- "${tr(
          'profile.identity_postcode',
        )}" ${tr('snack_bar_message.errors.should_not_be_empty')}\n';
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
          height: platformType == PlatformTypeState.mobile
              ? 110.h + ((15..h) * count)
              : 110.h + (20.h * count),
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
