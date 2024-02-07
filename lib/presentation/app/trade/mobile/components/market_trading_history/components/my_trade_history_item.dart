import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/trade/trade_history/trade_history_item.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/format_date.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';

class MyTradeItemMobile extends HookConsumerWidget {
  const MyTradeItemMobile({required this.item, super.key});

  final TradeHistoryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectMarketWatch = ref.watch(selectMarketsNotifierProvider);

    return Row(
      children: [
        SizedBox(
          width: 110.w,
          height: 15.h,
          child: Text(
            item.price
                .toStringAsFixed(selectMarketWatch.trading_price_precision),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.65.sp,
                  color: item.side == 'buy'
                      ? MainColorsApp.greenColor
                      : MainColorsApp.redColor,
                ),
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 15.h,
          width: 80.w,
          child: Text(
            abbreviateNumber(
              number: item.amount,
              precision: selectMarketWatch.trading_amount_precision,
            ),
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.65.sp,
                ),
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 15.h,
          width: 80.w,
          child: Text(
            formatShortDate(item.date).toString().split(' ').last,
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.65.sp,
                ),
          ),
        ),
      ],
    );
  }
}
