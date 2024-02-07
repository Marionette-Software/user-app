import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:slider_captcha/slider_capchar.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class CaptchaDialogMobile extends StatefulWidget {
  const CaptchaDialogMobile({super.key});

  @override
  CaptchaDialogMobileState createState() => CaptchaDialogMobileState();
}

class CaptchaDialogMobileState extends State<CaptchaDialogMobile> {
  Timer? _timer;
  final SliderController controller = SliderController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _timer = Timer(const Duration(seconds: 25), () {
        context.pop(false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isLightTheme(context)
            ? AppColors.whiteColor
            : walletBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: 100..h,
          top: 10..h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.r),
                color: isLightTheme(context)
                    ? AppColors.aboutHeaderLight
                    : AppColors.whiteColor.withOpacity(0.5),
              ),
            ),
            SizedBox(
              height: 20..h,
            ),
            Text(
              'Please confirm you are not a robot'.hardcoded,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1.sp,
                  ),
            ),
            SizedBox(
              height: 20..h,
            ),
            SliderCaptcha(
              captchaSize: 200.w,
              controller: controller,
              image: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  'assets/icons/captcha_image.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              titleStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.75.sp,
                  color: AppColors.whiteColor),
              imageToBarPadding: 28..h,
              colorBar: MainColorsApp.accentColor,
              colorCaptChar: Colors.blueGrey,
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: MainColorsApp.accentColor,
              ),
              onConfirm: (value) async {
                context.pop(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
