import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/api_key/api_key_state.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/format_date.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ApiKeyItemMobile extends HookConsumerWidget {
  const ApiKeyItemMobile({
    required this.onTap,
    required this.item,
    super.key,
  });

  final ApiKeyState item;
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 60..h,
      decoration: BoxDecoration(
        color: isLightTheme(context)
            ? AppColors.mainBackgroundLightColor
            : AppColors.whiteColor.withOpacity(0.05),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr('profile.description'),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : AppColors.whiteColor.withOpacity(0.5),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.75.sp,
                          ),
                    ),
                    SizedBox(
                      width: 220.w,
                      child: Text(
                        item.description,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.75.sp,
                                ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5..h,
                ),
                Row(
                  children: [
                    Center(
                      child: Text(
                        tr('profile.expires'),
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: isLightTheme(context)
                                      ? AppColors.aboutHeaderLight
                                      : AppColors.whiteColor.withOpacity(0.5),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.75.sp,
                                ),
                      ),
                    ),
                    Center(
                      child: Text(
                        formatTimestamp(item.expires),
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.75.sp,
                                ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            InkWell(
              onTap: onTap,
              child: SvgPicture.asset(
                dumpIcon,
                colorFilter: const ColorFilter.mode(
                  MainColorsApp.redColor,
                  BlendMode.srcIn,
                ),
                width: 21.w,
                height: 23..h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
