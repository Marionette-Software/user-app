// ignore_for_file: use_build_context_synchronously
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_notifier.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/auth/auth_service.dart';
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/custom_pin_code_field.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class TwoFaForSignInMobile extends StatefulHookConsumerWidget {
  const TwoFaForSignInMobile({
    super.key,
    required this.email,
    required this.password,
    required this.saveRememberMeStatus,
    this.loginWithNonCustodialPage = false,
  });

  final String email;
  final String password;
  final bool loginWithNonCustodialPage;
  final Function() saveRememberMeStatus;

  @override
  ConsumerState<TwoFaForSignInMobile> createState() =>
      _TwoFaForSignInMobileState();
}

class _TwoFaForSignInMobileState extends ConsumerState<TwoFaForSignInMobile> {
  final TextEditingController controllerPin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    IAuthService service = AuthService();

    final loaderState = useState(LoadState.notLoading);

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
                      final response = await service.login(
                        email: widget.email,
                        password: widget.password,
                        code: value,
                      );
                      if (response != null) {
                        if (response is GraphQlError) {
                          context.pop();
                          final snackBar = SnackBar(
                            elevation: 0,
                            padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.viewInsetsOf(context).bottom + 30
                                    ..h,
                            ),
                            behavior: SnackBarBehavior.floating,
                            clipBehavior: Clip.none,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              titleFontSize: 20.sp,
                              messageFontSize: 15.sp,
                              title: tr('snack_bar_message.errors.error'),
                              message: response.message,
                              contentType: ContentType.failure,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        } else {
                          var uBox =
                              Hive.box<UserConfigData>(Constants.userConfig);
                          var uData = UserConfigData(
                            token: response.data!.login!.token,
                            userId: response.data!.login!.id,
                            userName:
                                response.data!.login!.profiles!.length == 0
                                    ? 'User'
                                    : response.data!.login!.profiles!.first
                                            .first_name! +
                                        ' ' +
                                        response.data!.login!.profiles!.first
                                            .last_name!,
                          );
                          uBox.putAt(0, uData);
                          loaderState.value = LoadState.notLoading;

                          if (widget.loginWithNonCustodialPage) {
                            final progressState =
                                ref.read(nonCustodialStateProvider.notifier);

                            if (ref
                                    .watch(
                                        nonCustodialCurrenciesStateNotifierProvider)
                                    .wcAddress !=
                                '') {
                              progressState.state =
                                  NonCustodialState.walletConnected;
                            } else {
                              progressState.state = NonCustodialState.receive;
                            }
                            ref
                                .read(
                                    nonCustodialProgressStateProvider.notifier)
                                .state++;
                          }

                          widget.saveRememberMeStatus();

                          context.go(Wallets.routeName);
                        }
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
