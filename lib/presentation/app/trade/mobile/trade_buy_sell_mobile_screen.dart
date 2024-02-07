import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:slide_action/slide_action.dart';
import 'package:user_app/application/trade/create_order_with_order_book_provider.dart';
import 'package:user_app/application/trade/error_mesegge_provider.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/trade_avalible_balance_state_provider.dart';
import 'package:user_app/application/trade/trade_wallets_balance_future_provider.dart';
import 'package:user_app/application/trade/tranding_tab_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/trade/market_trade.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/wallets_data.data.gql.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/avalible_balance_row.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/create_order_button.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/error_message/amount_error_message.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/error_message/price_error_message.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/amount_input.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/market_price_container.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/price_input.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/total_input.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/persents_selector/order_persent_selecrot.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/validate_button.dart';
import 'package:user_app/presentation/app/trade/mobile/components/buy_sell_switch_widget.dart';
import 'package:user_app/presentation/app/trade/mobile/unauthorized_trade_buy_sell_mobile_screen.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class TradeBuySellScreenMobile extends StatefulHookConsumerWidget {
  const TradeBuySellScreenMobile({
    super.key,
    required this.item,
    required this.platformType,
    required this.withTradingBalance,
    required this.priceController,
    required this.amountController,
    required this.totalController,
    this.tradingTabWatch,
  });

  final PlatformTypeState platformType;
  final int? tradingTabWatch;
  final bool withTradingBalance;
  final MarketTrade item;
  final TextEditingController priceController;
  final TextEditingController amountController;
  final TextEditingController totalController;

  @override
  ConsumerState<TradeBuySellScreenMobile> createState() =>
      _TradeBuySellScreenMobileState();
}

