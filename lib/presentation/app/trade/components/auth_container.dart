import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/domain/auth/auth_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/auth/authentication.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class AuthContainer extends HookConsumerWidget {
  const AuthContainer({
    super.key,
    required this.platformType,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerStateProvider.notifier);

    return Container(
      width: platformType == PlatformTypeState.web ? 347.w : 734.w,
      height: platformType == PlatformTypeState.web ? 292.h : 184.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isLightTheme(context)
                ? AppColors.whiteColor
                : AppColors.whiteColor.withOpacity(0.1),
            isLightTheme(context)
                ? AppColors.whiteColor
                : AppColors.whiteColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          isLightTheme(context)
              ? BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(0, 3),
                )
              : BoxShadow(
                  color: Theme.of(context).primaryColorLight.withOpacity(0.0),
                  spreadRadius: 15,
                  blurRadius: 30,
                  offset: const Offset(0, 3),
                )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 25.h,
          left: 25.w,
          right: 25.w,
          bottom: 50.h,
        ),
        child: Column(
          children: [
            Text(
              tr('trade.ready_to_trade_your_favorite_assets'),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 20.sp,
                    color: isLightTheme(context)
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).primaryColor,
                  ),
            ),
            SizedBox(
              height: 25.h,
            ),
            MainButton(
              color: Theme.of(context).primaryColorLight,
              onTap: () async {
                context.go(Authentication.routeName);
                authController.state = AuthState.signIn;
              },
              disableColor: MainColorsApp.accentColor.withOpacity(0.5),
              text: tr('trade.sign_in'),
              height: platformType == PlatformTypeState.web ? 50.h : 35.h,
              fontSize: 20,
            ),
            SizedBox(
              height: platformType == PlatformTypeState.web ? 10.h : 15.h,
            ),
            Text(
              tr('trade.or'),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize:
                      platformType == PlatformTypeState.web ? 20.sp : 15.sp,
                  color: isLightTheme(context)
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).primaryColor),
            ),
            platformType == PlatformTypeState.web
                ? SizedBox(
                    height: 10.h,
                  )
                : SizedBox(
                    width: 15.h,
                  ),
            InkWell(
              onTap: () {
                context.go(Authentication.routeName);

                authController.state = AuthState.signUp;
              },
              child: Container(
                width: platformType == PlatformTypeState.web
                    ? double.infinity
                    : 320.w,
                height: platformType == PlatformTypeState.web ? 50.h : 35.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: isLightTheme(context)
                        ? Theme.of(context).primaryColorLight
                        : AppColors.whiteColor,
                  ),
                ),
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    tr('trade.register_to_trade'),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 20.sp,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
