import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/exchange/exchange_state_provider.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/components/custom_drop_down_mobile.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';
import 'package:user_app/presentation/helpers/rate_convert/swap_convert.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/domain/exchange/exchange_rate.dart';

class SendFieldSwapMobile extends HookConsumerWidget {
  const SendFieldSwapMobile({
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

  final Function(String?) dropdownOnChanged;
  final List<Currency> listCurrency;
  final TextEditingController controller;
  final TextEditingController toValueController;
  final dynamic dropdownValue;
  final Function(bool) onFocusChange;
  final bool isEnabled;
  final Function(String) onChanged;
  final double walletBalanceFrom;
  final bool focusInput;
  final int precision;
  final bool withTradingBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeDataWatch = ref.watch(exchangeStateNotifierProvider);
    final exchangeDataRead = ref.read(exchangeStateNotifierProvider.notifier);
    final userBalances = ref.watch(userBalancesStateNotifierProvider);

    final widgetKey = GlobalKey();

    return Column(
      key: widgetKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Send'.hardcoded,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: isLightTheme(context)
                    ? AppColors.aboutHeaderLight
                    : AppColors.whiteColor.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                letterSpacing: -1.sp,
              ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: listCurrency.length == 1
                  ? null
                  : () {
                      RenderBox renderBox = widgetKey.currentContext!
                          .findRenderObject() as RenderBox;
                      Offset position = renderBox.localToGlobal(Offset.zero);

                      showGeneralDialog(
                        barrierLabel: "Label",
                        barrierDismissible: true,
                        barrierColor: AppColors.blackColor.withOpacity(0),
                        transitionDuration: const Duration(milliseconds: 200),
                        context: context,
                        pageBuilder: (context, anim1, anim2) {
                          return CustomDropDownMobile(
                            position: position.dy,
                            listCurrency: listCurrency,
                            dropdownOnChanged: dropdownOnChanged,
                            withTradingBalance: withTradingBalance,
                            selectedItemId:
                                exchangeDataWatch.selectedFromCurrency.id,
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
                    width: 30.w,
                    height: 30..h,
                    isNetwork: true,
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        exchangeDataWatch.selectedFromCurrency.id,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              letterSpacing: -0.75.sp,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  listCurrency.length == 1
                      ? const SizedBox()
                      : Icon(
                          Icons.keyboard_arrow_down,
                          size: 25.w,
                          color: isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColor.withOpacity(0.5),
                        )
                ],
              ),
            ),
            Expanded(
              child: Focus(
                onFocusChange: onFocusChange,
                child: TextFormField(
                  autofocus: focusInput,
                  enabled: isEnabled,
                  textAlign: TextAlign.right,
                  controller: controller,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    letterSpacing: -1.25.sp,
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
                  decoration: InputDecoration(
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    filled: false,
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 11.w, bottom: 0, top: 0),
                    fillColor: isLightTheme(context)
                        ? cardColor
                        : Theme.of(context).inputDecorationTheme.fillColor,
                    hoverColor: isLightTheme(context)
                        ? cardColor
                        : Theme.of(context).inputDecorationTheme.fillColor,
                    focusColor: isLightTheme(context)
                        ? cardColor
                        : Theme.of(context).inputDecorationTheme.fillColor,
                    isCollapsed: false,
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
              width: 10.w,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(21.r),
              onTap: () {
                if (walletBalanceFrom >
                    (exchangeDataWatch.activeMarket.base_currency.id ==
                            exchangeDataWatch.selectedFromCurrency.id
                        ? exchangeDataWatch.activeMarket.minBaseCurrencyAmount!
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
                width: 60.w,
                height: 25..h,
                decoration: BoxDecoration(
                  color: MainColorsApp.accentColor,
                  borderRadius: BorderRadius.circular(21.r),
                ),
                child: Center(
                  child: Text(
                    'Max'.hardcoded,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.65.sp,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
