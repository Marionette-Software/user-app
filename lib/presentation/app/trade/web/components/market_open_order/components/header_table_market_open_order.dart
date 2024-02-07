import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class HeaderMarketOpenOrderWeb extends StatelessWidget {
  const HeaderMarketOpenOrderWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 45.w,
        top: 25.h,
        bottom: 21.h,
        right: 100.w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 76.w,
            child: Text(
              tr('trade.date'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
            width: 132.w,
            child: Text(
              tr('trade.market_pair'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
            width: 40.w,
            child: Text(
              tr('trade.side'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
            width: 40.w,
            child: Text(
              tr('trade.type'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
            width: 105.w,
            child: Text(
              tr('trade.price'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
            width: 105.w,
            child: Text(
              tr('trade.amount'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
            width: 105.w,
            child: Text(
              tr('trade.total'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
            width: 75.w,
            child: Text(
              tr('trade.executed'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
