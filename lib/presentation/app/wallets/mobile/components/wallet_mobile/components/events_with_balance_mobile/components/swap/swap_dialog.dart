// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:slide_action/slide_action.dart';
import 'package:user_app/application/exchange/exchange_rate_provider.dart';
import 'package:user_app/application/exchange/exchange_state_provider.dart';
import 'package:user_app/application/swap/submit_button_state_provider.dart';
import 'package:user_app/application/wallets/actions/wallet_actions.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/exchange/exchange_rate.dart';
import 'package:user_app/domain/exchange/precision_currency_state.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/swap/components/estimate_swap_rate.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/swap/components/platform_commission_row.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/swap/components/receive_field_swap.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/swap/components/row_with_balance.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/swap/components/send_field_swap.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/swap/components/send_field_swap_minimum_messege_mobile.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/swap/components/swap_btn.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/rate_convert/swap_convert.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class SwapMobile extends HookConsumerWidget {
  static String routeName = '/swapMobile';

  const SwapMobile({
    super.key,
    required this.fromControllerInitValue,
    required this.toControllerInitValue,
    required this.withTradingBalance,
  });

  final String fromControllerInitValue;
  final String toControllerInitValue;
  final bool withTradingBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeDataWatch = ref.watch(exchangeStateNotifierProvider);
    final exchangeDataRead = ref.read(exchangeStateNotifierProvider.notifier);
    final submitButtonSwapState =
        ref.read(submitButtonSwapStateProvider.notifier);
    final submitButtonSwapWatch = ref.watch(submitButtonSwapStateProvider);
    final activeInputExchangeRead =
        ref.read(activeInputExchangeProvider.notifier);
    final walletData = ref.watch(walletDataStateNotifierProvider);

    final fromValueController =
        useTextEditingController(text: fromControllerInitValue);
    final toValueController =
        useTextEditingController(text: toControllerInitValue);

    final loaderState = useState(LoadState.notLoading);
    final showMinimumAmountMessage = useState(false);

    WalletActionsGeneral walletActionsGeneral = WalletActionsGeneral();

    final userBalances = ref.watch(userBalancesStateNotifierProvider);
    final walletListWatch = ref.watch(walletsListDataStateNotifierProvider);

    final balanceFrom = userBalances.firstWhere(
      (element) => element.id == exchangeDataWatch.selectedFromCurrency.id,
    );
    final balanceTo = userBalances.firstWhere(
      (element) => element.id == exchangeDataWatch.selectedToCurrency.id,
    );

    double walletBalanceFrom = withTradingBalance
        ? balanceFrom.balance!
        : (balanceFrom.balance! + balanceFrom.advancedTradingBalance!);

    double walletBalanceTo = withTradingBalance
        ? balanceTo.balance!
        : (balanceTo.balance! + balanceTo.advancedTradingBalance!);

    context.afterBuild(() {
      if (walletBalanceFrom < double.parse(fromValueController.text)) {
        submitButtonSwapState.state = false;
      } else {
        submitButtonSwapState.state = true;
      }
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: getWalletColor(
          walletData.lightBgColor1,
          walletData.darkBgColor1,
          isLightTheme(context),
        ),
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50..h),
          child: Padding(
            padding: EdgeInsets.only(top: 15..h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 25.w,
                  ),
                  child: BackButtonMobile(
                    onTap: () => context.pop(),
                  ),
                ),
                Text(
                  'Quick Swap'.hardcoded,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                        letterSpacing: -0.75.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 70.w,
                  height: 25..h,
                )
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
                bottom: MediaQuery.of(context).viewInsets.bottom + 50
                  ..h,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15..h,
                      left: 15.w,
                      right: 15.w,
                    ),
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            showMinimumAmountMessage.value
                                ? SendFieldSwapMinimumMessageMobile(
                                    minValue:
                                        '${exchangeDataWatch.activeMarket.base_currency.id == exchangeDataWatch.selectedFromCurrency.id ? exchangeDataWatch.activeMarket.minBaseCurrencyAmount!.toStringAsFixed(exchangeDataWatch.selectedFromCurrency.precision) : exchangeDataWatch.activeMarket.minQuoteCurrencyAmount!.toStringAsFixed(exchangeDataWatch.selectedFromCurrency.precision)} ${exchangeDataWatch.selectedFromCurrency.id.toUpperCase()}',
                                  )
                                : const SizedBox(),
                            SendFieldSwapMobile(
                              onFocusChange: (value) {
                                if ((fromValueController.text ==
                                        (exchangeDataWatch.activeMarket
                                                    .base_currency.id ==
                                                exchangeDataWatch
                                                    .selectedFromCurrency.id
                                            ? exchangeDataWatch.activeMarket
                                                .minBaseCurrencyAmount!
                                                .toStringAsFixed(
                                                    exchangeDataWatch
                                                        .selectedFromCurrency
                                                        .precision)
                                            : exchangeDataWatch.activeMarket
                                                .minQuoteCurrencyAmount!
                                                .toStringAsFixed(
                                                    exchangeDataWatch
                                                        .selectedFromCurrency
                                                        .precision))) &&
                                    value) {
                                  fromValueController.text = '';
                                  toValueController.text =
                                      '≈ ${0.toStringAsFixed(exchangeDataWatch.selectedToCurrency.precision)}';
                                  submitButtonSwapState.state = false;
                                  showMinimumAmountMessage.value = true;
                                  activeInputExchangeRead.state = true;
                                } else {
                                  activeInputExchangeRead.state = false;
                                }
                              },
                              withTradingBalance: withTradingBalance,
                              walletBalanceFrom: walletBalanceFrom,
                              listCurrency: exchangeDataWatch.currencyFromList,
                              precision: exchangeDataWatch
                                  .selectedFromCurrency.precision,
                              dropdownValue: 'exchange.selectedFromCurrency.id',
                              controller: fromValueController,
                              toValueController: toValueController,
                              focusInput: activeInputExchangeRead.state,
                              onChanged: (String value) {
                                value = value == '.' ? '0.' : value;
                                if (value.isNotEmpty) {
                                  var amount = double.tryParse(value);

                                  if (amount! <
                                      (exchangeDataWatch.activeMarket
                                                  .base_currency.id ==
                                              exchangeDataWatch
                                                  .selectedFromCurrency.id
                                          ? exchangeDataWatch.activeMarket
                                              .minBaseCurrencyAmount!
                                          : exchangeDataWatch.activeMarket
                                              .minQuoteCurrencyAmount!)) {
                                    toValueController.text =
                                        '≈ ${0.toStringAsFixed(exchangeDataWatch.selectedToCurrency.precision)}';
                                    submitButtonSwapState.state = false;
                                    showMinimumAmountMessage.value = true;
                                  } else {
                                    if (amount > walletBalanceFrom) {
                                      submitButtonSwapState.state = false;
                                      showMinimumAmountMessage.value = false;
                                    } else {
                                      submitButtonSwapState.state = true;
                                      showMinimumAmountMessage.value = false;
                                    }

                                    var calculatedValue = swapConvert(
                                      market: exchangeDataWatch.activeMarket,
                                      currencyFrom: exchangeDataWatch
                                          .selectedFromCurrency.id,
                                      currencyTo: exchangeDataWatch
                                          .selectedToCurrency.id,
                                      amount: amount,
                                    );

                                    var rate = (calculatedValue / amount);

                                    exchangeDataRead.updateRate(
                                      ExchangeRate(
                                        currencyTo: exchangeDataWatch
                                            .selectedToCurrency,
                                        currencyFrom: exchangeDataWatch
                                            .selectedFromCurrency,
                                        rateWithPrecision: rate.toStringAsFixed(
                                            exchangeDataWatch
                                                .selectedFromCurrency
                                                .precision),
                                        rate: rate,
                                      ),
                                    );

                                    toValueController.text =
                                        '≈ ${numberFormatWithPrecision(exchangeDataWatch.selectedToCurrency.precision).format(calculatedValue)}';
                                  }
                                } else {
                                  toValueController.text =
                                      '≈ ${0.toStringAsFixed(exchangeDataWatch.selectedToCurrency.precision)}';
                                }
                              },
                              dropdownOnChanged: (value) {
                                showMinimumAmountMessage.value = false;
                                List<Currency> listCurrencyFrom = [];
                                List<Currency> listCurrencyTo = [];

                                final selectedFromCurrency =
                                    walletListWatch.firstWhere(
                                  (element) => element.id == value,
                                );

                                for (int i = 0;
                                    i < selectedFromCurrency.markets.length;
                                    i++) {
                                  userBalances
                                      .firstWhere((element) =>
                                          element.id ==
                                          selectedFromCurrency
                                              .markets[i].base_currency.id)
                                      .advancedTradingBalance;

                                  if (selectedFromCurrency.markets[i]
                                          .enable_custodial_exchange &&
                                      (userBalances
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  selectedFromCurrency
                                                      .markets[i]
                                                      .base_currency
                                                      .id)
                                              .enabled &&
                                          userBalances
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  selectedFromCurrency
                                                      .markets[i]
                                                      .quote_currency
                                                      .id)
                                              .enabled)) {
                                    if (selectedFromCurrency.id ==
                                        selectedFromCurrency
                                            .markets[i].base_currency.id) {
                                      listCurrencyTo.add(
                                        Currency(
                                          id: selectedFromCurrency
                                              .markets[i].quote_currency.id,
                                          name: selectedFromCurrency
                                              .markets[i].quote_currency.name,
                                          iconUrl: selectedFromCurrency
                                              .markets[i]
                                              .quote_currency
                                              .icon_url,
                                          precision: selectedFromCurrency
                                              .markets[i]
                                              .quote_currency
                                              .precision,
                                          swapQuoteToBasePricePrecision:
                                              selectedFromCurrency.markets[i]
                                                  .swapQuoteToBasePricePrecision,
                                          swapBaseToQuotePricePrecision:
                                              selectedFromCurrency.markets[i]
                                                  .swapBaseToQuotePricePrecision,
                                          minAmount: selectedFromCurrency
                                                  .markets[i]
                                                  .minQuoteCurrencyAmount ??
                                              0,
                                          marketId: selectedFromCurrency
                                              .markets[i].id,
                                        ),
                                      );
                                    } else {
                                      listCurrencyTo.add(
                                        Currency(
                                          id: selectedFromCurrency
                                              .markets[i].base_currency.id,
                                          name: selectedFromCurrency
                                              .markets[i].base_currency.name,
                                          iconUrl: selectedFromCurrency
                                              .markets[i]
                                              .base_currency
                                              .icon_url,
                                          precision: selectedFromCurrency
                                              .markets[i]
                                              .base_currency
                                              .precision,
                                          swapQuoteToBasePricePrecision:
                                              selectedFromCurrency.markets[i]
                                                  .swapQuoteToBasePricePrecision,
                                          swapBaseToQuotePricePrecision:
                                              selectedFromCurrency.markets[i]
                                                  .swapBaseToQuotePricePrecision,
                                          minAmount: selectedFromCurrency
                                                  .markets[i]
                                                  .minBaseCurrencyAmount ??
                                              0,
                                          marketId: selectedFromCurrency
                                              .markets[i].id,
                                        ),
                                      );
                                    }
                                  }
                                }

                                walletListWatch
                                    .firstWhere((e1) =>
                                        e1.id ==
                                        exchangeDataWatch.selectedToCurrency.id)
                                    .markets
                                    .forEach(
                                  (e2) {
                                    if (e2.enable_custodial_exchange) {
                                      if (exchangeDataWatch
                                              .selectedToCurrency.id ==
                                          e2.base_currency.id) {
                                        listCurrencyFrom.add(
                                          Currency(
                                            id: e2.quote_currency.id,
                                            name: e2.quote_currency.name,
                                            iconUrl: e2.quote_currency.icon_url,
                                            precision:
                                                e2.quote_currency.precision,
                                            swapQuoteToBasePricePrecision: e2
                                                .swapQuoteToBasePricePrecision,
                                            swapBaseToQuotePricePrecision: e2
                                                .swapBaseToQuotePricePrecision,
                                            minAmount:
                                                e2.minQuoteCurrencyAmount ?? 0,
                                            marketId: e2.id,
                                          ),
                                        );
                                      } else {
                                        listCurrencyFrom.add(
                                          Currency(
                                            id: e2.base_currency.id,
                                            name: e2.base_currency.name,
                                            iconUrl: e2.base_currency.icon_url,
                                            precision:
                                                e2.base_currency.precision,
                                            swapQuoteToBasePricePrecision: e2
                                                .swapQuoteToBasePricePrecision,
                                            swapBaseToQuotePricePrecision: e2
                                                .swapBaseToQuotePricePrecision,
                                            minAmount:
                                                e2.minBaseCurrencyAmount ?? 0,
                                            marketId: e2.id,
                                          ),
                                        );
                                      }
                                    }
                                  },
                                );

                                final selectedFrom =
                                    listCurrencyFrom.firstWhere(
                                        (element) => element.id == value);

                                final activeMarket = walletListWatch
                                    .firstWhere(
                                        (e1) => e1.id == selectedFrom.id)
                                    .markets
                                    .firstWhere(
                                        (e2) => e2.id == selectedFrom.marketId);

                                final selectedTo =
                                    exchangeDataWatch.selectedToCurrency;

                                exchangeDataRead
                                    .updateCurrencyFromList(listCurrencyFrom);

                                exchangeDataRead
                                    .updateCurrencyToList(listCurrencyTo);

                                exchangeDataRead
                                    .updateSelectedToCurrency(selectedTo);
                                exchangeDataRead
                                    .updateSelectedFromCurrency(selectedFrom);

                                exchangeDataRead.updatePrecision(
                                  PrecisionCurrencyState(
                                    swapBaseToQuotePricePrecision: selectedTo
                                        .swapBaseToQuotePricePrecision!,
                                    swapQuoteToBasePricePrecision: selectedTo
                                        .swapQuoteToBasePricePrecision!,
                                  ),
                                  PrecisionCurrencyState(
                                    swapBaseToQuotePricePrecision: selectedFrom
                                        .swapBaseToQuotePricePrecision!,
                                    swapQuoteToBasePricePrecision: selectedFrom
                                        .swapQuoteToBasePricePrecision!,
                                  ),
                                );

                                exchangeDataRead
                                    .updateActiveMarket(activeMarket);

                                String minAmount =
                                    activeMarket.base_currency.id ==
                                            selectedFromCurrency.id
                                        ? activeMarket.minBaseCurrencyAmount!
                                            .toStringAsFixed(
                                                selectedFromCurrency.precision)
                                        : activeMarket.minQuoteCurrencyAmount!
                                            .toStringAsFixed(
                                                selectedFromCurrency.precision);

                                var convertedValue = swapConvert(
                                  market: activeMarket,
                                  currencyFrom: selectedFrom.id,
                                  currencyTo: selectedTo.id,
                                  amount: double.parse(minAmount),
                                );

                                var rate =
                                    (convertedValue / double.parse(minAmount));

                                exchangeDataRead.updateRate(
                                  ExchangeRate(
                                    currencyTo: selectedTo,
                                    currencyFrom: selectedFrom,
                                    rateWithPrecision: rate.toStringAsFixed(
                                        selectedFrom.precision),
                                    rate: rate,
                                  ),
                                );

                                fromValueController.text =
                                    double.parse(minAmount).toStringAsFixed(
                                        selectedFrom.precision);

                                submitButtonSwapState.state = true;

                                if (double.parse(fromValueController.text) <
                                    double.parse(minAmount)) {
                                  submitButtonSwapState.state = false;
                                } else if (double.parse(
                                        fromValueController.text) >
                                    walletBalanceFrom) {
                                  toValueController.text =
                                      '≈ ${numberFormatWithPrecision(selectedTo.precision).format(convertedValue)}';
                                  submitButtonSwapState.state = false;
                                } else {
                                  toValueController.text =
                                      '≈ ${numberFormatWithPrecision(selectedTo.precision).format(convertedValue)}';
                                  submitButtonSwapState.state = true;
                                }
                                context.pop();
                              },
                            ),
                          ],
                        ),
                        Container(
                          height: 5..h,
                          width: double.infinity,
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : Colors.white.withOpacity(0.05),
                        ),
                        SizedBox(
                          height: 5..h,
                        ),
                        RowWithBalanceMobile(
                          rowWithBalance:
                              '${numberFormatWithPrecision(exchangeDataWatch.selectedFromCurrency.precision).format(walletBalanceFrom)} ${exchangeDataWatch.selectedFromCurrency.id}',
                        ),
                        SizedBox(
                          height: 10..h,
                        ),
                        SwapBtnMobile(
                          showMinimumAmountMessage: showMinimumAmountMessage,
                          fromValueController: fromValueController,
                          toValueController: toValueController,
                        ),
                        ReceiveFieldSwapMobile(
                          walletBalanceTo: walletBalanceTo,
                          withTradingBalance: withTradingBalance,
                          onChanged: (String value) {},
                          listCurrency: exchangeDataWatch.currencyToList,
                          dropdownValue:
                              exchangeDataWatch.selectedToCurrency.id,
                          dropdownOnChanged: (value) {
                            showMinimumAmountMessage.value = false;
                            List<Currency> listCurrencyFrom = [];
                            List<Currency> listCurrencyTo = [];

                            final selectedFromCurrency =
                                walletListWatch.firstWhere((element) =>
                                    element.id ==
                                    exchangeDataWatch.selectedFromCurrency.id);

                            for (int i = 0;
                                i < selectedFromCurrency.markets.length;
                                i++) {
                              userBalances
                                  .firstWhere((element) =>
                                      element.id ==
                                      selectedFromCurrency
                                          .markets[i].base_currency.id)
                                  .advancedTradingBalance;

                              if (selectedFromCurrency
                                      .markets[i].enable_custodial_exchange &&
                                  (userBalances
                                          .firstWhere((element) =>
                                              element.id ==
                                              selectedFromCurrency
                                                  .markets[i].base_currency.id)
                                          .enabled &&
                                      userBalances
                                          .firstWhere((element) =>
                                              element.id ==
                                              selectedFromCurrency
                                                  .markets[i].quote_currency.id)
                                          .enabled)) {
                                if (selectedFromCurrency.id ==
                                    selectedFromCurrency
                                        .markets[i].base_currency.id) {
                                  listCurrencyTo.add(
                                    Currency(
                                      id: selectedFromCurrency
                                          .markets[i].quote_currency.id,
                                      name: selectedFromCurrency
                                          .markets[i].quote_currency.name,
                                      iconUrl: selectedFromCurrency
                                          .markets[i].quote_currency.icon_url,
                                      precision: selectedFromCurrency
                                          .markets[i].quote_currency.precision,
                                      swapQuoteToBasePricePrecision:
                                          selectedFromCurrency.markets[i]
                                              .swapQuoteToBasePricePrecision,
                                      swapBaseToQuotePricePrecision:
                                          selectedFromCurrency.markets[i]
                                              .swapBaseToQuotePricePrecision,
                                      minAmount: selectedFromCurrency.markets[i]
                                              .minQuoteCurrencyAmount ??
                                          0,
                                      marketId:
                                          selectedFromCurrency.markets[i].id,
                                    ),
                                  );
                                } else {
                                  listCurrencyTo.add(
                                    Currency(
                                      id: selectedFromCurrency
                                          .markets[i].base_currency.id,
                                      name: selectedFromCurrency
                                          .markets[i].base_currency.name,
                                      iconUrl: selectedFromCurrency
                                          .markets[i].base_currency.icon_url,
                                      precision: selectedFromCurrency
                                          .markets[i].base_currency.precision,
                                      swapQuoteToBasePricePrecision:
                                          selectedFromCurrency.markets[i]
                                              .swapQuoteToBasePricePrecision,
                                      swapBaseToQuotePricePrecision:
                                          selectedFromCurrency.markets[i]
                                              .swapBaseToQuotePricePrecision,
                                      minAmount: selectedFromCurrency.markets[i]
                                              .minBaseCurrencyAmount ??
                                          0,
                                      marketId:
                                          selectedFromCurrency.markets[i].id,
                                    ),
                                  );
                                }
                              }
                            }
                            walletListWatch
                                .firstWhere((e1) => e1.id == value)
                                .markets
                                .forEach((e2) {
                              if (e2.enable_custodial_exchange) {
                                if (value == e2.base_currency.id) {
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
                            });

                            final selectedCurrencyTo = listCurrencyTo
                                .firstWhere((element) => element.id == value);

                            exchangeDataRead
                                .updateCurrencyFromList(listCurrencyFrom);

                            exchangeDataRead
                                .updateCurrencyToList(listCurrencyTo);

                            exchangeDataRead
                                .updateSelectedToCurrency(selectedCurrencyTo);

                            final activeMarket = walletListWatch
                                .firstWhere(
                                    (e1) => e1.id == selectedCurrencyTo.id)
                                .markets
                                .firstWhere((e2) =>
                                    e2.id == selectedCurrencyTo.marketId);

                            exchangeDataRead.updateActiveMarket(activeMarket);

                            final selectedCurrencyFrom =
                                listCurrencyFrom.firstWhere((element) =>
                                    element.id == selectedFromCurrency.id);

                            fromValueController.text =
                                activeMarket.base_currency.id ==
                                        selectedFromCurrency.id
                                    ? activeMarket.minBaseCurrencyAmount!
                                        .toStringAsFixed(
                                            selectedFromCurrency.precision)
                                    : activeMarket.minQuoteCurrencyAmount!
                                        .toStringAsFixed(
                                            selectedFromCurrency.precision);

                            var convertedValue = swapConvert(
                              market: activeMarket,
                              currencyFrom: selectedCurrencyFrom.id,
                              currencyTo: selectedCurrencyTo.id,
                              amount: double.parse(fromValueController.text),
                            );
                            exchangeDataRead.updateRate(
                              ExchangeRate(
                                currencyTo: selectedCurrencyTo,
                                currencyFrom: selectedCurrencyFrom,
                                rateWithPrecision: (convertedValue /
                                        double.parse(fromValueController.text))
                                    .toStringAsFixed(
                                        selectedCurrencyTo.precision),
                                rate: convertedValue /
                                    double.parse(fromValueController.text),
                              ),
                            );

                            exchangeDataRead.updatePrecision(
                              PrecisionCurrencyState(
                                swapBaseToQuotePricePrecision: exchangeDataWatch
                                    .selectedToCurrency
                                    .swapBaseToQuotePricePrecision!,
                                swapQuoteToBasePricePrecision: exchangeDataWatch
                                    .selectedToCurrency
                                    .swapQuoteToBasePricePrecision!,
                              ),
                              PrecisionCurrencyState(
                                swapBaseToQuotePricePrecision:
                                    selectedCurrencyTo
                                        .swapBaseToQuotePricePrecision!,
                                swapQuoteToBasePricePrecision:
                                    selectedCurrencyTo
                                        .swapQuoteToBasePricePrecision!,
                              ),
                            );

                            var amount = double.parse(fromValueController.text);

                            submitButtonSwapState.state = true;

                            if (amount > walletBalanceFrom) {
                              toValueController.text =
                                  '≈ ${numberFormatWithPrecision(selectedCurrencyTo.precision).format(convertedValue)}';
                              submitButtonSwapState.state = false;
                            } else {
                              toValueController.text =
                                  '≈ ${numberFormatWithPrecision(selectedCurrencyTo.precision).format(convertedValue)}';
                              submitButtonSwapState.state = true;
                            }
                            context.pop();
                          },
                          fromController: fromValueController,
                          controller: toValueController,
                          isEnabled: false,
                        ),
                        Container(
                          height: 5..h,
                          width: double.infinity,
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : Colors.white.withOpacity(0.05),
                        ),
                        SizedBox(
                          height: 5..h,
                        ),
                        RowWithBalanceMobile(
                          rowWithBalance:
                              '${numberFormatWithPrecision(exchangeDataWatch.selectedToCurrency.precision).format(walletBalanceTo)} ${exchangeDataWatch.selectedToCurrency.id}',
                        ),
                        SizedBox(
                          height: 30..h,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2..h,
                    color: isLightTheme(context)
                        ? AppColors.mainBackgroundLightColor
                        : AppColors.whiteColor.withOpacity(0.05),
                  ),
                  SizedBox(
                    height: 30..h,
                  ),
                  PlatformCommissionRowMobile(
                    platformCommission:
                        '${0.toStringAsFixed(exchangeDataWatch.selectedFromCurrency.precision)} ${exchangeDataWatch.selectedFromCurrency.id.toUpperCase()}',
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15..h, bottom: 15..h),
                    child: Divider(
                      height: 2..h,
                      color: isLightTheme(context)
                          ? AppColors.mainBackgroundLightColor
                          : AppColors.whiteColor.withOpacity(0.05),
                    ),
                  ),
                  const EstimatedSwapRateRowMobile(),
                  SizedBox(
                    height: 30..h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: loaderState.value == LoadState.loading
                        ? const CircularProgressIndicator()
                        : SlideAction(
                            trackHeight: 50..h,
                            trackBuilder: (context, state) {
                              return Container(
                                margin:
                                    EdgeInsets.only(top: 3..h, bottom: 3..h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.r),
                                  color: submitButtonSwapWatch
                                      ? MainColorsApp.accentColor
                                          .withOpacity(0.8)
                                      : isLightTheme(context)
                                          ? AppColors.mainBackgroundLightColor
                                              .withOpacity(0.5)
                                          : AppColors.whiteColor
                                              .withOpacity(0.25),
                                ),
                                child: Center(
                                  child: Text(
                                    'Swipe to confirm',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.75.sp,
                                          color: submitButtonSwapWatch
                                              ? Colors.white
                                              : isLightTheme(context)
                                                  ? AppColors.aboutHeaderLight
                                                  : AppColors.whiteColor
                                                      .withOpacity(0.25),
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
                                  color: submitButtonSwapWatch
                                      ? MainColorsApp.accentColor
                                      : isLightTheme(context)
                                          ? AppColors.mainBackgroundLightColor
                                          : AppColors.mainBackgroundDarkColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Container(
                                    height: 22..h,
                                    width: 22.w,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              );
                            },
                            action: submitButtonSwapWatch
                                ? () async {
                                    var amount = double.tryParse(
                                        fromValueController.text);
                                    if (amount == null) {
                                      toValueController.text =
                                          tr('wallet.invalid_value');
                                    } else if (amount > walletBalanceFrom) {
                                      final snackBar = SnackBar(
                                        elevation: 0,
                                        clipBehavior: Clip.none,
                                        padding: EdgeInsets.only(
                                          bottom:
                                              MediaQuery.viewInsetsOf(context)
                                                      .bottom +
                                                  30
                                                ..h,
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          titleFontSize: 20.sp,
                                          messageFontSize: 15.sp,
                                          title: tr(
                                              'snack_bar_message.errors.error'),
                                          message: tr(
                                              'snack_bar_message.errors.insufficient_funds'),
                                          contentType: ContentType.failure,
                                        ),
                                      );

                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(snackBar);
                                    }

                                    loaderState.value = LoadState.loading;

                                    final response =
                                        await walletActionsGeneral.swap(
                                      currencyFrom: exchangeDataWatch
                                          .selectedFromCurrency.id,
                                      currencyTo: exchangeDataWatch
                                          .selectedToCurrency.id,
                                      amount: double.parse(
                                        fromValueController.text,
                                      ),
                                    );

                                    if (response is GraphQlError) {
                                      loaderState.value = LoadState.notLoading;

                                      final snackBar = SnackBar(
                                        elevation: 0,
                                        clipBehavior: Clip.none,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.only(
                                          bottom:
                                              MediaQuery.viewInsetsOf(context)
                                                      .bottom +
                                                  30
                                                ..h,
                                        ),
                                        content: AwesomeSnackbarContent(
                                          titleFontSize: 20.sp,
                                          messageFontSize: 15.sp,
                                          title: tr(
                                              'snack_bar_message.errors.error'),
                                          message: response.message,
                                          contentType: ContentType.failure,
                                        ),
                                      );

                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(snackBar);
                                      context.pop();
                                    } else {
                                      loaderState.value = LoadState.notLoading;

                                      final snackBar = SnackBar(
                                        elevation: 0,
                                        clipBehavior: Clip.none,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.only(
                                          bottom:
                                              MediaQuery.viewInsetsOf(context)
                                                      .bottom +
                                                  30
                                                ..h,
                                        ),
                                        content: AwesomeSnackbarContent(
                                          titleFontSize: 20.sp,
                                          messageFontSize: 15.sp,
                                          title: tr(
                                              'snack_bar_message.success.success'),
                                          message: tr(
                                              'snack_bar_message.success.successful'),
                                          contentType: ContentType.success,
                                        ),
                                      );

                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(snackBar);

                                      fromValueController
                                          .text = exchangeDataWatch.activeMarket
                                                  .base_currency.id ==
                                              exchangeDataWatch
                                                  .selectedFromCurrency.id
                                          ? exchangeDataWatch.activeMarket
                                              .minBaseCurrencyAmount!
                                              .toStringAsFixed(exchangeDataWatch
                                                  .selectedFromCurrency
                                                  .precision)
                                          : exchangeDataWatch.activeMarket
                                              .minQuoteCurrencyAmount!
                                              .toStringAsFixed(exchangeDataWatch
                                                  .selectedFromCurrency
                                                  .precision);

                                      var convertedValue = swapConvert(
                                        market: exchangeDataWatch.activeMarket,
                                        currencyFrom: exchangeDataWatch
                                            .selectedFromCurrency.id,
                                        currencyTo: exchangeDataWatch
                                            .selectedToCurrency.id,
                                        amount: double.parse(
                                            fromValueController.text),
                                      );

                                      toValueController.text =
                                          '≈ ${convertedValue.toStringAsFixed(exchangeDataWatch.selectedToCurrency.precision)}';
                                    }
                                  }
                                : null,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
