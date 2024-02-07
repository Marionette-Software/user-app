import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/main_data_non_custodial_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_exchange_rate_state_notifier.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/exchange/non_custodial_exchange_rate.dart';
import 'package:user_app/domain/non_custodial_exchange/main_non_custodial_value.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_currency.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/non_custodial_exchange.dart';
import 'package:user_app/presentation/app/exchange/components/exchange_box/components/exchange_box_header.dart';
import 'package:user_app/presentation/app/exchange/components/exchange_box/components/exchange_field.dart';
import 'package:user_app/presentation/app/exchange/components/exchange_box/components/exchange_field_to.dart';
import 'package:user_app/presentation/app/exchange/components/exchange_box/components/exchange_info_row/exchange_info_row.dart';
import 'package:user_app/presentation/app/exchange/components/exchange_box/components/wallet_connect_row.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/rate_convert/non_custodial_convert.dart';

class ContainerWithInput extends HookConsumerWidget {
  const ContainerWithInput({
    super.key,
    required this.fromValueController,
    required this.toValueController,
    required this.data,
    required this.enabledNonCustodialWalletConnect,
    required this.getMinAmount,
    required this.platformType,
  });

  final TextEditingController fromValueController;
  final TextEditingController toValueController;
  final List<NonCustodialCurrency> data;
  final bool enabledNonCustodialWalletConnect;
  final String Function() getMinAmount;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyStateRead =
        ref.read(nonCustodialCurrenciesStateNotifierProvider.notifier);
    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);

    final mainDataNonCustodial =
        ref.read(mainDataNonCustodialNotifierProvider.notifier);

    var validateBtn = useState(true);

    return Column(
      children: [
        ExchangeBoxHeader(
          platformType: platformType,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 25.w,
              tabletValue: 25.w,
              mobileValue: 15.w,
            ),
            right: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 25.w,
              tabletValue: 25.w,
              mobileValue: 15.w,
            ),
            top: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 25.h,
              tabletValue: 25.h,
              mobileValue: 15.h,
            ),
          ),
          child: Column(
            children: [
              ExchangeField(
                precision: currencyStateWatch.selectedFromCurrency.precision,
                platformType: platformType,
                onChanged: (String value) {
                  if (value == '.') {
                    fromValueController.text = value == '.' ? '0.' : value;
                    fromValueController.selection = TextSelection.fromPosition(
                      TextPosition(offset: fromValueController.text.length),
                    );
                  }

                  var amount = double.tryParse(value.isEmpty ? '0' : value);

                  if (amount != null) {
                    double minAmount = double.parse(getMinAmount());
                    if (amount < minAmount) {
                      toValueController.text =
                          tr('non_custodial_exchange.amount_too_low');
                      validateBtn.value = false;
                    } else {
                      var a = nonCustodialSwap(
                        market: currencyStateWatch.activeMarket,
                        currencyFrom:
                            currencyStateWatch.selectedFromCurrency.id,
                        currencyTo: currencyStateWatch.selectedToCurrency.id,
                        amount: amount,
                      );
                      ref
                          .read(nonCustodialRateStateNotifierProvider.notifier)
                          .updateData(
                            NonCustodialExchangeRate(
                              currencyTo:
                                  currencyStateWatch.selectedToCurrency.id,
                              currencyFrom:
                                  currencyStateWatch.selectedFromCurrency.id,
                              rate: a / amount,
                            ),
                          );

                      if (a.isNegative) {
                        validateBtn.value = false;
                        toValueController.text = '...';
                      } else if (amount < minAmount) {
                        validateBtn.value = false;
                        toValueController.text = '≈ ${a.toStringAsFixed(
                          currencyStateWatch.selectedToCurrency.precision,
                        )}';
                      } else {
                        validateBtn.value = true;
                        toValueController.text = '≈ ${a.toStringAsFixed(
                          currencyStateWatch.selectedToCurrency.precision,
                        )}';
                      }
                    }
                  } else {
                    validateBtn.value = false;
                    toValueController.text =
                        tr('non_custodial_exchange.invalid_value');
                  }
                },
                items: currencyStateWatch.currencies,
                dropdownOnChanged: (value) {
                  final currency = currencyStateWatch.currencies.firstWhere(
                    (element) => element.id == value,
                  );

                  currencyStateRead.updateSelectedFromCurrency(currency);

                  List<Currency> updatedCurrenciesMarkets = [];
                  for (var element in currency.currenciesToList) {
                    for (var e0 in data) {
                      if (e0.id == element.id) {
                        updatedCurrenciesMarkets.add(element);
                      }
                    }
                  }
                  final newMarket = currency.markets.firstWhere(
                    (element) =>
                        element!.id == updatedCurrenciesMarkets[0].marketId,
                  );
                  currencyStateRead.updateActiveMarket(newMarket!);

                  fromValueController.text = getMinAmount();
                  var convertedValue = nonCustodialSwap(
                    market: newMarket,
                    currencyFrom: currency.id,
                    currencyTo: updatedCurrenciesMarkets[0].id,
                    amount: double.parse(fromValueController.text),
                  );
                  ref
                      .read(nonCustodialRateStateNotifierProvider.notifier)
                      .updateData(
                        NonCustodialExchangeRate(
                          currencyTo: updatedCurrenciesMarkets[0].id,
                          currencyFrom: currency.id,
                          rate: convertedValue /
                              double.parse(fromValueController.text),
                        ),
                      );

                  toValueController.text =
                      '≈ ${convertedValue.toStringAsFixed(currency.precision)}';

                  currencyStateRead.updateMarkets(updatedCurrenciesMarkets);

                  currencyStateRead
                      .updateSelectedToCurrency(updatedCurrenciesMarkets[0]);
                },
                oppositeController: toValueController,
                title:
                    '${tr('non_custodial_exchange.send')} (${tr('non_custodial_exchange.min')} ${getMinAmount()} ${currencyStateWatch.selectedFromCurrency.id.toUpperCase()})',
                controller: fromValueController,
              ),
              ExchangeInfoRow(
                platformType: platformType,
                fromValueController: fromValueController,
                toValueController: toValueController,
                data: data,
              ),
              ExchangeFieldTo(
                precision: currencyStateWatch.selectedToCurrency.precision,
                platformType: platformType,
                onChanged: (String value) {},
                items: currencyStateWatch.markets,
                dropdownOnChanged: (value) {
                  final currency = currencyStateWatch.markets.firstWhere(
                    (element) => element.id == value,
                  );

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

                  final newMarket = currencyStateWatch
                      .selectedFromCurrency.markets
                      .firstWhere(
                    (element) => element!.id == currency.marketId,
                  );
                  currencyStateRead.updateActiveMarket(newMarket!);
                },
                oppositeController: fromValueController,
                title: '${tr('non_custodial_exchange.receive')}:',
                controller: toValueController,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 25.h,
                    tabletValue: 15.h,
                    mobileValue: 15.h,
                  ),
                  bottom: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 16.h,
                    tabletValue: 15.h,
                    mobileValue: 0,
                  ),
                ),
                child: MainButton(
                  disableColor: MainColorsApp.accentColor.withOpacity(0.5),
                  onTap: validateBtn.value
                      ? () {
                          mainDataNonCustodial.update(
                            MainNonCustodialValue(
                              toAmount: toValueController.text,
                              fromAmount: fromValueController.text,
                              toCurrencyIndex:
                                  currencyStateWatch.markets.indexWhere(
                                (element) =>
                                    element.id ==
                                    currencyStateWatch.selectedToCurrency.id,
                              ),
                              toCurrencyId: currencyStateWatch.markets
                                  .firstWhere(
                                    (element) =>
                                        element.id ==
                                        currencyStateWatch
                                            .selectedToCurrency.id,
                                  )
                                  .id,
                              fromCurrencyIndex:
                                  currencyStateWatch.currencies.indexWhere(
                                (element) =>
                                    element.id ==
                                    currencyStateWatch.selectedFromCurrency.id,
                              ),
                              fromCurrencyId:
                                  currencyStateWatch.selectedFromCurrency.id,
                            ),
                          );
                          context.go(NonCustodialExchange.routeName);
                        }
                      : null,
                  text: tr('non_custodial_exchange.exchange'),
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 60.h,
                    tabletValue: 45.h,
                    mobileValue: 35.h,
                  ),
                  fontSize: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 20,
                    tabletValue: 18,
                    mobileValue: 13,
                  ),
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              enabledNonCustodialWalletConnect
                  ? Column(
                      children: [
                        (platformType == PlatformTypeState.web ||
                                platformType == PlatformTypeState.tablet)
                            ? SizedBox(
                                height: getSizeFromPlatformType(
                                  platformType: platformType,
                                  webValue: 22,
                                  tabletValue: 18,
                                  mobileValue: 0,
                                ),
                                child: AutoSizeText(
                                  tr('non_custodial_exchange.or_use'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        fontSize: getSizeFromPlatformType(
                                          platformType: platformType,
                                          webValue: 20,
                                          tabletValue: 15,
                                          mobileValue: 0,
                                        ),
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              )
                            : const SizedBox(),
                        WalletConnectRow(
                          platformType: platformType,
                        ),
                      ],
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ],
    );
  }
}
