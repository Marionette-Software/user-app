import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class BuyItemOption extends StatelessWidget {
  const BuyItemOption({
    required this.optionIcon,
    required this.optionTitle,
    super.key,
  });

  final String optionIcon;
  final String optionTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15..h),
      child: Container(
        width: double.infinity,
        height: 80..h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.whiteColor.withOpacity(0.05),
          border: isLightTheme(context)
              ? Border.all(
                  width: 1,
                  color: AppColors.mainBackgroundLightColor,
                )
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              optionTitle == 'Wire transfer'
                  ? SizedBox(
                      width: 38.w,
                      height: 26..h,
                      child: SvgPicture.asset(
                        optionIcon,
                        width: 38.w,
                        height: 26..h,
                        colorFilter: ColorFilter.mode(
                          isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColor.withOpacity(0.5),
                          BlendMode.srcIn,
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 38.w,
                      height: 26..h,
                      child: SvgPicture.asset(
                        optionIcon,
                        width: 38.w,
                        height: 26..h,
                      ),
                    ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                optionTitle,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      letterSpacing: -0.75.sp,
                    ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_sharp,
                size: 12..h,
                color: isLightTheme(context)
                    ? AppColors.aboutHeaderLight
                    : AppColors.whiteColor.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
