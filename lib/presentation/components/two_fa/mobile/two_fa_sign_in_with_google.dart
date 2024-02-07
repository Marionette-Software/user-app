import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ferry/typed_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/actions/auth_actions.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/auth/google_auth/__generated__/sign_in_with_google.data.gql.dart';
import 'package:user_app/infrastructure/auth/google_auth/__generated__/sign_in_with_google.var.gql.dart';
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/custom_pin_code_field.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class TwoFaForSignInWithGoogleMobile extends HookConsumerWidget {
  const TwoFaForSignInWithGoogleMobile({
    Key? key,
    required this.idToken,
    required this.displayName,
  }) : super(key: key);

  final String idToken;
  final String displayName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controllerPin = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainBackgroundDarkColor,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50..h),
          child: Padding(
            padding: EdgeInsets.only(
              top: 15..h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: BackButtonMobile(
                    onTap: () => context.pop(),
                  ),
                ),
                Text(
                  '2FA',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                        letterSpacing: -0.75.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: 70.w,
                  height: 25..h,
                )
              ],
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 10..h,
          ),
          decoration: BoxDecoration(
            color: isLightTheme(context)
                ? AppColors.whiteColor
                : walletBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 20..h, left: 15.w, right: 15.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 34.w,
                              height: 30..h,
                              child: SvgPicture.asset(twoFaHeaderIcon),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Confirmation'.hardcoded,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                                letterSpacing: -1.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20..h,
                ),
                Text(
                  'Enter 6-digit code using\nGoogle Authenticator',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: isLightTheme(context)
                            ? AppColors.aboutHeaderLight
                            : AppColors.whiteColor.withOpacity(0.5),
                        fontSize: 15.sp,
                      ),
                ),
                SizedBox(
                  height: 20..h,
                ),
                CustomPinCodeField(
                  pinCodeLength: 6,
                  controllerPin: controllerPin,
                  platformType: PlatformTypeState.mobile,
                  onCompleted: (String value) async {
                    if (value.length == (6)) {
                      var resWithGoogle = await AuthActionsGeneral()
                          .signInWithGoogle(token: idToken, code: value);

                      var box =
                          Hive.box<GlobalConfigData>(Constants.globalConfig);
                      var uBox = Hive.box<UserConfigData>(Constants.userConfig);

                      GlobalConfigData globalData = box.getAt(0)!;

                      if (resWithGoogle is OperationResponse<
                          GSignUpWithGoogleData, GSignUpWithGoogleVars>) {
                        GlobalConfigData globalConfig = GlobalConfigData(
                          url: globalData.url,
                          enabledTradingPage: globalData.enabledTradingPage,
                          termsAndConditionsUrl:
                              globalData.termsAndConditionsUrl,
                          enabledNonCustodialWalletConnect:
                              globalData.enabledNonCustodialWalletConnect,
                          enabledNonCustodialExchangePage:
                              globalData.enabledNonCustodialExchangePage,
                          withTradingBalance: globalData.withTradingBalance,
                          enabledBuySell: globalData.enabledBuySell,
                          googleAuthClientId: globalData.googleAuthClientId,
                          enabledStaking: globalData.enabledStaking,
                          enabledPhoneVerificationStep:
                              globalData.enabledPhoneVerificationStep,
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
                          userName: displayName,
                        );

                        box.putAt(0, globalConfig);
                        uBox.putAt(0, userConfig);
                        // ignore: use_build_context_synchronously

                        context.go(Wallets.routeName);
                      } else if (resWithGoogle is GraphQlError) {
                        final snackBar = SnackBar(
                          elevation: 0,
                          clipBehavior: Clip.none,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            titleFontSize: 30.sp,
                            messageFontSize: 20.sp,
                            title: tr('snack_bar_message.errors.error'),
                            message: resWithGoogle.message,
                            contentType: ContentType.failure,
                          ),
                        );

                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20..h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () async {
                      final clipboardData =
                          await Clipboard.getData(Clipboard.kTextPlain);
                      controllerPin.text = clipboardData!.text!.length == 6
                          ? clipboardData.text!
                          : '';
                    },
                    child: Container(
                      width: 70.w,
                      height: 25..h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.r),
                        color: MainColorsApp.accentColor,
                      ),
                      child: Center(
                        child: Text(
                          'Paste',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.whiteColor,
                                    fontSize: 13.sp,
                                    letterSpacing: -0.65.sp,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
