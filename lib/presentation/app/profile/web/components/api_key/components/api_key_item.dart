import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/api_key/api_key_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/format_date.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ApiKeyItemWeb extends HookConsumerWidget {
  const ApiKeyItemWeb({
    required this.onTap,
    required this.item,
    super.key,
  });

  final ApiKeyState item;
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: Container(
        width: 550.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: isLightTheme(context) ? cardColor : walletBackgroundColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Center(
                        child: Text(
                          tr('profile.description'),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                color: isLightTheme(context)
                                    ? Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5)
                                    : AppColors.whiteColor.withOpacity(0.25),
                                fontSize: 20.sp,
                              ),
                        ),
                      ),
                      Center(
                        child: Text(
                          item.description,
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 20.sp,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Center(
                        child: Text(
                          tr('profile.expires'),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                color: isLightTheme(context)
                                    ? Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5)
                                    : AppColors.whiteColor.withOpacity(0.25),
                                fontSize: 20.sp,
                              ),
                        ),
                      ),
                      Center(
                        child: Text(
                          formatTimestamp(item.expires),
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 20.sp,
                                  ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              InkWell(
                onTap: onTap,
                child: Container(
                  width: 105.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      width: 1,
                      color: MainColorsApp.accentColor,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          tr('profile.delete'),
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: isLightTheme(context)
                                        ? MainColorsApp.accentColor
                                        : AppColors.whiteColor,
                                    fontSize: 20.sp,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
