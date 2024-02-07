import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horizontal_blocked_scroll_physics/horizontal_blocked_scroll_physics.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/domain/auth/auth_state.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/auth/mobile/components/authorization_header.dart';
import 'package:user_app/presentation/auth/mobile/components/drawer/auth_drawer.dart';
import 'package:user_app/presentation/auth/mobile/components/sign_in_mobile_container.dart';
import 'package:user_app/presentation/auth/mobile/components/sign_up_mobile_container.dart';
import 'package:user_app/presentation/auth/mobile/reset_password_form/reset_password_mobile.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AuthenticationMobile extends StatefulHookConsumerWidget {
  const AuthenticationMobile({
    this.isResetPassword = false,
    this.resetToken,
    this.refCode = '',
    Key? key,
  }) : super(key: key);

  final bool isResetPassword;
  final String? resetToken;
  final String refCode;

  @override
  ConsumerState<AuthenticationMobile> createState() =>
      _AuthenticationMobileState();
}

class _AuthenticationMobileState extends ConsumerState<AuthenticationMobile> {
  late PageController pageController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> keyboardSubscription;
  bool isKeyboardVisible = false;
  int currentIndex = 1;
  bool preventScroll = true;
  bool isResetPassword = false;
  String localRefCode = '';

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: widget.isResetPassword ? 0 : 1);
    isResetPassword = widget.isResetPassword;
    localRefCode = widget.refCode;

    setStateListener();
    setKeyboardListener();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          color: AppColors.mainBackgroundDarkColor,
        ),
        Image.asset(
          authMobileBackground,
          fit: BoxFit.fill,
        ),
        Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          drawer: const AuthDrawer(),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Builder(
                    builder: (context) {
                      return AuthorizationHeader(
                        onTap: () => Scaffold.of(context).openDrawer(),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        color: isLightTheme(context)
                            ? Colors.white
                            : walletBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        )),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      child: PageView(
                        physics: isKeyboardVisible
                            ? const NeverScrollableScrollPhysics()
                            : currentIndex == 1 && preventScroll
                                ? const RightBlockedScrollPhysics()
                                : const BouncingScrollPhysics(),
                        pageSnapping: true,
                        controller: pageController,
                        onPageChanged: (index) {
                          setState(() => currentIndex = index);
                          if (index == 0) {
                            ref
                                .read(authMobileControllerStateProvider
                                    .notifier)
                                .state = AuthState.forgotPassword;
                          } else if (index == 1) {
                            ref
                                .read(authMobileControllerStateProvider
                                    .notifier)
                                .state = AuthState.signIn;
                          } else if (index == 2) {
                            ref
                                .read(authMobileControllerStateProvider
                                    .notifier)
                                .state = AuthState.signUp;
                          }
                        },
                        children: [
                          SendResetPasswordMobile(
                            isResetPassword: widget.isResetPassword,
                            resetToken: widget.resetToken,
                          ),
                          const SignInMobileContainer(
                            platformType: PlatformTypeState.mobile,
                          ),
                          SignUpMobileContainer(
                            platformType: PlatformTypeState.mobile,
                            refCode: widget.refCode,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void setStateListener() {
    context.afterBuild(() {
      ref.read(authMobileControllerStateProvider.notifier).addListener((state) {
        if (isKeyboardVisible) {
          return;
        }
        if (isResetPassword) {
          Future.delayed(const Duration(milliseconds: 500), () {
            ref.read(authMobileControllerStateProvider.notifier).state =
                AuthState.forgotPassword;
            setState(() => isResetPassword = false);
          });
        }
        if (!isResetPassword) {
          if (state == AuthState.forgotPassword && currentIndex != 0) {
            setState(() => preventScroll = false);
            pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastEaseInToSlowEaseOut,
            );
          } else if (localRefCode.isNotEmpty) {
            ref.read(authMobileControllerStateProvider.notifier).state =
                AuthState.signUp;
            setState(() {
              localRefCode = '';
            });
            pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastEaseInToSlowEaseOut,
            );
          } else if (state == AuthState.signIn) {
            setState(() => preventScroll = true);
            pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastEaseInToSlowEaseOut,
            );
          } else if (state == AuthState.signUp) {
            setState(() => preventScroll = true);
            pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastEaseInToSlowEaseOut,
            );
          }
        }
      });
    });
  }

  void setKeyboardListener() {
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        isKeyboardVisible = visible;
      });
    });
  }
}
