// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/exchange/exchange_state_provider.dart';
import 'package:user_app/application/swap/submit_button_state_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/tranding_tab_provider.dart';
import 'package:user_app/application/two_fa/actions/two_fa_actions.dart';
import 'package:user_app/application/wallets/actions/wallet_actions.dart';
import 'package:user_app/application/wallets/get_deposit_wallet_connect_state_provider.dart';
import 'package:user_app/application/wallets/get_status_payment_interface_state_provider.dart';
import 'package:user_app/application/wallets/receive_data_wc_state_provider.dart';
import 'package:user_app/application/wallets/select_deposit_network_state_provider.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/waite_wallet_connect_state_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/application/withdrawal/fee_withdraw_state_provider.dart';
import 'package:user_app/application/withdrawal/net_withdrawal_amount_state_notifier_provider.dart';
import 'package:user_app/application/withdrawal/withdraw_payment_interface_state_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/exchange/exchange_rate.dart';
import 'package:user_app/domain/exchange/precision_currency_state.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/wallet/market.dart';
import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/domain/wallet/wallet_payment_interface.dart';
import 'package:user_app/domain/wallet/withdraw_payment_interface.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_currency_chains_by_id.data.gql.dart';
import 'package:user_app/infrastructure/wallet/wallet_service.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/buy/buy.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/deposit_web/deposit_web.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/event_item.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/fiat_deposit/fiat_deposit.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/market_trades_web/market_trades_web.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/sell/sell.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/swap_web/swap_dialog.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/withdraw/fiat_withdraw/fiat_withdraw.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/withdraw/withdraw_coin/withdraw_web.dart';
import 'package:user_app/presentation/components/two_fa/activation_two_fa.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/rate_convert/create_order_convert.dart';
import 'package:user_app/presentation/helpers/rate_convert/swap_convert.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/wallet_connect/wallet_connect.dart';

class EventWithBalanceWeb extends HookConsumerWidget {
  const EventWithBalanceWeb({
    required this.withTradingBalance,
    super.key,
  });

  final bool withTradingBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final exchangeDataRead = ref.read(exchangeStateNotifierProvider.notifier);
    final submitButtonSwapState =
        ref.read(submitButtonSwapStateProvider.notifier);
    final withdrawPaymentInterfaceRead =
        ref.read(withdrawPaymentInterfaceNotifierProvider.notifier);
    final updateWithdrawalFee =
        ref.read(feeWithdrawalNotifierProvider.notifier);
    final updateNetAmountWatch = ref.watch(netWithdrawalAmountNotifierProvider);
    final selectedRead = ref.read(selectDepositNetworkStateProvider.notifier);
    final iconColor =
        (walletData.lightBgColor1 != null && walletData.lightBgColor1 != '')
            ? HexColor(walletData.lightBgColor1!)
            : MainColorsApp.accentColor;
    final waiteUserRead = ref.read(waiteWalletConnectStateProvider.notifier);
    final depositWalletRead =
        ref.read(getDepositWalletConnectStateProvider.notifier);
    final receiveDataWCRead = ref.read(receiveDataWCStateProvider.notifier);
    final getStatusPaymentInterfaceRead =
        ref.read(getStatusPaymentInterfaceStateProvider.notifier);
    final marketPercentState = ref.read(marketPercentProviderProvider.notifier);
    final tradingTabState = ref.read(tradingTabProvider.notifier);
    final userBalances = ref.watch(userBalancesStateNotifierProvider);
    final walletListWatch = ref.watch(walletsListDataStateNotifierProvider);

    TwoFaActionsGeneral twoFaActionsGeneral = TwoFaActionsGeneral();

    UserBalance userBalance =
        userBalances.firstWhere((element) => element.id == walletData.id);
    double walletBalance = withTradingBalance
        ? userBalance.balance!
        : (userBalance.balance! + userBalance.advancedTradingBalance!);

    final isMarketsForSwap = walletData.markets
        .firstWhereOrNull((element) => element.enable_custodial_exchange);

    final loaderState = useState(LoadState.notLoading);
    final loaderDepositState = useState(LoadState.notLoading);

    var globalConfigBox = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = globalConfigBox.getAt(0)!;

