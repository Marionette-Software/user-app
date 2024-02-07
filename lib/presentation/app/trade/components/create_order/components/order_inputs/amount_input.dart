import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/error_mesegge_provider.dart';
import 'package:user_app/application/trade/is_active_buy_sell_provider.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AmountInput extends HookConsumerWidget {
  const AmountInput({
    required this.priceController,
    required this.totalController,
    required this.amountController,
    required this.active,
    required this.platformType,
    super.key,
  });

  final TextEditingController priceController;
  final TextEditingController totalController;
  final TextEditingController amountController;
  final ValueNotifier<bool> active;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);
    final marketOrLimitProviderWatch = ref.watch(marketOrLimitProvider);
    final marketPercentState = ref.read(marketPercentProviderProvider.notifier);
    final isActiveBuySellProviderState =
        ref.read(isActiveBuySellProvider.notifier);

    final errorMinAmountRead = ref.read(errorMinAmountProvider.notifier);

    void handlePriceFieldValueChange(String v) {
      marketPercentState.state = 0;
      isActiveBuySellProviderState.state = false;
      if (marketOrLimitProviderWatch == OrderType.limit) {
        final total = (v.isEmpty
                ? 0
                : double.parse(v) *
                    double.parse(priceController.text.isNotEmpty
                        ? priceController.text
                        : '0'))
            .toStringAsFixed(marketDataWatch.quote_currency.precision);
        totalController.text = total;
      } else {
        final total = (v.isEmpty
                ? 0
                : double.parse(v) *
                    double.parse(priceController.text.isNotEmpty
                        ? priceController.text
                        : '0'))
            .toStringAsFixed(marketDataWatch.quote_currency.precision);
        totalController.text = '≈ $total';
      }

      final newValue = v.isEmpty ? 0 : double.parse(v);
      final isAmountBelowMin = newValue < marketDataWatch.trading_min_amount;

      errorMinAmountRead.state = isAmountBelowMin;
      active.value = !active.value;
    }

    void handlePriceFieldFocusChange(bool hasFocus) {
      final v = amountController.text;
      if (v.isEmpty || v == '0') {
        if (!hasFocus) {
          amountController.text = 0.toStringAsFixed(marketDataWatch.trading_amount_precision);
        }
      } else if (double.parse(v) == 0) {
        if (hasFocus) {
          amountController.clear();
        } else {
          amountController.text = marketDataWatch.trading_min_amount.toStringAsFixed(marketDataWatch.trading_amount_precision);
        }
      }
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          getSizeFromPlatformType(
            platformType: platformType,
            webValue: 10,
            tabletValue: 10,
            mobileValue: 5,
          ).r,
        ),
      ),
      width: getSizeFromPlatformType(
        platformType: platformType,
        webValue: double.infinity,
        tabletValue: 330,
        mobileValue: double.infinity,
      ).w,
      height: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 50,
        tabletValue: 40,
        mobileValue: 28,
      ).h,
      child: Focus(
        onFocusChange: handlePriceFieldFocusChange,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 6.h, left: 15.w),
              child: Text(
                tr('trade.amount'),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 15,
                        tabletValue: 13,
                        mobileValue: 15,
                      ).sp,
                      color: isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.5),
                    ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 20,
                        tabletValue: 15,
                        mobileValue: 25,
                      ).sp,
                      color: Theme.of(context).primaryColor,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.w600,
                    ),
                textAlign: TextAlign.end,
                inputFormatters: [
                  RegExInputFormatter.withRegex(
                    '^\$|^(0|([1-9.][0-9.]{0,10}))(\\.[0-9]{0,10})?\$',
                  ),
                  NumberTextInputFormatter(
                    decimalRange: marketDataWatch.trading_amount_precision == 0
                        ? 1
                        : marketDataWatch.trading_amount_precision,
                  ),
                ],
                decoration: InputDecoration(
                  filled: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 10,
                        tabletValue: 10,
                        mobileValue: 5,
                      ).r,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(
                      getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 10,
                        tabletValue: 10,
                        mobileValue: 5,
                      ).r,
                    ),
                  ),
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: getSizeFromPlatformType(
                          platformType: platformType,
                          webValue: 15,
                          tabletValue: 13,
                          mobileValue: 13,
                        ).sp,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(
                      getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 10,
                        tabletValue: 10,
                        mobileValue: 5,
                      ).r,
                    ),
                  ),
                  errorBorder: InputBorder.none,
                  // prefixText: tr('trade.amount'),
                  prefixStyle:
                      Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 15,
                              tabletValue: 13,
                              mobileValue: 15,
                            ).sp,
                            color: isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : AppColors.whiteColor.withOpacity(0.5),
                          ),
                  suffixText:
                      ' ${marketDataWatch.base_currency.id.toUpperCase()}',
                  suffixStyle:
                      Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 20,
                            tabletValue: 15,
                            mobileValue: 25,
                          ).sp,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: -0.5,
                          fontWeight: FontWeight.w600),
                  contentPadding: const EdgeInsets.only(
                      // left: 15.w,
                      // right: 12.w,
                      // top: 12.h,
                      // bottom: 17.h,
                      ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                onChanged: handlePriceFieldValueChange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
