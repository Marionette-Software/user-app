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
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/auth/mobile/components/about_mobile.dart';
import 'package:user_app/presentation/auth/mobile/components/captcha_mobile.dart';
import 'package:user_app/presentation/auth/mobile/components/reset_password_mobile.dart';
import 'package:user_app/presentation/auth/web/components/social_auth.dart';
import 'package:user_app/presentation/components/custom_password_input.dart';
import 'package:user_app/presentation/components/custom_text_input.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_show_modal_bottom_sheet.dart';
import 'package:user_app/presentation/components/two_fa/mobile/two_fa_for_sign_in.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/input_validation.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SignInMobileContainer extends StatefulHookConsumerWidget {
  const SignInMobileContainer({
    required this.platformType,
    this.loginWithNonCustodial = false,
    super.key,
  });

  final PlatformTypeState platformType;
  final bool loginWithNonCustodial;

  @override
  ConsumerState<SignInMobileContainer> createState() =>
      _SignInMobileContainerState();
}

class _SignInMobileContainerState extends ConsumerState<SignInMobileContainer> {
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
    final authController =
        ref.watch(authMobileControllerStateProvider.notifier);
    final loaderState = useState(LoadState.notLoading);

    IAuthService service = AuthService();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Padding(
        padding: EdgeInsets.only(
          top: 15..h,
          left: 15.w,
          right: 15.w,
          bottom: 15..h,
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(context).bottom + 30
                  ..h,
              ),
              child: Column(
                children: [
                  Text(
                    "Welcome!".hardcoded,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 25.sp,
                          letterSpacing: -1.25.sp,
                          fontWeight: FontWeight.w600,
                        ),
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
                    platformType: widget.platformType,
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
                          top: 15..h,
                          bottom: 15..h,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 10..h,
                              width: 10.w,
                              child: Container(
                                color: AppColors.fillColor,
                                child: Transform.scale(
                                  scale: 1.3.w,
                                  child: SizedBox(
                                    child: Checkbox(
                                      side: MaterialStateBorderSide.resolveWith(
                                        (states) => BorderSide(
                                          width: _rememberMe == false ? 0 : 0,
                                          color: _rememberMe == false
                                              ? Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.25)
                                              : Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.25),
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      activeColor:
                                          AppColors.checkboxActiveColors,
                                      checkColor: isLightTheme(context)
                                          ? Theme.of(context).primaryColorLight
                                          : Theme.of(context).primaryColor,
                                      tristate: false,
                                      value: _rememberMe,
                                      splashRadius: 3,
                                      onChanged: (value) {
                                        setState(() {
                                          _rememberMe = value ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              'Remember me',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
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
                        ),
                        child: const ResetPasswordMobile(),
                      ),
                    ],
                  ),
                  loaderState.value == LoadState.loading
                      ? const CircularProgressIndicator()
                      : MainButton(
                          disableColor:
                              MainColorsApp.accentColor.withOpacity(0.5),
                          borderRadius: 10.r,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              loaderState.value = LoadState.loading;
                              signIn(
                                saveRememberMeStatus: saveRememberMeStatus,
                                loginWithNonCustodial:
                                    widget.loginWithNonCustodial,
                                context: context,
                                // controllerState: controllerState,
                                emailController: emailController,
                                passwordController: passwordController,
                                formKey: formKey,
                                loadState: loaderState,
                                service: service,
                                ref: ref,
                                platformType: widget.platformType,
                              );
                            } else {
                              loaderState.value = LoadState.notLoading;

                              final snackBar = SnackBar(
                                elevation: 0,
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.viewInsetsOf(context).bottom +
                                          30
                                        ..h,
                                ),
                                clipBehavior: Clip.none,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  titleFontSize: 20.sp,
                                  messageFontSize: 15.sp,
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
                          height: 45..h,
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 15,
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
                    onTap: () async {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${tr('authorization.new_user')} ',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: Theme.of(context).primaryColor,
                                    letterSpacing: -0.75.sp,
                                  ),
                        ),
                        InkWell(
                          onTap: () => authController.state = AuthState.signUp,
                          child: Text(
                            tr('authorization.create_account'),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColorLight,
                                  fontSize: 15.sp,
                                  letterSpacing: -0.75.sp,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25..h,
                  ),
                  InkWell(
                    onTap: () async {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            mainShowModalBottomSheet(
                              context: context,
                              longShowModalBottom: false,
                              content: Container(
                                color: Colors.transparent,
                                child: const AboutMobileModal(),
                              ),
                            );
                          },
                          child: Text(
                            tr('authorization.about'),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColorLight,
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
    bool? result = await mainShowModalBottomSheet(
      context: context,
      longShowModalBottom: false,
      content: Container(
        color: Colors.transparent,
        child: const CaptchaDialogMobile(),
      ),
    );
    if (result == null || !result) {
      loadState.value = LoadState.notLoading;
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        clipBehavior: Clip.none,
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom + 30
            ..h,
        ),
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          titleFontSize: 20.sp,
          messageFontSize: 15.sp,
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
      .then((value) {
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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TwoFaForSignInMobile(
            saveRememberMeStatus: saveRememberMeStatus,
            email: emailController.text.toLowerCase(),
            password: passwordController.text,
            loginWithNonCustodialPage: loginWithNonCustodial,
          ),
        ),
      );
    } else {
      loadState.value = LoadState.notLoading;

      final snackBar = SnackBar(
        elevation: 0,
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom + 30
            ..h,
        ),
        behavior: SnackBarBehavior.floating,
        clipBehavior: Clip.none,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          titleFontSize: 20.sp,
          messageFontSize: 15.sp,
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
