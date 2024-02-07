import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class HeaderMarketOrderHistoryWeb extends StatelessWidget {
  const HeaderMarketOrderHistoryWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 25.h,
        bottom: 21.h,
        left: 45.w,
        right: 45.w,
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
            width: 132.w,
            child: Text(
              'Market pair'.hardcoded,
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
              'Side',
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
              'Type',
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
            width: 105.w,
            child: Text(
              'Price',
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
            width: 105.w,
            child: Text(
              'Amount',
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
            width: 105.w,
            child: Text(
              'Executed',
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
            width: 75.w,
            child: Text(
              'Status',
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
