import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:user_app/application/auth/actions/auth_actions.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/auth/google_auth/__generated__/sign_in_with_google.data.gql.dart';
import 'package:user_app/infrastructure/auth/google_auth/__generated__/sign_in_with_google.var.gql.dart';
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class TwoFaForSignInWithGoogleWeb extends HookConsumerWidget {
  const TwoFaForSignInWithGoogleWeb({
    Key? key,
    required this.idToken,
    required this.displayName,
  }) : super(key: key);

  final String idToken;
  final String displayName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controllerPin = TextEditingController();

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 600.w,
        child: Padding(
          padding: EdgeInsets.only(
            left: 50.w,
            right: 50.w,
            top: 35.h,
            bottom: 50.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
                            width: 50.w,
                            height: 44..h,
                            child: SvgPicture.asset(twoFaHeaderIcon),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            '2FA Confirmation'.hardcoded,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: 30.sp,
                                  color: Theme.of(context).primaryColor,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr('Enter 6-digit code using\nGoogle Authenticator'),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 20.sp,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Pinput(
                    focusedPinTheme: PinTheme(
                      width: 50.w,
                      height: 50.h,
                      textStyle:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w600,
                              ),
                      constraints:
                          BoxConstraints(minWidth: 50.w, minHeight: 50.h),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 2.w,
                            color: MainColorsApp.accentColor,
                          ),
                        ),
                      ),
                    ),
                    controller: controllerPin,
                    textInputAction: TextInputAction.send,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    onChanged: (String value) {},
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: const TextInputType.numberWithOptions(),
                    length: 6,
                    defaultPinTheme: PinTheme(
                      width: 50.w,
                      height: 50.h,
                      textStyle:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w600,
                              ),
                      constraints:
                          BoxConstraints(minWidth: 50.w, minHeight: 50.h),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 2.w,
                            color: isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : AppColors.whiteColor.withOpacity(0.25),
                          ),
                        ),
                      ),
                    ),
                    showCursor: true,
                    autofocus: true,
                    onCompleted: (String value) async {
                      if (value.length == (6)) {
                        var resWithGoogle = await AuthActionsGeneral()
                            .signInWithGoogle(token: idToken, code: value);

                        var box =
                            Hive.box<GlobalConfigData>(Constants.globalConfig);
                        var uBox =
                            Hive.box<UserConfigData>(Constants.userConfig);

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
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () async {
                        final clipboardData =
                            await Clipboard.getData(Clipboard.kTextPlain);
                        controllerPin.text = clipboardData!.text!.length == 6
                            ? clipboardData.text!
                            : '';
                      },
                      child: Container(
                        width: 92.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21.r),
                          color: MainColorsApp.accentColor,
                        ),
                        child: Center(
                          child: Text(
                            'Paste',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.whiteColor,
                                  fontSize: 20.sp,
                                  letterSpacing: -1.sp,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
