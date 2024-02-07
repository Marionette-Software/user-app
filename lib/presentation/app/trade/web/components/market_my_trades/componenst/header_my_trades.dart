import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class HeaderMyTradesWeb extends StatelessWidget {
  const HeaderMyTradesWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 25.h,
        bottom: 10.h,
        left: 15.w,
        right: 15.w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 140.w,
            child: Text(
              tr('trade.date'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 15.sp,
                    color: isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : AppColors.whiteColor.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.75.sp,
                  ),
            ),
          ),
          SizedBox(
            width: 47.w,
            child: Text(
              tr('trade.side'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 15.sp,
                    color: isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : AppColors.whiteColor.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.75.sp,
                  ),
            ),
          ),
          SizedBox(
            width: 138.w,
            child: Text(
              tr('trade.price'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 15.sp,
                    color: isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : AppColors.whiteColor.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.75.sp,
                  ),
            ),
          ),
          SizedBox(
            width: 112.w,
            child: Text(
              tr('trade.amount'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 15.sp,
                    color: isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : AppColors.whiteColor.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.75.sp,
                  ),
            ),
          ),
          SizedBox(
            width: 121.w,
            child: Text(
              tr('trade.total'),
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 15.sp,
                    color: isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : AppColors.whiteColor.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.75.sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
