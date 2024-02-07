import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/tranding_tab_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/trade/market_trade.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/presentation/app/trade/mobile/trade_buy_sell_mobile_screen.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class BottomButtonPanelMobile extends HookConsumerWidget {
  final MarketTrade item;
  const BottomButtonPanelMobile({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tradingTabState = ref.read(tradingTabProvider.notifier);
    final marketPercentState = ref.read(marketPercentProviderProvider.notifier);
    final marketOrLimitProviderWatch = ref.watch(marketOrLimitProvider);
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);

    final priceController = TextEditingController();
    final amountController = TextEditingController();
    final totalController = TextEditingController();

    priceController.text = marketOrLimitProviderWatch == OrderType.market
        ? marketDataWatch.marketDynamics!.lastPrice!
            .toStringAsFixed(marketDataWatch.trading_price_precision)
        : 0.toStringAsFixed(marketDataWatch.trading_price_precision);

    amountController.text =
        0.toStringAsFixed(marketDataWatch.trading_amount_precision);

    totalController.text = marketOrLimitProviderWatch == OrderType.market
        ? '≈ ${0.toStringAsFixed(marketDataWatch.quote_currency.precision)}'
        : 0.toStringAsFixed(marketDataWatch.quote_currency.precision);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isLightTheme(context)
                ? AppColors.whiteColor
                : walletBackgroundColor,
            isLightTheme(context)
                ? AppColors.whiteColor.withOpacity(0.9)
                : walletBackgroundColor.withOpacity(0.9)
          ],
          stops: const [0, 1],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20..h),
        child: Container(
          width: 370.w,
          height: 65..h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.r),
            border: isLightTheme(context)
                ? Border.all(
                    width: 1.h,
                    color: AppColors.mainBackgroundLightColor,
                  )
                : null,
            color: isLightTheme(context)
                ? AppColors.whiteColor
                : AppColors.mainBackgroundDarkColor,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  marketPercentState.state = 0;
                  tradingTabState.state = 1;

                  var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
                  GlobalConfigData globalData = box.getAt(0)!;

                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TradeBuySellScreenMobile(
                          item: item,
                          tradingTabWatch: 1,
                          priceController: priceController,
                          amountController: amountController,
                          totalController: totalController,
                          withTradingBalance: globalData.withTradingBalance,
                          platformType: PlatformTypeState.mobile,
                        ),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      MainColorsApp.greenColor),
                  shadowColor: MaterialStateProperty.all<Color>(
                      borderButtonProfileBorder),
                  elevation: MaterialStateProperty.all(8.w),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(21.w),
                      ),
                    ),
                  ),
                ),
                child: SizedBox(
                  width: 163.w,
                  height: 35..h,
                  child: Center(
                    child: Text(
                      tr('trade.buy'),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.whiteColorText,
                            fontWeight: FontWeight.w700,
                            fontSize: 15.sp,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 13.w,
              ),
              ElevatedButton(
                onPressed: () async {
                  marketPercentState.state = 0;
                  tradingTabState.state = 2;
                  var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
                  GlobalConfigData globalData = box.getAt(0)!;

                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TradeBuySellScreenMobile(
                          item: item,
                          tradingTabWatch: 2,
                          amountController: amountController,
                          totalController: totalController,
                          priceController: priceController,
                          withTradingBalance: globalData.withTradingBalance,
                          platformType: PlatformTypeState.mobile,
                        ),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(MainColorsApp.redColor),
                  shadowColor: MaterialStateProperty.all<Color>(
                      borderButtonProfileBorder),
                  elevation: MaterialStateProperty.all(8.w),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(21.w),
                      ),
                    ),
                  ),
                ),
                child: SizedBox(
                  width: 163.w,
                  height: 35..h,
                  child: Center(
                    child: Text(
                      tr('trade.sell'),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.whiteColorText,
                            fontWeight: FontWeight.w700,
                            fontSize: 15.sp,
                          ),
                    ),
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
