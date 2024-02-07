import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/app/history/mobile/components/details_components/components/detail_item_component_mobile.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class DetailBalanceTransferComponentMobile extends StatelessWidget {
  const DetailBalanceTransferComponentMobile({
    super.key,
    required this.iconUrl,
    required this.currency,
    required this.type,
    required this.date,
    required this.from,
    required this.to,
    required this.amount,
    required this.precision,
  });
  final String? iconUrl;
  final String currency;
  final String type;
  final String date;
  final String from;
  final String to;
  final String amount;
  final int precision;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340..h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isLightTheme(context)
                ? AppColors.whiteColor
                : AppColors.whiteColor.withOpacity(0.1),
            isLightTheme(context)
                ? AppColors.whiteColor
                : AppColors.whiteColor.withOpacity(0.0),
          ],
        ),
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: isLightTheme(context)
                ? Colors.transparent
                : AppColors.whiteColor.withOpacity(0.25),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 15..h, left: 25.w, right: 25.w),
        child: Column(
          children: [
            SizedBox(
              width: 85.w,
              child: Divider(
                color: isLightTheme(context)
                    ? Theme.of(context).primaryColor.withOpacity(0.1)
                    : AppColors.whiteColor.withOpacity(0.8),
                thickness: 3,
              ),
            ),
            SizedBox(
              height: 16..h,
            ),
            Text(
              tr('history.details'),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 20.sp),
            ),
            Container(
              height: 50..h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).primaryColor.withOpacity(0.25),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    tr('history.currency'),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 15.sp,
                          letterSpacing: -0.75.sp,
                          fontWeight: FontWeight.w500,
                          color: isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColor.withOpacity(0.5),
                        ),
                  ),
                  const Spacer(),
                  UserAppImage(
                    clipBehavior: Clip.hardEdge,
                    path: iconUrl!,
                    width: 20.w,
                    height: 20..h,
                    isNetwork: true,
                  ),
                  SizedBox(width: 7.w),
                  Text(
                    currency,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 15.sp,
                          letterSpacing: -0.75.sp,
                          fontWeight: FontWeight.w500,
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
              isBorder: true,
              name: tr('history.from'),
              value: from,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponentMobile(
              isBorder: true,
              name: tr('history.to'),
              value: to,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponentMobile(
              isBorder: false,
              name: tr('history.amount'),
              value:
                  '${numberFormatWithPrecision(precision).format(double.parse(amount))} $currency',
              valueColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
