import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class HeaderMarketListWeb extends StatelessWidget {
  const HeaderMarketListWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 145.w,
            child: Row(
              children: [
                Text(
                  'Market',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                        color: isLightTheme(context)
                            ? AppColors.aboutHeaderLight
                            : AppColors.whiteColor.withOpacity(0.5),
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 103.w,
            child: Text(
              'Price',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.75.sp,
                    color: isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : AppColors.whiteColor.withOpacity(0.5),
                  ),
            ),
          ),
          SizedBox(
              width: 70.w,
              child: Text(
                '24h chg',
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.75.sp,
                      color: isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.5),
                    ),
              )),
        ],
      ),
    );
  }
}
