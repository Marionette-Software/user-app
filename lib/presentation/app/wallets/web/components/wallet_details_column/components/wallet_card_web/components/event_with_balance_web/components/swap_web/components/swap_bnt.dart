import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/exchange/exchange_state_provider.dart';
import 'package:user_app/application/swap/submit_button_state_provider.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/rate_convert/swap_convert.dart';

class SwapBtnWeb extends HookConsumerWidget {
  const SwapBtnWeb({
    required this.toValueController,
    required this.fromValueController,
    required this.showMinimumAmountMessage,
    super.key,
  });

  final TextEditingController toValueController;
  final TextEditingController fromValueController;
  final ValueNotifier<bool> showMinimumAmountMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeDataWatch = ref.watch(exchangeStateNotifierProvider);
    final exchangeDataRead = ref.read(exchangeStateNotifierProvider.notifier);

    final submitButtonSwapState =
        ref.read(submitButtonSwapStateProvider.notifier);
    final userBalances = ref.watch(userBalancesStateNotifierProvider);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Tooltip(
          message: 'Reverse pair'.hardcoded,
          verticalOffset: -70.h,
          child: InkWell(
            borderRadius: BorderRadius.circular(40.r),
            onTap: () {
              showMinimumAmountMessage.value = false;
              final cListFromCurrency = exchangeDataWatch.currencyFromList;
              final cListToCurrency = exchangeDataWatch.currencyToList;
              final cSelectedFromCurrency =
                  exchangeDataWatch.selectedFromCurrency;
              final cSelectedToCurrency = exchangeDataWatch.selectedToCurrency;

              exchangeDataRead.updateCurrencyToList(cListFromCurrency);
              exchangeDataRead.updateCurrencyFromList(cListToCurrency);
              exchangeDataRead.updateSelectedFromCurrency(cSelectedToCurrency);
              exchangeDataRead.updateSelectedToCurrency(cSelectedFromCurrency);

              fromValueController.text =
                  exchangeDataWatch.activeMarket.base_currency.id ==
                          cSelectedToCurrency.id
                      ? exchangeDataWatch.activeMarket.minBaseCurrencyAmount!
                          .toStringAsFixed(cSelectedToCurrency.precision)
                      : exchangeDataWatch.activeMarket.minQuoteCurrencyAmount!
                          .toStringAsFixed(cSelectedToCurrency.precision);

              var convertedValue = swapConvert(
                market: exchangeDataWatch.activeMarket,
                currencyFrom: cSelectedToCurrency.id,
                currencyTo: cSelectedFromCurrency.id,
                amount: double.parse(fromValueController.text),
              );

              if (double.parse(fromValueController.text) >
                  userBalances
                      .firstWhere(
                        (element) => element.id == cSelectedToCurrency.id,
                      )
                      .balance!) {
                toValueController.text =
                    '≈ ${numberFormatWithPrecision(cSelectedFromCurrency.precision).format(convertedValue)}';
                submitButtonSwapState.state = false;
              } else {
                toValueController.text =
                    '≈ ${numberFormatWithPrecision(cSelectedFromCurrency.precision).format(convertedValue)}';
                submitButtonSwapState.state = true;
              }
            },
            child: SvgPicture.asset(
              swapIconInWallet,
              width: 109.w,
              height: 60.h,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 189.8.w,
              height: 2.7.h,
              decoration: BoxDecoration(
                color: MainColorsApp.accentColor,
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    MainColorsApp.accentColor.withOpacity(0.01),
                    MainColorsApp.accentColor.withOpacity(0.2),
                    MainColorsApp.accentColor,
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 106.w,
            ),
            Container(
              width: 189.8.w,
              height: 2.7.h,
              decoration: BoxDecoration(
                color: MainColorsApp.accentColor,
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    MainColorsApp.accentColor,
                    MainColorsApp.accentColor.withOpacity(0.2),
                    MainColorsApp.accentColor.withOpacity(0.01),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
