import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class WalletGradientButton extends StatelessWidget {
  const WalletGradientButton({
    super.key,
    this.isActive = true,
    required this.onTap,
    required this.text,
    this.height = 60,
  });

  final Function() onTap;
  final String text;
  final double height;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: double.infinity,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: isActive
              ? Theme.of(context).primaryColorLight
              : isLightTheme(context)
                  ? MainColorsApp.cardColor
                  : AppColors.whiteColor.withOpacity(0.05),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: isActive
                      ? AppColors.whiteColor
                      : isLightTheme(context)
                          ? Theme.of(context).primaryColor.withOpacity(0.25)
                          : AppColors.whiteColor.withOpacity(0.25),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1.sp,
                ),
          ),
        ),
      ),
    );
  }
}
