import 'package:easy_localization/easy_localization.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/create_order_with_order_book_provider.dart';
import 'package:user_app/application/trade/error_mesegge_provider.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/trade_avalible_balance_state_provider.dart';
import 'package:user_app/application/trade/trade_wallets_balance_future_provider.dart';
import 'package:user_app/application/trade/tranding_tab_provider.dart';
import 'package:user_app/application/user_data/global_data_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_balance_update_subscription.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_balance_update_subscription.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_balance_update_subscription.var.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/wallets_data.data.gql.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/market_limit_switch_web.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/amount_input.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/create_order_button.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/price_input.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/validate_button.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/avalible_balance_row.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/total_input.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/market_price_container.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/error_message/amount_error_message.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/error_message/price_error_message.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/persents_selector/order_persent_selecrot.dart';
import 'package:user_app/presentation/app/trade/components/trade_tab_bar/trade_tab_bar.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class CreateOrderForm extends HookConsumerWidget {
  const CreateOrderForm({
    required this.priceController,
    required this.totalController,
    required this.amountController,
    super.key,
  });

  final TextEditingController priceController;
  final TextEditingController amountController;
  final TextEditingController totalController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tradingTabState = ref.read(tradingTabProvider.notifier);
    final marketOrLimitProviderWatch = ref.watch(marketOrLimitProvider);
    final marketOrLimitProviderRead = ref.read(marketOrLimitProvider.notifier);
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);
    final marketPercentState = ref.read(marketPercentProviderProvider.notifier);
    final tradeMarketPriceRead = ref.read(tradeMarketPriceProvider.notifier);
    final userData = ref.watch(userDataFutureProvider);
    final tradingTabWatch = ref.watch(tradingTabProvider);
    final walletTradeData = ref.watch(walletTradeDataStateNotifierProvider);

    final errorMinOrMaxPriceWatch = ref.watch(errorMinOrMaxPriceProvider);
    final errorMinOrMaxPriceRead =
        ref.read(errorMinOrMaxPriceProvider.notifier);

    final errorMinAmountWatch = ref.watch(errorMinAmountProvider);
    final errorMinAmountRead = ref.read(errorMinAmountProvider.notifier);

    final priceWithOrderBookRead =
        ref.read(priceWithOrderBookProvider.notifier);
    final amountWithOrderBookRead =
        ref.read(amountWithOrderBookProvider.notifier);

    final loaderState = useState(LoadState.notLoading);
    var counter = useState(0);
    final refreshValue = useState(1);
    final walletFuture = ref.watch(
      getWalletsForTradeFutureProvider(
        RefreshRequest(refresh: '$refreshValue'),
      ),
    );
    useEffect(() {
      if (refreshValue.value == 0) {
        refreshValue.value++;
      }
      return null;
    }, []);

    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    return Container(
      width: 373.w,
      height: 525.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : Colors.white.withOpacity(0.05),
            width: 2.h,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: walletFuture.when(
          data: (data) {
            var wallets = walletTradeData;

            final active = useState(false);

            GTradeWalletsDataData_user_currencies quoteCurrency =
                wallets.firstWhere(
              (element) {
                return element!.id == marketDataWatch.quote_currency.id;
              },
            )!;

            GTradeWalletsDataData_user_currencies baseCurrency =
                wallets.firstWhere(
              (element) {
                return element!.id == marketDataWatch.base_currency.id;
              },
            )!;

            String quoteCurrencyBalanceBuy = (globalData.withTradingBalance
                    ? quoteCurrency.advancedTradingBalance!
                    : (quoteCurrency.advancedTradingBalance! +
                        quoteCurrency.balance!))
                .toStringAsFixed(marketDataWatch.quote_currency.precision);

            String baseCurrencyBalanceSell = (globalData.withTradingBalance
                    ? baseCurrency.advancedTradingBalance!
                    : (baseCurrency.advancedTradingBalance! +
                        baseCurrency.balance!))
                .toStringAsFixed(marketDataWatch.base_currency.precision);

            if (tradeMarketPriceRead.state.buy == 'none' ||
                tradeMarketPriceRead.state.sell == 'none') {
              tradeMarketPriceRead.updateBuy(quoteCurrencyBalanceBuy);
              tradeMarketPriceRead.updateSell(baseCurrencyBalanceSell);
              // totalController.text =
              //     '≈ ${0.toStringAsFixed(marketDataWatch.quote_currency!.precision!)}';
              // amountController.text =
              //     0.toStringAsFixed(marketDataWatch.trading_amount_precision!);
            }

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TradeTabBar(
                    platformType: PlatformTypeState.web,
                    leftTabOnTap: () {
                      marketPercentState.state = 0;
                      tradingTabState.state = 1;
                      if (marketOrLimitProviderWatch == OrderType.limit) {
                        priceController.text = 0.toStringAsFixed(
                            marketDataWatch.trading_price_precision);
                      } else {
                        priceController.text = marketDataWatch
                            .marketDynamics!.lastPrice!
                            .toStringAsFixed(
                                marketDataWatch.trading_price_precision);
                      }
                      amountController.text = 0.toStringAsFixed(
                          marketDataWatch.trading_amount_precision);
                      totalController.text = 0.toStringAsFixed(
                          marketDataWatch.quote_currency.precision);

                      errorMinAmountRead.state = false;
                      errorMinOrMaxPriceRead.state = false;
                    },
                    leftTabActive: tradingTabWatch == 1,
                    leftTabTitle: tr('trade.buy'),
                    rightTabOnTap: () {
                      marketPercentState.state = 0;
                      tradingTabState.state = 2;
                      if (marketOrLimitProviderWatch == OrderType.limit) {
                        priceController.text = 0.toStringAsFixed(
                            marketDataWatch.trading_price_precision);
                      } else {
                        priceController.text = marketDataWatch
                            .marketDynamics!.lastPrice!
                            .toStringAsFixed(
                                marketDataWatch.trading_price_precision);
                      }

                      amountController.text = 0.toStringAsFixed(
                          marketDataWatch.trading_amount_precision);
                      totalController.text = 0.toStringAsFixed(
                          marketDataWatch.quote_currency.precision);

                      errorMinAmountRead.state = false;
                      errorMinOrMaxPriceRead.state = false;
                    },
                    rightTabActive: tradingTabWatch == 2,
                    rightTabTitle: tr('trade.sell'),
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 28.h,
                              bottom: 6.h,
                            ),
                            child: MarketLimitSwitchWeb(
                              options: const [
                                OrderType.market,
                                OrderType.limit
                              ],
                              changeType: (index) {
                                priceWithOrderBookRead.state = 0;
                                amountWithOrderBookRead.state = 0;

                                priceController.text = marketOrLimitProviderRead
                                            .state ==
                                        OrderType.market
                                    ? marketDataWatch.marketDynamics!.lastPrice!
                                        .toStringAsFixed(marketDataWatch
                                            .trading_price_precision)
                                    : 0.toStringAsFixed(marketDataWatch
                                        .trading_price_precision);

                                amountController.text = 0.toStringAsFixed(
                                    marketDataWatch.trading_amount_precision);
                                totalController.text = 0.toStringAsFixed(
                                    marketDataWatch.quote_currency.precision);
                                marketPercentState.state = 0;

                                errorMinAmountRead.state = false;
                                errorMinOrMaxPriceRead.state = false;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 48.h,
                            child: errorMinOrMaxPriceWatch
                                ? Padding(
                                    padding: EdgeInsets.only(right: 15.w),
                                    child: const PriceErrorMessage(
                                      platformType: PlatformTypeState.web,
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(
                                      top: 15.h,
                                      left: 15.w,
                                      right: 15.w,
                                    ),
                                    child: Operation(
                                      client:
                                          subscriptionClient(globalData.url),
                                      operationRequest:
                                          GGetUserBalanceUpdatedReq(
                                        (b) => b
                                          ..vars.token = userData.value!.token,
                                      ),
                                      builder: (
                                        BuildContext context,
                                        OperationResponse<
                                                GGetUserBalanceUpdatedData?,
                                                GGetUserBalanceUpdatedVars>?
                                            response,
                                        Object? error,
                                      ) {
                                        if (response != null &&
                                            response.data != null &&
                                            response.data!.userBalanceUpdated !=
                                                null) {
                                          return AvailableBalanceRow(
                                            userBalanceUpdated: response
                                                .data!.userBalanceUpdated!,
                                            withTradingBalance:
                                                globalData.withTradingBalance,
                                            loaderState: loaderState,
                                            platformType: PlatformTypeState.web,
                                            currencyId: tradingTabWatch == 1
                                                ? marketDataWatch
                                                    .quote_currency.id: marketDataWatch
                                                    .base_currency.id,
                                          );
                                        } else {
                                          return AvailableBalanceRow(
                                            withTradingBalance:
                                                globalData.withTradingBalance,
                                            loaderState: loaderState,
                                            platformType: PlatformTypeState.web,
                                            currencyId: tradingTabWatch == 1
                                                ? marketDataWatch
                                                    .quote_currency.id: marketDataWatch
                                                    .base_currency.id,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                          ),
                          marketOrLimitProviderWatch == OrderType.limit
                              ? PriceInput(
                                  platformType: PlatformTypeState.web,
                                  priceController: priceController,
                                  totalController: totalController,
                                  amountController: amountController,
                                )
                              : const MarketPriceContainer(
                                  platformType: PlatformTypeState.web,
                                ),
                          Container(
                            height: 5.h,
                            width: double.infinity,
                            color: isLightTheme(context)
                                ? AppColors.mainBackgroundLightColor
                                : Colors.white.withOpacity(0.05),
                            margin: EdgeInsets.only(
                              left: 15.w,
                              right: 15.w,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 17.h),
                    child: SizedBox(
                      height: 48.h,
                      child: errorMinAmountWatch
                          ? Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: const AmountErrorMessage(),
                            )
                          : SizedBox(
                              width: double.infinity,
                              child: OrderPercentSelector(
                                platformType: PlatformTypeState.web,
                                amountController: amountController,
                                priceController: priceController,
                                totalController: totalController,
                                active: active,
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: AmountInput(
                      platformType: PlatformTypeState.web,
                      priceController: priceController,
                      totalController: totalController,
                      amountController: amountController,
                      active: active,
                    ),
                  ),
                  Container(
                    height: 5.h,
                    width: double.infinity,
                    color: isLightTheme(context)
                        ? AppColors.mainBackgroundLightColor
                        : Colors.white.withOpacity(0.05),
                    margin: EdgeInsets.only(
                      left: 15.w,
                      right: 15.w,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: TotalInput(
                      platformType: PlatformTypeState.web,
                      currencyId: marketDataWatch.quote_currency.id,
                      totalController: totalController,
                      priceController: priceController,
                      amountController: amountController,
                    ),
                  ),
                  Container(
                    height: 5.h,
                    width: double.infinity,
                    color: isLightTheme(context)
                        ? AppColors.mainBackgroundLightColor
                        : Colors.white.withOpacity(0.05),
                    margin: EdgeInsets.only(
                      left: 15.w,
                      right: 15.w,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 25.h,
                      left: 15.w,
                      right: 15.w,
                    ),
                    child: loaderState.value == LoadState.loading
                        ? const CircularProgressIndicator()
                        : MainButton(
                            fontSize: 20,
                            onTap: validateButton(
                              ref: ref,
                              totalController: totalController,
                              amountController: amountController,
                            )
                                ? () {
                                    createOrder(
                                      platformType: PlatformTypeState.web,
                                      loaderState: loaderState,
                                      context: context,
                                      ref: ref,
                                      counter: counter,
                                      totalController: totalController,
                                      priceController: priceController,
                                      amountController: amountController,
                                    );
                                  }
                                : null,
                            disableColor: tradingTabWatch == 1
                                ? MainColorsApp.greenColor.withOpacity(0.5)
                                : Theme.of(context)
                                    .colorScheme
                                    .error
                                    .withOpacity(0.5),
                            text: tradingTabWatch == 1
                                ? tr('trade.buy')
                                : tr('trade.sell'),
                            height: 60.h,
                            color: tradingTabWatch == 1
                                ? MainColorsApp.greenColor
                                : Theme.of(context).colorScheme.error,
                            borderRadius: 10.r,
                          ),
                  ),
                ],
              ),
            );
          },
          error: (error, _) => UserAppError(
            errorMessage: error.toString(),
          ),
          loading: () => const MainLoader(),
        ),
      ),
    );
  }
}