class _TradeBuySellScreenMobileState
    extends ConsumerState<TradeBuySellScreenMobile> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final marketOrLimitProviderRead = ref.read(marketOrLimitProvider.notifier);
    final priceWithOrderBookRead =
        ref.read(priceWithOrderBookProvider.notifier);
    final amountWithOrderBookRead =
        ref.read(amountWithOrderBookProvider.notifier);
    final marketOrLimitProviderWatch = ref.watch(marketOrLimitProvider);
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);
    final marketPercentState = ref.read(marketPercentProviderProvider.notifier);
    final tradeMarketPriceRead = ref.read(tradeMarketPriceProvider.notifier);
    final tradingTabWatch = ref.watch(tradingTabProvider);
    final walletTradeData = ref.watch(walletTradeDataStateNotifierProvider);

    final errorMinOrMaxPriceWatch = ref.watch(errorMinOrMaxPriceProvider);
    final errorMinOrMaxPriceRead =
        ref.read(errorMinOrMaxPriceProvider.notifier);

    final errorMinAmountWatch = ref.watch(errorMinAmountProvider);
    final errorMinAmountRead = ref.read(errorMinAmountProvider.notifier);

    final active = useState(false);
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

    var userConfigBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userConfigBox.getAt(0)!;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.mainBackgroundDarkColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            50..h,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 15..h, left: 10.w, right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BackButtonMobile(onTap: () {
                  widget.priceController.text =
                      marketOrLimitProviderRead.state == OrderType.market
                          ? marketDataWatch.marketDynamics!.lastPrice!
                              .toStringAsFixed(
                                  marketDataWatch.trading_price_precision)
                          : 0.toStringAsFixed(
                              marketDataWatch.trading_price_precision);

                  widget.amountController.text = 0.toStringAsFixed(
                      marketDataWatch.trading_amount_precision);
                  widget.totalController.text = 0.toStringAsFixed(
                      marketDataWatch.quote_currency.precision);
                  context.pop();
                }),
                Expanded(
                  child: AutoSizeText(
                    tradingTabWatch == 2
                        ? 'Sell ${widget.item.base_currency.name}'
                        : 'Buy ${widget.item.base_currency.name}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.75.sp,
                          color: AppColors.whiteColor,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const IgnorePointer(
                  child: Opacity(
                    opacity: 0,
                    child: SearchButtonMobile(),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 10..h,
          ),
          decoration: BoxDecoration(
            color: isLightTheme(context)
                ? AppColors.whiteColor
                : walletBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20..h,
                bottom: MediaQuery.of(context).viewInsets.bottom + 50
                  ..h,
              ),
              child: Column(
                children: [
                  MarketLimitSwitchMobile(
                    options: const [OrderType.market, OrderType.limit],
                    changeType: (index) {
                      priceWithOrderBookRead.state = 0;
                      amountWithOrderBookRead.state = 0;

                      widget.priceController.text =
                          marketOrLimitProviderRead.state == OrderType.market
                              ? marketDataWatch.marketDynamics!.lastPrice!
                                  .toStringAsFixed(
                                      marketDataWatch.trading_price_precision)
                              : 0.toStringAsFixed(
                                  marketDataWatch.trading_price_precision);

                      widget.amountController.text = 0.toStringAsFixed(
                          marketDataWatch.trading_amount_precision);
                      widget.totalController.text = 0.toStringAsFixed(
                          marketDataWatch.quote_currency.precision);
                      marketPercentState.state = 0;

                      errorMinAmountRead.state = false;
                      errorMinOrMaxPriceRead.state = false;
                    },
                  ),
                  userData.token != null
                      ? walletFuture.when(
                          data: (data) {
                            var wallets = walletTradeData;

                            GTradeWalletsDataData_user_currencies
                                quoteCurrency = wallets.firstWhere(
                              (element) {
                                return element!.id ==
                                    marketDataWatch.quote_currency.id;
                              },
                            )!;

                            GTradeWalletsDataData_user_currencies baseCurrency =
                                wallets.firstWhere(
                              (element) {
                                return element!.id ==
                                    marketDataWatch.base_currency.id;
                              },
                            )!;

                            String quoteCurrencyBalanceBuy = (widget
                                        .withTradingBalance
                                    ? quoteCurrency.advancedTradingBalance!
                                    : (quoteCurrency.advancedTradingBalance! +
                                        quoteCurrency.balance!))
                                .toStringAsFixed(
                                    marketDataWatch.quote_currency.precision);

                            String baseCurrencyBalanceSell = (widget
                                        .withTradingBalance
                                    ? baseCurrency.advancedTradingBalance!
                                    : (baseCurrency.advancedTradingBalance! +
                                        baseCurrency.balance!))
                                .toStringAsFixed(
                                    marketDataWatch.base_currency.precision);

                            if (tradeMarketPriceRead.state.buy == 'none' ||
                                tradeMarketPriceRead.state.sell == 'none') {
                              tradeMarketPriceRead
                                  .updateBuy(quoteCurrencyBalanceBuy);
                              tradeMarketPriceRead
                                  .updateSell(baseCurrencyBalanceSell);
                              // totalController!.text =
                              //     '≈ ${0.toStringAsFixed(marketDataWatch.quote_currency!.precision!)}';
                              // amountController!.text = 0.toStringAsFixed(
                              //     marketDataWatch.trading_amount_precision!);
                            }

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Stack(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 48..h,
                                          child: errorMinOrMaxPriceWatch
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 30.w,
                                                  ),
                                                  child: PriceErrorMessage(
                                                    platformType:
                                                        widget.platformType,
                                                  ),
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 30.w,
                                                  ),
                                                  child: AvailableBalanceRow(
                                                    withTradingBalance: widget
                                                        .withTradingBalance,
                                                    loaderState: loaderState,
                                                    platformType:
                                                        widget.platformType,
                                                    currencyId:
                                                        tradingTabWatch == 1
                                                            ? marketDataWatch
                                                                .quote_currency
                                                                .id
                                                            : marketDataWatch
                                                                .base_currency
                                                                .id,
                                                  ),
                                                ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 15.w,
                                            right: 15.w,
                                          ),
                                          child: marketOrLimitProviderWatch ==
                                                  OrderType.limit
                                              ? PriceInput(
                                                  platformType:
                                                      widget.platformType,
                                                  priceController:
                                                      widget.priceController,
                                                  totalController:
                                                      widget.totalController,
                                                  amountController:
                                                      widget.amountController,
                                                )
                                              : MarketPriceContainer(
                                                  platformType:
                                                      widget.platformType,
                                                ),
                                        ),
                                        Container(
                                          height: 5..h,
                                          width: double.infinity,
                                          color: isLightTheme(context)
                                              ? AppColors
                                                  .mainBackgroundLightColor
                                              : Colors.white.withOpacity(0.05),
                                          margin: EdgeInsets.only(
                                            left: 30.w,
                                            right: 30.w,
                                            top: 8..h,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 22..h,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 48..h,
                                      child: errorMinAmountWatch
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                right: 30.w,
                                              ),
                                              child: const AmountErrorMessage(),
                                            )
                                          : Padding(
                                              padding: EdgeInsets.only(
                                                left: 10.w,
                                                right: 10.w,
                                              ),
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: OrderPercentSelector(
                                                  platformType:
                                                      widget.platformType,
                                                  amountController:
                                                      widget.amountController,
                                                  priceController:
                                                      widget.priceController,
                                                  totalController:
                                                      widget.totalController,
                                                  active: active,
                                                ),
                                              ),
                                            ),
                                    ),
                                    SizedBox(
                                      height: 15..h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 15.w,
                                        right: 30.w,
                                      ),
                                      child: AmountInput(
                                        platformType: widget.platformType,
                                        priceController: widget.priceController,
                                        totalController: widget.totalController,
                                        amountController:
                                            widget.amountController,
                                        active: active,
                                      ),
                                    ),
                                    Container(
                                      height: 5..h,
                                      width: double.infinity,
                                      color: isLightTheme(context)
                                          ? AppColors.mainBackgroundLightColor
                                          : Colors.white.withOpacity(0.05),
                                      margin: EdgeInsets.only(
                                        left: 30.w,
                                        right: 30.w,
                                        top: 8..h,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 31..h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 15.w, right: 30.w),
                                  child: TotalInput(
                                    platformType: widget.platformType,
                                    currencyId:
                                        marketDataWatch.quote_currency.id,
                                    totalController: widget.totalController,
                                    priceController: widget.priceController,
                                    amountController: widget.amountController,
                                  ),
                                ),
                                Container(
                                  height: 5..h,
                                  width: double.infinity,
                                  color: isLightTheme(context)
                                      ? AppColors.mainBackgroundLightColor
                                      : Colors.white.withOpacity(0.05),
                                  margin: EdgeInsets.only(
                                    left: 30.w,
                                    right: 30.w,
                                    top: 8..h,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 28..h,
                                    left: 30.w,
                                    right: 30.w,
                                  ),
                                  child: loaderState.value == LoadState.loading
                                      ? const CircularProgressIndicator()
                                      : SlideAction(
                                          trackHeight: 50..h,
                                          trackBuilder: (context, state) {
                                            return Container(
                                              margin: EdgeInsets.only(
                                                top: 3..h,
                                                bottom: 3..h,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25.r),
                                                color: validateButton(
                                                  ref: ref,
                                                  totalController:
                                                      widget.totalController,
                                                  amountController:
                                                      widget.amountController,
                                                )
                                                    ? (tradingTabWatch == 2
                                                        ? MainColorsApp.redColor
                                                            .withOpacity(0.5)
                                                        : MainColorsApp
                                                            .greenColor
                                                            .withOpacity(0.5))
                                                    : isLightTheme(context)
                                                        ? AppColors
                                                            .mainBackgroundLightColor
                                                            .withOpacity(0.5)
                                                        : AppColors.whiteColor
                                                            .withOpacity(0.25),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  tradingTabWatch == 1
                                                      ? "Swipe to buy ${widget.item.base_currency.id}"
                                                      : "Swipe to sell ${widget.item.base_currency.id}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium!
                                                      .copyWith(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        letterSpacing: -0.75.sp,
                                                        color: validateButton(
                                                          ref: ref,
                                                          totalController: widget
                                                              .totalController,
                                                          amountController: widget
                                                              .amountController,
                                                        )
                                                            ? Colors.white
                                                            : isLightTheme(
                                                                    context)
                                                                ? AppColors
                                                                    .aboutHeaderLight
                                                                : AppColors
                                                                    .whiteColor
                                                                    .withOpacity(
                                                                        0.25),
                                                      ),
                                                ),
                                              ),
                                            );
                                          },
                                          thumbBuilder: (context, state) {
                                            return Container(
                                              height: 50..h,
                                              width: 50.w,
                                              decoration: BoxDecoration(
                                                color: validateButton(
                                                  ref: ref,
                                                  totalController:
                                                      widget.totalController,
                                                  amountController:
                                                      widget.amountController,
                                                )
                                                    ? (tradingTabWatch == 2
                                                        ? MainColorsApp.redColor
                                                        : MainColorsApp
                                                            .greenColor)
                                                    : isLightTheme(context)
                                                        ? AppColors
                                                            .mainBackgroundLightColor
                                                        : AppColors
                                                            .mainBackgroundDarkColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: Container(
                                                  height: 22..h,
                                                  width: 22.w,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors.whiteColor,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          action: validateButton(
                                            ref: ref,
                                            totalController:
                                                widget.totalController,
                                            amountController:
                                                widget.amountController,
                                          )
                                              ? () {
                                                  createOrder(
                                                    platformType:
                                                        widget.platformType,
                                                    loaderState: loaderState,
                                                    context: context,
                                                    ref: ref,
                                                    counter: counter,
                                                    totalController:
                                                        widget.totalController,
                                                    priceController:
                                                        widget.priceController,
                                                    amountController:
                                                        widget.amountController,
                                                  );
                                                }
                                              : null,
                                        ),
                                ),
                              ],
                            );
                          },
                          error: (error, _) => UserAppError(
                            errorMessage: error.toString(),
                          ),
                          loading: () => Padding(
                            padding: EdgeInsets.only(top: 30..h),
                            child: const MainLoaderMobile(
                              loaderSize: 100,
                            ),
                          ),
                        )
                      : UnauthorizedTradeBuySellMobileScreen(
                          tradingTabWatch: widget.tradingTabWatch,
                          priceController: widget.priceController,
                          amountController: widget.amountController,
                          totalController: widget.totalController,
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
