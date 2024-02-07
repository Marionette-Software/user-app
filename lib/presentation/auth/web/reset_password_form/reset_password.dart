// ignore_for_file: use_build_context_synchronously

import 'dart:ui';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/global_data/actions/global_actions.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/reset_password/recovery_password/recovery_password_service.dart';
import 'package:user_app/presentation/auth/authentication.dart';
import 'package:user_app/presentation/auth/web/components/auth_app_bar.dart';
import 'package:user_app/presentation/auth/web/components/footer_components/footer.dart';
import 'package:user_app/presentation/components/custom_password_input.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/validate_password.dart';

class ResetPasswordWeb extends HookConsumerWidget {
  const ResetPasswordWeb({
    super.key,
    required this.resetToken,
  });

  final String resetToken;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final loaderState = useState(LoadState.notLoading);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: const AuthAppBar(
          isWeb: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: Column(
            children: [
              Text(
                tr('authorization.marionette_demo'),
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -2.sp,
                    ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr('authorization.powered_by'),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 20.sp,
                          letterSpacing: -1.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  InkWell(
                    onTap: () async {
                      GlobalActionsGeneral globalActionsGeneral =
                          GlobalActionsGeneral();
                      globalActionsGeneral.openLink(
                          url: 'https://marionette.dev/');
                    },
                    child: Text(
                      tr('authorization.marionette_dev'),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: MainColorsApp.accentColor,
                            fontSize: 20.sp,
                            letterSpacing: -1.sp,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                width: 1185.0.w,
                height: 603.0.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(resetPasswordBg),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: isLightTheme(context)
                            ? [
                                BoxShadow(
                                  color: MainColorsApp.accentColor
                                      .withOpacity(0.25),
                                  spreadRadius: 80,
                                  blurRadius: 80,
                                  offset: const Offset(0, 10),
                                )
                              ]
                            : null,
                      ),
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 25,
                            sigmaY: 25,
                          ),
                          child: MainDecorationContainerWeb(
                            content: SizedBox(
                              width: 600.0.w,
                              height: 411.0.h,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 30.h,
                                  left: 25.w,
                                  right: 25.w,
                                  bottom: 50.h,
                                ),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            tr('authorization.create_new_password'),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 30.sp,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: -1.5.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      CustomPasswordInput(
                                        platformType: PlatformTypeState.web,
                                        controller: newPasswordController,
                                        hint: tr('authorization.new_password'),
                                        onValidate: (password) {
                                          if (password!.isEmpty) {
                                            return '';
                                          } else if (isPasswordValid(
                                            password: password,
                                          )) {
                                            return '';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      CustomPasswordInput(
                                        platformType: PlatformTypeState.web,
                                        controller: confirmPasswordController,
                                        hint: tr(
                                            'authorization.confirm_password'),
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
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      loaderState.value == LoadState.loading
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : MainButton(
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                              height: 60.h,
                                              disableColor: MainColorsApp
                                                  .accentColor
                                                  .withOpacity(0.5),
                                              text: tr('Proceed'),
                                              onTap: () async {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  loaderState.value =
                                                      LoadState.loading;

                                                  var response =
                                                      await PasswordResetService()
                                                          .passwordReset(
                                                    newPasswordController.text,
                                                    resetToken,
                                                  );

                                                  if (response == 'ok') {
                                                    loaderState.value =
                                                        LoadState.notLoading;
                                                    final snackBar = SnackBar(
                                                      elevation: 0,
                                                      clipBehavior: Clip.none,
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      content:
                                                          AwesomeSnackbarContent(
                                                        titleFontSize: 30.sp,
                                                        messageFontSize: 20.sp,
                                                        title: tr(
                                                            'snack_bar_message.success.success'),
                                                        message: tr(
                                                            'snack_bar_message.success.password_resets_successfully'),
                                                        contentType:
                                                            ContentType.success,
                                                      ),
                                                    );

                                                    ScaffoldMessenger.of(
                                                        context)
                                                      ..hideCurrentSnackBar()
                                                      ..showSnackBar(snackBar);

                                                   context.go(Authentication.routeName);
                                                  } else if (response
                                                      is GraphQlError) {
                                                    loaderState.value =
                                                        LoadState.notLoading;
                                                    final snackBar = SnackBar(
                                                      elevation: 0,
                                                      clipBehavior: Clip.none,
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      content:
                                                          AwesomeSnackbarContent(
                                                        titleFontSize: 30.sp,
                                                        messageFontSize: 20.sp,
                                                        title: tr(
                                                            'snack_bar_message.errors.error'),
                                                        message: tr(
                                                            'snack_bar_message.errors.token_expired_the_reset_link_was_already_used'),
                                                        contentType:
                                                            ContentType.failure,
                                                      ),
                                                    );

                                                    ScaffoldMessenger.of(
                                                        context)
                                                      ..hideCurrentSnackBar()
                                                      ..showSnackBar(snackBar);
                                                  }
                                                } else {
                                                  int count = 0;
                                                  String message = '';

                                                  if (newPasswordController
                                                      .text.isEmpty) {
                                                    message +=
                                                        '- ${tr('snack_bar_message.errors.new_password_should_not_be_empty')}\n';
                                                    count += 1;
                                                  }
                                                  if (isPasswordValid(
                                                      password:
                                                          confirmPasswordController
                                                              .text)) {
                                                    message += tr(
                                                        'snack_bar_message.errors.password_validate_params');
                                                    count += 6;
                                                  }
                                                  if (confirmPasswordController
                                                      .text.isEmpty) {
                                                    message +=
                                                        '- ${tr('snack_bar_message.errors.password_not_match')}\n';
                                                    count += 1;
                                                  } else if (newPasswordController
                                                          .text !=
                                                      confirmPasswordController
                                                          .text) {
                                                    message +=
                                                        '- ${tr('snack_bar_message.errors.password_not_match')}\n';
                                                    count += 1;
                                                  }
                                                  final snackBar = SnackBar(
                                                    elevation: 0,
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    clipBehavior: Clip.none,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    content: SizedBox(
                                                      height: 110.h +
                                                          (20.h * count),
                                                      child:
                                                          AwesomeSnackbarContent(
                                                        titleFontSize: 30.sp,
                                                        messageFontSize: 20.sp,
                                                        title: tr(
                                                            'snack_bar_message.errors.input_error'),
                                                        message: message,
                                                        contentType:
                                                            ContentType.failure,
                                                      ),
                                                    ),
                                                  );

                                                  ScaffoldMessenger.of(context)
                                                    ..hideCurrentSnackBar()
                                                    ..showSnackBar(snackBar);
                                                }
                                              },
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const FooterWeb(),
            ],
          ),
        ),
      ),
    );
  }
}
