import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/swap_web/components/estimated_rate_row.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/swap_web/components/platform_commission_row.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/swap_web/components/receive_field.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/swap_web/components/send_field.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/swap_web/components/send_minimum_message.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/swap_web/components/swap_bnt.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/swap_web/components/wallet_gradient_button.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/swap_web/components/balance_row.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/rate_convert/swap_convert.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SwapDialog extends HookConsumerWidget {
  const SwapDialog({
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

    final fromValueController =
        useTextEditingController(text: fromControllerInitValue);
    final toValueController =
        useTextEditingController(text: toControllerInitValue);

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

    final loaderState = useState(LoadState.notLoading);
    final showMinimumAmountMessage = useState(false);

    WalletActionsGeneral walletActionsGeneral = WalletActionsGeneral();

    context.afterBuild(() {
      if (walletBalanceFrom < double.parse(fromValueController.text)) {
        submitButtonSwapState.state = false;
      } else {
        submitButtonSwapState.state = true;
      }
    });

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 600.w,
        child: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            bottom: 50.h,
          ),
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 25.w,
                    right: 25.w,
                  ),
                  child: Column(
                    children: [
                      Text(
                        tr('wallet.quick_swap'),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: isLightTheme(context)
                                  ? AppColors.darkColorText
                                  : AppColors.whiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 30.sp,
                              letterSpacing: -1.5.sp,
                            ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          showMinimumAmountMessage.value
                              ? SendMinimumMessage(
                                  minValue:
                                      '${exchangeDataWatch.activeMarket.base_currency.id == exchangeDataWatch.selectedFromCurrency.id ? exchangeDataWatch.activeMarket.minBaseCurrencyAmount!.toStringAsFixed(exchangeDataWatch.selectedFromCurrency.precision) : exchangeDataWatch.activeMarket.minQuoteCurrencyAmount!.toStringAsFixed(exchangeDataWatch.selectedFromCurrency.precision)} ${exchangeDataWatch.selectedFromCurrency.id.toUpperCase()}',
                                )
                              : const SizedBox(),
                          Row(
                            children: [
                              SendFieldWeb(
                                withTradingBalance: withTradingBalance,
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
                                walletBalanceFrom: walletBalanceFrom,
                                listCurrency:
                                    exchangeDataWatch.currencyFromList,
                                precision: exchangeDataWatch
                                    .selectedFromCurrency.precision,
                                dropdownValue:
                                    'exchange.selectedFromCurrency.id',
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
                                          rateWithPrecision: rate
                                              .toStringAsFixed(exchangeDataWatch
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
                                          exchangeDataWatch
                                              .selectedToCurrency.id)
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
                                              iconUrl:
                                                  e2.quote_currency.icon_url,
                                              precision:
                                                  e2.quote_currency.precision,
                                              swapQuoteToBasePricePrecision: e2
                                                  .swapQuoteToBasePricePrecision,
                                              swapBaseToQuotePricePrecision: e2
                                                  .swapBaseToQuotePricePrecision,
                                              minAmount:
                                                  e2.minQuoteCurrencyAmount ??
                                                      0,
                                              marketId: e2.id,
                                            ),
                                          );
                                        } else {
                                          listCurrencyFrom.add(
                                            Currency(
                                              id: e2.base_currency.id,
                                              name: e2.base_currency.name,
                                              iconUrl:
                                                  e2.base_currency.icon_url,
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
                                      .firstWhere((e2) =>
                                          e2.id == selectedFrom.marketId);

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
                                      swapBaseToQuotePricePrecision:
                                          selectedFrom
                                              .swapBaseToQuotePricePrecision!,
                                      swapQuoteToBasePricePrecision:
                                          selectedFrom
                                              .swapQuoteToBasePricePrecision!,
                                    ),
                                  );

                                  exchangeDataRead
                                      .updateActiveMarket(activeMarket);

                                  String minAmount = activeMarket
                                              .base_currency.id ==
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

                                  var rate = (convertedValue /
                                      double.parse(minAmount));

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
                              )
                            ],
                          ),
                        ],
                      ),
                      BalanceRow(
                        balance: numberFormatWithPrecision(exchangeDataWatch
                                .selectedFromCurrency.precision)
                            .format(walletBalanceFrom),
                        id: exchangeDataWatch.selectedFromCurrency.id,
                      ),
                      SwapBtnWeb(
                        showMinimumAmountMessage: showMinimumAmountMessage,
                        fromValueController: fromValueController,
                        toValueController: toValueController,
                      ),
                      ReceiveFieldWeb(
                        walletBalanceTo: walletBalanceTo,
                        withTradingBalance: withTradingBalance,
                        onChanged: (String value) {},
                        items: exchangeDataWatch.currencyToList,
                        dropdownValue: exchangeDataWatch.selectedToCurrency.id,
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
                                    minAmount: selectedFromCurrency
                                            .markets[i].minBaseCurrencyAmount ??
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

                          exchangeDataRead.updateCurrencyToList(listCurrencyTo);

                          exchangeDataRead
                              .updateSelectedToCurrency(selectedCurrencyTo);

                          final activeMarket = walletListWatch
                              .firstWhere(
                                  (e1) => e1.id == selectedCurrencyTo.id)
                              .markets
                              .firstWhere(
                                  (e2) => e2.id == selectedCurrencyTo.marketId);

                          exchangeDataRead.updateActiveMarket(activeMarket);

                          final selectedCurrencyFrom =
                              listCurrencyFrom.firstWhere((element) =>
                                  element.id == selectedFromCurrency.id);

                          fromValueController.text = activeMarket
                                      .base_currency.id ==
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
                              swapBaseToQuotePricePrecision: selectedCurrencyTo
                                  .swapBaseToQuotePricePrecision!,
                              swapQuoteToBasePricePrecision: selectedCurrencyTo
                                  .swapQuoteToBasePricePrecision!,
                            ),
                          );

                          var amount = double.parse(fromValueController.text);

                          submitButtonSwapState.state = true;

                          if (amount < selectedCurrencyFrom.minAmount) {
                            submitButtonSwapState.state = false;
                          } else if (amount > walletBalanceFrom) {
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
                      BalanceRow(
                        balance: numberFormatWithPrecision(
                                exchangeDataWatch.selectedToCurrency.precision)
                            .format(walletBalanceTo),
                        id: exchangeDataWatch.selectedToCurrency.id,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 600.w,
                  height: 2.h,
                  color: isLightTheme(context)
                      ? MainColorsApp.cardColor
                      : AppColors.whiteColor.withOpacity(0.05),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const PlatformCommissionRowWeb(),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  width: 600.w,
                  height: 2.h,
                  color: isLightTheme(context)
                      ? MainColorsApp.cardColor
                      : AppColors.whiteColor.withOpacity(0.05),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    children: [
                      const EstimatedRateRowWeb(),
                      SizedBox(
                        height: 30.h,
                      ),
                      loaderState.value == LoadState.loading
                          ? const CircularProgressIndicator()
                          : WalletGradientButton(
                              text: tr('wallet.swap'),
                              isActive: submitButtonSwapWatch,
                              onTap: submitButtonSwapWatch
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
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            titleFontSize: 30.sp,
                                            messageFontSize: 20.sp,
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
                                        loaderState.value =
                                            LoadState.notLoading;

                                        final snackBar = SnackBar(
                                          elevation: 0,
                                          clipBehavior: Clip.none,
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            titleFontSize: 30.sp,
                                            messageFontSize: 20.sp,
                                            title: tr(
                                                'snack_bar_message.errors.error'),
                                            message: response.message,
                                            contentType: ContentType.failure,
                                          ),
                                        );

                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(snackBar);
                                      } else {
                                        loaderState.value =
                                            LoadState.notLoading;

                                        final snackBar = SnackBar(
                                          elevation: 0,
                                          clipBehavior: Clip.none,
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            titleFontSize: 30.sp,
                                            messageFontSize: 20.sp,
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
                                            .text = exchangeDataWatch
                                                    .activeMarket
                                                    .base_currency
                                                    .id ==
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
                                                        .precision);

                                        var convertedValue = swapConvert(
                                          market:
                                              exchangeDataWatch.activeMarket,
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
                                  : () {},
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
