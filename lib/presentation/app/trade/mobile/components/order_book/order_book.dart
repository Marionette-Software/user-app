import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/orderbook/get_orderbook_future_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/trade/orderbook/orderbook_item.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/full_orderbook_subscription.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/full_orderbook_subscription.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/full_orderbook_subscription.var.gql.dart';
import 'package:user_app/presentation/app/trade/mobile/components/order_book/components/orderbook_buy_side.dart';
import 'package:user_app/presentation/app/trade/mobile/components/order_book/components/orderbook_sell_side.dart';
import 'package:user_app/presentation/app/trade/mobile/components/order_book/components/spread.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class OrderBookMobile extends HookConsumerWidget {
  const OrderBookMobile({
    required this.scrollController,
    Key? key,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshValue = useState(1);
    final orderBookData = ref.watch(
      getOrderBookFutureProvider(
        RefreshRequest(refresh: '$refreshValue'),
      ),
    );

    final activeMarketWatch = ref.watch(selectMarketsNotifierProvider);

    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    useEffect(() {
      if (refreshValue.value == 0) {
        refreshValue.value++;
      }
      return null;
    }, []);

    return Container(
      padding: EdgeInsets.only(
        top: 10..h,
      ),
      child: orderBookData.when(
        data: (data) {
          var orderBookFutureData = data;

          return orderBookFutureData.buy.isEmpty &&
                  orderBookFutureData.sell.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: 26..h),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'No open orders'.hardcoded,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 15.sp,
                            color: isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : AppColors.whiteColor.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.75.sp,
                          ),
                    ),
                  ),
                )
              : SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Operation(
                        client: subscriptionClient(globalData.url),
                        operationRequest: GPublicFullOrderBookSubscriptionReq(
                          (b) => b..vars.market = activeMarketWatch.id,
                        ),
                        builder: (
                          BuildContext context,
                          OperationResponse<
                                  GPublicFullOrderBookSubscriptionData,
                                  GPublicFullOrderBookSubscriptionVars>?
                              response,
                          Object? error,
                        ) {
                          if (response!.loading) {
                            double spreadValue =
                                orderBookFutureData.sell.isEmpty ||
                                        orderBookFutureData.buy.isEmpty
                                    ? 0
                                    : orderBookFutureData.sell.first.price -
                                        orderBookFutureData.buy.first.price;

                            return Column(
                              children: [
                                globalData.enabledSpread
                                    ? spreadValue.isNegative
                                        ? const SizedBox()
                                        : SpreadRowMobile(
                                            spreadValue: numberFormatWithPrecision(
                                                    activeMarketWatch
                                                        .trading_price_precision)
                                                .format(spreadValue),
                                          )
                                    : const SizedBox(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    OrderBookBuySideMobile(
                                      withTradingBalance:
                                          globalData.withTradingBalance,
                                      orderBookWatch: orderBookFutureData.buy,
                                    ),
                                    VerticalDivider(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.25),
                                      width: 1.w,
                                    ),
                                    OrderBookSellSideMobile(
                                      withTradingBalance:
                                          globalData.withTradingBalance,
                                      orderBookWatch: orderBookFutureData.sell,
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }

                          if (response.data != null &&
                              response.data!.publicFullOrderBook != null &&
                              response.data!.publicFullOrderBook!.buy != null &&
                              response.data!.publicFullOrderBook!.sell !=
                                  null &&
                              response
                                  .data!.publicFullOrderBook!.buy!.isNotEmpty) {
                            List<OrderBookItem> buy = [];
                            List<OrderBookItem> sell = [];
                            for (int i = 0;
                                i <
                                    response
                                        .data!.publicFullOrderBook!.buy!.length;
                                i++) {
                              buy.add(
                                OrderBookItem(
                                  price: response.data!.publicFullOrderBook!
                                      .buy![i]!.price!,
                                  amount: response.data!.publicFullOrderBook!
                                      .buy![i]!.amount!,
                                  cumulativeAmount: response
                                      .data!
                                      .publicFullOrderBook!
                                      .buy![i]!
                                      .cumulativeAmount!,
                                ),
                              );
                            }
                            for (int i = 0;
                                i <
                                    response.data!.publicFullOrderBook!.sell!
                                        .length;
                                i++) {
                              sell.add(
                                OrderBookItem(
                                  price: response.data!.publicFullOrderBook!
                                      .sell![i]!.price!,
                                  amount: response.data!.publicFullOrderBook!
                                      .sell![i]!.amount!,
                                  cumulativeAmount: response
                                      .data!
                                      .publicFullOrderBook!
                                      .sell![i]!
                                      .cumulativeAmount!,
                                ),
                              );
                            }

                            double spreadValue = buy.isEmpty || sell.isEmpty
                                ? 0
                                : sell.first.price - buy.first.price;

                            return Column(
                              children: [
                                globalData.enabledSpread
                                    ? spreadValue.isNegative
                                        ? const SizedBox()
                                        : SpreadRowMobile(
                                            spreadValue: numberFormatWithPrecision(
                                                    activeMarketWatch
                                                        .trading_price_precision)
                                                .format(spreadValue),
                                          )
                                    : const SizedBox(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    OrderBookBuySideMobile(
                                      withTradingBalance:
                                          globalData.withTradingBalance,
                                      orderBookWatch: buy,
                                    ),
                                    VerticalDivider(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.25),
                                      width: 1.w,
                                    ),
                                    OrderBookSellSideMobile(
                                      withTradingBalance:
                                          globalData.withTradingBalance,
                                      orderBookWatch: sell,
                                    ),
                                  ],
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                              child: UserAppError(errorMessage: ''),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 10..h,
                      )
                    ],
                  ),
                );
        },
        loading: () => Padding(
          padding: EdgeInsets.only(top: 30..h),
          child: const MainLoaderMobile(
            loaderSize: 100,
          ),
        ),
        error: (error, _) => UserAppError(errorMessage: '$error'),
      ),
    );
  }
}
