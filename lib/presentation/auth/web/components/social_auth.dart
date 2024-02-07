// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ferry/typed_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/actions/auth_actions.dart';
import 'package:user_app/domain/auth/auth_status.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/auth/google_auth/__generated__/sign_in_with_google.data.gql.dart';
import 'package:user_app/infrastructure/auth/google_auth/__generated__/sign_in_with_google.var.gql.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/auth/components/google_auth.dart';
import 'package:user_app/presentation/auth/mobile/components/captcha_mobile.dart';
import 'package:user_app/presentation/auth/web/components/captcha.dart';
import 'package:user_app/presentation/auth/web/components/two_fa_for_sign_in_with_google.dart';
import 'package:user_app/presentation/components/main_show_modal_bottom_sheet.dart';
import 'package:user_app/presentation/components/two_fa/mobile/two_fa_sign_in_with_google.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SocialAuthWeb extends HookConsumerWidget {
  const SocialAuthWeb({
    super.key,
    required this.platformType,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loaderState = useState(LoadState.notLoading);

    return loaderState.value == LoadState.loading
        ? const CircularProgressIndicator()
        : InkWell(
            borderRadius: BorderRadius.circular(
              getSizeFromPlatformType(
                platformType: platformType,
                webValue: 10,
                tabletValue: 10,
                mobileValue: 10,
              ).r,
            ),
            child: Container(
              width: double.infinity,
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 60.h,
                tabletValue: 45,
                mobileValue: 45..h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 10,
                    tabletValue: 10,
                    mobileValue: 10,
                  ).r,
                ),
                border: Border.all(
                  width: 1.5.w,
                  color: isLightTheme(context)
                      ? Theme.of(context).primaryColor.withOpacity(0.25)
                      : Theme.of(context).primaryColor.withOpacity(0.25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 18,
                      tabletValue: 20,
                      mobileValue: 15,
                    ).w,
                    height: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 18,
                      tabletValue: 20,
                      mobileValue: 15,
                    ).h,
                    child: SvgPicture.asset(
                      googleLogoPath,
                    ),
                  ),
                  SizedBox(
                    width: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 10,
                      tabletValue: 15,
                      mobileValue: 10,
                    ).w,
                  ),
                  Text(
                    tr('authorization.log_in_google'),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1.sp,
                          fontStyle: FontStyle.normal,
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 20,
                            tabletValue: 15,
                            mobileValue: 15,
                          ).sp,
                        ),
                  ),
                ],
              ),
            ),
            onTap: () async {
              loaderState.value = LoadState.loading;
              var box = Hive.box<GlobalConfigData>(Constants.globalConfig);

              GlobalConfigData globalData = box.getAt(0)!;

              if (globalData.googleAuthClientId.isNotEmpty) {
                var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
                GlobalConfigData globalData = box.getAt(0)!;

                if (globalData.enabledLoginCaptcha) {
                  bool? result = platformType == PlatformTypeState.web
                      ? await showDialog<bool>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return const CaptchaDialogWeb();
                          },
                        )
                      : await mainShowModalBottomSheet(
                          context: context,
                          longShowModalBottom: false,
                          content: Container(
                            color: Colors.transparent,
                            child: const CaptchaDialogMobile(),
                          ),
                        );

                  if (result == null || !result) {
                    loaderState.value = LoadState.notLoading;
                    final snackBar = SnackBar(
                      elevation: 0,
                      clipBehavior: Clip.none,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        titleFontSize: platformType == PlatformTypeState.mobile
                            ? 20.sp
                            : 30.sp,
                        messageFontSize:
                            platformType == PlatformTypeState.mobile
                                ? 15.sp
                                : 20.sp,
                        title:
                            tr('snack_bar_message.errors.authentication_error'),
                        message: 'Fail. Please try again'.hardcoded,
                        contentType: ContentType.failure,
                      ),
                    );

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);

                    if (context.mounted) {}
                    return;
                  }
                }
                var res = await googleLogin(globalData.googleAuthClientId);

                AuthorizationStatus data = await _handleLoginGoogle(
                  context: context,
                  res: res,
                );
                if (res is GoogleAuthModel) {
                  if (data == AuthorizationStatus.success) {
                    context.go(Wallets.routeName);
                  } else if (data == AuthorizationStatus.twoFa) {
                    platformType == PlatformTypeState.mobile
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TwoFaForSignInWithGoogleMobile(
                                displayName: res.displayName,
                                idToken: res.idToken,
                              ),
                            ),
                          )
                        : showDialog(
                            barrierColor: AppColors.placeHolderGrey,
                            context: context,
                            builder: (context) {
                              return ModalWindowWallet(
                                titleSize: 30,
                                shapeRadius: 10.0.r,
                                alertDialogSide: false,
                                title: '',
                                content: TwoFaForSignInWithGoogleWeb(
                                  idToken: res.idToken,
                                  displayName: res.displayName,
                                ),
                              );
                            },
                          );
                  }
                } else {
                  final snackBar = SnackBar(
                    elevation: 0,
                    clipBehavior: Clip.none,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      titleFontSize: platformType == PlatformTypeState.mobile
                          ? 20.sp
                          : 30.sp,
                      messageFontSize: platformType == PlatformTypeState.mobile
                          ? 15.sp
                          : 20.sp,
                      title:
                          tr('snack_bar_message.errors.authentication_error'),
                      message: 'Google auth does not work',
                      contentType: ContentType.failure,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                }
              }
              loaderState.value = LoadState.notLoading;
            },
          );
  }

  Future<AuthorizationStatus> _handleLoginGoogle({
    required BuildContext context,
    required dynamic res,
  }) async {
    if (res is GoogleAuthModel) {
      var resWithGoogle = await AuthActionsGeneral().signInWithGoogle(
        token: res.idToken,
      );
      var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
      var uBox = Hive.box<UserConfigData>(Constants.userConfig);

      GlobalConfigData globalData = box.getAt(0)!;
      if (resWithGoogle
          is OperationResponse<GSignUpWithGoogleData, GSignUpWithGoogleVars>) {
        GlobalConfigData globalConfig = GlobalConfigData(
          url: globalData.url,
          enabledTradingPage: globalData.enabledTradingPage,
          termsAndConditionsUrl: globalData.termsAndConditionsUrl,
          enabledNonCustodialWalletConnect:
              globalData.enabledNonCustodialWalletConnect,
          enabledNonCustodialExchangePage:
              globalData.enabledNonCustodialExchangePage,
          withTradingBalance: globalData.withTradingBalance,
          enabledBuySell: globalData.enabledBuySell,
          googleAuthClientId: globalData.googleAuthClientId,
          enabledStaking: globalData.enabledStaking,
          enabledPhoneVerificationStep: globalData.enabledPhoneVerificationStep,
          enabledReferrals: globalData.enabledReferrals,
          enabledLoginCaptcha: globalData.enabledLoginCaptcha,
          orderBookMiddle: globalData.orderBookMiddle,
          enabledSpread: globalData.enabledSpread,
          withInstantBuy: globalData.withInstantBuy,
          withInstantSell: globalData.withInstantSell,
          enabledSellWithdrawZeroBalance:
              globalData.enabledSellWithdrawZeroBalance,
        );
        UserConfigData userConfig = UserConfigData(
          token: resWithGoogle.data!.signWithGoogle!.token,
          userId: resWithGoogle.data!.signWithGoogle!.id,
          userName: res.displayName,
        );

        box.putAt(0, globalConfig);
        uBox.putAt(0, userConfig);
        return AuthorizationStatus.success;
      } else if (resWithGoogle is GraphQlError) {
        if (resWithGoogle.message == '2FA code is wrong or disabled') {
          return AuthorizationStatus.twoFa;
        } else {
          return AuthorizationStatus.error;
        }
      }
    }
    return AuthorizationStatus.error;
  }
}
