import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/exchange/exchange_state_provider.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/exchange/exchange_rate.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/components/custom_drop_down_web.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';
import 'package:user_app/presentation/helpers/rate_convert/swap_convert.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SendFieldWeb extends HookConsumerWidget {
  const SendFieldWeb({
    required this.listCurrency,
    required this.controller,
    required this.toValueController,
    required this.dropdownValue,
    required this.dropdownOnChanged,
    required this.onFocusChange,
    this.isEnabled = true,
    required this.onChanged,
    this.focusInput = true,
    required this.precision,
    required this.walletBalanceFrom,
    required this.withTradingBalance,
    super.key,
  });

  final List<Currency> listCurrency;
  final TextEditingController controller;
  final TextEditingController toValueController;
  final Function(Object?) dropdownOnChanged;
  final Function(bool) onFocusChange;
  final dynamic dropdownValue;
  final bool isEnabled;
  final Function(String) onChanged;
  final bool focusInput;
  final int precision;
  final double walletBalanceFrom;
  final bool withTradingBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeDataWatch = ref.watch(exchangeStateNotifierProvider);
    final exchangeDataRead = ref.read(exchangeStateNotifierProvider.notifier);
    final userBalances = ref.watch(userBalancesStateNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('wallet.send'),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: isLightTheme(context)
                    ? Theme.of(context).primaryColor.withOpacity(0.5)
                    : AppColors.whiteColor.withOpacity(0.5),
                fontWeight: FontWeight.w600,
                fontSize: 25.sp,
                letterSpacing: -1.25.sp,
              ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: 550.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: listCurrency.length == 1
                    ? null
                    : () {
                        showGeneralDialog(
                          barrierLabel: "Label",
                          barrierDismissible: true,
                          barrierColor: AppColors.blackColor.withOpacity(0),
                          transitionDuration: const Duration(milliseconds: 200),
                          context: context,
                          pageBuilder: (context, anim1, anim2) {
                            return CustomDropDownWeb(
                              positionY: 150,
                              selectedItemId:
                                  exchangeDataWatch.selectedFromCurrency.id,
                              listCurrency: listCurrency,
                              dropdownOnChanged: dropdownOnChanged,
                              withTradingBalance: withTradingBalance,
                              userBalances: userBalances,
                            );
                          },
                        );
                      },
                child: Row(
                  children: [
                    UserAppImage(
                      clipBehavior: Clip.hardEdge,
                      path: exchangeDataWatch.selectedFromCurrency.iconUrl,
                      width: 50.w,
                      height: 50.h,
                      isNetwork: true,
                    ),
                    SizedBox(width: 15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          exchangeDataWatch.selectedFromCurrency.id,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.sp,
                                    letterSpacing: -1.sp,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    listCurrency.length == 1
                        ? const SizedBox()
                        : Icon(
                            Icons.keyboard_arrow_down,
                            size: 25.w,
                            color: isLightTheme(context)
                                ? AppColors.darkColorText
                                : AppColors.whiteColor,
                          )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Focus(
                  onFocusChange: onFocusChange,
                  child: TextFormField(
                    autofocus: focusInput,
                    enabled: isEnabled,
                    textAlign: TextAlign.end,
                    controller: controller,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      letterSpacing: -2.sp,
                    ),
                    keyboardType: TextInputType.number,
                    enableSuggestions: false,
                    inputFormatters: [
                      RegExInputFormatter.withRegex(
                        '^\$|^(0|([1-9.][0-9.]{0,}))(\\.[0-9]{0,})?\$',
                      ),
                      NumberTextInputFormatter(
                        decimalRange: precision,
                      ),
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter amount';
                      }
                      return null;
                    },
                    onChanged: onChanged,
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Tooltip(
                message: 'Use all available balance'.hardcoded,
                verticalOffset: -60.h,
                child: InkWell(
                  borderRadius: BorderRadius.circular(21.r),
                  onTap: () {
                    if (walletBalanceFrom >
                        (exchangeDataWatch.activeMarket.base_currency.id ==
                                exchangeDataWatch.selectedFromCurrency.id
                            ? exchangeDataWatch
                                .activeMarket.minBaseCurrencyAmount!
                            : exchangeDataWatch
                                .activeMarket.minQuoteCurrencyAmount!)) {
                      controller.text =
                          walletBalanceFrom.toStringAsFixed(precision);
                      var calculatedValue = swapConvert(
                        market: exchangeDataWatch.activeMarket,
                        currencyFrom: exchangeDataWatch.selectedFromCurrency.id,
                        currencyTo: exchangeDataWatch.selectedToCurrency.id,
                        amount: walletBalanceFrom,
                      );

                      var rate = (calculatedValue / walletBalanceFrom);

                      exchangeDataRead.updateRate(
                        ExchangeRate(
                          currencyTo: exchangeDataWatch.selectedToCurrency,
                          currencyFrom: exchangeDataWatch.selectedFromCurrency,
                          rateWithPrecision: rate.toStringAsFixed(
                              exchangeDataWatch.selectedFromCurrency.precision),
                          rate: rate,
                        ),
                      );

                      toValueController.text =
                          '≈ ${numberFormatWithPrecision(exchangeDataWatch.selectedToCurrency.precision).format(calculatedValue)}';
                    }
                  },
                  child: Container(
                    width: 75.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: MainColorsApp.accentColor,
                      borderRadius: BorderRadius.circular(21.r),
                    ),
                    child: Center(
                      child: Text(
                        'Max'.hardcoded,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 20.sp,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -1.sp,
                                ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: 550.w,
          height: 5.h,
          color: isLightTheme(context)
              ? MainColorsApp.cardColor
              : AppColors.whiteColor.withOpacity(0.05),
        ),
      ],
    );
  }
}
