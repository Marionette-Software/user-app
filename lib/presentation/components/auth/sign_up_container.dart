// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/agree_provider.dart';
import 'package:user_app/application/auth/actions/auth_actions.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/application/global_data/actions/global_actions.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_notifier.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_provider.dart';
import 'package:user_app/domain/auth/auth_state.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/general/request_status.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';
import 'package:user_app/domain/non_custodial_exchange/stepper_progress.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/auth/auth_service.dart';
import 'package:user_app/infrastructure/auth/login/__generated__/login_request.var.gql.dart';
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/auth/components/custom_check_box_input.dart';
import 'package:user_app/presentation/auth/web/components/captcha.dart';
import 'package:user_app/presentation/auth/web/components/social_auth.dart';
import 'package:user_app/presentation/components/auth/components/auth_card_header_web.dart';
import 'package:user_app/presentation/components/custom_password_input.dart';
import 'package:user_app/presentation/components/custom_text_input.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/input_validation.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/validate_password.dart';
import 'package:user_app/infrastructure/auth/login/__generated__/login_request.data.gql.dart';

class SignUpContainer extends HookConsumerWidget {
  SignUpContainer({
    required this.platformType,
    this.refCode = '',
    this.signUpWithNonCustodial = false,
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final PlatformTypeState platformType;
  final bool signUpWithNonCustodial;
  final String refCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerStateProvider.notifier);
    final emailController = useTextEditingController();
    final referralCodeController = useTextEditingController(text: refCode);
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final agreeStateWatch = ref.watch(agreeStateProvider);
    final progress = ref.read(nonCustodialProgressStateProvider.notifier);
    final progressState = ref.read(nonCustodialStateProvider.notifier);
    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);
    final loaderState = useState(LoadState.notLoading);

