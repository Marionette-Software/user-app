import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/auth/authentication.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:lottie/lottie.dart';

class SplashScreenMobile extends StatelessWidget {
  static const routeName = '/splashScreen';

  const SplashScreenMobile({required this.isJsonAnimation, super.key});

  final bool isJsonAnimation;

  @override
  Widget build(BuildContext context) {
    var userConfigBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userConfigBox.getAt(0)!;

    return isJsonAnimation
        ? FlutterSplashScreen(
            useImmersiveMode: true,
            duration: const Duration(milliseconds: 2650),
            nextScreen: (userData.token != null)
                ? const Wallets()
                : const Authentication(),
            backgroundColor: AppColors.mainBackgroundDarkColor,
            splashScreenBody: Center(
              child: Lottie.asset('assets/splash/splash_screen.json'),
            ),
          )
        : FlutterSplashScreen.scale(
            backgroundColor: AppColors.mainBackgroundDarkColor,
            childWidget: SizedBox(
              width: 300.w,
              height: 100.h,
              child: SvgPicture.asset('assets/splash/splash_screen.svg'),
            ),
            duration: const Duration(milliseconds: 1500),
            animationDuration: const Duration(milliseconds: 1000),
            nextScreen: (userData.token != null)
                ? const Wallets()
                : const Authentication(),
          );
  }
}
