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
import 'package:pinput/pinput.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_notifier.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/auth/auth_service.dart';
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class TwoFaForSignInWeb extends HookConsumerWidget {
  const TwoFaForSignInWeb({
    Key? key,
    required this.email,
    required this.password,
    this.loginWithNonCustodialPage = false,
  }) : super(key: key);

  final String email;
  final String password;
  final bool loginWithNonCustodialPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IAuthService service = AuthService();

    final TextEditingController controllerPin = TextEditingController();
    final loaderState = useState(LoadState.notLoading);

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
                        final response = await service.login(
                          email: email,
                          password: password,
                          code: value,
                        );
                        if (response != null) {
                          if (response is GraphQlError) {
                            final snackBar = SnackBar(
                              elevation: 0,
                              clipBehavior: Clip.none,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                titleFontSize: 30.sp,
                                messageFontSize: 20.sp,
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
                            var dataUsr = UserConfigData(
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
                            uBox.putAt(0, dataUsr);

                            loaderState.value = LoadState.notLoading;
                            // controllerState.state = ControllerState.authorized;

                            if (loginWithNonCustodialPage) {
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
                                  .read(nonCustodialProgressStateProvider
                                      .notifier)
                                  .state++;
                            }

                            context.go(Wallets.routeName);
                          }
                        }
                      }
                    },
                    onSubmitted: (String value) async {
                      if (value.length == (6)) {
                        final response = await service.login(
                          email: email,
                          password: password,
                          code: value,
                        );
                        if (response != null) {
                          if (response is GraphQlError) {
                            final snackBar = SnackBar(
                              elevation: 0,
                              clipBehavior: Clip.none,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                titleFontSize: 30.sp,
                                messageFontSize: 20.sp,
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
                            var dataUsr = UserConfigData(
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
                            uBox.putAt(0, dataUsr);

                            loaderState.value = LoadState.notLoading;

                            if (loginWithNonCustodialPage) {
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
                                  .read(nonCustodialProgressStateProvider
                                      .notifier)
                                  .state++;
                            }
                            context.go(Wallets.routeName);
                          }
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
