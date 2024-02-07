import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/profile/actions/settings/change_password.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/custom_password_input.dart';
import 'package:user_app/presentation/components/flat_custom_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/sizes.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/validate_password.dart';

class ProfileChangePasswordMobile extends StatefulHookConsumerWidget {
  const ProfileChangePasswordMobile({super.key});

  @override
  ConsumerState<ProfileChangePasswordMobile> createState() =>
      _ProfileChangePasswordMobileState();
}

class _ProfileChangePasswordMobileState
    extends ConsumerState<ProfileChangePasswordMobile> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final oldPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final newPasswordConfirmController = useTextEditingController();

    final errorOldPassword = useState(false);
    final loaderState = useState(LoadState.notLoading);

    return Scaffold(
      backgroundColor: AppColors.mainBackgroundDarkColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          50..h,
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 15..h, left: 10.w, right: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IgnorePointer(
                  child: Opacity(
                    opacity: 0,
                    child: BackButtonMobile(
                      onTap: () {
                        context.pop();
                      },
                    ),
                  ),
                ),
                Text(
                  tr('profile.title_change_password'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75,
                      ),
                  textAlign: TextAlign.center,
                ),
                MobileGenericButton(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  onTap: () {
                   context.pop();
                  },
                  child: Text(
                    tr('profile.close'),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 13.sp,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.65.sp,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          margin: EdgeInsets.only(
            top: 10..h,
          ),
          decoration: BoxDecoration(
            color: isLightTheme(context)
                ? AppColors.whiteColor
                : walletBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            children: [
              gapH16,
              Expanded(
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 15.w,
                        right: 15.w,
                        top: 5..h,
                        bottom: 50..h,
                      ),
                      child: Column(
                        children: [
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
                              platformType: PlatformTypeState.mobile,
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
                          SizedBox(height: 20..h),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: CustomPasswordInput(
                              platformType: PlatformTypeState.mobile,
                              controller: newPasswordController,
                              hint: tr('profile.new_password'),
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
                            ),
                          ),
                          SizedBox(height: 20..h),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: CustomPasswordInput(
                              platformType: PlatformTypeState.mobile,
                              controller: newPasswordConfirmController,
                              hint: tr('profile.confirm_new_password'),
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
                          SizedBox(height: 20..h),
                          loaderState.value == LoadState.loading
                              ? const CircularProgressIndicator()
                              : SizedBox(
                                  height: 45..h,
                                  child: FlatCustomButton(
                                    radius: 25.r,
                                    color: MainColorsApp.accentColor,
                                    onTap: () {
                                      ChangePasswordAction().changePassword(
                                        context: context,
                                        ref: ref,
                                        platformType: PlatformTypeState.mobile,
                                        formKey: _formKey,
                                        loaderState: loaderState,
                                        errorOldPassword: errorOldPassword,
                                        oldPasswordController:
                                            oldPasswordController,
                                        newPasswordController:
                                            newPasswordController,
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
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: -0.75.sp,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
