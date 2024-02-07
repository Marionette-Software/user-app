import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/app/history/web/components/details_components/components/detail_item_component.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class DetailBalanceTransferComponent extends StatelessWidget {
  const DetailBalanceTransferComponent({
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
      width: 402.w,
      height: 535.h,
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
                : AppColors.whiteColor.withOpacity(0),
          ],
        ),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          isLightTheme(context)
              ? BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                )
              : BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 25.h,
          left: 25.w,
          right: 25.w,
        ),
        child: Column(
          children: [
            Text(
              tr('history.details'),
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 30.sp,
                  ),
            ),
            Container(
              height: 80.h,
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
                          fontSize: 20.sp,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                  ),
                  const Spacer(),
                  UserAppImage(
                    clipBehavior: Clip.hardEdge,
                    path: iconUrl!,
                    width: 35.w,
                    height: 35.h,
                    isNetwork: true,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    currency,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 20.sp,
                        ),
                  ),
                ],
              ),
            ),
            DetailItemComponent(
              isBorder: true,
              name: tr('history.date'),
              value: date,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponent(
              isBorder: true,
              name: tr('history.type'),
              value: type,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponent(
              isBorder: true,
              name: tr('history.from'),
              value: from,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponent(
              isBorder: true,
              name: tr('history.to'),
              value: to,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponent(
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
