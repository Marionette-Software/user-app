import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/app/history/mobile/components/details_components/components/detail_item_component_mobile.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class DetailTradeComponentMobile extends StatelessWidget {
  const DetailTradeComponentMobile({
    super.key,
    required this.iconUrlFrom,
    required this.iconUrlTo,
    required this.currency,
    required this.date,
    required this.type,
    required this.rate,
    required this.amount,
    required this.total,
    required this.side,
    required this.showPriceTotal,
  });

  final String iconUrlFrom;
  final String iconUrlTo;
  final String currency;
  final String date;
  final String type;
  final String rate;
  final String amount;
  final String total;
  final String side;
  final bool showPriceTotal;

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
            Container(
              width: 400.w,
              height: 50..h,
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
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 15.sp,
                          letterSpacing: -0.75.sp,
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                  ),
                  const Spacer(),
                  UserAppImage(
                    clipBehavior: Clip.hardEdge,
                    path: iconUrlFrom,
                    width: 20.w,
                    height: 20.h,
                    isNetwork: true,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    currency,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
            showPriceTotal
                ? DetailItemComponentMobile(
                    isBorder: true,
                    name: tr('history.price'),
                    value: rate,
                    valueColor: Theme.of(context).primaryColor,
                  )
                : const SizedBox(),
            DetailItemComponentMobile(
              isBorder: true,
              name: tr('history.side'),
              value: side,
              valueColor: side == 'Sell'
                  ? Theme.of(context).colorScheme.error
                  : MainColorsApp.greenColor,
            ),
            DetailItemComponentMobile(
              isBorder: true,
              name: tr('history.amount'),
              value: amount,
              valueColor: Theme.of(context).primaryColor,
            ),
            showPriceTotal
                ? DetailItemComponentMobile(
                    isBorder: false,
                    name: tr('history.total'),
                    value: total,
                    valueColor: Theme.of(context).primaryColor,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
