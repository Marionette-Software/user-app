import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SpreadRowMobile extends HookConsumerWidget {
  const SpreadRowMobile({required this.spreadValue, super.key});

  final String spreadValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 10..h),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isLightTheme(context)
                  ? AppColors.mainBackgroundLightColor
                  : AppColors.whiteColor.withOpacity(0.05),
              width: 2..h,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            bottom: 10..h,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                spreadValue,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.75.sp,
                    ),
              ),
              const Spacer(),
              Text(
                'Spread'.hardcoded,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.65.sp,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
