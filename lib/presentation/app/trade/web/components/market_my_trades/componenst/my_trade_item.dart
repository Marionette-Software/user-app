import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/trade/trade_history/trade_history_item.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/formatters/format_date.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';

class MyTradeItemWeb extends HookConsumerWidget {
  const MyTradeItemWeb({required this.item, super.key});

  final TradeHistoryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeMarketWatch = ref.watch(selectMarketsNotifierProvider);

    return Padding(
      padding: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 140.w,
            child: Text(
              formatShortDate(item.date),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
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
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: item.side == 'sell'
                        ? Theme.of(context).colorScheme.error
                        : MainColorsApp.greenColor,
                  ),
            ),
          ),
          SizedBox(
            width: 138.w,
            child: Text(
              numberFormatWithPrecision(
                      activeMarketWatch.trading_price_precision)
                  .format(item.price),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.75.sp,
                  ),
            ),
          ),
          SizedBox(
            width: 112.w,
            child: Text(
              numberFormatWithPrecision(
                      activeMarketWatch.trading_amount_precision)
                  .format(item.amount),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.75.sp,
                  ),
            ),
          ),
          SizedBox(
            width: 121.w,
            child: Text(
              numberFormatWithPrecision(
                      activeMarketWatch.quote_currency.precision)
                  .format(item.price * item.amount),
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.75.sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
