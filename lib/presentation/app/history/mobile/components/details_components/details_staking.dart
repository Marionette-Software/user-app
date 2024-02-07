import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/app/history/mobile/components/details_components/components/detail_item_component_mobile.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class DetailStakingComponentMobile extends StatelessWidget {
  const DetailStakingComponentMobile({
    super.key,
    required this.iconUrl,
    required this.currency,
    required this.date,
    required this.type,
    required this.amount,
    required this.precision,
    this.isShowModalBottom = false,
  });
  final String iconUrl;
  final String currency;
  final String date;
  final String type;
  final String amount;
  final int precision;
  final bool isShowModalBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          top: 15..h,
        ),
        child: Column(
          children: [
            isShowModalBottom
                ? Container(
                    width: 60.w,
                    height: 5..h,
                    padding: EdgeInsets.only(bottom: 25..h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.r),
                      color: isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.25),
                    ),
                  )
                : const SizedBox(),
            Container(
              width: double.infinity,
              height: 40..h,
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isLightTheme(context)
                        ? AppColors.separatorLightTheme
                        : AppColors.separatorDarkTheme,
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Currency',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 15.sp,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                  ),
                  const Spacer(),
                  UserAppImage(
                    clipBehavior: Clip.hardEdge,
                    path: iconUrl,
                    width: 20.w,
                    height: 20.h,
                    isNetwork: true,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    currency,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                ],
              ),
            ),
            DetailItemComponentMobile(
              isBorder: true,
              name: tr('history.date'),
              value: date,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponentMobile(
              isBorder: true,
              name: tr('history.type'),
              value: type,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponentMobile(
              isBorder: false,
              name: tr('history.amount'),
              value: numberFormatWithPrecision(precision)
                  .format(double.parse(amount))
                  .toString(),
              valueColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
