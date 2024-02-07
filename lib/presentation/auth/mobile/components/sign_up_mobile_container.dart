// ignore_for_file: use_build_context_synchronously
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/agree_provider.dart';
import 'package:user_app/application/auth/actions/auth_actions.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
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
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/auth/authentication.dart';
import 'package:user_app/presentation/auth/components/custom_check_box_input.dart';
import 'package:user_app/presentation/auth/mobile/components/captcha_mobile.dart';
import 'package:user_app/presentation/auth/web/components/social_auth.dart';
import 'package:user_app/presentation/components/custom_password_input.dart';
import 'package:user_app/presentation/components/custom_text_input.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_show_modal_bottom_sheet.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/input_validation.dart';
import 'package:user_app/presentation/helpers/validate_password.dart';

class SignUpMobileContainer extends StatefulHookConsumerWidget {
  const SignUpMobileContainer({
    required this.platformType,
    this.signUpWithNonCustodial = false,
    this.refCode = '',
    super.key,
  });

  final PlatformTypeState platformType;
  final bool signUpWithNonCustodial;
  final String refCode;

  @override
  ConsumerState<SignUpMobileContainer> createState() =>
      _SignUpMobileContainerState();
}

class _SignUpMobileContainerState extends ConsumerState<SignUpMobileContainer> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authController =
        ref.watch(authMobileControllerStateProvider.notifier);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final referralCodeController =
        useTextEditingController(text: widget.refCode);
    final agreeStateWatch = ref.watch(agreeStateProvider);
    final progress = ref.read(nonCustodialProgressStateProvider.notifier);
    final progressState = ref.read(nonCustodialStateProvider.notifier);
    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);
    final loaderState = useState(LoadState.notLoading);

    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    IAuthService service = AuthService();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 15..h,
                  left: 15.w,
                  right: 15.w,
                  bottom: MediaQuery.viewInsetsOf(context).bottom + 30
                    ..h,
                ),
                child: Column(
                  children: [
                    Text(
                      "Sign up".hardcoded,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 25.sp,
                              letterSpacing: -1.25.sp,
                              fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15..h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 15..h,
                      ),
                      child: CustomInputWidget(
                        platformType: widget.platformType,
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        hintText: tr('authorization.email'),
                        onValidate: (text) =>
                            InputValidation.simpleEmailValidation(
                                    text.toString())
                                ? null
                                : '',
                      ),
                    ),
                    CustomPasswordInput(
                      platformType: widget.platformType,
                      controller: passwordController,
                      textInputAction: TextInputAction.next,
                      hint: tr('authorization.password'),
                      onValidate: (password) {
                        if (password!.isEmpty) {
                          return '';
                        } else if (isPasswordValid(password: password)) {
                          return '';
                        } else if (password != confirmPasswordController.text) {
                          return '';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 15..h,
                        bottom: 15..h,
                      ),
                      child: CustomPasswordInput(
                        platformType: widget.platformType,
                        textInputAction: TextInputAction.done,
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
                              bottom: 15..h,
                            ),
                            child: CustomInputWidget(
                              platformType: widget.platformType,
                              controller: referralCodeController,
                              textInputAction: TextInputAction.next,
                              hintText: 'Referral code (Optional)'.hardcoded,
                            ),
                          )
                        : const SizedBox(),
                    AgreeInputWidget(
                      platformType: widget.platformType,
                    ),
                    SizedBox(
                      height: 15..h,
                    ),
                    loaderState.value == LoadState.loading
                        ? const CircularProgressIndicator()
                        : MainButton(
                            disableColor:
                                MainColorsApp.accentColor.withOpacity(0.5),
                            borderRadius: 10.r,
                            height: 45..h,
                            text: tr('authorization.sign_up'),
                            fontSize: getSizeFromPlatformType(
                              platformType: widget.platformType,
                              webValue: 20,
                              tabletValue: 15,
                              mobileValue: 15,
                            ),
                            color: Theme.of(context).primaryColorLight,
                            onTap: () async {
                              if (agreeStateWatch) {
                                if (_formKey.currentState!.validate()) {
                                  loaderState.value = LoadState.loading;
                                  var box = Hive.box<GlobalConfigData>(
                                      Constants.globalConfig);
                                  GlobalConfigData globalData = box.getAt(0)!;

                                  if (globalData.enabledLoginCaptcha) {
                                    bool? result =
                                        await mainShowModalBottomSheet(
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
                                        padding: EdgeInsets.only(
                                          bottom:
                                              MediaQuery.viewInsetsOf(context)
                                                      .bottom +
                                                  30
                                                ..h,
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        clipBehavior: Clip.none,
                                        content: AwesomeSnackbarContent(
                                          titleFontSize: 20.sp,
                                          messageFontSize: 15.sp,
                                          title: tr(
                                              'snack_bar_message.errors.authentication_error'),
                                          message: 'Fail. Please try again'
                                              .hardcoded,
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
                                          titleFontSize: 20.sp,
                                          messageFontSize: 15.sp,
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
                                      if (!widget.signUpWithNonCustodial) {
                                        context.go(Authentication.routeName);
                                      }

                                      final response = await service.login(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                      if (response is GraphQlError) {
                                        final snackBar = SnackBar(
                                          elevation: 0,
                                          behavior: SnackBarBehavior.floating,
                                          clipBehavior: Clip.none,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            titleFontSize: 20.sp,
                                            messageFontSize: 15.sp,
                                            title: tr(
                                                'snack_bar_message.errors.error'),
                                            message: response.message,
                                            contentType: ContentType.failure,
                                          ),
                                        );

                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(snackBar);

                                        loaderState.value =
                                            LoadState.notLoading;
                                      } else {
                                        loaderState.value =
                                            LoadState.notLoading;
                                        TextInput.finishAutofillContext();

                                        UserConfigHelper.update(
                                          token: response.data!.login!.token,
                                          userId: response.data!.login!.id,
                                          userName: response.data!.login!
                                                      .profiles!.length ==
                                                  0
                                              ? 'User'
                                              : response.data!.login!.profiles!
                                                      .first.first_name! +
                                                  ' ' +
                                                  response
                                                      .data!
                                                      .login!
                                                      .profiles!
                                                      .first
                                                      .last_name!,
                                        );

                                        loaderState.value =
                                            LoadState.notLoading;
                                        // controllerRead.state =
                                        //     ControllerState.authorized;

                                        if (widget.signUpWithNonCustodial) {
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
                                                NonCustodialState
                                                    .walletConnected;
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
                                        padding: EdgeInsets.only(
                                          bottom:
                                              MediaQuery.viewInsetsOf(context)
                                                      .bottom +
                                                  10
                                                ..h,
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        clipBehavior: Clip.none,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          titleFontSize: 20.sp,
                                          messageFontSize: 15.sp,
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
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.viewInsetsOf(context)
                                              .bottom +
                                          10
                                        ..h,
                                    ),
                                    clipBehavior: Clip.none,
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    content: SizedBox(
                                      height: 90.h + ((15..h) * count),
                                      child: AwesomeSnackbarContent(
                                        titleFontSize: 20.sp,
                                        messageFontSize: 15.sp,
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
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.viewInsetsOf(context)
                                            .bottom +
                                        10
                                      ..h,
                                  ),
                                  clipBehavior: Clip.none,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    titleFontSize: 20.sp,
                                    messageFontSize: 15.sp,
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
                      height: 15..h,
                    ),
                    SocialAuthWeb(
                      platformType: widget.platformType,
                    ),
                    SizedBox(
                      height: 35..h,
                    ),
                    InkWell(
                      onTap: () async {
                        // GlobalActionsGeneral globalActionsGeneral =
                        // GlobalActionsGeneral();
                        // globalActionsGeneral.openLink(
                        //     url: 'https://marionette.dev/');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${tr('authorization.do_you_have_account')} ',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  letterSpacing: -0.75.sp,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                          InkWell(
                            onTap: () =>
                                authController.state = AuthState.signIn,
                            child: Text(
                              tr('authorization.sign_in'),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: MainColorsApp.accentColor,
                                    fontSize: 15.sp,
                                    letterSpacing: -0.75.sp,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
