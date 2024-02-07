import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class TotalInput extends HookConsumerWidget {
  const TotalInput({
    Key? key,
    required this.totalController,
    required this.currencyId,
    required this.priceController,
    required this.amountController,
    required this.platformType,
  }) : super(key: key);

  final TextEditingController totalController;
  final TextEditingController priceController;
  final TextEditingController amountController;
  final String currencyId;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);
    final marketOrLimitProviderWatch = ref.watch(marketOrLimitProvider);

    final double price = priceController.text.isNotEmpty
        ? double.parse(priceController.text)
        : 0;
    final double amount = double.tryParse(amountController.text) ?? 0;

    totalController.text = marketOrLimitProviderWatch == OrderType.market
        ? '≈ ${(price * amount).toStringAsFixed(marketDataWatch.quote_currency.precision)}'
        : (price * amount)
            .toStringAsFixed(marketDataWatch.quote_currency.precision);

    return Container(
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          getSizeFromPlatformType(
            platformType: platformType,
            webValue: 10,
            tabletValue: 10,
            mobileValue: 5,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h, left: 15.w),
            child: Text(
              tr('trade.total'),
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
              readOnly: true,
              controller: totalController,
              keyboardType: TextInputType.number,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 20,
                      tabletValue: 15,
                      mobileValue: 25,
                    ).sp,
                    color: isLightTheme(context)
                        ? AppColors.aboutHeaderLight
                        : AppColors.whiteColor.withOpacity(0.5),
                    letterSpacing: -0.5,
                  ),
              textAlign: TextAlign.end,
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
                // prefixText: tr('trade.total'),
                prefixStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
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
                suffixText: ' ${currencyId.toUpperCase()}',
                suffixStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 20,
                        tabletValue: 15,
                        mobileValue: 25,
                      ).sp,
                      color: isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.5),
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.w600,
                    ),
                contentPadding: const EdgeInsets.only(
                    // left: 15.w,
                    // right: 12.w,
                    // top: 12.h,
                    // bottom: 17.h,
                    ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
