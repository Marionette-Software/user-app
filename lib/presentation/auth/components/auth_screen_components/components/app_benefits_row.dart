import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';

class AppBenefitsRow extends StatelessWidget {
  const AppBenefitsRow({
    Key? key,
    this.platformType = PlatformTypeState.web,
  }) : super(key: key);

  final PlatformTypeState platformType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: platformType == PlatformTypeState.web
            ? 25.h
            : platformType == PlatformTypeState.tablet
                ? 15.h
                : 25.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: platformType == PlatformTypeState.web
                ? 160.w
                : platformType == PlatformTypeState.tablet
                    ? 128.w
                    : 124.w,
            height: platformType == PlatformTypeState.web ? 44.h : 28.h,
            decoration: BoxDecoration(
              color: MainColorsApp.accentColor,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                tr('authorization.custodial_wallet'),
                maxLines: 1,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            width: platformType == PlatformTypeState.web
                ? 25.w
                : platformType == PlatformTypeState.tablet
                    ? 15.w
                    : 8.w,
          ),
          Container(
            width: platformType == PlatformTypeState.web
                ? 160.w
                : platformType == PlatformTypeState.tablet
                    ? 128.w
                    : 124.w,
            height: platformType == PlatformTypeState.web ? 44.h : 28.h,
            decoration: BoxDecoration(
              color: MainColorsApp.accentColor,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Center(
              child: Text(
                tr('authorization.swap_exchange'),
                textAlign: TextAlign.center,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
              ),
            ),
          ),
          SizedBox(
            width: platformType == PlatformTypeState.web
                ? 25.w
                : platformType == PlatformTypeState.tablet
                    ? 15.w
                    : 8.w,
          ),
          Container(
            width: platformType == PlatformTypeState.web
                ? 160.w
                : platformType == PlatformTypeState.tablet
                    ? 128.w
                    : 124.w,
            height: platformType == PlatformTypeState.web ? 44.h : 28.h,
            decoration: BoxDecoration(
              color: MainColorsApp.accentColor,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Center(
              child: Text(
                tr('authorization.trading_platform'),
                textAlign: TextAlign.center,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
