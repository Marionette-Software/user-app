import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/market_dynamic_state_notifier_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MarketInfoDetailsWeb extends HookConsumerWidget {
  const MarketInfoDetailsWeb({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketDynamicWatch = ref.watch(marketDynamicStateNotifierProvider);
    final selectMarketWatch = ref.watch(selectMarketsNotifierProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 134.w,
          height: 40.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r),
            ),
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.05),
          ),
          child: Center(
            child: Tooltip(
              message: selectMarketWatch.base_currency.id.toUpperCase(),
              child: Text(
                '24h (${selectMarketWatch.base_currency.id.toUpperCase()})',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.75.sp,
                    ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                marketDynamicWatch.highPrice != null
                    ? '${numberFormatWithPrecision(selectMarketWatch.trading_price_precision).format(marketDynamicWatch.highPrice!)} high'
                    : 'N/A',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 15.sp,
                      color: MainColorsApp.greenColor,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.75,
                    ),
              ),
              Text(
                marketDynamicWatch.lowPrice != null
                    ? '${numberFormatWithPrecision(selectMarketWatch.trading_price_precision).format(marketDynamicWatch.lowPrice!)} low'
                    : 'N/A',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.75,
                    ),
              ),
              Center(
                child: Text(
                  marketDynamicWatch.amount24h != null
                      ? '${abbreviateNumber(number: marketDynamicWatch.amount24h!, precision: selectMarketWatch.trading_amount_precision)} vol'
                      : 'N/A',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75,
                      ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
