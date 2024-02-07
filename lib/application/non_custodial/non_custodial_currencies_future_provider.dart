import 'package:ferry/ferry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/main_data_non_custodial_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_payment_interface.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_currency.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_payment_interface.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/get_currencies.data.gql.dart';
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/get_currencies.var.gql.dart';
import 'package:user_app/infrastructure/non_custodial_exchange/non_custodial_exchange_service.dart';

final getNonCustodialCurrenciesFutureProvider =
    FutureProvider.family<List<NonCustodialCurrency>, RefreshRequest>(
  (ref, request) async {
    INonCustodialExchangeService service = NonCustodialExchangeService();
    var stateProvider =
        ref.read(nonCustodialCurrenciesStateNotifierProvider.notifier);

    final paymentInterfaceRead =
        ref.read(nonCustodialPaymentInterfaceNotifierProvider.notifier);

    final mainDataNonCustodialWatch =
        ref.watch(mainDataNonCustodialNotifierProvider);

    OperationResponse<GGetNonCustodialCurrenciesData,
            GGetNonCustodialCurrenciesVars> response =
        await service.getCurrencies();

    List<NonCustodialCurrency> currencies = [];

    /// Filtering currencies. Need remove markets, where disabled non custodial exchange
    for (int i = 0; i < response.data!.currencies!.length; i++) {
      var item = response.data!.currencies![i];
      var itemMarketsList = item!.markets!.toList();
      var itemPaymentInterfacesList = item.currencyPaymentInterfaces!.toList();

      List<Currency> marketsList = [];
      List<GGetNonCustodialCurrenciesData_currencies_currencyPaymentInterfaces_paymentInterface>
          wcBlockchains = [];

      /// Remove markets, where disabled non custodial exchange
      for (int a = 0; a < itemMarketsList.length; a++) {
        if (itemMarketsList[a]!.enable_non_custodial_exchange! &&
            (itemMarketsList[a]!.base_currency!.userBalanceEnable! &&
                itemMarketsList[a]!.quote_currency!.userBalanceEnable!)) {
          if (item.id == itemMarketsList[a]!.base_currency_id) {
            marketsList.add(
              Currency(
                id: itemMarketsList[a]!.quote_currency_id!,
                name: itemMarketsList[a]!.quote_currency!.name!,
                iconUrl: itemMarketsList[a]!.quote_currency!.icon_url!,
                precision: itemMarketsList[a]!.quote_currency!.precision!,
                minAmount: itemMarketsList[a]!.minQuoteCurrencyAmount!,
                marketId: itemMarketsList[a]!.id!,
                swapBaseToQuotePricePrecision:
                    itemMarketsList[a]!.swapBaseToQuotePricePrecision,
                swapQuoteToBasePricePrecision:
                    itemMarketsList[a]!.swapQuoteToBasePricePrecision,
              ),
            );
          } else {
            marketsList.add(
              Currency(
                id: itemMarketsList[a]!.base_currency_id!,
                name: itemMarketsList[a]!.base_currency!.name!,
                iconUrl: itemMarketsList[a]!.base_currency!.icon_url!,
                precision: itemMarketsList[a]!.base_currency!.precision!,
                minAmount: itemMarketsList[a]!.minBaseCurrencyAmount!,
                marketId: itemMarketsList[a]!.id!,
                swapBaseToQuotePricePrecision:
                    itemMarketsList[a]!.swapBaseToQuotePricePrecision,
                swapQuoteToBasePricePrecision:
                    itemMarketsList[a]!.swapQuoteToBasePricePrecision,
              ),
            );
          }
        }
      }

      for (int b = 0; b < itemPaymentInterfacesList.length; b++) {
        var itemBlockchain = itemPaymentInterfacesList[b]!.paymentInterface!;
        if (itemBlockchain.blockchain != null &&
            (itemBlockchain.blockchain?.chainId == 1 ||
                itemBlockchain.blockchain?.chainId == 56)) {
          wcBlockchains.add(itemBlockchain);
        }
      }

      currencies.add(
        NonCustodialCurrency(
          id: item.id!,
          name: item.name!,
          iconUrl: item.icon_url!,
          precision: item.precision!,
          paymentInterfaces: item.currencyPaymentInterfaces!.toList(),
          paymentInterfacesWC: wcBlockchains,
          currenciesToList: marketsList,
          markets: item.markets!.toList(),
        ),
      );
    }

    /// Remove currencies, where have no markets to non custodial exchange
    List<NonCustodialCurrency> updatedCurrencies = [];
    for (int i = 0; i < currencies.length; i++) {
      if (currencies[i].currenciesToList.isNotEmpty &&
          currencies[i].paymentInterfaces.isNotEmpty) {
        updatedCurrencies.add(currencies[i]);
      }
    }

    List<NonCustodialCurrency> updatedCurrenciesMarkets = [];

    for (var element in updatedCurrencies[0].currenciesToList) {
      for (var e0 in updatedCurrencies) {
        if (e0.id == element.id && e0.paymentInterfaces.isNotEmpty) {
          if (e0.paymentInterfaces.isNotEmpty) {
            updatedCurrenciesMarkets.add(e0);
          }
        }
      }
    }

    if (mainDataNonCustodialWatch.fromCurrencyId!.isEmpty) {
      stateProvider.updateCurrencies(updatedCurrencies);

      int indexFrom = 0;
      int indexTo = 0;

      /// Select 1st currency as active
      stateProvider
          .updateSelectedFromCurrency(updatedCurrenciesMarkets[indexFrom]);

      /// Update market
      stateProvider.updateActiveMarket(
        updatedCurrenciesMarkets[indexFrom].markets.firstWhere(
              (element) =>
                  element!.id ==
                  updatedCurrenciesMarkets[indexFrom]
                      .currenciesToList[indexTo]
                      .marketId,
            )!,
      );

      /// Update markets list (Currencies to list)
      stateProvider.updateMarkets(
        updatedCurrenciesMarkets[indexFrom].currenciesToList,
      );

      /// Select 1st market as active
      stateProvider.updateSelectedToCurrency(
        updatedCurrenciesMarkets[indexFrom].currenciesToList[indexTo],
      );

      stateProvider.updatePaymentInterfaces(
        currencies[indexFrom].paymentInterfaces,
      );

      List<NonCustodialPaymentInterfacesState> baseCurrencyPi = [];
      List<NonCustodialPaymentInterfacesState> quoteCurrencyPi = [];

      for (var element in updatedCurrenciesMarkets[indexFrom].markets) {
        if (element!.base_currency!.id!.toUpperCase() ==
            updatedCurrenciesMarkets[indexFrom]
                .currenciesToList[indexTo]
                .id
                .toUpperCase()) {
          if (element.base_currency!.currencyPaymentInterfaces!.isNotEmpty) {
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
            stateProvider.updateReceivePaymentInterface(baseCurrencyPi);
          }
        } else if (element.quote_currency!.id!.toUpperCase() ==
            updatedCurrenciesMarkets[indexFrom]
                .currenciesToList[indexTo]
                .id
                .toUpperCase()) {
          if (element.quote_currency!.currencyPaymentInterfaces!.isNotEmpty) {
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
            stateProvider.updateReceivePaymentInterface(quoteCurrencyPi);
          }
        }
      }
      if (stateProvider.state.receivePaymentInterface.isNotEmpty) {
        paymentInterfaceRead.updateInterface(
          stateProvider.state.receivePaymentInterface[0],
        );
      }

      return updatedCurrencies;
    } else {
      return updatedCurrencies;
    }
  },
);
