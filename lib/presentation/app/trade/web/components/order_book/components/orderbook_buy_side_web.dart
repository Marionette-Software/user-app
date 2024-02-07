import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/create_order_with_order_book_provider.dart';
import 'package:user_app/application/trade/error_mesegge_provider.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/domain/trade/orderbook/orderbook_item.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class OrderBookBuySideWeb extends StatefulHookConsumerWidget {
  const OrderBookBuySideWeb({
    Key? key,
    required this.orderBookBuy,
    required this.withTradingBalance,
  }) : super(key: key);

  final List<OrderBookItem> orderBookBuy;
  final bool withTradingBalance;

  @override
  ConsumerState<OrderBookBuySideWeb> createState() =>
      _UserOrdersHistoryWebState();
}

class _UserOrdersHistoryWebState extends ConsumerState<OrderBookBuySideWeb> {
  bool hovered = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);
    final marketPercentState = ref.read(marketPercentProviderProvider.notifier);
    final marketOrLimitProviderState = ref.read(marketOrLimitProvider.notifier);

    final priceWithOrderBookRead =
        ref.read(priceWithOrderBookProvider.notifier);
    final amountWithOrderBookRead =
        ref.read(amountWithOrderBookProvider.notifier);

    final errorMinOrMaxPriceRead =
        ref.read(errorMinOrMaxPriceProvider.notifier);
    final errorMinAmountRead = ref.read(errorMinAmountProvider.notifier);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 107.w,
                child: Text(
                  tr('trade.price'),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 15.sp,
                        color: isLightTheme(context)
                            ? AppColors.aboutHeaderLight
                            : AppColors.whiteColor.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              SizedBox(
                width: 107.w,
                child: Text(
                  tr('trade.amount'),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 15.sp,
                        color: isLightTheme(context)
                            ? AppColors.aboutHeaderLight
                            : AppColors.whiteColor.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
              SizedBox(
                width: 107.w,
                child: Text(
                  'Cumulative total',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 15.sp,
                        color: isLightTheme(context)
                            ? AppColors.aboutHeaderLight
                            : AppColors.whiteColor.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: widget.orderBookBuy.isEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        reverse: true,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemCount: 14,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 15.w, right: 15.w),
                                child: Container(
                                  width: 343.w - ((index) * 20).w,
                                  height: 24.h,
                                  color: isLightTheme(context)
                                      ? AppColors.mainBackgroundLightColor
                                      : AppColors.whiteColor.withOpacity(0.05),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount: widget.orderBookBuy.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            hoverColor: MainColorsApp.greenColor,
                            onTap: () {
                              priceWithOrderBookRead.state = 0;
                              amountWithOrderBookRead.state = 0;

                              errorMinOrMaxPriceRead.state = false;
                              errorMinAmountRead.state = false;

                              marketOrLimitProviderState.state =
                                  OrderType.limit;
                              marketPercentState.state = 0;

                              priceWithOrderBookRead.state =
                                  widget.orderBookBuy[index].price;

                              amountWithOrderBookRead.state =
                                  marketDataWatch.trading_min_amount;
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 15.w,
                                right: 15.w,
                              ),
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: ((343.w /
                                                  widget.orderBookBuy.last
                                                      .cumulativeAmount) *
                                              widget.orderBookBuy[index]
                                                  .cumulativeAmount)
                                          .w,
                                      height: 28.h,
                                      color: MainColorsApp.greenColor
                                          .withOpacity(0.25),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 107.w,
                                        child: Text(
                                          numberFormatWithPrecision(
                                                  marketDataWatch
                                                      .trading_price_precision)
                                              .format(widget
                                                  .orderBookBuy[index].price),
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                fontSize: 15.sp,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.75.sp,
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 107.w,
                                        child: Text(
                                          abbreviateNumber(
                                            number: widget
                                                .orderBookBuy[index].amount,
                                            precision: marketDataWatch
                                                .trading_amount_precision,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                fontSize: 15.sp,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.75.sp,
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 107.w,
                                        child: Text(
                                          abbreviateNumber(
                                            number: widget.orderBookBuy[index]
                                                .cumulativeAmount,
                                            precision: marketDataWatch
                                                .trading_amount_precision,
                                          ),
                                          textAlign: TextAlign.end,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                fontSize: 15.sp,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.75.sp,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
