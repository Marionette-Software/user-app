import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/persents_selector/components/order_selector_item.dart';

class OrderTypeSelector extends HookConsumerWidget {
  const OrderTypeSelector({
    super.key,
    required this.priceController,
    required this.amountController,
    required this.totalController,
    required this.errorMinAmount,
    required this.errorMinOrMaxPrice,
    required this.platformType,
  });
  final PlatformTypeState platformType;
  final TextEditingController priceController;
  final TextEditingController amountController;
  final TextEditingController totalController;
  final ValueNotifier<bool> errorMinAmount;
  final ValueNotifier<bool> errorMinOrMaxPrice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketOrLimitProviderState = ref.read(marketOrLimitProvider.notifier);
    final marketOrLimitProviderWatch = ref.watch(marketOrLimitProvider);
    final marketPercentState = ref.read(marketPercentProviderProvider.notifier);
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);

    return Padding(
      padding: EdgeInsets.only(
        top: 17.h,
        left: 38.w,
        bottom: 13.h,
      ),
      child: Row(
        children: [
          OrderSelectorItem(
            platformType: platformType,
            title: tr('trade.market'),
            onTap: () {
              priceController.text = marketDataWatch.marketDynamics!.lastPrice!
                  .toStringAsFixed(marketDataWatch.trading_price_precision);
              amountController.text =
                  0.toStringAsFixed(marketDataWatch.trading_amount_precision);
              totalController.text =
                  '≈ ${0.toStringAsFixed(marketDataWatch.quote_currency.precision)}';
              marketPercentState.state = 0;
              marketOrLimitProviderState.state = OrderType.market;
              errorMinAmount.value = false;
              errorMinOrMaxPrice.value = false;
            },
            active:
                marketOrLimitProviderWatch == OrderType.market ? true : false,
          ),
          SizedBox(
            width: 15.w,
          ),
          OrderSelectorItem(
            platformType: platformType,
            title: tr('trade.limit'),
            onTap: () {
              marketOrLimitProviderState.state = OrderType.limit;
              priceController.text =
                  0.toStringAsFixed(marketDataWatch.trading_price_precision);

              amountController.text =
                  0.toStringAsFixed(marketDataWatch.trading_amount_precision);
              totalController.text =
                  0.toStringAsFixed(marketDataWatch.quote_currency.precision);
              marketPercentState.state = 0;
              errorMinAmount.value = false;
              errorMinOrMaxPrice.value = false;
            },
            active:
                marketOrLimitProviderWatch == OrderType.limit ? true : false,
          ),
        ],
      ),
    );
  }
}
