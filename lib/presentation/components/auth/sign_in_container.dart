// ignore_for_file: use_build_context_synchronously
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/actions/auth_actions.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_notifier.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_provider.dart';
import 'package:user_app/domain/auth/auth_state.dart';
import 'package:user_app/domain/auth/auth_status.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/auth/auth_service.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/auth/web/components/captcha.dart';
import 'package:user_app/presentation/auth/web/components/reset_password_web.dart';
import 'package:user_app/presentation/auth/web/components/social_auth.dart';
import 'package:user_app/presentation/auth/web/components/two_fa_for_sign_in_web.dart';
import 'package:user_app/presentation/components/auth/components/auth_card_header_web.dart';
import 'package:user_app/presentation/components/custom_password_input.dart';
import 'package:user_app/presentation/components/custom_text_input.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/input_validation.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SignInContainer extends StatefulHookConsumerWidget {
  const SignInContainer({
    required this.platformType,
    this.loginWithNonCustodial = false,
    super.key,
  });

  final PlatformTypeState platformType;
  final bool loginWithNonCustodial;
  @override
  ConsumerState<SignInContainer> createState() => _SignInContainerState();
}

class _SignInContainerState extends ConsumerState<SignInContainer> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _rememberMe = false;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _loadRememberMeStatus();
  }

  Future<void> _loadRememberMeStatus() async {
    bool rememberMe =
        (await secureStorage.read(key: 'rememberMe')).toString() == 'true';
    String email = await secureStorage.read(key: 'email') ?? '';
    String password = await secureStorage.read(key: 'password') ?? '';

    setState(() {
      _rememberMe = rememberMe;
      if (_rememberMe) {
        emailController.text = email;
        passwordController.text = password;
      }
    });
  }

  Future<void> saveRememberMeStatus() async {
    await secureStorage.write(key: 'rememberMe', value: _rememberMe.toString());
    if (_rememberMe) {
      await secureStorage.write(key: 'email', value: emailController.text);
      await secureStorage.write(
          key: 'password', value: passwordController.text);
    } else {
      await secureStorage.delete(key: 'email');
      await secureStorage.delete(key: 'password');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(authControllerStateProvider.notifier);

    final loaderState = useState(LoadState.notLoading);

    IAuthService service = AuthService();

    return Container(
      width: 600.w,
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
          top: 35.h,
          left: 25.w,
          right: 25.w,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              AuthCardHeader(
                platformType: PlatformTypeState.web,
                title: tr('authorization.sign_in'),
                subtitle: '${tr('authorization.new_user')} ',
                subtitleFuncText: tr('authorization.create_account'),
                subtitleOnTap: () => authController.state = AuthState.signUp,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 14.h,
                  bottom: 25.h,
                ),
                child: CustomInputWidget(
                  platformType: PlatformTypeState.web,
                  controller: emailController,
                  hintText: tr('authorization.email'),
                  onValidate: (text) {
                    if (text!.isEmpty) {
                      return '';
                    } else if (!InputValidation.simpleEmailValidation(
                        text.toString())) {
                      return '';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              CustomPasswordInput(
                platformType: PlatformTypeState.web,
                hint: tr('authorization.password'),
                controller: passwordController,
                onValidate: (password) {
                  if (password!.isEmpty) {
                    return '';
                  } else {
                    return null;
                  }
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 23.w,
                      top: 15.h,
                      bottom: 15.h,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: Container(
                            color: AppColors.fillColor,
                            child: Transform.scale(
                              scale: 1.3.w,
                              child: SizedBox(
                                child: Checkbox(
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                      width: 0,
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.25),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  activeColor: AppColors.checkboxActiveColors,
                                  checkColor: isLightTheme(context)
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context).primaryColor,
                                  tristate: false,
                                  value: _rememberMe,
                                  splashRadius: 3,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Remember me',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.sp,
                                    color: Theme.of(context).primaryColor,
                                    letterSpacing: -0.75.sp,
                                  ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20.w,
                      top: 15.h,
                      bottom: 15.h,
                    ),
                    child: const ResetPasswordWeb(
                      platformType: PlatformTypeState.web,
                    ),
                  ),
                ],
              ),
              loaderState.value == LoadState.loading
                  ? const CircularProgressIndicator()
                  : MainButton(
                      borderRadius: 10.r,
                      disableColor: MainColorsApp.accentColor.withOpacity(0.5),
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          loaderState.value = LoadState.loading;
                          signIn(
                            saveRememberMeStatus: saveRememberMeStatus,
                            loginWithNonCustodial: widget.loginWithNonCustodial,
                            context: context,
                            emailController: emailController,
                            passwordController: passwordController,
                            formKey: formKey,
                            loadState: loaderState,
                            service: service,
                            ref: ref,
                            platformType: PlatformTypeState.web,
                          );
                        } else {
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
                              message: tr(
                                  'snack_bar_message.errors.invalid_credentials'),
                              contentType: ContentType.failure,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        }
                      },
                      text: tr('authorization.sign_in'),
                      height: 60.h,
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 20,
                    ),
              SizedBox(
                height: 25.h,
              ),
              const SocialAuthWeb(
                platformType: PlatformTypeState.web,
              ),
              SizedBox(
                height: 21.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> signIn({
  required GlobalKey<FormState> formKey,
  required ValueNotifier<LoadState> loadState,
  required IAuthService service,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required BuildContext context,
  required WidgetRef ref,
  required bool loginWithNonCustodial,
  required PlatformTypeState platformType,
  required Function() saveRememberMeStatus,
}) async {
  var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
  GlobalConfigData globalData = box.getAt(0)!;

  if (globalData.enabledLoginCaptcha) {
    bool? result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const CaptchaDialogWeb();
      },
    );
    if (result == null || !result) {
      loadState.value = LoadState.notLoading;
      final snackBar = SnackBar(
        elevation: 0,
        clipBehavior: Clip.none,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          titleFontSize: 30.sp,
          messageFontSize: 20.sp,
          title: tr('snack_bar_message.errors.authentication_error'),
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

  AuthActionsGeneral authActionsGeneral = AuthActionsGeneral();
  authActionsGeneral
      .login(
    loginWithNonCustodial: loginWithNonCustodial,
    email: emailController.text,
    password: passwordController.text,
  )
      .then((value) async {
    if (value == AuthorizationStatus.success) {
      loadState.value = LoadState.notLoading;

      if (loginWithNonCustodial) {
        final progressState = ref.read(nonCustodialStateProvider.notifier);

        if (ref.watch(nonCustodialCurrenciesStateNotifierProvider).wcAddress !=
            '') {
          progressState.state = NonCustodialState.walletConnected;
        } else {
          progressState.state = NonCustodialState.receive;
        }
        ref.read(nonCustodialProgressStateProvider.notifier).state++;
      }
      saveRememberMeStatus();

      context.go(Wallets.routeName);
    } else if (value == AuthorizationStatus.twoFa) {
      showDialog(
        barrierColor: AppColors.placeHolderGrey,
        context: context,
        builder: (context) {
          return ModalWindowWallet(
            titleSize: 30,
            shapeRadius: 10.0.r,
            alertDialogSide: false,
            title: '',
            content: TwoFaForSignInWeb(
              email: emailController.text.toLowerCase(),
              password: passwordController.text,
              loginWithNonCustodialPage: loginWithNonCustodial,
            ),
          );
        },
      );
      saveRememberMeStatus();
    } else {
      loadState.value = LoadState.notLoading;

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
            mobileValue: 14,
          ).sp,
          messageFontSize: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 20,
            tabletValue: 20,
            mobileValue: 15,
          ).sp,
          title: tr('snack_bar_message.errors.authentication_error'),
          message: tr('snack_bar_message.errors.invalid_credentials'),
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
    return value;
  }).then((value) async {
    loadState.value = LoadState.notLoading;
  });
}
