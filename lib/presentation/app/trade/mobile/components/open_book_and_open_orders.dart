import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/order_state_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/trade/order_state.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/presentation/app/trade/mobile/components/order_book/order_book.dart';
import 'package:user_app/presentation/app/trade/mobile/components/market_open_order/market_open_order.dart';
import 'package:user_app/presentation/app/trade/mobile/components/market_trading_history/market_public_trades_history.dart';
import 'package:user_app/presentation/app/trade/mobile/components/market_trading_history/market_my_trades_history.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class OrderBookAndOpenOrderMobile extends HookConsumerWidget {
  const OrderBookAndOpenOrderMobile({
    required this.scrollController,
    super.key,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketOrderStateWatch = ref.watch(marketOrderStateProvider);
    final marketOrderStateRead = ref.read(marketOrderStateProvider.notifier);

    var userConfigBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userConfigBox.getAt(0)!;

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color:
              isLightTheme(context) ? AppColors.whiteColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 18.w,
                right: 18.w,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: userData.token != null
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      marketOrderStateRead.state =
                          MarketOrderState.marketOrderBook;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: marketOrderStateWatch ==
                                MarketOrderState.marketOrderBook
                            ? Border(
                                bottom: BorderSide(
                                  color: isLightTheme(context)
                                      ? AppColors.aboutHeaderLight
                                      : Colors.white,
                                  width: 5..h,
                                ),
                              )
                            : Border(
                                bottom: BorderSide(
                                  color: Colors.transparent,
                                  width: 5..h,
                                ),
                              ),
                      ),
                      padding: EdgeInsets.only(bottom: 3.h),
                      child: Text(
                        tr('trade.order_book'),
                        textAlign: TextAlign.start,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: marketOrderStateWatch ==
                                          MarketOrderState.marketOrderBook
                                      ? isLightTheme(context)
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context).primaryColor
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                  fontSize: 15.sp,
                                  letterSpacing: -0.75.sp,
                                ),
                      ),
                    ),
                  ),
                  userData.token != null
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                marketOrderStateRead.state =
                                    MarketOrderState.marketOpenOrders;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: marketOrderStateWatch ==
                                          MarketOrderState.marketOpenOrders
                                      ? Border(
                                          bottom: BorderSide(
                                            color: isLightTheme(context)
                                                ? AppColors.aboutHeaderLight
                                                : Colors.white,
                                            width: 5..h,
                                          ),
                                        )
                                      : Border(
                                          bottom: BorderSide(
                                            color: Colors.transparent,
                                            width: 5..h,
                                          ),
                                        ),
                                ),
                                padding: EdgeInsets.only(bottom: 3..h),
                                child: Text(
                                  tr('trade.open_orders'),
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        color: marketOrderStateWatch ==
                                                MarketOrderState
                                                    .marketOpenOrders
                                            ? isLightTheme(context)
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context).primaryColor
                                            : Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.5),
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.75,
                                      ),
                                ),
                              ),
                            )
                          ],
                        )
                      : const SizedBox(),
                  userData.token != null
                      ? InkWell(
                          onTap: () {
                            marketOrderStateRead.state =
                                MarketOrderState.myTrades;
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  marketOrderStateRead.state =
                                      MarketOrderState.myTrades;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: marketOrderStateWatch ==
                                            MarketOrderState.myTrades
                                        ? Border(
                                            bottom: BorderSide(
                                              color: isLightTheme(context)
                                                  ? AppColors.aboutHeaderLight
                                                  : Colors.white,
                                              width: 5..h,
                                            ),
                                          )
                                        : Border(
                                            bottom: BorderSide(
                                              color: Colors.transparent,
                                              width: 3..h,
                                            ),
                                          ),
                                  ),
                                  padding: EdgeInsets.only(bottom: 3..h),
                                  child: Text(
                                    tr('trade.my_trades'),
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          color: marketOrderStateWatch ==
                                                  MarketOrderState.myTrades
                                              ? isLightTheme(context)
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Theme.of(context)
                                                      .primaryColor
                                              : Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.5),
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.75.sp,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          width: 25.w,
                        ),
                  InkWell(
                    onTap: () {
                      marketOrderStateRead.state =
                          MarketOrderState.tradeHistory;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: marketOrderStateWatch ==
                                MarketOrderState.tradeHistory
                            ? Border(
                                bottom: BorderSide(
                                  color: isLightTheme(context)
                                      ? AppColors.aboutHeaderLight
                                      : Colors.white,
                                  width: 5..h,
                                ),
                              )
                            : Border(
                                bottom: BorderSide(
                                  color: Colors.transparent,
                                  width: 5..h,
                                ),
                              ),
                      ),
                      padding: EdgeInsets.only(bottom: 3..h),
                      child: Text(
                        tr('trade.tradeHistory'),
                        textAlign: TextAlign.start,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: marketOrderStateWatch ==
                                          MarketOrderState.tradeHistory
                                      ? isLightTheme(context)
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context).primaryColor
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                  fontSize: 15.sp,
                                  letterSpacing: -0.75.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 2..h,
              width: MediaQuery.of(context).size.width,
              color: isLightTheme(context)
                  ? AppColors.mainBackgroundLightColor
                  : AppColors.whiteColor.withOpacity(0.05),
            ),
            marketOrderStateWatch == MarketOrderState.marketOrderBook
                ? OrderBookMobile(
                    scrollController: scrollController,
                  )
                : marketOrderStateWatch == MarketOrderState.marketOpenOrders
                    ? userData.token != null
                        ? MarketOpenOrderMobile(
                            scrollController: scrollController,
                          )
                        : const SizedBox()
                    : marketOrderStateWatch == MarketOrderState.myTrades
                        ? userData.token != null
                            ? MarketMyTradesHistoryMobile(
                                scrollController: scrollController,
                              )
                            : const SizedBox()
                        : marketOrderStateWatch == MarketOrderState.tradeHistory
                            ? MarketPublicTradesHistoryMobile(
                                scrollController: scrollController,
                              )
                            : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
