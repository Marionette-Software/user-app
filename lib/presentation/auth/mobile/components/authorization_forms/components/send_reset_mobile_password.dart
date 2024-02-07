import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/actions/auth_actions.dart';
import 'package:user_app/domain/general/request_status.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/presentation/auth/components/main_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SendResetMobilePassword extends HookConsumerWidget {
  const SendResetMobilePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final loaderState = useState(LoadState.notLoading);

    final formKey = GlobalKey<FormState>();

    return Container(
      width: 300.w,
      height: 205.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5.r),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isLightTheme(context)
                ? AppColors.whiteColor
                : AppColors.whiteColor.withOpacity(0.1),
            isLightTheme(context)
                ? AppColors.whiteColor
                : AppColors.whiteColor.withOpacity(0.0),
          ],
        ),
      ),
      child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.only(
            top: 21.h,
            bottom: 30.h,
            left: 15.w,
            right: 15.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr('authorization.reset_password'),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Text(
                tr('authorization.using_the_link_sent_in_email'),
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
              ),
              SizedBox(height: 18.h),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  cursorColor: Theme.of(context).inputDecorationTheme.fillColor,
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  controller: emailController,
                  validator: (password) {
                    if (password == '' || password == null) {
                      return tr('authorization.please_fill_field');
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: tr('authorization.email'),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColorLight,
                        width: 2.w,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: MainColorsApp.redColor,
                        width: 2,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              loaderState.value == LoadState.loading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : SizedBox(
                      height: 35.h,
                      child: MainButtonMobile(
                        fontSize: 10.h,
                        text: tr('authorization.reset_button'),
                        color: Theme.of(context).primaryColorLight,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            AuthActionsGeneral authActionsGeneral =
                                AuthActionsGeneral();
                            authActionsGeneral
                                .askPasswordReset(
                              email: emailController.text,
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

                                  context.pop();
                                } else if (response is GraphQlError) {
                                  final snackBar = SnackBar(
                                    elevation: 0,
                                    clipBehavior: Clip.none,
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    content: AwesomeSnackbarContent(
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
                                }
                                loaderState.value = LoadState.notLoading;
                              },
                            );
                          }
                        },
                        height: 63.h,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
