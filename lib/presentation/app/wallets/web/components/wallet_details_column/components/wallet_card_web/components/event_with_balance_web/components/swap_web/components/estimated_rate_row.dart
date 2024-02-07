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

class EstimatedRateRowWeb extends HookConsumerWidget {
  const EstimatedRateRowWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeRateStateRead = ref.read(exchangeRateStateProvider.notifier);
    final exchangeRateStateWatch = ref.watch(exchangeRateStateProvider);
    final exchangeDataWatch = ref.watch(exchangeStateNotifierProvider);
    final exchangeDataRead = ref.read(exchangeStateNotifierProvider.notifier);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          tr('wallet.estimated_rate'),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.9.sp,
              ),
        ),
        const Spacer(),
        Text(
          '1 ${exchangeDataWatch.rate.currencyFrom.id.toUpperCase()}',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.9.sp,
              ),
        ),
        SizedBox(width: 6.w),
        Tooltip(
          message: 'Reverse rate for pair',
          child: InkWell(
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
              width: 20.w,
              colorFilter: const ColorFilter.mode(
                MainColorsApp.accentColor,
                BlendMode.srcIn,
              ),
            ),
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
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.9.sp,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                  )
                : Text(
                    numberFormatWithPrecision(exchangeDataRead
                            .state
                            .fromCurrencyPrecision!
                            .swapQuoteToBasePricePrecision)
                        .format(exchangeDataWatch.rate.rate),
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.9.sp,
                        ),
                  ),
            Text(
              ' ${exchangeDataWatch.rate.currencyTo.id.toUpperCase()}',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.9.sp,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
