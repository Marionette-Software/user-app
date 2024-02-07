import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';

class AppBenefitsRowMobile extends StatelessWidget {
  const AppBenefitsRowMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 25.h,
        left: 20.w,
        right: 20.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 9.5.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: MainColorsApp.accentColor,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Text(
              tr('authorization.custodial_wallet'),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                  ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 9.5.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: MainColorsApp.accentColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                tr('authorization.swap_exchange'),
                maxLines: 1,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                    ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 9.5.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: MainColorsApp.accentColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                tr('authorization.trading_platform'),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
