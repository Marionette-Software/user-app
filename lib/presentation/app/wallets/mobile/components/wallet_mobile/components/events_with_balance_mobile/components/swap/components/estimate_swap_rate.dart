import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/exchange/exchange_rate_provider.dart';
import 'package:user_app/application/exchange/exchange_state_provider.dart';
import 'package:user_app/domain/exchange/exchange_rate.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class EstimatedSwapRateRowMobile extends HookConsumerWidget {
  const EstimatedSwapRateRowMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeRateStateRead = ref.read(exchangeRateStateProvider.notifier);
    final exchangeRateStateWatch = ref.watch(exchangeRateStateProvider);
    final exchangeDataWatch = ref.watch(exchangeStateNotifierProvider);
    final exchangeDataRead = ref.read(exchangeStateNotifierProvider.notifier);

    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tr('wallet.estimated_rate'),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: isLightTheme(context)
                      ? AppColors.aboutHeaderLight
                      : AppColors.whiteColor.withOpacity(0.5),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.65.sp,
                ),
          ),
          const Spacer(),
          Text(
            '1 ${exchangeDataWatch.rate.currencyFrom.id.toUpperCase()}',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.65.sp,
                ),
          ),
          SizedBox(width: 6.w),
          InkWell(
            onTap: () async {
              exchangeDataRead.updateRate(
                ExchangeRate(
                  currencyTo: exchangeDataWatch.rate.currencyFrom,
                  currencyFrom: exchangeDataWatch.rate.currencyTo,
                  rateWithPrecision: (1 / exchangeDataWatch.rate.rate)
                      .toStringAsFixed(
                          exchangeDataWatch.rate.currencyFrom.precision),
                  rate: 1 / exchangeDataWatch.rate.rate,
                ),
              );
              exchangeRateStateRead.state = !exchangeRateStateWatch;
            },
            child: SvgPicture.asset(
              swapIconRateInWallet,
              colorFilter: const ColorFilter.mode(
                MainColorsApp.accentColor,
                BlendMode.srcIn,
              ),
              width: 18.w,
            ),
          ),
          SizedBox(width: 6.w),
          Row(
            children: [
              exchangeDataWatch.rate.currencyFrom.id.toUpperCase() ==
                      exchangeDataWatch.activeMarket.base_currency.id
                          .toUpperCase()
                  ? Text(
                      numberFormatWithPrecision(exchangeDataRead
                              .state
                              .fromCurrencyPrecision!
                              .swapBaseToQuotePricePrecision)
                          .format(exchangeDataWatch.rate.rate),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.65.sp,
                          ),
                    )
                  : Text(
                      numberFormatWithPrecision(exchangeDataRead
                              .state
                              .fromCurrencyPrecision!
                              .swapQuoteToBasePricePrecision)
                          .format(exchangeDataWatch.rate.rate),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.65.sp,
                          ),
                    ),
              Text(
                ' ${exchangeDataWatch.rate.currencyTo.id.toUpperCase()}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.65.sp,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
