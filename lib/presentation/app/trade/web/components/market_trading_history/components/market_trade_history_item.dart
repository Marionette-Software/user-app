import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/create_order_with_order_book_provider.dart';
import 'package:user_app/application/trade/error_mesegge_provider.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/format_date.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';

class MarketTradeHistoryItem extends HookConsumerWidget {
  const MarketTradeHistoryItem({
    Key? key,
    required this.price,
    required this.amount,
    required this.createdAt,
    required this.side,
  }) : super(key: key);

  final double price;
  final double amount;
  final String createdAt;
  final String side;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeMarketWatch = ref.watch(selectMarketsNotifierProvider);

    final marketPercentState = ref.read(marketPercentProviderProvider.notifier);
    final marketOrLimitProviderState = ref.read(marketOrLimitProvider.notifier);

    final priceWithOrderBookRead =
        ref.read(priceWithOrderBookProvider.notifier);
    final amountWithOrderBookRead =
        ref.read(amountWithOrderBookProvider.notifier);

    final errorMinOrMaxPriceRead =
        ref.read(errorMinOrMaxPriceProvider.notifier);
    final errorMinAmountRead = ref.read(errorMinAmountProvider.notifier);

    return Padding(
      padding: EdgeInsets.only(
        right: 15.w,
      ),
      child: InkWell(
        hoverColor: side != 'sell'
            ? MainColorsApp.redColor.withOpacity(0.5)
            : MainColorsApp.greenColor.withOpacity(0.5),
        onTap: () {
          priceWithOrderBookRead.state = 0;
          amountWithOrderBookRead.state = 0;

          errorMinOrMaxPriceRead.state = false;
          errorMinAmountRead.state = false;

          marketOrLimitProviderState.state = OrderType.limit;
          marketPercentState.state = 0;

          priceWithOrderBookRead.state = price;

          amountWithOrderBookRead.state = activeMarketWatch.trading_min_amount;
        },
        child: Row(
          children: [
            SizedBox(
              width: 90.w,
              child: Text(
                numberFormatWithPrecision(
                        activeMarketWatch.trading_price_precision)
                    .format(price),
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.75.sp,
                      color: side != 'sell'
                          ? MainColorsApp.redColor
                          : MainColorsApp.greenColor,
                    ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 90.w,
              child: Text(
                abbreviateNumber(
                  number: amount,
                  precision: activeMarketWatch.trading_amount_precision,
                ),
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.75.sp,
                    ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 90.w,
              child: Text(
                formatShortDate(createdAt).toString().split(' ').last,
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
      ),
    );
  }
}
