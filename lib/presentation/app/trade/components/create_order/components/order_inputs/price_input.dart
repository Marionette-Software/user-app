import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/error_mesegge_provider.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/market_percet_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class PriceInput extends HookConsumerWidget {
  const PriceInput({
    required this.priceController,
    required this.totalController,
    required this.amountController,
    required this.platformType,
    super.key,
  });

  final TextEditingController priceController;
  final TextEditingController totalController;
  final TextEditingController amountController;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);
    final marketOrLimitProviderWatch = ref.watch(marketOrLimitProvider);
    final marketPercentState = ref.read(marketPercentProviderProvider.notifier);

    final pricePrecision = marketDataWatch.trading_price_precision;
    final tradingMinPrice = marketDataWatch.trading_min_price;
    final tradingMaxPrice = marketDataWatch.trading_max_price;

    final errorMinOrMaxPriceRead =
        ref.read(errorMinOrMaxPriceProvider.notifier);

    void handlePriceFieldFocusChange(bool hasFocus) {
      final price = priceController.text;

      if ((price == 0.toStringAsFixed(pricePrecision)) && hasFocus) {
        priceController.text = '';
      } else if (price == '' && !hasFocus) {
        priceController.text = 0.toStringAsFixed(pricePrecision);
      }
    }

    void handlePriceFieldValueChange(String value) {
      marketPercentState.state = 0;
      totalController.text = (double.parse(value.isNotEmpty ? value : '0') *
              double.parse(amountController.text))
          .toStringAsFixed(marketDataWatch.quote_currency.precision);

      final newValue = value.isEmpty ? 0 : double.parse(value);
      errorMinOrMaxPriceRead.state =
          newValue < tradingMinPrice || newValue > tradingMaxPrice;
    }

    return SizedBox(
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
                tr('trade.price'),
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
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Expanded(
              child: TextField(
                readOnly: marketOrLimitProviderWatch == OrderType.market,
                controller: priceController,
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
                    decimalRange: pricePrecision == 0 ? 1 : pricePrecision,
                  ),
                ],
                decoration: InputDecoration(
                  // prefixText: tr('trade.price'),
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
                      ).sp,
                    ),
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
                      ' ${marketDataWatch.quote_currency.id.toUpperCase()}',
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
                            fontWeight: FontWeight.w600,
                          ),
                  contentPadding: EdgeInsets.only(
                    // left: 15.w,
                    right: 12.w,
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
