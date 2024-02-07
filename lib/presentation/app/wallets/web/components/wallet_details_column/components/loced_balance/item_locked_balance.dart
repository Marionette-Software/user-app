import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ItemLockedBalance extends StatelessWidget {
  const ItemLockedBalance({
    required this.title,
    required this.lockedBalance,
    super.key,
  });

  final String title;
  final String lockedBalance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 550.w,
      height: 80.h,
      padding: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
      ),
      decoration: BoxDecoration(
        color: isLightTheme(context) ? cardColor : walletBackgroundColor,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: isLightTheme(context)
                      ? Theme.of(context).primaryColor.withOpacity(0.5)
                      : AppColors.whiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                lockedBalance,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: isLightTheme(context)
                          ? Theme.of(context).primaryColor.withOpacity(0.5)
                          : AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.lock,
                size: 14.w,
                color: isLightTheme(context)
                    ? AppColors.darkColorText.withOpacity(0.5)
                    : AppColors.whiteColor.withOpacity(0.5),
              ),
            ],
          )
        ],
      ),
    );
  }
}
