// ignore_for_file: use_build_context_synchronously
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/swap/submit_button_state_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/tranding_tab_provider.dart';
import 'package:user_app/application/two_fa/actions/two_fa_actions.dart';
import 'package:user_app/application/wallets/actions/wallet_actions.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/application/withdrawal/fee_withdraw_state_provider.dart';
import 'package:user_app/application/withdrawal/net_withdrawal_amount_state_notifier_provider.dart';
import 'package:user_app/application/withdrawal/withdraw_payment_interface_state_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/exchange/exchange_rate.dart';
import 'package:user_app/domain/exchange/precision_currency_state.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/wallet/market.dart';
import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/domain/wallet/wallet_payment_interface.dart';
import 'package:user_app/domain/wallet/withdraw_payment_interface.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/buy/buy_mobile.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/buy_sell_market/market_buy_sell.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/deposit/deposit_options/deposit_options.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/sell/sell_mobile.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/swap/swap_dialog.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/event_item.dart';
import 'package:user_app/presentation/components/two_fa/mobile/activation_two_fa.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/withdraw/withdarawal_coin/withdarawal_coin.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/withdraw/withdrawal_fiat/withdarawal_fiat.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/rate_convert/create_order_convert.dart';
import 'package:user_app/application/exchange/exchange_state_provider.dart';
import 'package:user_app/presentation/helpers/rate_convert/swap_convert.dart';
import 'package:collection/collection.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class EventsWithBalanceMobile extends HookConsumerWidget {
  const EventsWithBalanceMobile({
    Key? key,
    required this.withTradingBalance,
  }) : super(key: key);

  final bool withTradingBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletDataStateNotifierProvider);
    final exchangeDataRead = ref.read(exchangeStateNotifierProvider.notifier);
    final tradingTabState = ref.read(tradingTabProvider.notifier);
    final marketPercentState =
        ref.read(marketPercentProviderProviderMobile.notifier);
    final submitButtonSwapState =
        ref.read(submitButtonSwapStateProvider.notifier);
    final withdrawPaymentInterfaceRead =
        ref.read(withdrawPaymentInterfaceNotifierProvider.notifier);

    final loaderState = useState(LoadState.notLoading);
    final loaderDepositState = useState(LoadState.notLoading);

    final iconColor = getWalletColor(
      walletState.lightBgColor1,
      walletState.darkBgColor1,
      isLightTheme(context),
    );

    NavigatorState stateNavigator = Navigator.of(context);
    TwoFaActionsGeneral twoFaActionsGeneral = TwoFaActionsGeneral();

    final updateWithdrawalFee =
        ref.read(feeWithdrawalNotifierProvider.notifier);
    final updateNetAmountWatch = ref.watch(netWithdrawalAmountNotifierProvider);

    final userBalances = ref.watch(userBalancesStateNotifierProvider);
    UserBalance userBalance =
        userBalances.firstWhere((element) => element.id == walletState.id);
    double walletBalance = withTradingBalance
        ? userBalance.balance!
        : (userBalance.balance! + userBalance.advancedTradingBalance!);

    final walletListWatch = ref.watch(walletsListDataStateNotifierProvider);

    final isMarketsForSwap = walletState.markets
        .firstWhereOrNull((element) => element.enable_custodial_exchange);

    var globalConfigBox = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = globalConfigBox.getAt(0)!;

    return Row(
      mainAxisAlignment: globalData.enabledBuySell
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      children: [
        EventItemMobile(
          colorIcon: iconColor,
          disableButton:
              loaderDepositState.value == LoadState.loading ? true : false,
          onTap: () async {
            loaderDepositState.value = LoadState.loading;
            var listWalletDepositPI =
                await WalletActionsGeneral().getDepositWalletPaymentInterface(
              currencyId: walletState.id,
            );
            loaderDepositState.value = LoadState.notLoading;
            if (listWalletDepositPI is List<WalletPaymentInterface>) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DepositOptionsMobile(
                      listWalletDepositPI: listWalletDepositPI),
                ),
              );
            }
          },
          title: tr('Receive'),
          iconPath: receiveWalletIcon,
        ),
        globalData.enabledBuySell
            ? Consumer(
                builder: (_, ref, __) {
                  final userBalance = ref
                      .watch(userBalancesStateNotifierProvider)
                      .firstWhere((e) => e.id == walletState.id);
                  return EventItemMobile(
                    colorIcon: iconColor,
                    onTap: () async {
                      if (globalData.withInstantBuy) {
                        if (walletState.markets.isNotEmpty &&
                            userBalance.balance != null) {
                          var amountTo = '0.0';
                          var amountFrom = '0.0';
                          List<Currency> listCurrencyFrom = [];
                          List<Currency> listCurrencyTo = [];
                          getData() async {
                            for (int i = 0;
                                i < walletState.markets.length;
                                i++) {
                              if (walletState.markets[i].enable_trading) {
                                if (walletState.id ==
                                    walletState.markets[i].base_currency.id) {
                                  listCurrencyFrom.add(
                                    Currency(
                                      id: walletState
                                          .markets[i].quote_currency.id,
                                      name: walletState
                                          .markets[i].quote_currency.name,
                                      iconUrl: walletState
                                          .markets[i].quote_currency.icon_url,
                                      precision: walletState
                                          .markets[i].quote_currency.precision,
                                      minAmount: walletState
                                          .markets[i].minQuoteCurrencyAmount!,
                                      marketId: walletState.markets[i].id,
                                      swapBaseToQuotePricePrecision: walletState
                                          .markets[i]
                                          .swapBaseToQuotePricePrecision,
                                      swapQuoteToBasePricePrecision: walletState
                                          .markets[i]
                                          .swapQuoteToBasePricePrecision,
                                    ),
                                  );
                                  listCurrencyTo.add(
                                    Currency(
                                      id: walletState
                                          .markets[i].base_currency.id,
                                      name: walletState
                                          .markets[i].base_currency.name,
                                      iconUrl: walletState
                                          .markets[i].base_currency.icon_url,
                                      precision: walletState
                                          .markets[i].base_currency.precision,
                                      minAmount: walletState
                                          .markets[i].minBaseCurrencyAmount!,
                                      marketId: walletState.markets[i].id,
                                      swapBaseToQuotePricePrecision: walletState
                                          .markets[i]
                                          .swapBaseToQuotePricePrecision,
                                      swapQuoteToBasePricePrecision: walletState
                                          .markets[i]
                                          .swapQuoteToBasePricePrecision,
                                    ),
                                  );
                                }
                              }
                            }

                            if (listCurrencyFrom.isNotEmpty &&
                                listCurrencyTo.isNotEmpty) {
                              exchangeDataRead
                                  .updateCurrencyFromList(listCurrencyFrom);
                              exchangeDataRead
                                  .updateCurrencyToList(listCurrencyTo);

                              exchangeDataRead
                                  .updateSelectedToCurrency(listCurrencyTo[0]);

                              exchangeDataRead.updateSelectedFromCurrency(
                                  listCurrencyFrom[0]);

                              Market? market = walletState.markets
                                  .firstWhereOrNull((p0) =>
                                      p0.base_currency.id ==
                                      listCurrencyFrom[0].id);

                              // ignore: prefer_conditional_assignment
                              if (market == null) {
                                market = walletState.markets.firstWhereOrNull(
                                    (p0) =>
                                        p0.quote_currency.id ==
                                        listCurrencyFrom[0].id);
                              }
                              exchangeDataRead.updateActiveMarket(market!);

                              amountFrom = market.trading_min_amount
                                  .toStringAsFixed(
                                      market.trading_amount_precision);

                              var convertedValue = createOrderConvert(
                                market: market,
                                currencyFrom: listCurrencyTo[0].id,
                                currencyTo: listCurrencyFrom[0].id,
                                amount: double.parse(amountFrom),
                              );

                              amountTo =
                                  '≈ ${numberFormatWithPrecision(listCurrencyFrom[0].precision).format(convertedValue)}';

                              var rate =
                                  (convertedValue / double.parse(amountFrom));

                              exchangeDataRead.updateRate(
                                ExchangeRate(
                                  currencyTo: listCurrencyFrom[0],
                                  currencyFrom: listCurrencyTo[0],
                                  rateWithPrecision: rate.toStringAsFixed(
                                      listCurrencyFrom[0].precision),
                                  rate: rate,
                                ),
                              );
                            }
                          }

                          await getData();

                          if (listCurrencyFrom.isNotEmpty &&
                              listCurrencyTo.isNotEmpty) {
                            tradingTabState.state = 1;
                            marketPercentState.state = 0;

                            if (!stateNavigator.mounted) return;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MarketBuySellMobile(
                                  withTradingBalance: withTradingBalance,
                                  fromControllerInitValue: amountFrom,
                                  toControllerInitValue: amountTo,
                                ),
                              ),
                            );
                          } else {
                            final snackBar = SnackBar(
                              elevation: 0,
                              clipBehavior: Clip.none,
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.viewInsetsOf(context).bottom + 30
                                      ..h,
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: tr('snack_bar_message.errors.error'),
                                message: tr(
                                    'snack_bar_message.errors.this_option_is_currently_unavailable'),
                                contentType: ContentType.failure,
                              ),
                            );

                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          }
                        } else {
                          final snackBar = SnackBar(
                            elevation: 0,
                            clipBehavior: Clip.none,
                            padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.viewInsetsOf(context).bottom + 30
                                    ..h,
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: tr('snack_bar_message.errors.error'),
                              message: tr(
                                  'snack_bar_message.errors.this_option_is_currently_unavailable'),
                              contentType: ContentType.failure,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        }
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BuyMobile(),
                          ),
                        );
                      }
                    },
                    title: tr('wallet.buy'),
                    iconPath: buyWalletIcons,
                  );
                },
              )
            : SizedBox(
                width: 10.w,
              ),
        EventItemMobile(
          colorIcon: isMarketsForSwap == null
              ? iconColor.withOpacity(0.25)
              : iconColor,
          iconPath: swapTab,
          title: tr('wallet.swap'),
          onTap: isMarketsForSwap == null
              ? null
              : () async {
                  try {
                    var amountTo = '0.0';
                    var amountFrom = '0.0';
                    List<Currency> listCurrencyFrom = [];
                    List<Currency> listCurrencyTo = [];

                    getData() async {
                      for (int i = 0; i < walletState.markets.length; i++) {
                        userBalances
                            .firstWhere((element) =>
                                element.id ==
                                walletState.markets[i].base_currency.id)
                            .advancedTradingBalance;

                        if (walletState.markets[i].enable_custodial_exchange &&
                            (userBalances
                                    .firstWhere((element) =>
                                        element.id ==
                                        walletState.markets[i].base_currency.id)
                                    .enabled &&
                                userBalances
                                    .firstWhere((element) =>
                                        element.id ==
                                        walletState
                                            .markets[i].quote_currency.id)
                                    .enabled)) {
                          if (walletState.id ==
                              walletState.markets[i].base_currency.id) {
                            listCurrencyTo.add(
                              Currency(
                                id: walletState.markets[i].quote_currency.id,
                                name:
                                    walletState.markets[i].quote_currency.name,
                                iconUrl: walletState
                                    .markets[i].quote_currency.icon_url,
                                precision: walletState
                                    .markets[i].quote_currency.precision,
                                swapQuoteToBasePricePrecision: walletState
                                    .markets[i].swapQuoteToBasePricePrecision,
                                swapBaseToQuotePricePrecision: walletState
                                    .markets[i].swapBaseToQuotePricePrecision,
                                minAmount: walletState
                                        .markets[i].minQuoteCurrencyAmount ??
                                    0,
                                marketId: walletState.markets[i].id,
                              ),
                            );
                          } else {
                            listCurrencyTo.add(
                              Currency(
                                id: walletState.markets[i].base_currency.id,
                                name: walletState.markets[i].base_currency.name,
                                iconUrl: walletState
                                    .markets[i].base_currency.icon_url,
                                precision: walletState
                                    .markets[i].base_currency.precision,
                                swapQuoteToBasePricePrecision: walletState
                                    .markets[i].swapQuoteToBasePricePrecision,
                                swapBaseToQuotePricePrecision: walletState
                                    .markets[i].swapBaseToQuotePricePrecision,
                                minAmount: walletState
                                        .markets[i].minBaseCurrencyAmount ??
                                    0,
                                marketId: walletState.markets[i].id,
                              ),
                            );
                          }
                        }
                      }

                      walletListWatch
                          .firstWhere((e1) => e1.id == listCurrencyTo[0].id)
                          .markets
                          .forEach(
                        (e2) {
                          if (e2.enable_custodial_exchange) {
                            if (listCurrencyTo[0].id == e2.base_currency.id) {
                              listCurrencyFrom.add(
                                Currency(
                                  id: e2.quote_currency.id,
                                  name: e2.quote_currency.name,
                                  iconUrl: e2.quote_currency.icon_url,
                                  precision: e2.quote_currency.precision,
                                  swapQuoteToBasePricePrecision:
                                      e2.swapQuoteToBasePricePrecision,
                                  swapBaseToQuotePricePrecision:
                                      e2.swapBaseToQuotePricePrecision,
                                  minAmount: e2.minQuoteCurrencyAmount ?? 0,
                                  marketId: e2.id,
                                ),
                              );
                            } else {
                              listCurrencyFrom.add(
                                Currency(
                                  id: e2.base_currency.id,
                                  name: e2.base_currency.name,
                                  iconUrl: e2.base_currency.icon_url,
                                  precision: e2.base_currency.precision,
                                  swapQuoteToBasePricePrecision:
                                      e2.swapQuoteToBasePricePrecision,
                                  swapBaseToQuotePricePrecision:
                                      e2.swapBaseToQuotePricePrecision,
                                  minAmount: e2.minBaseCurrencyAmount ?? 0,
                                  marketId: e2.id,
                                ),
                              );
                            }
                          }
                        },
                      );
                      int indexOfObjectToMove = listCurrencyFrom.indexWhere(
                          (element) => element.id == walletState.id);
                      Currency movedObject =
                          listCurrencyFrom.removeAt(indexOfObjectToMove);
                      listCurrencyFrom.insert(0, movedObject);

                      if (listCurrencyFrom.isNotEmpty &&
                          listCurrencyTo.isNotEmpty) {
                        exchangeDataRead
                            .updateCurrencyFromList(listCurrencyFrom);
                        exchangeDataRead.updateCurrencyToList(listCurrencyTo);

                        exchangeDataRead
                            .updateSelectedToCurrency(listCurrencyTo[0]);

                        exchangeDataRead
                            .updateSelectedFromCurrency(listCurrencyFrom[0]);

                        exchangeDataRead.updatePrecision(
                          PrecisionCurrencyState(
                            swapBaseToQuotePricePrecision: listCurrencyTo[0]
                                .swapBaseToQuotePricePrecision!,
                            swapQuoteToBasePricePrecision: listCurrencyTo[0]
                                .swapQuoteToBasePricePrecision!,
                          ),
                          PrecisionCurrencyState(
                            swapBaseToQuotePricePrecision: listCurrencyFrom[0]
                                .swapBaseToQuotePricePrecision!,
                            swapQuoteToBasePricePrecision: listCurrencyFrom[0]
                                .swapQuoteToBasePricePrecision!,
                          ),
                        );

                        final activeMarket = walletListWatch
                            .firstWhere((e1) => e1.id == listCurrencyFrom[0].id)
                            .markets
                            .firstWhere(
                                (e2) => e2.id == listCurrencyFrom[0].marketId);

                        exchangeDataRead.updateActiveMarket(activeMarket);

                        amountFrom = (activeMarket.base_currency.id ==
                                    listCurrencyFrom[0].id
                                ? activeMarket.minBaseCurrencyAmount!
                                : activeMarket.minQuoteCurrencyAmount!)
                            .toStringAsFixed(walletState.precision);

                        var convertedValue = swapConvert(
                          market: activeMarket,
                          currencyFrom: listCurrencyFrom[0].id,
                          currencyTo: listCurrencyTo[0].id,
                          amount: double.parse(amountFrom),
                        );

                        amountTo =
                            '≈ ${numberFormatWithPrecision(listCurrencyTo[0].precision).format(convertedValue)}';

                        var rate = (convertedValue / double.parse(amountFrom));

                        exchangeDataRead.updateRate(
                          ExchangeRate(
                            currencyTo: listCurrencyTo[0],
                            currencyFrom: listCurrencyFrom[0],
                            rateWithPrecision: rate
                                .toStringAsFixed(listCurrencyFrom[0].precision),
                            rate: rate,
                          ),
                        );
                      }
                    }

                    await getData();

                    if (listCurrencyFrom.isNotEmpty &&
                        listCurrencyTo.isNotEmpty) {
                      if (double.parse(amountFrom) <= walletBalance) {
                        submitButtonSwapState.state = true;
                      } else {
                        submitButtonSwapState.state = false;
                      }

                      if (!stateNavigator.mounted) return;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SwapMobile(
                            withTradingBalance: withTradingBalance,
                            fromControllerInitValue: amountFrom,
                            toControllerInitValue: amountTo,
                          ),
                        ),
                      );
                    } else {
                      if (!stateNavigator.mounted) return;

                      final snackBar = SnackBar(
                        elevation: 0,
                        clipBehavior: Clip.none,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          titleFontSize: 20.sp,
                          messageFontSize: 15.sp,
                          title: tr('snack_bar_message.errors.error'),
                          message: tr(
                              'snack_bar_message.errors.this_option_is_currently_unavailable'),
                          contentType: ContentType.failure,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    }
                  } catch (e) {
                    final snackBar = SnackBar(
                      elevation: 0,
                      clipBehavior: Clip.none,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        titleFontSize: 20.sp,
                        messageFontSize: 15.sp,
                        title: tr('snack_bar_message.errors.error'),
                        message:
                            tr('snack_bar_message.errors.something_went_wrong'),
                        contentType: ContentType.failure,
                      ),
                    );

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  }
                },
        ),
        globalData.enabledBuySell
            ? EventItemMobile(
                colorIcon: globalData.enabledSellWithdrawZeroBalance ||
                        walletBalance > 0
                    ? iconColor
                    : iconColor.withOpacity(0.25),
                iconPath: sellWalletIcon,
                title: tr('wallet.sell'),
                onTap: globalData.enabledSellWithdrawZeroBalance ||
                        walletBalance > 0
                    ? () async {
                        if (globalData.withInstantSell) {
                          if (walletState.markets.isNotEmpty) {
                            var amountTo = '0.0';
                            var amountFrom = '0.0';
                            List<Currency> listCurrencyFrom = [];
                            List<Currency> listCurrencyTo = [];
                            getData() async {
                              for (int i = 0;
                                  i < walletState.markets.length;
                                  i++) {
                                if (walletState.markets[i].enable_trading) {
                                  if (walletState.id ==
                                      walletState.markets[i].base_currency.id) {
                                    listCurrencyFrom.add(
                                      Currency(
                                        id: walletState
                                            .markets[i].quote_currency.id,
                                        name: walletState
                                            .markets[i].quote_currency.name,
                                        iconUrl: walletState
                                            .markets[i].quote_currency.icon_url,
                                        precision: walletState.markets[i]
                                            .quote_currency.precision,
                                        minAmount: walletState
                                            .markets[i].minQuoteCurrencyAmount!,
                                        marketId: walletState.markets[i].id,
                                        swapBaseToQuotePricePrecision:
                                            walletState.markets[i]
                                                .swapBaseToQuotePricePrecision,
                                        swapQuoteToBasePricePrecision:
                                            walletState.markets[i]
                                                .swapQuoteToBasePricePrecision,
                                      ),
                                    );
                                    listCurrencyTo.add(
                                      Currency(
                                        id: walletState
                                            .markets[i].base_currency.id,
                                        name: walletState
                                            .markets[i].base_currency.name,
                                        iconUrl: walletState
                                            .markets[i].base_currency.icon_url,
                                        precision: walletState
                                            .markets[i].base_currency.precision,
                                        minAmount: walletState
                                            .markets[i].minBaseCurrencyAmount!,
                                        marketId: walletState.markets[i].id,
                                        swapBaseToQuotePricePrecision:
                                            walletState.markets[i]
                                                .swapBaseToQuotePricePrecision,
                                        swapQuoteToBasePricePrecision:
                                            walletState.markets[i]
                                                .swapQuoteToBasePricePrecision,
                                      ),
                                    );
                                  }
                                }
                              }

                              if (listCurrencyFrom.isNotEmpty &&
                                  listCurrencyTo.isNotEmpty) {
                                exchangeDataRead
                                    .updateCurrencyFromList(listCurrencyFrom);
                                exchangeDataRead
                                    .updateCurrencyToList(listCurrencyTo);

                                exchangeDataRead.updateSelectedToCurrency(
                                    listCurrencyTo[0]);

                                exchangeDataRead.updateSelectedFromCurrency(
                                    listCurrencyFrom[0]);

                                Market? market = walletState.markets
                                    .firstWhereOrNull((p0) =>
                                        p0.base_currency.id ==
                                        listCurrencyFrom[0].id);

                                // ignore: prefer_conditional_assignment
                                if (market == null) {
                                  market = walletState.markets.firstWhereOrNull(
                                      (p0) =>
                                          p0.quote_currency.id ==
                                          listCurrencyFrom[0].id);
                                }
                                exchangeDataRead.updateActiveMarket(market!);

                                amountFrom = market.trading_min_amount
                                    .toStringAsFixed(
                                        market.trading_amount_precision);

                                var convertedValue = createOrderConvert(
                                  market: market,
                                  currencyFrom: listCurrencyTo[0].id,
                                  currencyTo: listCurrencyFrom[0].id,
                                  amount: double.parse(amountFrom),
                                );

                                amountTo =
                                    '≈ ${numberFormatWithPrecision(listCurrencyFrom[0].precision).format(convertedValue)}';

                                var rate =
                                    (convertedValue / double.parse(amountFrom));

                                exchangeDataRead.updateRate(
                                  ExchangeRate(
                                    currencyTo: listCurrencyFrom[0],
                                    currencyFrom: listCurrencyTo[0],
                                    rateWithPrecision: rate.toStringAsFixed(
                                        listCurrencyTo[0].precision),
                                    rate: rate,
                                  ),
                                );
                              }
                            }

                            await getData();

                            if (listCurrencyFrom.isNotEmpty &&
                                listCurrencyTo.isNotEmpty) {
                              tradingTabState.state = 2;
                              marketPercentState.state = 0;

                              if (!stateNavigator.mounted) return;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MarketBuySellMobile(
                                    withTradingBalance: withTradingBalance,
                                    fromControllerInitValue: amountFrom,
                                    toControllerInitValue: amountTo,
                                  ),
                                ),
                              );
                            } else {
                              final snackBar = SnackBar(
                                elevation: 0,
                                clipBehavior: Clip.none,
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.viewInsetsOf(context).bottom +
                                          30
                                        ..h,
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: tr('snack_bar_message.errors.error'),
                                  message: tr(
                                      'snack_bar_message.errors.this_option_is_currently_unavailable'),
                                  contentType: ContentType.failure,
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                            }
                          } else {
                            final snackBar = SnackBar(
                              elevation: 0,
                              clipBehavior: Clip.none,
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.viewInsetsOf(context).bottom + 30
                                      ..h,
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: tr('snack_bar_message.errors.error'),
                                message: tr(
                                    'snack_bar_message.errors.this_option_is_currently_unavailable'),
                                contentType: ContentType.failure,
                              ),
                            );

                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          }
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SellMobile(),
                            ),
                          );
                        }
                      }
                    : null,
              )
            : SizedBox(
                width: 10.w,
              ),
        EventItemMobile(
          colorIcon:
              globalData.enabledSellWithdrawZeroBalance || walletBalance > 0
                  ? iconColor
                  : iconColor.withOpacity(0.25),
          iconPath: sendWalletIcon,
          disableButton: loaderState.value == LoadState.loading ? true : false,
          onTap: globalData.enabledSellWithdrawZeroBalance || walletBalance > 0
              ? () async {
                  loaderState.value = LoadState.loading;
                  var twoFaStatus = await twoFaActionsGeneral.getTwoFaStatus();

                  if (twoFaStatus) {
                    if (!stateNavigator.mounted) return;
                    var listWalletWithdraw = await WalletActionsGeneral()
                        .getWithdrawWalletPaymentInterface(
                      currencyId: walletState.id,
                    );

                    if (listWalletWithdraw is List<WithdrawPaymentInterface>) {
                      if (listWalletWithdraw.isEmpty) {
                        final snackBar = SnackBar(
                          elevation: 0,
                          clipBehavior: Clip.none,
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.viewInsetsOf(context).bottom + 30
                              ..h,
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            titleFontSize: 20.sp,
                            messageFontSize: 15.sp,
                            title: tr('snack_bar_message.errors.error'),
                            message: tr(
                                'snack_bar_message.errors.withdraw_unavailable'),
                            contentType: ContentType.failure,
                          ),
                        );

                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      } else {
                        WithdrawPaymentInterface fiatWithdrawWallet =
                            listWalletWithdraw.firstWhere(
                          (element) => element.type == 'fiat',
                          orElse: () => WithdrawPaymentInterface.initialData(),
                        );

                        withdrawPaymentInterfaceRead
                            .updateInterface(listWalletWithdraw[0]);

                        updateWithdrawalFee.updateFee(
                          listWalletWithdraw[0]
                              .minWithdrawFee
                              .toStringAsFixed(walletState.precision),
                        );
                        updateNetAmountWatch['amount'] = double.parse('0')
                            .toStringAsFixed(walletState.precision);

                        if (fiatWithdrawWallet.type == 'fiat') {
                          if (!stateNavigator.mounted) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WithdrawalFiatMobile(
                                withTradingBalance: withTradingBalance,
                              ),
                            ),
                          );
                        } else {
                          if (!stateNavigator.mounted) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WithdrawCoinMobile(
                                listWalletWithdraw: listWalletWithdraw,
                                withTradingBalance: withTradingBalance,
                              ),
                            ),
                          );
                        }
                      }
                    }
                    loaderState.value = LoadState.notLoading;
                  } else {
                    loaderState.value = LoadState.notLoading;
                    if (!stateNavigator.mounted) return;
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return const ActivationTwoFaMobile(
                          title:
                              'Please activate Two Factor\nAuthentication to do withdraw',
                        );
                      },
                    );
                  }
                }
              : null,
          title: tr('wallet.send'),
        ),
      ],
    );
  }
}
