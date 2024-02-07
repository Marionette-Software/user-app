import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/trade/user_orders/user_order.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/formatters/format_date.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';

class MarketOrderHistoryItemWeb extends HookConsumerWidget {
  const MarketOrderHistoryItemWeb({required this.item, super.key});

  final UserOrderItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeMarketWatch = ref.watch(selectMarketsNotifierProvider);

    return Padding(
      padding: EdgeInsets.only(
        right: 25.w,
        left: 25.w,
      ),
      child: Container(
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            width: 1.w,
            color: AppColors.mainBackgroundLightColor,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 17.w,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 76.w,
                child: Text(
                  formatShortDate(item.date),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              SizedBox(
                width: 132.w,
                child: Text(
                  textAlign: TextAlign.start,
                  '${item.market.split('-')[0].toUpperCase()}/${item.market.split('-')[1].toUpperCase()}',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              SizedBox(
                width: 47.w,
                child: Text(
                  capitalize(item.side),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                        color: item.side == 'sell'
                            ? Theme.of(context).colorScheme.error
                            : MainColorsApp.greenColor,
                      ),
                ),
              ),
              SizedBox(
                width: 47.w,
                child: Text(
                  capitalize(item.type),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              SizedBox(
                width: 105.w,
                child: Text(
                  item.type == 'market'
                      ? '≈${abbreviateNumber(number: item.executed / item.total, precision: item.marketItem.tradingPricePrecision!)}'
                      : abbreviateNumber(
                          number: item.price,
                          precision: item.marketItem.tradingPricePrecision!,
                        ),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              SizedBox(
                width: 105.w,
                child: Text(
                  abbreviateNumber(
                    number: item.amount,
                    precision: activeMarketWatch.trading_amount_precision,
                  ),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              SizedBox(
                width: 105.w,
                child: Text(
                  '${((100 * item.total) / item.amount).toStringAsFixed(2)}%',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              SizedBox(
                width: 75.w,
                child: Text(
                  item.status == 'canceled' && item.total != 0
                      ? tr('trade.partially_executed')
                      : capitalize(item.status),
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
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
