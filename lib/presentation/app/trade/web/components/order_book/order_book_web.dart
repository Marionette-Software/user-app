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
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/trade/orderbook/orderbook_item.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/full_orderbook_subscription.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/full_orderbook_subscription.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/full_orderbook_subscription.var.gql.dart';
import 'package:user_app/presentation/app/trade/web/components/order_book/components/last_price.dart';
import 'package:user_app/presentation/app/trade/web/components/order_book/components/orderbook_buy_side_web.dart';
import 'package:user_app/presentation/app/trade/web/components/order_book/components/orderbook_sell_side_web.dart';
import 'package:user_app/presentation/app/trade/web/components/order_book/components/spread.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';

class OrderBookWeb extends HookConsumerWidget {
  const OrderBookWeb({
    Key? key,
  }) : super(key: key);

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

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 373.w,
        height: 1105.h,
        child: orderBookData.when(
          data: (data) {
            var orderBookFutureData = data;

            return Operation(
              client: subscriptionClient(globalData.url),
              operationRequest: GPublicFullOrderBookSubscriptionReq(
                (b) => b..vars.market = activeMarketWatch.id,
              ),
              builder: (
                BuildContext context,
                OperationResponse<GPublicFullOrderBookSubscriptionData,
                        GPublicFullOrderBookSubscriptionVars>?
                    response,
                Object? error,
              ) {
                if (response!.loading) {
                  double spreadValue = orderBookFutureData.sell.isEmpty ||
                          orderBookFutureData.buy.isEmpty
                      ? 0
                      : orderBookFutureData.sell.first.price -
                          orderBookFutureData.buy.first.price;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OrderBookSellSideWeb(
                          withTradingBalance: globalData.withTradingBalance,
                          orderBookWatch: orderBookFutureData.sell,
                        ),
                      ),
                      globalData.enabledSpread
                          ? spreadValue.isNegative
                              ? const LastPriceRowWeb()
                              : SpreadRowWeb(
                                  spreadValue: numberFormatWithPrecision(
                                          activeMarketWatch
                                              .trading_price_precision)
                                      .format(spreadValue),
                                )
                          : const LastPriceRowWeb(),
                      Expanded(
                        child: OrderBookBuySideWeb(
                          withTradingBalance: globalData.withTradingBalance,
                          orderBookBuy: orderBookFutureData.buy,
                        ),
                      ),
                    ],
                  );
                }

                if (response.data != null &&
                    response.data!.publicFullOrderBook != null &&
                    response.data!.publicFullOrderBook!.buy != null &&
                    response.data!.publicFullOrderBook!.sell != null) {
                  List<OrderBookItem> buy = [];
                  List<OrderBookItem> sell = [];
                  for (int i = 0;
                      i < response.data!.publicFullOrderBook!.buy!.length;
                      i++) {
                    buy.add(
                      OrderBookItem(
                        price:
                            response.data!.publicFullOrderBook!.buy![i]!.price!,
                        amount: response
                            .data!.publicFullOrderBook!.buy![i]!.amount!,
                        cumulativeAmount: response.data!.publicFullOrderBook!
                            .buy![i]!.cumulativeAmount!,
                      ),
                    );
                  }
                  for (int i = 0;
                      i < response.data!.publicFullOrderBook!.sell!.length;
                      i++) {
                    sell.add(
                      OrderBookItem(
                        price: response
                            .data!.publicFullOrderBook!.sell![i]!.price!,
                        amount: response
                            .data!.publicFullOrderBook!.sell![i]!.amount!,
                        cumulativeAmount: response.data!.publicFullOrderBook!
                            .sell![i]!.cumulativeAmount!,
                      ),
                    );
                  }

                  double spreadValue = buy.isEmpty || sell.isEmpty
                      ? 0
                      : sell.first.price - buy.first.price;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OrderBookSellSideWeb(
                          withTradingBalance: globalData.withTradingBalance,
                          orderBookWatch: sell,
                        ),
                      ),
                      globalData.enabledSpread
                          ? spreadValue.isNegative
                              ? const LastPriceRowWeb()
                              : SpreadRowWeb(
                                  spreadValue: numberFormatWithPrecision(
                                          activeMarketWatch
                                              .trading_price_precision)
                                      .format(spreadValue),
                                )
                          : const LastPriceRowWeb(),
                      Expanded(
                        child: OrderBookBuySideWeb(
                          withTradingBalance: globalData.withTradingBalance,
                          orderBookBuy: buy,
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: UserAppError(errorMessage: ''),
                  );
                }
              },
            );
          },
          loading: () => const MainLoader(),
          error: (error, _) => UserAppError(errorMessage: '$error'),
        ),
      ),
    );
  }
}
