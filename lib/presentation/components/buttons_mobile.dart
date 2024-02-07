import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/presentation/components/flat_custom_button.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class BackButtonMobile extends StatelessWidget {
  final VoidCallback? onTap;
  const BackButtonMobile({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FlatCustomButton(
      width: 70.w,
      height: 20.h,
      radius: 21.r,
      onTap: onTap,
      color: AppColors.mobileBackButtonColor,
      splashColor: AppColors.mobileBackButtonColor.withOpacity(0.8),
      margin: const EdgeInsets.only(right: 10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 12.sp,
            ),
            SizedBox(width: 2.w),
            Text(
              'Back',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 13.sp,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.65.sp,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchButtonMobile extends StatelessWidget {
  final VoidCallback? onTap;
  const SearchButtonMobile({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FlatCustomButton(
      width: 70.w,
      height: 25.h,
      radius: 21.r,
      onTap: onTap,
      color: AppColors.mobileBackButtonColor,
      splashColor: Colors.transparent,
      child: Center(
          child: SvgPicture.asset(
        lookingGlass,
        height: 13.h,
        width: 13.w,
      )),
    );
  }
}

class MobileAppBarButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String picPath;
  const MobileAppBarButton({super.key, this.onTap, required this.picPath});

  @override
  Widget build(BuildContext context) {
    return FlatCustomButton(
      width: 70.w,
      height: 20.h,
      radius: 21.r,
      onTap: onTap,
      color: AppColors.mobileBackButtonColor,
      splashColor: Colors.transparent,
      child: Center(
          child: SvgPicture.asset(
            picPath,
            height: 13.h,
            width: 13.w,
          )),
    );
  }
}

class MobileGenericButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final Color? color;
  final double? height;
  final EdgeInsets? padding;
  const MobileGenericButton({super.key, this.onTap, this.child, this.color, this.height, this.padding});

  @override
  Widget build(BuildContext context) {
    return FlatCustomButton(
      // width: 70.w,
      height: height ?? 20.h,
      radius: 21.r,
      onTap: onTap,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 15.w),
      color: color ?? AppColors.mobileBackButtonColor,
      splashColor: Colors.transparent,
      child: Center(
          child: child),
    );
  }
}

class MarketButtonSelectMobile extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function(String market)? onTap;
  const MarketButtonSelectMobile(
      {super.key, this.onTap, required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          onTap!(text);
        },
        borderRadius: BorderRadius.circular(21.r),
        splashColor: Colors.transparent,
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5..h),
          margin: EdgeInsets.only(left: 8.w, right: 6.w),
          decoration: BoxDecoration(
            color: isSelected
                ? isLightTheme(context)
                    ? AppColors.mainBackgroundDarkColor
                    : AppColors.whiteColor
                : isLightTheme(context)
                    ? AppColors.mainBackgroundLightColor
                    : AppColors.whiteColor.withOpacity(0.25),
            borderRadius: BorderRadius.circular(21.r),
          ),
          duration: const Duration(milliseconds: 300),
          child: IgnorePointer(
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 13.sp,
                    color: isSelected
                        ? isLightTheme(context)
                            ? AppColors.whiteColor
                            : AppColors.darkColorText
                        : isLightTheme(context)
                            ? AppColors.aboutHeaderLight
                            : AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.65.sp,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
