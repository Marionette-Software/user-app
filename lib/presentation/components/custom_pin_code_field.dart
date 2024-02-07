import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:pinput/pinput.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class CustomPinCodeField extends StatelessWidget {
  const CustomPinCodeField({
    required this.platformType,
    required this.onCompleted,
    required this.pinCodeLength,
    required this.controllerPin,
    super.key,
  });

  final Function(String value) onCompleted;
  final PlatformTypeState platformType;
  final int pinCodeLength;
  final TextEditingController controllerPin;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      focusedPinTheme: PinTheme(
        width: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 50,
          tabletValue: 40,
          mobileValue: 30,
        ),
        height: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 50,
          tabletValue: 40,
          mobileValue: 30,
        ).h,
        textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 40,
                tabletValue: 40,
                mobileValue: 20,
              ).sp,
              fontWeight: FontWeight.w600,
            ),
        constraints: BoxConstraints(
            minWidth: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 50,
              tabletValue: 40,
              mobileValue: 30,
            ),
            minHeight: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 50,
              tabletValue: 40,
              mobileValue: 30,
            ).h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2.w,
              color: MainColorsApp.accentColor,
            ),
          ),
        ),
      ),
      defaultPinTheme: PinTheme(
        width: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 50,
          tabletValue: 40,
          mobileValue: 30,
        ),
        height: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 50,
          tabletValue: 40,
          mobileValue: 30,
        ).h,
        textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 40,
                tabletValue: 40,
                mobileValue: 20,
              ).sp,
              fontWeight: FontWeight.w600,
            ),
        constraints: BoxConstraints(
            minWidth: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 50,
              tabletValue: 40,
              mobileValue: 30,
            ),
            minHeight: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 50,
              tabletValue: 40,
              mobileValue: 30,
            ).h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2.w,
              color: isLightTheme(context)
                  ? AppColors.aboutHeaderLight
                  : AppColors.whiteColor.withOpacity(0.25),
            ),
          ),
        ),
      ),
      controller: controllerPin,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      onChanged: (String value) {},
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: const TextInputType.numberWithOptions(),
      length: pinCodeLength,
      showCursor: true,
      autofocus: true,
      onCompleted: (String value) {
        onCompleted(value);
      },
    );
  }
}
