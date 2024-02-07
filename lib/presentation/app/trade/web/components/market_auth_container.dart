import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/domain/auth/auth_state.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/auth/authentication.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MarketAuthContainerWeb extends HookConsumerWidget {
  const MarketAuthContainerWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerStateProvider.notifier);

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 1024.w,
        height: 448.h,
        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Ready to trade your favorite\nassets?'.hardcoded,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1.5.sp,
                    ),
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10.r),
                onTap: () {
                  context.go(Authentication.routeName);
                  authController.state = AuthState.signIn;
                },
                child: Container(
                  width: 550.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                    color: MainColorsApp.accentColor,
                  ),
                  child: Center(
                    child: Text(
                      'Sign in'.hardcoded.hardcoded,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1.sp,
                          color: AppColors.whiteColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'or'.hardcoded.hardcoded,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1.sp,
                    ),
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10.r),
                onTap: () {
                  context.go(Authentication.routeName);
                  authController.state = AuthState.signUp;
                },
                child: Container(
                  width: 550.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                    border: Border.all(
                      width: 1.w,
                      color: isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Register to trade'.hardcoded.hardcoded,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -1.sp,
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
