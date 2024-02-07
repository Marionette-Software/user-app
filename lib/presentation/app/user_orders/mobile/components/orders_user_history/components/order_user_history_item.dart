import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/platform/platform_utils.dart';
import 'package:user_app/domain/trade/user_orders/user_order.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class OrderUserHistoryItemMobile extends HookConsumerWidget {
  const OrderUserHistoryItemMobile({
    super.key,
    required this.item,
  });

  final UserOrderItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, bottom: 15..h, top: 15..h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                capitalize(item.side),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.75.sp,
                      color: item.side == 'sell'
                          ? Theme.of(context).colorScheme.error
                          : MainColorsApp.greenColor,
                    ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                '${item.market.split('-')[0].toUpperCase()}/${item.market.split('-')[1].toUpperCase()}',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.75.sp,
                    ),
              ),
              Text(
                ' (${capitalize(item.type)})',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.75.sp,
                    ),
              ),
            ],
          ),
          SizedBox(height: 15..h),
          Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('trade.date'),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.65.sp,
                            color: isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : Colors.white.withOpacity(0.5),
                          ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 4..h,
                    ),
                    Text(
                      PlatformUtils.convertDateTime(item.date),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.65.sp,
                          ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('trade.price'),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.65.sp,
                            color: isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : Colors.white.withOpacity(0.5),
                          ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 4..h,
                    ),
                    Text(
                      item.type == 'market'
                          ? '≈${abbreviateNumber(number: item.executed / item.total, precision: item.marketItem.tradingPricePrecision!)}'
                          : abbreviateNumber(
                              number: item.price,
                              precision: item.marketItem.tradingPricePrecision!,
                            ),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.65.sp,
                          ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('trade.status'),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.65.sp,
                            color: isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : Colors.white.withOpacity(0.5),
                          ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 4..h,
                    ),
                    Text(
                      item.status == 'canceled' && item.total != 0
                          ? tr('trade.partially_executed')
                          : capitalize(item.status),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.65.sp,
                          ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15..h,
          ),
          Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('trade.amount'),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.65.sp,
                            color: isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : Colors.white.withOpacity(0.5),
                          ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 4..h,
                    ),
                    Text(
                      abbreviateNumber(
                        number: item.amount,
                        precision: item.marketItem.tradingAmountPrecision!,
                      ),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.65.sp,
                          ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('trade.total'),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.65.sp,
                            color: isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : Colors.white.withOpacity(0.5),
                          ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 4..h,
                    ),
                    Text(
                      abbreviateNumber(
                        number: item.executed,
                        precision: item.marketItem.quoteCurrencyPrecision!,
                      ),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.65.sp,
                          ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
