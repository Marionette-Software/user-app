import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/profile/actions/settings/change_password.dart';
import 'package:user_app/presentation/components/custom_password_input.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/validate_password.dart';
import 'package:user_app/presentation/constants/colors.dart';

class ChangePasswordForm extends HookConsumerWidget {
  static final _formKey = GlobalKey<FormState>();

  const ChangePasswordForm({
    required this.platformType,
    Key? key,
  }) : super(key: key);

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final oldPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final newPasswordConfirmController = useTextEditingController();

    final errorOldPassword = useState(false);
    final loaderState = useState(LoadState.notLoading);

    return Form(
      key: _formKey,
      child: SizedBox(
        width: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 600,
          tabletValue: 475,
          mobileValue: 320,
        ).w,
        height: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 505,
          tabletValue: 395,
          mobileValue: 376,
        ).h,
        child: MainDecorationContainerWeb(
          content: Padding(
            padding: EdgeInsets.only(
              left: 25.w,
              right: 25.w,
              top: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 30,
                tabletValue: 25,
                mobileValue: 15,
              ).h,
              bottom: 50.h,
            ),
            child: Column(
              children: [
                Text(
                  tr('profile.title_change_password'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: getSizeFromPlatformType(
                          platformType: platformType,
                          webValue: 30,
                          tabletValue: 20,
                          mobileValue: 20,
                        ).sp,
                      ),
                ),
                SizedBox(
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 30,
                    tabletValue: 25,
                    mobileValue: 15,
                  ).h,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: errorOldPassword.value
                          ? Theme.of(context).colorScheme.error
                          : Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: CustomPasswordInput(
                    platformType: platformType,
                    controller: oldPasswordController,
                    hint: tr('profile.old_password'),
                    onValidate: (password) {
                      if (password!.isEmpty) {
                        return '';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 25,
                    tabletValue: 15,
                    mobileValue: 10,
                  ).h,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: CustomPasswordInput(
                    platformType: platformType,
                    controller: newPasswordController,
                    hint: tr('profile.new_password'),
                    onValidate: (password) {
                      if (password!.isEmpty) {
                        return '';
                      } else if (isPasswordValid(password: password)) {
                        return '';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 25,
                    tabletValue: 15,
                    mobileValue: 10,
                  ).h,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: CustomPasswordInput(
                    platformType: platformType,
                    controller: newPasswordConfirmController,
                    hint: tr('profile.confirm_new_password'),
                    onValidate: (password) {
                      if (password!.isEmpty) {
                        return '';
                      } else if (password != newPasswordController.text) {
                        return '';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                    height: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 25,
                  tabletValue: 15,
                  mobileValue: 10,
                ).h),
                loaderState.value == LoadState.loading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: getSizeFromPlatformType(
                          platformType: platformType,
                          webValue: 550,
                          tabletValue: 425,
                          mobileValue: 270,
                        ).w,
                        height: getSizeFromPlatformType(
                          platformType: platformType,
                          webValue: 60,
                          tabletValue: 45,
                          mobileValue: 35,
                        ).h,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColorLight,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6.r),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            ChangePasswordAction().changePassword(
                              context: context,
                              ref: ref,
                              platformType: platformType,
                              formKey: _formKey,
                              loaderState: loaderState,
                              errorOldPassword: errorOldPassword,
                              oldPasswordController: oldPasswordController,
                              newPasswordController: newPasswordController,
                              newPasswordConfirmController:
                                  newPasswordConfirmController,
                            );
                          },
                          child: Center(
                            child: Text(
                              tr('profile.submit'),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: getSizeFromPlatformType(
                                      platformType: platformType,
                                      webValue: 20,
                                      tabletValue: 18,
                                      mobileValue: 13,
                                    ).h,
                                    color: AppColors.whiteColor,
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
