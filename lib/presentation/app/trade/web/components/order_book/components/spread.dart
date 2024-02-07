import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SpreadRowWeb extends HookConsumerWidget {
  const SpreadRowWeb({required this.spreadValue, super.key});

  final String spreadValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
        top: 11.h,
        bottom: 11.h,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isLightTheme(context)
                  ? AppColors.mainBackgroundLightColor
                  : AppColors.whiteColor.withOpacity(0.05),
              width: 2.w,
            ),
            top: BorderSide(
              color: isLightTheme(context)
                  ? AppColors.mainBackgroundLightColor
                  : AppColors.whiteColor.withOpacity(0.05),
              width: 2.w,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 9.h,
            bottom: 9.h,
            left: 15.w,
            right: 15.w,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                spreadValue,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1.5.sp,
                    ),
              ),
              const Spacer(),
              Text(
                'Spread'.hardcoded,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 15.sp,
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
