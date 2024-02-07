import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class PlatformCommissionRowMobile extends StatelessWidget {
  const PlatformCommissionRowMobile({
    required this.platformCommission,
    super.key,
  });

  final String platformCommission;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tr('wallet.platform_commission'),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: isLightTheme(context)
                      ? AppColors.aboutHeaderLight
                      : AppColors.whiteColor.withOpacity(0.5),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.65.sp,
                ),
          ),
          Text(
            platformCommission,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.65.sp,
                ),
          ),
        ],
      ),
    );
  }
}
