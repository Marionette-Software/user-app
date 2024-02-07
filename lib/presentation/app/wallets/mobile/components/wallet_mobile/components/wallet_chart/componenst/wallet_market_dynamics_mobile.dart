import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_market_state_notifier_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class WalletMarketDynamicsMobile extends HookConsumerWidget {
  const WalletMarketDynamicsMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletMarketWatch = ref.watch(walletMarketStateNotifierProvider);

    double? changeFor24h;
    if (walletMarketWatch.marketDynamics!.lastPrice != null &&
        walletMarketWatch.marketDynamics!.startPrice != null) {
      changeFor24h = walletMarketWatch.marketDynamics!.lastPrice! -
          walletMarketWatch.marketDynamics!.startPrice!;
    } else {
      changeFor24h = null;
    }

    String? change24Percent;

    if (changeFor24h != null) {
      if (walletMarketWatch.marketDynamics!.startPrice != null) {
        change24Percent = ((100 * changeFor24h) /
                    walletMarketWatch.marketDynamics!.startPrice!)
                .isNegative
            ? (((100 * changeFor24h) /
                        walletMarketWatch.marketDynamics!.startPrice!) *
                    -1)
                .toStringAsFixed(2)
            : ((100 * changeFor24h) /
                    walletMarketWatch.marketDynamics!.startPrice!)
                .toStringAsFixed(2);
      } else {
        change24Percent = null;
      }
    } else {
      change24Percent = 'N/A';
    }

    horizontalLine() {
      return Container(
        height: 20..h,
        width: 2.w,
        color: isLightTheme(context)
            ? AppColors.mainBackgroundLightColor
            : AppColors.whiteColor.withOpacity(0.25),
      );
    }

    columnWithMarketDynamicsData(
      String value,
      String title,
      Color valueColor,
    ) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.65.sp,
                  color: valueColor,
                ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.65.sp,
                ),
          )
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        columnWithMarketDynamicsData(
          walletMarketWatch.marketDynamics!.highPrice == null
              ? 'N/A'
              : numberFormatWithPrecision(
                      walletMarketWatch.trading_price_precision!)
                  .format(walletMarketWatch.marketDynamics!.highPrice),
          tr('wallet.24h_high'),
          isLightTheme(context)
              ? AppColors.darkColorText
              : AppColors.whiteColor.withOpacity(0.5),
        ),
        horizontalLine(),
        columnWithMarketDynamicsData(
          walletMarketWatch.marketDynamics!.lowPrice == null
              ? 'N/A'
              : numberFormatWithPrecision(
                      walletMarketWatch.trading_price_precision!)
                  .format(walletMarketWatch.marketDynamics!.lowPrice),
          tr('wallet.24h_low'),
          isLightTheme(context)
              ? AppColors.darkColorText
              : AppColors.whiteColor.withOpacity(0.5),
        ),
        horizontalLine(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            changeFor24h != null
                ? changeFor24h.isNegative
                    ? Icon(
                        Icons.arrow_drop_down,
                        color: Theme.of(context).colorScheme.error,
                        weight: 5.w,
                      )
                    : Icon(
                        Icons.arrow_drop_up,
                        color: MainColorsApp.greenColor,
                        weight: 5.w,
                      )
                : const SizedBox(),
            columnWithMarketDynamicsData(
                walletMarketWatch.marketDynamics!.lowPrice == null ||
                        walletMarketWatch.marketDynamics!.highPrice == null
                    ? 'N/A'
                    : '${'$change24Percent%'} (${numberFormatWithPrecision(walletMarketWatch.trading_price_precision!).format(changeFor24h)})',
                tr('wallet.24h_change'),
                changeFor24h != null
                    ? changeFor24h.isNegative
                        ? Theme.of(context).colorScheme.error
                        : MainColorsApp.greenColor
                    : Theme.of(context).textTheme.labelLarge!.color!),
          ],
        )
      ],
    );
  }
}
