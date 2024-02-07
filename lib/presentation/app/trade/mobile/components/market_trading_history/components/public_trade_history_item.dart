import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/create_order_with_order_book_provider.dart';
import 'package:user_app/application/trade/error_mesegge_provider.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/tranding_tab_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/domain/trade/trade_history/trade_history_item.dart';
import 'package:user_app/presentation/app/trade/mobile/trade_buy_sell_mobile_screen.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/format_date.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';

class PublicTradeHistoryItemMobile extends HookConsumerWidget {
  const PublicTradeHistoryItemMobile({required this.item, super.key});

  final TradeHistoryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketOrLimitProviderWatch = ref.watch(marketOrLimitProvider);
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);
    final tradingTabState = ref.read(tradingTabProvider.notifier);

    final marketOrLimitProviderState = ref.read(marketOrLimitProvider.notifier);

    final priceWithOrderBookRead =
        ref.read(priceWithOrderBookProvider.notifier);
    final amountWithOrderBookRead =
        ref.read(amountWithOrderBookProvider.notifier);

    final errorMinOrMaxPriceRead =
        ref.read(errorMinOrMaxPriceProvider.notifier);
    final errorMinAmountRead = ref.read(errorMinAmountProvider.notifier);

    final priceController = TextEditingController();
    final amountController = TextEditingController();
    final totalController = TextEditingController();

    return InkWell(
      onTap: () {
        tradingTabState.state = item.side != 'sell' ? 2 : 1;

        var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
        GlobalConfigData globalData = box.getAt(0)!;

        priceWithOrderBookRead.state = 0;
        amountWithOrderBookRead.state = 0;

        errorMinOrMaxPriceRead.state = false;
        errorMinAmountRead.state = false;

        marketOrLimitProviderState.state = OrderType.limit;

        priceController.text = marketOrLimitProviderWatch == OrderType.market
            ? marketDataWatch.marketDynamics!.lastPrice!
                .toStringAsFixed(marketDataWatch.trading_price_precision)
            : item.price
                .toStringAsFixed(marketDataWatch.trading_price_precision);

        amountController.text = marketDataWatch.trading_min_amount.toStringAsFixed(marketDataWatch.trading_amount_precision);

        totalController.text = marketOrLimitProviderWatch == OrderType.market
            ? '≈ ${0.toStringAsFixed(marketDataWatch.quote_currency.precision)}'
            : 0.toStringAsFixed(marketDataWatch.quote_currency.precision);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TradeBuySellScreenMobile(
              item: marketDataWatch,
              tradingTabWatch: item.side != 'sell' ? 2 : 1,
              priceController: priceController,
              amountController: amountController,
              totalController: totalController,
              withTradingBalance: globalData.withTradingBalance,
              platformType: PlatformTypeState.mobile,
            ),
          ),
        );
      },
      child: Row(
        children: [
          SizedBox(
            width: 110.w,
            child: Text(
              item.price
                  .toStringAsFixed(marketDataWatch.trading_price_precision),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 13.sp,
                    color: item.side != 'sell'
                        ? MainColorsApp.redColor
                        : MainColorsApp.greenColor,
                  ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 80.w,
            child: Text(
              abbreviateNumber(
                number: item.amount,
                precision: marketDataWatch.trading_amount_precision,
              ),
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 13.sp,
                  ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 80.w,
            child: Text(
              formatShortDate(item.date).toString().split(' ').last,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 13.sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
