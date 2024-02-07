import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:slider_captcha/slider_capchar.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class CaptchaDialogWeb extends StatefulWidget {
  const CaptchaDialogWeb({super.key});

  @override
  CaptchaDialogWebState createState() => CaptchaDialogWebState();
}

class CaptchaDialogWebState extends State<CaptchaDialogWeb> {
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
    return AlertDialog(
      title: Text(
        'Please confirm you are not a robot'.hardcoded,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: -1.5.sp,
            ),
      ),
      contentPadding: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
        bottom: 38.h,
        top: 35.h,
      ),
      alignment: Alignment.center,
      backgroundColor:
          isLightTheme(context) ? AppColors.whiteColor : walletBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
        side: const BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
      ),
      content: SliderCaptcha(
        captchaSize: 200.w,
        controller: controller,
        image: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(
            'assets/icons/captcha_image.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        titleStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.whiteColor,
              letterSpacing: -1.sp,
              fontSize: 20.sp,
            ),
        imageToBarPadding: 25.h,
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
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
