import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/domain/auth/auth_state.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/auth/components/auth_screen_components/components/app_benefits_row.dart';
import 'package:user_app/presentation/auth/components/contact_form/contact_form.dart';
import 'package:user_app/presentation/auth/web/components/auth_app_bar.dart';
import 'package:user_app/presentation/auth/web/components/footer_components/footer.dart';
import 'package:user_app/presentation/components/auth/sign_in_container.dart';
import 'package:user_app/presentation/components/auth/sign_up_container.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AuthenticationScreen extends StatefulHookConsumerWidget {
  const AuthenticationScreen({
    this.refCode = '',
    this.platformType = PlatformTypeState.web,
    super.key,
  });

  final PlatformTypeState platformType;
  final String refCode;

  @override
  ConsumerState<AuthenticationScreen> createState() =>
      _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> {
  @override
  void initState() {
    super.initState();
    context.afterBuild(() {
      if (widget.refCode.isNotEmpty) {
        ref.read(authControllerStateProvider.notifier).state = AuthState.signUp;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(authControllerStateProvider);

    return Scaffold(
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthAppBar(
                isWeb:
                    widget.platformType == PlatformTypeState.web ? true : false,
              ),
              SizedBox(
                height: (widget.platformType == PlatformTypeState.web
                        ? (authController == AuthState.signIn ? 914 : 1024)
                        : widget.platformType == PlatformTypeState.tablet
                            ? (authController == AuthState.signIn ? 1300 : 1300)
                            : (authController == AuthState.signIn ? 588 : 650))
                    .h,
                width: widget.platformType == PlatformTypeState.web
                    ? 1920.w
                    : widget.platformType == PlatformTypeState.tablet
                        ? 834.w
                        : 428.w,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    widget.platformType == PlatformTypeState.web ||
                            PlatformTypeState.web == PlatformTypeState.web
                        ? Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              authBackground,
                            ),
                          )
                        : const SizedBox(),
                    widget.platformType == PlatformTypeState.web
                        ? Positioned(
                            top:
                                (authController == AuthState.signIn ? 265 : 322)
                                    .h,
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
                          )
                        : const SizedBox(),
                    widget.platformType == PlatformTypeState.web
                        ? Positioned(
                            top:
                                (authController == AuthState.signIn ? 448 : 505)
                                    .h,
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
                          )
                        : const SizedBox(),
                    widget.platformType == PlatformTypeState.web
                        ? Positioned(
                            top:
                                (authController == AuthState.signIn ? 676 : 733)
                                    .h,
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
                          )
                        : const SizedBox(),
                    Positioned(
                      top: 50.h,
                      left: widget.platformType == PlatformTypeState.web
                          ? 660.w
                          : widget.platformType == PlatformTypeState.tablet
                              ? 175.w
                              : 99.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tr('authorization.marionette_demo'),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -2.sp,
                                ),
                          ),
                          AppBenefitsRow(
                            platformType: widget.platformType,
                          ),
                          Text(
                            tr('authorization.app_actions'),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.sp,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 50.h,
                              bottom: 50.h,
                            ),
                            child: Container(
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
                              child: authController == AuthState.signIn
                                  ? SignInContainer(
                                      platformType: widget.platformType,
                                    )
                                  : SignUpContainer(
                                      refCode: widget.refCode,
                                      platformType: widget.platformType,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              (widget.platformType == PlatformTypeState.web)
                  ? const ContactFormWeb()
                  : const SizedBox(),
              const FooterWeb(
                withAuthPage: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
