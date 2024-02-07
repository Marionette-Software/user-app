import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/actions/auth_actions.dart';
import 'package:user_app/domain/general/request_status.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/components/custom_text_input.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/colors.dart';

class SendResetWebPassword extends HookConsumerWidget {
  const SendResetWebPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final loaderState = useState(LoadState.notLoading);

    final formKey = GlobalKey<FormState>();

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 600.w,
        height: 311.h,
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(
              top: 30.h,
              left: 25.w,
              right: 25.w,
              bottom: 50.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  tr('Reset password'),
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                        letterSpacing: -1.5.sp,
                      ),
                ),
                SizedBox(height: 30.h),
                CustomInputWidget(
                  platformType: PlatformTypeState.web,
                  controller: controller,
                  hintText: tr('authorization.enter_email'),
                  onValidate: (text) {
                    if (text!.isEmpty) {
                      return '';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 25.h),
                loaderState.value == LoadState.loading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : MainButton(
                        text: tr('Reset'),
                        disableColor:
                            MainColorsApp.accentColor.withOpacity(0.5),
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
                                if (response == RequestStatus.success) {
                                  final snackBar = SnackBar(
                                    elevation: 0,
                                    clipBehavior: Clip.none,
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    content: AwesomeSnackbarContent(
                                      titleFontSize: 30.sp,
                                      messageFontSize: 20.sp,
                                      title: tr(
                                          'snack_bar_message.success.success'),
                                      message: tr(
                                          'snack_bar_message.success.reset_password'),
                                      contentType: ContentType.success,
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(snackBar);
                                  loaderState.value = LoadState.notLoading;
                                  context.pop();
                                } else {
                                  final snackBar = SnackBar(
                                    elevation: 0,
                                    clipBehavior: Clip.none,
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    content: AwesomeSnackbarContent(
                                      titleFontSize: 30.sp,
                                      messageFontSize: 20.sp,
                                      title:
                                          tr('snack_bar_message.errors.error'),
                                      message: tr(
                                          'snack_bar_message.errors.user_not_exist'),
                                      contentType: ContentType.failure,
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(snackBar);
                                  loaderState.value = LoadState.notLoading;
                                }
                              },
                            );
                          }
                        },
                        height: 60.h,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
