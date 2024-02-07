import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/main_data_non_custodial_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_exchange_rate_state_notifier.dart';
import 'package:user_app/application/non_custodial/non_custodial_payment_interface.dart';
import 'package:user_app/application/non_custodial/non_custodial_receive_state_provider.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/exchange/non_custodial_exchange_rate.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_currency.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_payment_interface.dart';
import 'package:user_app/presentation/helpers/rate_convert/non_custodial_convert.dart';

abstract class NonCustodialInterface {
  String getMinAmount({
    required WidgetRef ref,
  });
  Future updateRate({
    required WidgetRef ref,
    required TextEditingController fromValueController,
    required TextEditingController toValueController,
  });
  fromOnChangeInput({
    required String value,
    required WidgetRef ref,
    required TextEditingController fromValueController,
    required TextEditingController toValueController,
  });
  fromDropdownInput({
    required List<NonCustodialCurrency> data,
    required WidgetRef ref,
    required TextEditingController fromValueController,
    required TextEditingController toValueController,
    Object? value,
  });
  toDropdownInput({
    Object? value,
    required WidgetRef ref,
    required List<NonCustodialCurrency> data,
    required TextEditingController fromValueController,
  });
}

class NonCustodialActionsGeneral extends NonCustodialInterface {
  NonCustodialActionsGeneral();

  @override
  String getMinAmount({
    required WidgetRef ref,
  }) {
    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);

    String minAmount = '0';
    for (var element in currencyStateWatch.currencies) {
      if (element.id == currencyStateWatch.selectedFromCurrency.id) {
        for (var e0 in element.markets) {
          if (e0!.id == currencyStateWatch.selectedToCurrency.marketId) {
            if (e0.base_currency_id ==
                currencyStateWatch.selectedFromCurrency.id) {
              minAmount = (e0.minBaseCurrencyAmount!)
                  .toStringAsFixed(e0.base_currency!.precision!);
            } else {
              minAmount = (e0.minQuoteCurrencyAmount!)
                  .toStringAsFixed(e0.quote_currency!.precision!);
            }
          }
        }
      }
    }

