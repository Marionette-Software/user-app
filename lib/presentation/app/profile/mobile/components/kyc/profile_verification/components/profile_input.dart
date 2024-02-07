import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ProfileInputMobile extends StatelessWidget {
  const ProfileInputMobile({
    required this.controller,
    required this.hintText,
    required this.onValidator,
    required this.onChanged,
    required this.lengthLimiting,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final Function(String value) onValidator;
  final Function(String value) onChanged;
  final int lengthLimiting;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (String? value) {
        onChanged(value!);
      },
      validator: (String? value) {
        return onValidator(value!);
      },
      inputFormatters: [LengthLimitingTextInputFormatter(lengthLimiting)],
      decoration: InputDecoration(
        floatingLabelAlignment: FloatingLabelAlignment.center,
        filled: false,
        errorStyle: const TextStyle(
          fontSize: 0,
          height: 0,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.25),
            width: 5..h,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.25),
            width: 5..h,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: MainColorsApp.redColor, width: 5..h),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.25),
            width: 5..h,
          ),
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.75.sp,
            color: isLightTheme(context)
                ? AppColors.aboutHeaderLight
                : AppColors.whiteColor.withOpacity(0.5)),
        isCollapsed: false,
      ),
      style: TextStyle(
        fontSize: 15.sp,
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
        letterSpacing: -0.75.sp,
      ),
    );
  }
}
