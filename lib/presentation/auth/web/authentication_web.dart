import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/application/global_data/actions/global_actions.dart';
import 'package:user_app/domain/auth/auth_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/auth/components/auth_screen_components/components/app_benefits_row.dart';
import 'package:user_app/presentation/components/auth/sign_in_container.dart';
import 'package:user_app/presentation/components/auth/sign_up_container.dart';
import 'package:user_app/presentation/auth/web/components/auth_app_bar.dart';
import 'package:user_app/presentation/auth/web/components/footer_components/footer.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AuthenticationWeb extends HookConsumerWidget {
  const AuthenticationWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerStateProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AuthAppBar(
              isWeb: true,
            ),
            SizedBox(
              height: (authController == AuthState.signIn ? 1594 : 1707).h,
              width: 1920.w,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      authBackground,
                      height: 1178.h,
                      width: 1178.w,
                    ),
                  ),
                  Positioned(
                    top: (authController == AuthState.signIn ? 265 : 322).h,
                    left: 462.w,
                    right: 462.w,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 90.w,
                          height: 100.h,
                          child: SvgPicture.asset(coin1),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 90.w,
                          height: 100.h,
                          child: SvgPicture.asset(coin4),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: (authController == AuthState.signIn ? 448 : 505).h,
                    left: 391.w,
                    right: 391.w,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 135.w,
                          height: 150.h,
                          child: SvgPicture.asset(coin2),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 135.w,
                          height: 150.h,
                          child: SvgPicture.asset(coin5),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: (authController == AuthState.signIn ? 676 : 733).h,
                    left: 459.w,
                    right: 459.w,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 108.w,
                          height: 120.h,
                          child: SvgPicture.asset(coin3),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 108.w,
                          height: 120.h,
                          child: SvgPicture.asset(coin6),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 50.h,
                    left: 660.w,
                    right: 660.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          tr('authorization.marionette_demo'),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 48.sp),
                        ),
                        const AppBenefitsRow(),
                        Text(
                          tr('authorization.app_actions'),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 48.sp),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 25.h,
                            bottom: 50.h,
                          ),
                          child: authController == AuthState.signIn
                              ? SignInContainer(
                                  platformType: PlatformTypeState.web,
                                )
                              : SignUpContainer(
                                  platformType: PlatformTypeState.web,
                                ),
                        ),
                        InkWell(
                          onTap: () async {
                            GlobalActionsGeneral globalActionsGeneral =
                                GlobalActionsGeneral();
                            globalActionsGeneral.openLink(
                                url: 'https://marionette.dev/');
                          },
                          child: SizedBox(
                            width: 180.w,
                            height: 20.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  tr('authorization.powered_by'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(fontSize: 18.sp),
                                ),
                                Text(
                                  tr('authorization.marionette_dev'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                          color: MainColorsApp.accentColor,
                                          fontSize: 18.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: (authController == AuthState.signIn ? 914 : 1027).h,
                    child: Image.asset(
                      isLightTheme(context) ? authBanner : authBannerDark,
                      width: 1920.w,
                      height: 680.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            const FooterWeb(),
          ],
        ),
      ),
    );
  }
}
