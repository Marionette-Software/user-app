import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/market_dynamic_state_notifier_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class LastPriceRowWeb extends HookConsumerWidget {
  const LastPriceRowWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeMarketWatch = ref.watch(selectMarketsNotifierProvider);

    bool isNegativeLastPrice = (activeMarketWatch.marketDynamics!.lastPrice! -
            activeMarketWatch.marketDynamics!.startPrice!)
        .isNegative;

    final marketDynamicWatch = ref.watch(marketDynamicStateNotifierProvider);

    return Padding(
      padding: EdgeInsets.only(
        top: 11.h,
        bottom: 11.h,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isLightTheme(context)
                  ? AppColors.mainBackgroundLightColor
                  : AppColors.whiteColor.withOpacity(0.05),
              width: 2.w,
            ),
            top: BorderSide(
              color: isLightTheme(context)
                  ? AppColors.mainBackgroundLightColor
                  : AppColors.whiteColor.withOpacity(0.05),
              width: 2.w,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 9.h,
            bottom: 9.h,
            left: 15.w,
            right: 15.w,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                numberFormatWithPrecision(
                        activeMarketWatch.trading_price_precision)
                    .format(marketDynamicWatch.lastPrice!),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 30.sp,
                      color: isNegativeLastPrice
                          ? MainColorsApp.redColor
                          : MainColorsApp.greenColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1.5.sp,
                    ),
              ),
              SizedBox(
                width: 10.w,
              ),
              SvgPicture.asset(
                isNegativeLastPrice ? arrowDownIcon : arrowUpIcon,
                colorFilter: ColorFilter.mode(
                  isNegativeLastPrice
                      ? MainColorsApp.redColor
                      : MainColorsApp.greenColor,
                  BlendMode.srcIn,
                ),
                width: 12.w,
                height: 11.h,
              ),
              const Spacer(),
              Text(
                'Last price',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 15.sp,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
