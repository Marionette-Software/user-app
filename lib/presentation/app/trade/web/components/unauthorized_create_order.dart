import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/application/trade/create_order_with_order_book_provider.dart';
import 'package:user_app/application/trade/get_market_dynamyc_future_provider.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/tranding_tab_provider.dart';
import 'package:user_app/domain/auth/auth_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/market_limit_switch_web.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/amount_input.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/market_price_container.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/price_input.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/order_inputs/total_input.dart';
import 'package:user_app/presentation/app/trade/components/create_order/components/persents_selector/components/order_selector_item.dart';
import 'package:user_app/presentation/app/trade/components/trade_tab_bar/trade_tab_bar.dart';
import 'package:user_app/presentation/auth/authentication.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class UnauthorizedCreateOrderWeb extends StatefulHookConsumerWidget {
  const UnauthorizedCreateOrderWeb({
    required this.priceController,
    required this.totalController,
    required this.amountController,
    super.key,
  });

  final TextEditingController priceController;
  final TextEditingController amountController;
  final TextEditingController totalController;

  @override
  ConsumerState<UnauthorizedCreateOrderWeb> createState() =>
      _UnauthorizedCreateOrderWebState();
}

class _UnauthorizedCreateOrderWebState
    extends ConsumerState<UnauthorizedCreateOrderWeb> {
  @override
  Widget build(BuildContext context) {
    final tradingTabState = ref.read(tradingTabProvider.notifier);
    final marketOrLimitProviderWatch = ref.watch(marketOrLimitProvider);
    final marketOrLimitProviderRead = ref.read(marketOrLimitProvider.notifier);
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);
    final marketPercentState = ref.read(marketPercentProviderProvider.notifier);
    final tradingTabWatch = ref.watch(tradingTabProvider);
    final authController = ref.watch(authControllerStateProvider.notifier);

    var errorMinAmount = useState(false);
    var errorMinOrMaxPrice = useState(false);
    final active = useState(false);
    final refreshValue = useState(1);
    final getMarketDynamicsFuture = ref.watch(
      getMarketDynamicsFutureProvider(
        RefreshRequest(refresh: '$refreshValue'),
      ),
    );
    useEffect(() {
      if (refreshValue.value == 0) {
        refreshValue.value++;
      }
      return null;
    }, []);

    final priceWithOrderBookRead =
        ref.read(priceWithOrderBookProvider.notifier);
    final amountWithOrderBookRead =
        ref.read(amountWithOrderBookProvider.notifier);

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
      child: getMarketDynamicsFuture.when(
        data: (data) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TradeTabBar(
                    platformType: PlatformTypeState.web,
                    leftTabOnTap: () {
                      marketPercentState.state = 0;
                      tradingTabState.state = 1;
                      if (marketOrLimitProviderWatch == OrderType.limit) {
                        widget.priceController.text = 0.toStringAsFixed(
                            marketDataWatch.trading_price_precision);
                      } else {
                        widget.priceController.text = marketDataWatch
                            .marketDynamics!.lastPrice!
                            .toStringAsFixed(
                                marketDataWatch.trading_price_precision);
                      }
                      widget.amountController.text = 0.toStringAsFixed(
                          marketDataWatch.trading_amount_precision);
                      widget.totalController.text = 0.toStringAsFixed(
                          marketDataWatch.quote_currency.precision);
                      errorMinAmount.value = false;
                      errorMinOrMaxPrice.value = false;
                    },
                    leftTabActive: tradingTabWatch == 1,
                    leftTabTitle: tr('trade.buy'),
                    rightTabOnTap: () {
                      marketPercentState.state = 0;
                      tradingTabState.state = 2;
                      if (marketOrLimitProviderWatch == OrderType.limit) {
                        widget.priceController.text = 0.toStringAsFixed(
                            marketDataWatch.trading_price_precision);
                      } else {
                        widget.priceController.text = marketDataWatch
                            .marketDynamics!.lastPrice!
                            .toStringAsFixed(
                                marketDataWatch.trading_price_precision);
                      }

                      widget.amountController.text = 0.toStringAsFixed(
                          marketDataWatch.trading_amount_precision);
                      widget.totalController.text = 0.toStringAsFixed(
                          marketDataWatch.quote_currency.precision);
                      errorMinAmount.value = false;
                      errorMinOrMaxPrice.value = false;
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
                              top: 25.h,
                              bottom: 15.h,
                            ),
                            child: MarketLimitSwitchWeb(
                              options: const [
                                OrderType.market,
                                OrderType.limit
                              ],
                              changeType: (index) {
                                priceWithOrderBookRead.state = 0;
                                amountWithOrderBookRead.state = 0;

                                widget.priceController.text =
                                    marketOrLimitProviderRead.state ==
                                            OrderType.market
                                        ? marketDataWatch
                                            .marketDynamics!.lastPrice!
                                            .toStringAsFixed(marketDataWatch
                                                .trading_price_precision)
                                        : 0.toStringAsFixed(marketDataWatch
                                            .trading_price_precision);

                                widget.amountController.text = 0
                                    .toStringAsFixed(marketDataWatch
                                        .trading_amount_precision);
                                widget.totalController.text = 0.toStringAsFixed(
                                    marketDataWatch.quote_currency.precision);
                                marketPercentState.state = 0;
                                errorMinAmount.value = false;
                                errorMinOrMaxPrice.value = false;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 15.w,
                              right: 15.w,
                            ),
                            child: SizedBox(
                              width: 347.w,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.h,
                                  horizontal: 0.w,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          tr('trade.available'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                  fontSize: 15.sp,
                                                  color: isLightTheme(context)
                                                      ? AppColors
                                                          .aboutHeaderLight
                                                      : AppColors.whiteColor
                                                          .withOpacity(0.5),
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '${tradingTabWatch == 1 ? 0.toStringAsFixed(marketDataWatch.quote_currency.precision) : 0.toStringAsFixed(marketDataWatch.base_currency.precision)} ${tradingTabWatch == 1 ? marketDataWatch.quote_currency.id : marketDataWatch.base_currency.id}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                fontSize: 15.sp,
                                                color: isLightTheme(context)
                                                    ? AppColors.aboutHeaderLight
                                                    : AppColors.whiteColor
                                                        .withOpacity(0.5),
                                                fontWeight: FontWeight.w500,
                                              ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          marketOrLimitProviderWatch == OrderType.limit
                              ? PriceInput(
                                  platformType: PlatformTypeState.web,
                                  priceController: widget.priceController,
                                  totalController: widget.totalController,
                                  amountController: widget.amountController,
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
                    padding: EdgeInsets.only(
                      top: 24.h,
                      bottom: 5.h,
                      left: 15.w,
                      right: 15.w,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OrderSelectorItem(
                            platformType: PlatformTypeState.web,
                            onTap: () {},
                            active: false,
                            title: '25%',
                          ),
                          OrderSelectorItem(
                            platformType: PlatformTypeState.web,
                            onTap: () {},
                            active: false,
                            title: '50%',
                          ),
                          OrderSelectorItem(
                            platformType: PlatformTypeState.web,
                            onTap: () {},
                            active: false,
                            title: '75%',
                          ),
                          OrderSelectorItem(
                            platformType: PlatformTypeState.web,
                            onTap: () {},
                            active: false,
                            title: '100%',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: AmountInput(
                      platformType: PlatformTypeState.web,
                      priceController: widget.priceController,
                      totalController: widget.totalController,
                      amountController: widget.amountController,
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
                      totalController: widget.totalController,
                      priceController: widget.priceController,
                      amountController: widget.amountController,
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
                      top: 35.h,
                      left: 15.w,
                      right: 15.w,
                    ),
                    child: MainButton(
                      fontSize: 20,
                      onTap: () {
                        context.go(Authentication.routeName);
                        authController.state = AuthState.signIn;
                      },
                      disableColor: tradingTabWatch == 1
                          ? MainColorsApp.greenColor.withOpacity(0.5)
                          : Theme.of(context)
                              .colorScheme
                              .error
                              .withOpacity(0.5),
                      text: tradingTabWatch == 1
                          ? tr('trade.buy')
                          : tr('trade.sell'),
                      height: 50.h,
                      color: tradingTabWatch == 1
                          ? MainColorsApp.greenColor
                          : Theme.of(context).colorScheme.error,
                      borderRadius: 10.r,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        error: (error, _) => UserAppError(
          errorMessage: error.toString(),
        ),
        loading: () => const MainLoader(),
      ),
    );
  }
}