    return Row(
      mainAxisAlignment: globalData.enabledBuySell
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      children: [
        EventItemWeb(
          disableButton:
              loaderDepositState.value == LoadState.loading ? true : false,
          colorIcon: iconColor,
          onTap: () async {
            List<WalletPaymentInterface> depositPaymentInterface = [];
            loaderDepositState.value = LoadState.loading;
            var listWalletDepositPI =
                await WalletActionsGeneral().getDepositWalletPaymentInterface(
              currencyId: walletData.id,
            );
            loaderDepositState.value = LoadState.notLoading;

            if (listWalletDepositPI is List<WalletPaymentInterface>) {
              WalletPaymentInterface fiatDepositWallet =
                  listWalletDepositPI.firstWhere(
                (element) => element.type == 'fiat',
                orElse: () => WalletPaymentInterface.initialData(),
              );

              if (fiatDepositWallet.type == 'fiat') {
                var res = await WalletService().fiatDeposit(
                    currencyId: fiatDepositWallet.currency.id,
                    paymentInterfaceId: fiatDepositWallet.paymentInterface.id);

                if (res is GraphQlError) {
                  final snackBar = SnackBar(
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      titleFontSize: 30.sp,
                      messageFontSize: 20.sp,
                      title: tr('snack_bar_message.errors.error'),
                      message: res.message,
                      contentType: ContentType.failure,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                } else if (res is Map<String, dynamic>) {
                  showDialog(
                    barrierColor: AppColors.placeHolderGrey,
                    context: context,
                    builder: (context) => ModalWindowWallet(
                      titleSize: 30,
                      title: '',
                      backgroundColor: Colors.transparent,
                      content: FiatDepositWeb(
                        fiatWalletDetails: res,
                        walletName: fiatDepositWallet.currency.id,
                      ),
                    ),
                  );
                }
              } else {
                for (var p0 in listWalletDepositPI) {
                  if (p0.userDepositEnable && p0.enable) {
                    depositPaymentInterface.add(p0);
                  }
                }

                if (depositPaymentInterface.isNotEmpty) {
                  selectedRead.state = 0;
                  waiteUserRead.state = false;
                  depositWalletRead.state = '0';
                  getStatusPaymentInterfaceRead.state = true;
                  WalletService service = WalletService();
                  service
                      .getCurrencyChains(currencyId: walletData.id)
                      .then((result) {
                    var data =
                        (result as GGetCurrencyChainsDataData).currencyChains;
                    receiveDataWCRead.state = true;
                    showDialog(
                      barrierColor: AppColors.placeHolderGrey,
                      context: context,
                      builder: (context) => ModalWindowWallet(
                        titleSize: 30,
                        title: '',
                        alertDialogSide: false,
                        backgroundColor: Colors.transparent,
                        content: data!.isNotEmpty
                            ? WalletConnect(
                                depositChains: data.toList(),
                                depositPaymentInterface:
                                    depositPaymentInterface,
                              )
                            : DepositWeb(
                                depositPaymentInterface:
                                    depositPaymentInterface,
                              ),
                      ),
                    );
                  }).onError((error, stackTrace) {
                    showDialog(
                      barrierColor: AppColors.placeHolderGrey,
                      context: context,
                      builder: (context) => ModalWindowWallet(
                        titleSize: 30,
                        title: '',
                        backgroundColor: Colors.transparent,
                        content: DepositWeb(
                          depositPaymentInterface: depositPaymentInterface,
                        ),
                      ),
                    );
                  });
                } else {
                  final snackBar = SnackBar(
                    elevation: 0,
                    clipBehavior: Clip.none,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      titleFontSize: 30.sp,
                      messageFontSize: 20.sp,
                      title: tr('snack_bar_message.errors.error'),
                      message: tr('snack_bar_message.errors.you_cant_deposit'),
                      contentType: ContentType.failure,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                }
              }
            }
          },
          title: 'Receive',
          iconPath: receiveWalletIcon,
        ),
        globalData.enabledBuySell
            ? EventItemWeb(
                colorIcon: iconColor,
                onTap: () async {
                  if (globalData.withInstantBuy) {
                    if (walletData.markets.isNotEmpty) {
                      var amountTo = '0.0';
                      var amountFrom = '0.0';
                      List<Currency> listCurrencyFrom = [];
                      List<Currency> listCurrencyTo = [];
                      getData() async {
                        for (int i = 0; i < walletData.markets.length; i++) {
                          if (walletData.markets[i].enable_trading) {
                            if (walletData.id ==
                                walletData.markets[i].base_currency.id) {
                              listCurrencyFrom.add(
                                Currency(
                                  id: walletData.markets[i].quote_currency.id,
                                  name:
                                      walletData.markets[i].quote_currency.name,
                                  iconUrl: walletData
                                      .markets[i].quote_currency.icon_url,
                                  precision: walletData
                                      .markets[i].quote_currency.precision,
                                  minAmount: walletData
                                      .markets[i].minQuoteCurrencyAmount!,
                                  marketId: walletData.markets[i].id,
                                  swapBaseToQuotePricePrecision: walletData
                                      .markets[i].swapBaseToQuotePricePrecision,
                                  swapQuoteToBasePricePrecision: walletData
                                      .markets[i].swapQuoteToBasePricePrecision,
                                ),
                              );
                              listCurrencyTo.add(
                                Currency(
                                  id: walletData.markets[i].base_currency.id,
                                  name:
                                      walletData.markets[i].base_currency.name,
                                  iconUrl: walletData
                                      .markets[i].base_currency.icon_url,
                                  precision: walletData
                                      .markets[i].base_currency.precision,
                                  minAmount: walletData
                                      .markets[i].minBaseCurrencyAmount!,
                                  marketId: walletData.markets[i].id,
                                  swapBaseToQuotePricePrecision: walletData
                                      .markets[i].swapBaseToQuotePricePrecision,
                                  swapQuoteToBasePricePrecision: walletData
                                      .markets[i].swapQuoteToBasePricePrecision,
                                ),
                              );
                            }
                          }
                        }

                        if (listCurrencyFrom.isNotEmpty &&
                            listCurrencyTo.isNotEmpty) {
                          exchangeDataRead
                              .updateCurrencyFromList(listCurrencyFrom);
                          exchangeDataRead.updateCurrencyToList(listCurrencyTo);

                          exchangeDataRead
                              .updateSelectedToCurrency(listCurrencyTo[0]);

                          exchangeDataRead
                              .updateSelectedFromCurrency(listCurrencyFrom[0]);

                          Market? market = walletData.markets.firstWhereOrNull(
                              (p0) =>
                                  p0.base_currency.id ==
                                  listCurrencyFrom[0].id);

                          // ignore: prefer_conditional_assignment
                          if (market == null) {
                            market = walletData.markets.firstWhereOrNull((p0) =>
                                p0.quote_currency.id == listCurrencyFrom[0].id);
                          }
                          exchangeDataRead.updateActiveMarket(market!);

                          amountFrom = market.trading_min_amount
                              .toStringAsFixed(market.trading_amount_precision);

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

                        showDialog(
                          barrierColor: AppColors.placeHolderGrey,
                          context: context,
                          builder: (context) => Align(
                            alignment: Alignment.center,
                            child: ModalWindowWallet(
                              titleSize: 7,
                              shapeRadius: 10,
                              title: '',
                              content: MarketTradesWeb(
                                withTradingBalance: withTradingBalance,
                                fromControllerInitValue: amountFrom,
                                toControllerInitValue: amountTo,
                              ),
                            ),
                          ),
                        );
                      } else {
                        final snackBar = SnackBar(
                          elevation: 0,
                          clipBehavior: Clip.none,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            titleFontSize: 30.sp,
                            messageFontSize: 20.sp,
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
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          titleFontSize: 30.sp,
                          messageFontSize: 20.sp,
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
                    showDialog(
                      barrierColor: AppColors.placeHolderGrey,
                      context: context,
                      builder: (context) => const Align(
                        alignment: Alignment.center,
                        child: ModalWindowWallet(
                          titleSize: 0,
                          shapeRadius: 10,
                          alertDialogSide: false,
                          backgroundColor: Colors.transparent,
                          title: '',
                          content: BuyWeb(),
                        ),
                      ),
                    );
                  }
                },
                title: tr('wallet.buy'),
                iconPath: buyWalletIcons,
              )
            : SizedBox(
                width: 11.w,
              ),
        Tooltip(
          message: isMarketsForSwap == null
              ? 'Swap is not available for this currency'.hardcoded
              : '',
          verticalOffset: -85.h,
          child: EventItemWeb(
            colorIcon: isMarketsForSwap == null
                ? iconColor.withOpacity(0.25)
                : iconColor,
            iconPath: swapTab,
            title: tr('wallet.swap'),
            onTap: isMarketsForSwap == null
                ? null
                : () async {
                    try {
                      if (walletData.markets.isNotEmpty) {
                        var amountTo = '0.0';
                        var amountFrom = '0.0';
                        List<Currency> listCurrencyFrom = [];
                        List<Currency> listCurrencyTo = [];

                        getData() async {
                          for (int i = 0; i < walletData.markets.length; i++) {
                            userBalances
                                .firstWhere((element) =>
                                    element.id ==
                                    walletData.markets[i].base_currency.id)
                                .advancedTradingBalance;

                            if (walletData
                                    .markets[i].enable_custodial_exchange &&
                                (userBalances
                                        .firstWhere((element) =>
                                            element.id ==
                                            walletData
                                                .markets[i].base_currency.id)
                                        .enabled &&
                                    userBalances
                                        .firstWhere((element) =>
                                            element.id ==
                                            walletData
                                                .markets[i].quote_currency.id)
                                        .enabled)) {
                              if (walletData.id ==
                                  walletData.markets[i].base_currency.id) {
                                listCurrencyTo.add(
                                  Currency(
                                    id: walletData.markets[i].quote_currency.id,
                                    name: walletData
                                        .markets[i].quote_currency.name,
                                    iconUrl: walletData
                                        .markets[i].quote_currency.icon_url,
                                    precision: walletData
                                        .markets[i].quote_currency.precision,
                                    swapQuoteToBasePricePrecision: walletData
                                        .markets[i]
                                        .swapQuoteToBasePricePrecision,
                                    swapBaseToQuotePricePrecision: walletData
                                        .markets[i]
                                        .swapBaseToQuotePricePrecision,
                                    minAmount: walletData.markets[i]
                                            .minQuoteCurrencyAmount ??
                                        0,
                                    marketId: walletData.markets[i].id,
                                  ),
                                );
                              } else {
                                listCurrencyTo.add(
                                  Currency(
                                    id: walletData.markets[i].base_currency.id,
                                    name: walletData
                                        .markets[i].base_currency.name,
                                    iconUrl: walletData
                                        .markets[i].base_currency.icon_url,
                                    precision: walletData
                                        .markets[i].base_currency.precision,
                                    swapQuoteToBasePricePrecision: walletData
                                        .markets[i]
                                        .swapQuoteToBasePricePrecision,
                                    swapBaseToQuotePricePrecision: walletData
                                        .markets[i]
                                        .swapBaseToQuotePricePrecision,
                                    minAmount: walletData
                                            .markets[i].minBaseCurrencyAmount ??
                                        0,
                                    marketId: walletData.markets[i].id,
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
                                if (listCurrencyTo[0].id ==
                                    e2.base_currency.id) {
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
                              (element) => element.id == walletData.id);
                          Currency movedObject =
                              listCurrencyFrom.removeAt(indexOfObjectToMove);
                          listCurrencyFrom.insert(0, movedObject);

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

                            exchangeDataRead.updatePrecision(
                              PrecisionCurrencyState(
                                swapBaseToQuotePricePrecision: listCurrencyTo[0]
                                    .swapBaseToQuotePricePrecision!,
                                swapQuoteToBasePricePrecision: listCurrencyTo[0]
                                    .swapQuoteToBasePricePrecision!,
                              ),
                              PrecisionCurrencyState(
                                swapBaseToQuotePricePrecision:
                                    listCurrencyFrom[0]
                                        .swapBaseToQuotePricePrecision!,
                                swapQuoteToBasePricePrecision:
                                    listCurrencyFrom[0]
                                        .swapQuoteToBasePricePrecision!,
                              ),
                            );

                            final activeMarket = walletListWatch
                                .firstWhere(
                                    (e1) => e1.id == listCurrencyFrom[0].id)
                                .markets
                                .firstWhere((e2) =>
                                    e2.id == listCurrencyFrom[0].marketId);

                            exchangeDataRead.updateActiveMarket(activeMarket);

                            amountFrom = (activeMarket.base_currency.id ==
                                        listCurrencyFrom[0].id
                                    ? activeMarket.minBaseCurrencyAmount!
                                    : activeMarket.minQuoteCurrencyAmount!)
                                .toStringAsFixed(walletData.precision);

                            var convertedValue = swapConvert(
                              market: activeMarket,
                              currencyFrom: listCurrencyFrom[0].id,
                              currencyTo: listCurrencyTo[0].id,
                              amount: double.parse(amountFrom),
                            );

                            amountTo =
                                '≈ ${numberFormatWithPrecision(listCurrencyTo[0].precision).format(convertedValue)}';

                            var rate =
                                (convertedValue / double.parse(amountFrom));

                            exchangeDataRead.updateRate(
                              ExchangeRate(
                                currencyTo: listCurrencyTo[0],
                                currencyFrom: listCurrencyFrom[0],
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
                          if (double.parse(amountFrom) <= walletBalance) {
                            submitButtonSwapState.state = true;
                          } else {
                            submitButtonSwapState.state = false;
                          }

                          showDialog(
                            barrierColor: AppColors.placeHolderGrey,
                            context: context,
                            builder: (context) => ModalWindowWallet(
                              titleSize: 30,
                              title: '',
                              alertDialogSide: false,
                              content: SwapDialog(
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
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              titleFontSize: 30.sp,
                              messageFontSize: 20.sp,
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
                      }
                    } catch (e) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        clipBehavior: Clip.none,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          titleFontSize: 30.sp,
                          messageFontSize: 20.sp,
                          title: tr('snack_bar_message.errors.error'),
                          message: tr(
                              'snack_bar_message.errors.something_went_wrong'),
                          contentType: ContentType.failure,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    }
                  },
          ),
        ),
        globalData.enabledBuySell
            ? Tooltip(
                message: globalData.enabledSellWithdrawZeroBalance ||
                        walletBalance > 0
                    ? ''
                    : 'No balance to sell'.hardcoded,
                verticalOffset: -85.h,
                child: EventItemWeb(
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
                            if (walletData.markets.isNotEmpty) {
                              var amountTo = '0.0';
                              var amountFrom = '0.0';
                              List<Currency> listCurrencyFrom = [];
                              List<Currency> listCurrencyTo = [];
                              getData() async {
                                for (int i = 0;
                                    i < walletData.markets.length;
                                    i++) {
                                  if (walletData.markets[i].enable_trading) {
                                    if (walletData.id ==
                                        walletData
                                            .markets[i].base_currency.id) {
                                      listCurrencyFrom.add(
                                        Currency(
                                          id: walletData
                                              .markets[i].quote_currency.id,
                                          name: walletData
                                              .markets[i].quote_currency.name,
                                          iconUrl: walletData.markets[i]
                                              .quote_currency.icon_url,
                                          precision: walletData.markets[i]
                                              .quote_currency.precision,
                                          minAmount: walletData.markets[i]
                                              .minQuoteCurrencyAmount!,
                                          marketId: walletData.markets[i].id,
                                          swapBaseToQuotePricePrecision:
                                              walletData.markets[i]
                                                  .swapBaseToQuotePricePrecision,
                                          swapQuoteToBasePricePrecision:
                                              walletData.markets[i]
                                                  .swapQuoteToBasePricePrecision,
                                        ),
                                      );
                                      listCurrencyTo.add(
                                        Currency(
                                          id: walletData
                                              .markets[i].base_currency.id,
                                          name: walletData
                                              .markets[i].base_currency.name,
                                          iconUrl: walletData.markets[i]
                                              .base_currency.icon_url,
                                          precision: walletData.markets[i]
                                              .base_currency.precision,
                                          minAmount: walletData.markets[i]
                                              .minBaseCurrencyAmount!,
                                          marketId: walletData.markets[i].id,
                                          swapBaseToQuotePricePrecision:
                                              walletData.markets[i]
                                                  .swapBaseToQuotePricePrecision,
                                          swapQuoteToBasePricePrecision:
                                              walletData.markets[i]
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

                                  Market? market = walletData.markets
                                      .firstWhereOrNull((p0) =>
                                          p0.base_currency.id ==
                                          listCurrencyFrom[0].id);

                                  // ignore: prefer_conditional_assignment
                                  if (market == null) {
                                    market = walletData.markets
                                        .firstWhereOrNull((p0) =>
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

                                  var rate = (convertedValue /
                                      double.parse(amountFrom));

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
                                tradingTabState.state = 2;
                                marketPercentState.state = 0;

                                showDialog(
                                  barrierColor: AppColors.placeHolderGrey,
                                  context: context,
                                  builder: (context) => Align(
                                    alignment: Alignment.center,
                                    child: ModalWindowWallet(
                                      titleSize: 7,
                                      shapeRadius: 10,
                                      title: '',
                                      content: MarketTradesWeb(
                                        withTradingBalance: withTradingBalance,
                                        fromControllerInitValue: amountFrom,
                                        toControllerInitValue: amountTo,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                final snackBar = SnackBar(
                                  elevation: 0,
                                  clipBehavior: Clip.none,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    titleFontSize: 30.sp,
                                    messageFontSize: 20.sp,
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
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  titleFontSize: 30.sp,
                                  messageFontSize: 20.sp,
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
                            showDialog(
                              barrierColor: AppColors.placeHolderGrey,
                              context: context,
                              builder: (context) => const Align(
                                alignment: Alignment.center,
                                child: ModalWindowWallet(
                                  titleSize: 0,
                                  shapeRadius: 10,
                                  alertDialogSide: false,
                                  title: '',
                                  content: SellWeb(),
                                ),
                              ),
                            );
                          }
                        }
                      : null,
                ),
              )
            : SizedBox(
                width: 11.w,
              ),
        Tooltip(
          message:
              globalData.enabledSellWithdrawZeroBalance || walletBalance > 0
                  ? ''
                  : ' No balance to send'.hardcoded,
          verticalOffset: -85.h,
          child: EventItemWeb(
            colorIcon:
                globalData.enabledSellWithdrawZeroBalance || walletBalance > 0
                    ? iconColor
                    : iconColor.withOpacity(0.25),
            iconPath: sendWalletIcon,
            disableButton:
                loaderState.value == LoadState.loading ? true : false,
            onTap: globalData.enabledSellWithdrawZeroBalance ||
                    walletBalance > 0
                ? () async {
                    loaderState.value = LoadState.loading;
                    var twoFaStatus =
                        await twoFaActionsGeneral.getTwoFaStatus();

                    if (twoFaStatus) {
                      var listWalletWithdrawPI = await WalletActionsGeneral()
                          .getWithdrawWalletPaymentInterface(
                        currencyId: walletData.id,
                      );

                      if (listWalletWithdrawPI
                          is List<WithdrawPaymentInterface>) {
                        if (listWalletWithdrawPI.isEmpty) {
                          final snackBar = SnackBar(
                            elevation: 0,
                            clipBehavior: Clip.none,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              titleFontSize: 30.sp,
                              messageFontSize: 20.sp,
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
                              listWalletWithdrawPI.firstWhere(
                            (element) => element.type == 'fiat',
                            orElse: () =>
                                WithdrawPaymentInterface.initialData(),
                          );

                          withdrawPaymentInterfaceRead
                              .updateInterface(listWalletWithdrawPI[0]);

                          updateWithdrawalFee.updateFee(
                            listWalletWithdrawPI[0]
                                .minWithdrawFee
                                .toStringAsFixed(walletData.precision),
                          );
                          updateNetAmountWatch['amount'] = double.parse('0')
                              .toStringAsFixed(walletData.precision);

                          if (fiatWithdrawWallet.type == 'fiat') {
                            showDialog(
                              barrierColor: AppColors.placeHolderGrey,
                              context: context,
                              builder: (context) => ModalWindowWallet(
                                titleSize: 30,
                                title: '',
                                content: FiatWithdrawWeb(
                                  withTradingBalance: withTradingBalance,
                                ),
                              ),
                            );
                          } else {
                            showDialog(
                              barrierColor: AppColors.placeHolderGrey,
                              context: context,
                              builder: (context) => ModalWindowWallet(
                                titleSize: 30,
                                title: '',
                                content: WithdrawWeb(
                                  listWalletWithdrawPI: listWalletWithdrawPI,
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
                      showDialog(
                        barrierColor: AppColors.placeHolderGrey,
                        context: context,
                        builder: (context) => ModalWindowWallet(
                          titleSize: 30,
                          shapeRadius: 10,
                          title: '',
                          content: ActivationTwoFa(
                            platformType: PlatformTypeState.web,
                            activateMessage:
                                tr('profile.before_you_send_activate_two_fa'),
                          ),
                        ),
                      );
                    }
                  }
                : null,
            title: tr('wallet.send'),
          ),
        ),
      ],
    );
  }
}