    IAuthService service = AuthService();

    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            width: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 600,
              tabletValue: 475,
              mobileValue: MediaQuery.of(context).size.width,
            ).w,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.whiteColor,
              gradient: isLightTheme(context)
                  ? null
                  : const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff1C252D), Color(0xff020C15)],
                    ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 35,
                  tabletValue: 25,
                  mobileValue: 24,
                ).h,
                left: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 25,
                  tabletValue: 25,
                  mobileValue: 15,
                ).w,
                right: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 25,
                  tabletValue: 25,
                  mobileValue: 15,
                ).w,
              ),
              child: Column(
                children: [
                  AuthCardHeader(
                    platformType: platformType,
                    title: tr('authorization.sign_up'),
                    subtitle: '${tr('authorization.do_you_have_account')} ',
                    subtitleFuncText: tr('authorization.sign_in'),
                    subtitleOnTap: () =>
                        authController.state = AuthState.signIn,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 16,
                            tabletValue: 15,
                            mobileValue: 10,
                          ).h,
                          bottom: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 25,
                            tabletValue: 15,
                            mobileValue: 10,
                          ).h,
                        ),
                        child: CustomInputWidget(
                          platformType: platformType,
                          controller: emailController,
                          hintText: tr('authorization.email'),
                          onValidate: (text) =>
                              InputValidation.simpleEmailValidation(
                                      text.toString())
                                  ? null
                                  : '',
                        ),
                      ),
                      CustomPasswordInput(
                        platformType: platformType,
                        controller: passwordController,
                        hint: tr('authorization.password'),
                        onValidate: (password) {
                          if (password!.isEmpty) {
                            return '';
                          } else if (isPasswordValid(password: password)) {
                            return '';
                          } else if (password !=
                              confirmPasswordController.text) {
                            return '';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 25,
                        tabletValue: 15,
                        mobileValue: 10,
                      ).h,
                      bottom: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 10,
                        tabletValue: 15,
                        mobileValue: 7,
                      ).h,
                    ),
                    child: CustomPasswordInput(
                      platformType: platformType,
                      controller: confirmPasswordController,
                      hint: tr('authorization.confirm_password'),
                      onValidate: (password) {
                        if (password!.isEmpty) {
                          return '';
                        } else if (password != passwordController.text) {
                          return '';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  globalData.enabledReferrals
                      ? Padding(
                          padding: EdgeInsets.only(
                            top: getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 16,
                              tabletValue: 15,
                              mobileValue: 10,
                            ).h,
                            bottom: getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 15,
                              tabletValue: 15,
                              mobileValue: 10,
                            ).h,
                          ),
                          child: CustomInputWidget(
                            platformType: platformType,
                            controller: referralCodeController,
                            hintText: 'Referral code (Optional)'.hardcoded,
                          ),
                        )
                      : const SizedBox(),
                  AgreeInputWidget(
                    platformType: platformType,
                  ),
                  loaderState.value == LoadState.loading
                      ? const CircularProgressIndicator()
                      : MainButton(
                          disableColor:
                              MainColorsApp.accentColor.withOpacity(0.5),
                          borderRadius: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 10,
                            tabletValue: 8,
                            mobileValue: 5,
                          ).r,
                          height: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 60,
                            tabletValue: 45,
                            mobileValue: 35,
                          ).h,
                          text: tr('authorization.sign_up'),
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 20,
                            tabletValue: 15,
                            mobileValue: 13,
                          ),
                          color: Theme.of(context).primaryColorLight,
                          onTap: () async {
                            if (agreeStateWatch) {
                              if (_formKey.currentState!.validate()) {
                                loaderState.value = LoadState.loading;

                                if (globalData.enabledLoginCaptcha) {
                                  bool? result = await showDialog<bool>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return const CaptchaDialogWeb();
                                    },
                                  );
                                  if (result == null || !result) {
                                    loaderState.value = LoadState.notLoading;
                                    final snackBar = SnackBar(
                                      elevation: 0,
                                      clipBehavior: Clip.none,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        titleFontSize: 30.sp,
                                        messageFontSize: 20.sp,
                                        title: tr(
                                            'snack_bar_message.errors.authentication_error'),
                                        message:
                                            'Fail. Please try again'.hardcoded,
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

                                AuthActionsGeneral signUpAction =
                                    AuthActionsGeneral();
                                signUpAction
                                    .signUp(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  referralId: referralCodeController.text,
                                )
                                    .then((value) async {
                                  if (value == RequestStatus.success) {
                                    final snackBar = SnackBar(
                                      elevation: 0,
                                      clipBehavior: Clip.none,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        titleFontSize: getSizeFromPlatformType(
                                          platformType: platformType,
                                          webValue: 30,
                                          tabletValue: 30,
                                          mobileValue: 20,
                                        ).sp,
                                        messageFontSize:
                                            getSizeFromPlatformType(
                                          platformType: platformType,
                                          webValue: 20,
                                          tabletValue: 20,
                                          mobileValue: 15,
                                        ).sp,
                                        title: tr(
                                            'snack_bar_message.success.success'),
                                        message:
                                            '${tr('snack_bar_message.success.email_was_sent')} ${emailController.text}',
                                        contentType: ContentType.success,
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);
                                    loaderState.value = LoadState.notLoading;

                                    final response = await service.login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );

                                    if (response is GraphQlError) {
                                      final snackBar = SnackBar(
                                        elevation: 0,
                                        clipBehavior: Clip.none,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          titleFontSize:
                                              getSizeFromPlatformType(
                                            platformType: platformType,
                                            webValue: 30,
                                            tabletValue: 30,
                                            mobileValue: 20,
                                          ).sp,
                                          messageFontSize:
                                              getSizeFromPlatformType(
                                            platformType: platformType,
                                            webValue: 20,
                                            tabletValue: 20,
                                            mobileValue: 15,
                                          ).sp,
                                          title: tr(
                                              'snack_bar_message.errors.error'),
                                          message: response.message,
                                          contentType: ContentType.failure,
                                        ),
                                      );

                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(snackBar);

                                      loaderState.value = LoadState.notLoading;
                                    } else if (response is OperationResponse<
                                        GSignInData, GSignInVars>) {
                                      loaderState.value = LoadState.notLoading;

                                      var uBox = Hive.box<UserConfigData>(
                                          Constants.userConfig);
                                      var dataUsr = UserConfigData(
                                        token: response.data!.login!.token,
                                        userId: response.data!.login!.id,
                                        userName: response
                                                .data!.login!.profiles!.isEmpty
                                            ? 'User'
                                            : '${response.data!.login!.profiles!.first!.first_name!} ${response.data!.login!.profiles!.first!.last_name!}',
                                      );
                                      uBox.putAt(0, dataUsr);

                                      loaderState.value = LoadState.notLoading;

                                      if (signUpWithNonCustodial) {
                                        var nonCustodialBox =
                                            await Hive.openBox(
                                                'nonCustodialBox');

                                        StepperProgress stepperProgress =
                                            StepperProgress(
                                          authenticated: 'true',
                                          isWalletConnect: 'false',
                                        );
                                        nonCustodialBox.putAt(
                                            0, stepperProgress);

                                        if (currencyStateWatch.wcAddress !=
                                            '') {
                                          progressState.state =
                                              NonCustodialState.walletConnected;
                                        } else {
                                          progressState.state =
                                              NonCustodialState.receive;
                                        }

                                        progress.state++;
                                        context.pop();
                                      } else {
                                        context.go(Wallets.routeName);
                                      }
                                    }
                                  } else if (value is GraphQlError) {
                                    loaderState.value = LoadState.notLoading;
                                    final snackBar = SnackBar(
                                      elevation: 0,
                                      clipBehavior: Clip.none,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        titleFontSize: getSizeFromPlatformType(
                                          platformType: platformType,
                                          webValue: 30,
                                          tabletValue: 30,
                                          mobileValue: 20,
                                        ).sp,
                                        messageFontSize:
                                            getSizeFromPlatformType(
                                          platformType: platformType,
                                          webValue: 20,
                                          tabletValue: 20,
                                          mobileValue: 15,
                                        ).sp,
                                        title: tr(
                                            'snack_bar_message.errors.error'),
                                        message: value.message,
                                        contentType: ContentType.failure,
                                      ),
                                    );

                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);
                                  }
                                });
                              } else {
                                int count = 0;
                                String message = '';
                                if (emailController.text.isEmpty) {
                                  message +=
                                      '- ${tr('snack_bar_message.errors.login_input_validation')}\n';
                                  count += 1;
                                }
                                if (isPasswordValid(
                                    password: passwordController.text)) {
                                  message += tr(
                                      'snack_bar_message.errors.password_validate_params');
                                  count += 6;
                                }
                                if (passwordController.text.isEmpty) {
                                  message +=
                                      '- ${tr('snack_bar_message.errors.password_input_validation')}\n';
                                  count += 1;
                                }
                                if (passwordController.text !=
                                    confirmPasswordController.text) {
                                  message +=
                                      '- ${tr('snack_bar_message.errors.password_not_match')}\n';
                                  count += 1;
                                }
                                if (confirmPasswordController.text.isEmpty) {
                                  message +=
                                      '- ${tr('snack_bar_message.errors.password_input_validation')}\n';
                                  count += 1;
                                }

                                final snackBar = SnackBar(
                                  elevation: 0,
                                  clipBehavior: Clip.none,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: SizedBox(
                                    height: 110.h + (20.h * count),
                                    child: AwesomeSnackbarContent(
                                      titleFontSize: getSizeFromPlatformType(
                                        platformType: platformType,
                                        webValue: 30,
                                        tabletValue: 30,
                                        mobileValue: 20,
                                      ).sp,
                                      messageFontSize: getSizeFromPlatformType(
                                        platformType: platformType,
                                        webValue: 20,
                                        tabletValue: 20,
                                        mobileValue: 15,
                                      ).sp,
                                      title: tr(
                                          'snack_bar_message.errors.input_error'),
                                      message: message,
                                      contentType: ContentType.failure,
                                    ),
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);
                              }
                            } else {
                              final snackBar = SnackBar(
                                elevation: 0,
                                clipBehavior: Clip.none,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  titleFontSize: getSizeFromPlatformType(
                                    platformType: platformType,
                                    webValue: 30,
                                    tabletValue: 30,
                                    mobileValue: 20,
                                  ).sp,
                                  messageFontSize: getSizeFromPlatformType(
                                    platformType: platformType,
                                    webValue: 20,
                                    tabletValue: 20,
                                    mobileValue: 15,
                                  ).sp,
                                  title: tr('snack_bar_message.errors.error'),
                                  message: tr(
                                      'snack_bar_message.errors.confirm_terms_of_use'),
                                  contentType: ContentType.failure,
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                            }
                          },
                        ),
                  SizedBox(
                    height: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 25,
                      tabletValue: 15,
                      mobileValue: 10,
                    ).h,
                  ),
                  SocialAuthWeb(
                    platformType: platformType,
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  platformType == PlatformTypeState.mobile
                      ? InkWell(
                          onTap: () async {
                            GlobalActionsGeneral globalActionsGeneral =
                                GlobalActionsGeneral();
                            globalActionsGeneral.openLink(
                                url: 'https://marionette.dev/');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 7.w,
                              ),
                              Text(
                                tr('authorization.powered_by'),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(fontSize: 18.sp),
                              ),
                              Text(
                                tr('authorization.marionette_dev'),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      fontSize: 18.sp,
                                      color: MainColorsApp.accentColor,
                                    ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
