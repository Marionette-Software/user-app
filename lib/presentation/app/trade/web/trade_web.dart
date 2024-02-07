import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/create_order_with_order_book_provider.dart';
import 'package:user_app/application/trade/get_markets_future_provider.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/open_market_list_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/trade/market/get_market_req.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/presentation/app/components/header_web/header_web.dart';
import 'package:user_app/presentation/app/trade/components/create_order/create_order_form.dart';
import 'package:user_app/presentation/app/trade/web/components/market_auth_container.dart';
import 'package:user_app/presentation/app/trade/web/components/markets_container.dart/markets_container.dart';
import 'package:user_app/presentation/app/trade/web/components/order_book/order_book_web.dart';
import 'package:user_app/presentation/app/trade/web/components/market_container_with_history.dart';
import 'package:user_app/presentation/app/trade/web/components/trade_chart_container.dart';
import 'package:user_app/presentation/app/trade/web/components/market_trading_history/market_trading_history_container.dart';
import 'package:user_app/presentation/app/trade/web/components/unauthorized_create_order.dart';
import 'package:user_app/presentation/auth/web/components/auth_app_bar.dart';
import 'package:user_app/presentation/auth/web/components/footer_components/footer.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class TradePageWeb extends StatefulHookConsumerWidget {
  const TradePageWeb({super.key});

  @override
  ConsumerState<TradePageWeb> createState() => _TradePageWebState();
}

class _TradePageWebState extends ConsumerState<TradePageWeb> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    final refreshValueBlockchain = useState(1);
    final openMarketListWatch = ref.watch(openMarketListProvider);
    final marketOrLimitProviderWatch = ref.watch(marketOrLimitProvider);
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);

    final priceWithOrderBookWatch = ref.watch(priceWithOrderBookProvider);
    final amountWithOrderBookWatch = ref.watch(amountWithOrderBookProvider);

    final getMarkets = ref.watch(
      getMarketFutureProvider(
        GetMarketReqData(
          refresh: '${refreshValueBlockchain.value}',
        ),
      ),
    );

    var userConfigBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userConfigBox.getAt(0)!;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          60.h,
        ),
        child: userData.token != null
            ? const HeaderWeb()
            : const AuthAppBar(isWeb: true),
      ),
      body: getMarkets.when(
        data: (data) {
          final priceController = useTextEditingController();
          final amountController = useTextEditingController();
          final totalController = useTextEditingController();

          priceController.text = marketOrLimitProviderWatch == OrderType.market
              ? marketDataWatch.marketDynamics!.lastPrice!
                  .toStringAsFixed(marketDataWatch.trading_price_precision)
              : priceWithOrderBookWatch
                  .toStringAsFixed(marketDataWatch.trading_price_precision);

          amountController.text = amountWithOrderBookWatch
              .toStringAsFixed(marketDataWatch.trading_amount_precision);

          totalController.text = marketOrLimitProviderWatch == OrderType.market
              ? '≈ ${0.toStringAsFixed(marketDataWatch.quote_currency.precision)}'
              : (amountWithOrderBookWatch * priceWithOrderBookWatch)
                  .toStringAsFixed(marketDataWatch.quote_currency.precision);

          return Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: isLightTheme(context)
                  ? const DecorationImage(
                      image: AssetImage(bgInner),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 25.h,
                      bottom: 24.h,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        !globalData.orderBookMiddle
                            ? Padding(
                                padding: EdgeInsets.only(right: 25.w),
                                child: openMarketListWatch
                                    ? const MarketsContainerWeb()
                                    : const OrderBookWeb(),
                              )
                            : const SizedBox(),
                        Column(
                          children: [
                            const TradeChartContainer(),
                            SizedBox(
                              height: 25.w,
                            ),
                            userData.token != null
                                ? const MarketContainerWithHistoryWeb()
                                : const MarketAuthContainerWeb()
                          ],
                        ),
                        globalData.orderBookMiddle
                            ? Padding(
                                padding:
                                    EdgeInsets.only(left: 25.w, right: 25.w),
                                child: Column(
                                  children: [
                                    Visibility(
                                      visible: openMarketListWatch,
                                      child: const MarketsContainerWeb(),
                                    ),
                                    Visibility(
                                      visible: !openMarketListWatch,
                                      child: const OrderBookWeb(),
                                    ),
                                  ],
                                ))
                            : SizedBox(
                                width: 25.w,
                              ),
                        SizedBox(
                          width: 373.w,
                          child: MainDecorationContainerWeb(
                            content: Column(
                              children: [
                                userData.token != null
                                    ? CreateOrderForm(
                                        priceController: priceController,
                                        amountController: amountController,
                                        totalController: totalController,
                                      )
                                    : UnauthorizedCreateOrderWeb(
                                        priceController: priceController,
                                        amountController: amountController,
                                        totalController: totalController,
                                      ),
                                const MarketTradingHistoryContainerWeb(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const FooterWeb(),
                ],
              ),
            ),
          );
        },
        error: (error, _) {
          return UserAppError(
            errorMessage: error.toString(),
          );
        },
        loading: () => const MainLoader(),
      ),
    );
  }
}
