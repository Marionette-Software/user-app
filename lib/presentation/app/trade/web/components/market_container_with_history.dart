import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/order_state_provider.dart';
import 'package:user_app/application/trade/user_orders/user_order_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/trade/order_state.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/trade/web/components/cancel_all_order_with_market.dart';
import 'package:user_app/presentation/app/trade/web/components/market_my_trades/market_my_trades.dart';
import 'package:user_app/presentation/app/trade/web/components/market_open_order/market_open_order_conteiner_web.dart';
import 'package:user_app/presentation/app/trade/web/components/market_order_history.dart/market_order_history.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:webviewx/webviewx.dart';

class MarketContainerWithHistoryWeb extends HookConsumerWidget {
  const MarketContainerWithHistoryWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketOrderStateWatch = ref.watch(marketOrderStateWebProvider);
    final marketOrderStateRead = ref.read(marketOrderStateWebProvider.notifier);
    final marketOrdersWatch = ref.watch(marketOrdersNotifierProvider);
    // final controllerWatch = ref.watch(controllerStateProvider);

    var userConfigBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userConfigBox.getAt(0)!;

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 1024.w,
        height: 448.h,
        child: Column(
          children: [
            Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isLightTheme(context)
                    ? AppColors.mainBackgroundLightColor
                    : AppColors.whiteColor.withOpacity(0.05),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 34.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        marketOrderStateRead.state =
                            MarketOrderState.marketOpenOrders;
                      },
                      child: Container(
                        width: 150.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: marketOrderStateWatch ==
                                  MarketOrderState.marketOpenOrders
                              ? isLightTheme(context)
                                  ? AppColors.whiteColor
                                  : const Color.fromARGB(255, 25, 34, 43)
                              : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Open orders',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -1.sp,
                                  color: isLightTheme(context)
                                      ? (marketOrderStateWatch ==
                                              MarketOrderState.marketOpenOrders
                                          ? Theme.of(context).primaryColorLight
                                          : Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.5))
                                      : (marketOrderStateWatch ==
                                              MarketOrderState.marketOpenOrders
                                          ? Theme.of(context).primaryColorLight
                                          : AppColors.whiteColor),
                                ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        marketOrderStateRead.state =
                            MarketOrderState.orderHistory;
                      },
                      child: Container(
                        width: 150.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: marketOrderStateWatch ==
                                  MarketOrderState.orderHistory
                              ? isLightTheme(context)
                                  ? AppColors.whiteColor
                                  : const Color.fromARGB(255, 25, 34, 43)
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            'Orders history'.hardcoded,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -1.sp,
                                  color: isLightTheme(context)
                                      ? (marketOrderStateWatch ==
                                              MarketOrderState.orderHistory
                                          ? Theme.of(context).primaryColorLight
                                          : Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.5))
                                      : (marketOrderStateWatch ==
                                              MarketOrderState.orderHistory
                                          ? Theme.of(context).primaryColorLight
                                          : AppColors.whiteColor),
                                ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        marketOrderStateRead.state = MarketOrderState.myTrades;
                      },
                      child: Container(
                        width: 150.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color:
                              marketOrderStateWatch == MarketOrderState.myTrades
                                  ? isLightTheme(context)
                                      ? AppColors.whiteColor
                                      : const Color.fromARGB(255, 25, 34, 43)
                                  : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            'My trades'.hardcoded,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -1.sp,
                                  color: isLightTheme(context)
                                      ? (marketOrderStateWatch ==
                                              MarketOrderState.myTrades
                                          ? Theme.of(context).primaryColorLight
                                          : Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.5))
                                      : (marketOrderStateWatch ==
                                              MarketOrderState.myTrades
                                          ? Theme.of(context).primaryColorLight
                                          : AppColors.whiteColor),
                                ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    userData.token != null
                        ? marketOrderStateWatch ==
                                    MarketOrderState.marketOpenOrders &&
                                marketOrdersWatch.isNotEmpty
                            ? Tooltip(
                                message:
                                    'Cancel all open orders for this market'.hardcoded,
                                verticalOffset: -60.h,
                                child: InkWell(
                                  onTap: () async {
                                    showDialog(
                                      barrierColor: AppColors.placeHolderGrey,
                                      context: context,
                                      builder: (context) => const WebViewAware(
                                        child: ModalWindowWallet(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          titleSize: 30,
                                          title: '',
                                          backgroundColor: Colors.transparent,
                                          content: CancelAllOrderWithMarket(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 115.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      borderRadius: BorderRadius.circular(19.r),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          tr('trade.cancel_all'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                fontSize: 15.sp,
                                                letterSpacing: -0.75.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.whiteColorText,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 11.w,
                                        ),
                                        Icon(
                                          Icons.close,
                                          size: 18.h,
                                          color: AppColors.whiteColorText,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox()
                        : const SizedBox()
                  ],
                ),
              ),
            ),
            userData.token != null
                ? marketOrderStateWatch == MarketOrderState.marketOpenOrders
                    ? const MarketOpenOrderContainerWeb()
                    : marketOrderStateWatch == MarketOrderState.myTrades
                        ? const MarketMyTradesWeb()
                        : const MarketOrderHistoryWeb()
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
