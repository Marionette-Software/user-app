import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/actions/auth_actions.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/domain/general/request_status.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/reset_password/recovery_password/recovery_password_service.dart';
import 'package:user_app/presentation/auth/components/main_button.dart';
import 'package:user_app/presentation/components/custom_password_input.dart';
import 'package:user_app/presentation/components/custom_text_input.dart';
import 'package:user_app/presentation/helpers/input_validation.dart';
import 'package:user_app/domain/auth/auth_state.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/presentation/helpers/validate_password.dart';

class SendResetPasswordMobile extends HookConsumerWidget {
  static final formKey = GlobalKey<FormState>();
  final bool isResetPassword;
  final String? resetToken;

  const SendResetPasswordMobile({
    super.key,
    this.isResetPassword = false,
    this.resetToken,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final loaderState = useState(LoadState.notLoading);
    final authController =
        ref.watch(authMobileControllerStateProvider.notifier);
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: isResetPassword
          ? Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15..h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tr('authorization.create_new_password'),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -1.25.sp,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 15..h,
                              bottom: 15..h,
                            ),
                            child: CustomPasswordInput(
                              controller: newPasswordController,
                              hint: tr('authorization.new_password'),
                              onValidate: (password) {
                                if (password!.isEmpty) {
                                  return '';
                                } else if (isPasswordValid(
                                    password: password)) {
                                  return '';
                                } else {
                                  return null;
                                }
                              },
                              platformType: PlatformTypeState.mobile,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 15..h,
                            ),
                            child: CustomPasswordInput(
                              controller: confirmPasswordController,
                              hint: tr('authorization.confirm_password'),
                              platformType: PlatformTypeState.mobile,
                              onValidate: (password) {
                                if (password!.isEmpty) {
                                  return '';
                                } else if (password !=
                                    newPasswordController.text) {
                                  return '';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          loaderState.value == LoadState.loading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : MainButtonMobile(
                                  borderRadius: 10.r,
                                  fontSize: 15,
                                  color: Theme.of(context).primaryColorLight,
                                  height: 45..h,
                                  text: tr('authorization.proceed'),
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      loaderState.value = LoadState.loading;

                                      var response =
                                          await PasswordResetService()
                                              .passwordReset(
                                        newPasswordController.text,
                                        resetToken ?? "",
                                      );

                                      if (response == 'ok') {
                                        loaderState.value =
                                            LoadState.notLoading;
                                        final snackBar = SnackBar(
                                          elevation: 0,
                                          clipBehavior: Clip.none,
                                          padding: EdgeInsets.only(
                                            bottom:
                                                // ignore: use_build_context_synchronously
                                                MediaQuery.viewInsetsOf(context)
                                                        .bottom +
                                                    30
                                                  ..h,
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            titleFontSize: 20.sp,
                                            messageFontSize: 15.sp,
                                            title: tr(
                                                'snack_bar_message.success.success'),
                                            message: tr(
                                                'snack_bar_message.success.password_resets_successfully'),
                                            contentType: ContentType.success,
                                          ),
                                        );

                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(snackBar);

                                        authController.state = AuthState.signIn;
                                      } else if (response is GraphQlError) {
                                        loaderState.value =
                                            LoadState.notLoading;
                                        final snackBar = SnackBar(
                                          elevation: 0,
                                          clipBehavior: Clip.none,
                                          padding: EdgeInsets.only(
                                            bottom:
                                                // ignore: use_build_context_synchronously
                                                MediaQuery.viewInsetsOf(context)
                                                        .bottom +
                                                    30
                                                  ..h,
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            titleFontSize: 20.sp,
                                            messageFontSize: 15.sp,
                                            title: tr(
                                                'snack_bar_message.errors.error'),
                                            message: tr(
                                                'snack_bar_message.errors.token_expired_the_reset_link_was_already_used'),
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

                                      if (newPasswordController.text.isEmpty) {
                                        message +=
                                            '- ${tr('snack_bar_message.errors.new_password_should_not_be_empty')}\n';
                                        count += 1;
                                      }
                                      if (isPasswordValid(
                                          password:
                                              confirmPasswordController.text)) {
                                        message += tr(
                                            'snack_bar_message.errors.password_validate_params');
                                        count += 5;
                                      }
                                      if (confirmPasswordController
                                          .text.isEmpty) {
                                        message +=
                                            '- ${tr('snack_bar_message.errors.password_not_match')}\n';
                                        count += 1;
                                      } else if (newPasswordController.text !=
                                          confirmPasswordController.text) {
                                        message +=
                                            '- ${tr('snack_bar_message.errors.password_not_match')}\n';
                                        count += 1;
                                      }
                                      final snackBar = SnackBar(
                                        elevation: 0,
                                        clipBehavior: Clip.none,
                                        padding: EdgeInsets.only(
                                          bottom:
                                              // ignore: use_build_context_synchronously
                                              MediaQuery.viewInsetsOf(context)
                                                      .bottom +
                                                  30
                                                ..h,
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: SizedBox(
                                          height: 110.h + (20.h * count),
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
                                  },
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15..h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Text(
                                      tr('authorization.reset_button'),
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: -0.65.sp,
                                          ),
                                    ),
                                    Positioned(
                                      left: 18.w,
                                      child: GestureDetector(
                                        onTap: () {
                                          authController.state =
                                              AuthState.signIn;
                                        },
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 15.w,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15..h),
                          CustomInputWidget(
                            textInputAction: TextInputAction.done,
                            platformType: PlatformTypeState.mobile,
                            controller: controller,
                            hintText: tr('authorization.enter_email'),
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
                          SizedBox(height: 15..h),
                          loaderState.value == LoadState.loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              : MainButtonMobile(
                                  borderRadius: 10.r,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  text: tr('authorization.reset'),
                                  color: Theme.of(context).primaryColorLight,
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      loaderState.value = LoadState.loading;
                                      AuthActionsGeneral authActionsGeneral =
                                          AuthActionsGeneral();
                                      authActionsGeneral
                                          .askPasswordReset(
                                        email: controller.text,
                                      )
                                          .then(
                                        (response) {
                                          if (response ==
                                              RequestStatus.success) {
                                            final snackBar = SnackBar(
                                              elevation: 0,
                                              clipBehavior: Clip.none,
                                              padding: EdgeInsets.only(
                                                bottom:
                                                    // ignore: use_build_context_synchronously
                                                    MediaQuery.viewInsetsOf(
                                                                context)
                                                            .bottom +
                                                        30
                                                      ..h,
                                              ),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor:
                                                  Colors.transparent,
                                              content: AwesomeSnackbarContent(
                                                title: tr(
                                                    'snack_bar_message.success.success'),
                                                message: tr(
                                                    'snack_bar_message.success.reset_password'),
                                                contentType:
                                                    ContentType.success,
                                              ),
                                            );

                                            ScaffoldMessenger.of(context)
                                              ..hideCurrentSnackBar()
                                              ..showSnackBar(snackBar);
                                            loaderState.value =
                                                LoadState.notLoading;

                                            ref
                                                .read(
                                                    authMobileControllerStateProvider
                                                        .notifier)
                                                .state = AuthState.signIn;
                                          } else {
                                            final snackBar = SnackBar(
                                              elevation: 0,
                                              clipBehavior: Clip.none,
                                              padding: EdgeInsets.only(
                                                bottom:
                                                    // ignore: use_build_context_synchronously
                                                    MediaQuery.viewInsetsOf(
                                                                context)
                                                            .bottom +
                                                        30
                                                      ..h,
                                              ),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor:
                                                  Colors.transparent,
                                              content: AwesomeSnackbarContent(
                                                title: tr(
                                                    'snack_bar_message.errors.error'),
                                                message: tr(
                                                    'snack_bar_message.errors.user_not_exist'),
                                                contentType:
                                                    ContentType.failure,
                                              ),
                                            );

                                            ScaffoldMessenger.of(context)
                                              ..hideCurrentSnackBar()
                                              ..showSnackBar(snackBar);
                                            loaderState.value =
                                                LoadState.notLoading;
                                          }
                                        },
                                      );
                                    }
                                  },
                                  height: 45..h,
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
