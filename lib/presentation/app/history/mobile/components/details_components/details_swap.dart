import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/app/history/mobile/components/details_components/components/detail_item_component_mobile.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class DetailSwapComponentMobile extends StatelessWidget {
  const DetailSwapComponentMobile({
    super.key,
    required this.iconUrlFrom,
    required this.iconUrlTo,
    required this.currency,
    required this.date,
    required this.type,
    required this.side,
    required this.rate,
    required this.total,
    required this.precision,
    required this.buyAmount,
    required this.sellAmount,
    required this.ratePrecision,
    this.isShowModalBottom = false,
  });
  final String iconUrlFrom;
  final String iconUrlTo;
  final String currency;
  final String date;
  final String type;
  final String side;
  final String rate;
  final String sellAmount;
  final String buyAmount;
  final String total;
  final int precision;
  final bool isShowModalBottom;
  final int ratePrecision;

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
                children: [
                  Text(
                    tr('history.market_pair'),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 15.sp,
                          letterSpacing: -0.75.sp,
                          fontWeight: FontWeight.w500,
                          color: isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColorText.withOpacity(0.5),
                        ),
                  ),
                  const Spacer(),
                  UserAppImage(
                    clipBehavior: Clip.hardEdge,
                    path: iconUrlFrom,
                    width: 20.w,
                    height: 20..h,
                    isNetwork: true,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    currency,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 15.sp,
                          letterSpacing: -0.75.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  UserAppImage(
                    clipBehavior: Clip.hardEdge,
                    path: iconUrlTo,
                    width: 20.w,
                    height: 20..h,
                    isNetwork: true,
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
              isBorder: true,
              name: tr('history.sell'),
              value: sellAmount,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponentMobile(
              isBorder: true,
              name: tr('history.buy'),
              value: buyAmount,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponentMobile(
              isBorder: false,
              name: tr('history.rate'),
              value: numberFormatWithPrecision(ratePrecision).format(
                double.parse(rate),
              ),
              valueColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
