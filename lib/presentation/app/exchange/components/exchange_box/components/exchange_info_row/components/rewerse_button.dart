import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/actions/non_custodial_actions.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_payment_interface.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_currency.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_payment_interface.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/rate_convert/non_custodial_convert.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ReverseButton extends HookConsumerWidget {
  const ReverseButton({
    Key? key,
    required this.fromValueController,
    required this.toValueController,
    required this.data,
    this.platformType = PlatformTypeState.web,
  }) : super(key: key);

  final TextEditingController fromValueController;
  final TextEditingController toValueController;
  final List<NonCustodialCurrency> data;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentInterfaceRead =
        ref.read(nonCustodialPaymentInterfaceNotifierProvider.notifier);

    List<NonCustodialPaymentInterfacesState> baseCurrencyPi = [];
    List<NonCustodialPaymentInterfacesState> quoteCurrencyPi = [];

    return SizedBox(
      width: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 48.84.w,
        tabletValue: 40.w,
        mobileValue: 34.19.w,
      ),
      height: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 50.h,
        tabletValue: 40.h,
        mobileValue: 35.h,
      ),
      child: ElevatedButton(
        onPressed: () {
          NonCustodialActionsGeneral nonCustodialActions =
              NonCustodialActionsGeneral();

          final currencyStateWatch =
              ref.watch(nonCustodialCurrenciesStateNotifierProvider);
          final currencyStateRead =
              ref.read(nonCustodialCurrenciesStateNotifierProvider.notifier);
          var fromCurrency = data.firstWhere(
            (element) =>
                element.id.toUpperCase() ==
                currencyStateWatch.selectedToCurrency.id.toUpperCase(),
          );

          var toCurrency = fromCurrency.currenciesToList.firstWhere(
            (element) =>
                element.id.toUpperCase() ==
                currencyStateWatch.selectedFromCurrency.id.toUpperCase(),
          );

          List<Currency> updatedCurrenciesMarkets = [];
          for (var element in fromCurrency.currenciesToList) {
            for (var e0 in data) {
              if (e0.id == element.id) {
                updatedCurrenciesMarkets.add(element);
              }
            }
          }

          List<NonCustodialCurrency> updateCurrencies = [];

          for (var element in data) {
            if (element.id == toCurrency.id) {
              for (var e0 in element.currenciesToList) {
                for (var e1 in data) {
                  if (e0.id == e1.id) {
                    updateCurrencies.add(e1);
                  }
                }
              }
            }
          }

          currencyStateRead.updateCurrencies(updateCurrencies);
          currencyStateRead.updateMarkets(updatedCurrenciesMarkets);

          currencyStateRead.updateSelectedFromCurrency(fromCurrency);
          currencyStateRead.updateSelectedToCurrency(toCurrency);
          for (var element in fromCurrency.markets) {
            if (element!.base_currency_id == toCurrency.id) {
              for (var p0
                  in element.base_currency!.currencyPaymentInterfaces!) {
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
            } else if (element.quote_currency_id == toCurrency.id) {
              for (var p0
                  in element.quote_currency!.currencyPaymentInterfaces!) {
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
          fromValueController.text =
              (double.parse(nonCustodialActions.getMinAmount(ref: ref)) * 10)
                  .toString();
          toValueController.text = nonCustodialSwap(
            market: currencyStateWatch.activeMarket,
            currencyFrom: currencyStateWatch.selectedFromCurrency.id,
            currencyTo: currencyStateWatch.selectedToCurrency.id,
            amount: fromValueController.text.isEmpty
                ? 0
                : double.parse(fromValueController.text),
          ).toStringAsFixed(currencyStateWatch.selectedToCurrency.precision);
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
          ),
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
            (states) {
              if (states.contains(MaterialState.hovered)) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(
                    color: MainColorsApp.accentColor,
                    width: 1.5,
                  ),
                );
              }
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                  color: isLightTheme(context)
                      ? MainColorsApp.primaryOp10Color
                      : Theme.of(context).primaryColorLight,
                ),
              );
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              return isLightTheme(context)
                  ? MainColorsApp.primaryOp10Color
                  : AppColors.inputEventColor;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.hovered)) {
                return MainColorsApp.primaryColor;
              }
              return MainColorsApp.primaryColor;
            },
          ),
        ),
        child: SvgPicture.asset(
          swapIcon,
          colorFilter: ColorFilter.mode(
            isLightTheme(context)
                ? Theme.of(context).primaryColorLight
                : AppColors.whiteColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