    return minAmount;
  }

  @override
  Future updateRate({
    required WidgetRef ref,
    required TextEditingController fromValueController,
    required TextEditingController toValueController,
  }) async {
    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);
    final receiveStateRead =
        ref.read(nonCustodialReceiveNotifierProvider.notifier);
    final mainDataNonCustodialWatch =
        ref.watch(mainDataNonCustodialNotifierProvider);

    double convertedValue;

    if (mainDataNonCustodialWatch.toCurrencyId!.isEmpty) {
      fromValueController.text =
          (double.parse(NonCustodialActionsGeneral().getMinAmount(ref: ref)) *
                  10)
              .toString();

      convertedValue = nonCustodialSwap(
        market: currencyStateWatch.activeMarket,
        currencyFrom: currencyStateWatch.selectedFromCurrency.id,
        currencyTo: currencyStateWatch.selectedToCurrency.id,
        amount: fromValueController.text.isEmpty
            ? 0
            : double.parse(fromValueController.text),
      );

      ref.read(nonCustodialRateStateNotifierProvider.notifier).updateData(
            NonCustodialExchangeRate(
              currencyTo: currencyStateWatch.selectedToCurrency.id,
              currencyFrom: currencyStateWatch.selectedFromCurrency.id,
              rate: convertedValue /
                  (fromValueController.text.isEmpty
                      ? 0
                      : double.parse(fromValueController.text)),
            ),
          );

      toValueController.text =
          '≈ ${convertedValue.toStringAsFixed(currencyStateWatch.selectedToCurrency.precision)}';

      receiveStateRead.updateReceiveAmountState(
        toValueController.text,
        fromValueController.text,
      );
    } else {
      convertedValue = nonCustodialSwap(
        market: currencyStateWatch.activeMarket,
        currencyFrom: currencyStateWatch.selectedFromCurrency.id,
        currencyTo: currencyStateWatch.selectedToCurrency.id,
        amount: double.parse(fromValueController.text),
      );
      ref.read(nonCustodialRateStateNotifierProvider.notifier).updateData(
            NonCustodialExchangeRate(
              currencyTo: currencyStateWatch.selectedToCurrency.id,
              currencyFrom: currencyStateWatch.selectedFromCurrency.id,
              rate: convertedValue / double.parse(fromValueController.text),
            ),
          );
      toValueController.text =
          '≈ ${convertedValue.toStringAsFixed(currencyStateWatch.selectedToCurrency.precision)}';

      receiveStateRead.updateReceiveAmountState(
        toValueController.text,
        fromValueController.text,
      );
    }
  }

  @override
  fromOnChangeInput({
    required String value,
    required TextEditingController fromValueController,
    required TextEditingController toValueController,
    required WidgetRef ref,
  }) {
    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);

    final receiveStateRead =
        ref.read(nonCustodialReceiveNotifierProvider.notifier);

    if (value == '.') {
      fromValueController.text = value == '.' ? '0.' : value;
      fromValueController.selection = TextSelection.fromPosition(
        TextPosition(
          offset: fromValueController.text.length,
        ),
      );
    }

    var amount = double.tryParse(value == '0.' || value.isEmpty ? '0' : value);
    if (amount != null) {
      if (amount <
          double.parse(NonCustodialActionsGeneral().getMinAmount(ref: ref))) {
        receiveStateRead.updateReceiveAmountState(
          toValueController.text,
          value,
        );
        toValueController.text = tr('non_custodial_exchange.amount_too_low');
      } else {
        var a = nonCustodialSwap(
          market: currencyStateWatch.activeMarket,
          currencyFrom: currencyStateWatch.selectedFromCurrency.id,
          currencyTo: currencyStateWatch.selectedToCurrency.id,
          amount: amount,
        );
        ref.read(nonCustodialRateStateNotifierProvider.notifier).updateData(
              NonCustodialExchangeRate(
                currencyTo: currencyStateWatch.selectedToCurrency.id,
                currencyFrom: currencyStateWatch.selectedFromCurrency.id,
                rate: a / amount,
              ),
            );

        toValueController.text = '≈ ${a.toStringAsFixed(
          currencyStateWatch.selectedToCurrency.precision,
        )}';

        receiveStateRead.updateReceiveAmountState(
          toValueController.text,
          fromValueController.text,
        );
      }
    } else {
      toValueController.text = tr('non_custodial_exchange.invalid_value');
    }
  }

  @override
  fromDropdownInput({
    required List<NonCustodialCurrency> data,
    required WidgetRef ref,
    required TextEditingController fromValueController,
    required TextEditingController toValueController,
    Object? value,
  }) {
    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);
    final currencyStateRead =
        ref.read(nonCustodialCurrenciesStateNotifierProvider.notifier);
    final receiveStateRead =
        ref.read(nonCustodialReceiveNotifierProvider.notifier);

    final currency = currencyStateWatch.currencies.firstWhere(
      (element) => element.id == value,
    );
    final newMarket = currency.markets.firstWhere(
      (element) => element!.id == currency.currenciesToList[0].marketId,
    );

    var convertedValue = nonCustodialSwap(
      market: newMarket!,
      currencyFrom: currency.id,
      currencyTo: currency.currenciesToList[0].id,
      amount: 1,
    );

    ref.read(nonCustodialRateStateNotifierProvider.notifier).updateData(
          NonCustodialExchangeRate(
            currencyTo: currencyStateWatch.selectedToCurrency.id,
            currencyFrom: currencyStateWatch.selectedFromCurrency.id,
            rate: convertedValue / 1,
          ),
        );

    toValueController.text =
        '≈ ${convertedValue.toStringAsFixed(currency.precision)}';

    currencyStateRead.updateActiveMarket(newMarket);

    currencyStateRead.updateSelectedFromCurrency(currency);

    List<Currency> updatedCurrenciesMarkets = [];
    for (var element in currency.currenciesToList) {
      for (var e0 in data) {
        if (e0.id == element.id) {
          updatedCurrenciesMarkets.add(element);
        }
      }
    }

    currencyStateRead.updateMarkets(updatedCurrenciesMarkets);

    currencyStateRead.updateSelectedToCurrency(updatedCurrenciesMarkets[0]);
    receiveStateRead.updateReceiveAmountState(
      toValueController.text,
      fromValueController.text,
    );

    fromValueController.text =
        (double.parse(NonCustodialActionsGeneral().getMinAmount(ref: ref)) * 10)
            .toString();
  }

  @override
  toDropdownInput({
    Object? value,
    required WidgetRef ref,
    required List<NonCustodialCurrency> data,
    required TextEditingController fromValueController,
  }) {
    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);
    final currencyStateRead =
        ref.read(nonCustodialCurrenciesStateNotifierProvider.notifier);
    final paymentInterfaceRead =
        ref.read(nonCustodialPaymentInterfaceNotifierProvider.notifier);

    final currency = currencyStateWatch.markets.firstWhere(
      (element) => element.id == value,
    );

    List<NonCustodialPaymentInterfacesState> baseCurrencyPi = [];
    List<NonCustodialPaymentInterfacesState> quoteCurrencyPi = [];

    for (var element in currencyStateWatch.selectedFromCurrency.markets) {
      if (element!.base_currency_id == currency.id) {
        for (var p0 in element.base_currency!.currencyPaymentInterfaces!) {
          baseCurrencyPi.add(
            NonCustodialPaymentInterfacesState(
              id: p0!.paymentInterface!.id!,
              title: p0.paymentInterface!.title!,
              logoUrl: p0.paymentInterface!.logoUrl!,
              subtitle: p0.paymentInterface!.subtitle!,
              type: p0.type!,
            ),
          );
        }
        currencyStateRead.updateReceivePaymentInterface(baseCurrencyPi);

        if (baseCurrencyPi.isNotEmpty) {
          paymentInterfaceRead.updateInterface(baseCurrencyPi.first);
        }
      } else if (element.quote_currency_id == currency.id) {
        for (var p0 in element.quote_currency!.currencyPaymentInterfaces!) {
          quoteCurrencyPi.add(
            NonCustodialPaymentInterfacesState(
              id: p0!.paymentInterface!.id!,
              title: p0.paymentInterface!.title!,
              logoUrl: p0.paymentInterface!.logoUrl!,
              subtitle: p0.paymentInterface!.subtitle!,
              type: p0.type!,
            ),
          );
        }
        currencyStateRead.updateReceivePaymentInterface(quoteCurrencyPi);
        if (quoteCurrencyPi.isNotEmpty) {
          paymentInterfaceRead.updateInterface(quoteCurrencyPi.first);
        }
      }
    }

    List<NonCustodialCurrency> updatedCurrenciesMarkets = [];

    for (var element in data) {
      if (element.id == currency.id) {
        for (var e0 in element.currenciesToList) {
          for (var e1 in data) {
            if (e0.id == e1.id) {
              updatedCurrenciesMarkets.add(e1);
            }
          }
        }
      }
    }
    currencyStateRead.updateCurrencies(updatedCurrenciesMarkets);

    currencyStateRead.updateSelectedToCurrency(currency);

    final newMarket =
        currencyStateWatch.selectedFromCurrency.markets.firstWhere(
      (element) => element!.id == currency.marketId,
    );
    currencyStateRead.updateActiveMarket(newMarket!);

    fromValueController.text =
        (double.parse(NonCustodialActionsGeneral().getMinAmount(ref: ref)) * 10)
            .toString();
  }
}
