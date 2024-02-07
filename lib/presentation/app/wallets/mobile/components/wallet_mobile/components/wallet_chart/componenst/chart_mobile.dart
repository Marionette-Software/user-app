import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/application/wallets/wallet_market_state_notifier_provider.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_wallet_history_kline.data.gql.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class WalletChartMobile extends HookConsumerWidget {
  const WalletChartMobile({
    super.key,
    required this.walletHistoryKline,
  });

  final List<GWalletHistoryKlineData_kline?> walletHistoryKline;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletDataStateNotifierProvider);
    final walletMarketWatch = ref.watch(walletMarketStateNotifierProvider);

    var priceArray = [];

    priceWithInterval() {
      double interval = double.parse(
        ((walletHistoryKline.map((e) => e!.high!).reduce(max) -
                    walletHistoryKline.map((e) => e!.high!).reduce(min)) /
                4)
            .toStringAsFixed(walletMarketWatch.trading_price_precision!),
      );

      priceArray.add(
        numberFormatWithPrecision(walletMarketWatch.trading_price_precision!)
            .format(
          walletHistoryKline.map((e) => e!.high!).reduce(min),
        ),
      );

      for (int i = 1; i < 4; i++) {
        double minValue = walletHistoryKline.map((e) => e!.high!).reduce(min) +
            (interval * i);
        priceArray.add(
          numberFormatWithPrecision(walletMarketWatch.trading_price_precision!)
              .format(minValue),
        );
      }
      priceArray.add(
        numberFormatWithPrecision(walletMarketWatch.trading_price_precision!)
            .format(
          walletHistoryKline.map((e) => e!.high!).reduce(max),
        ),
      );
    }

    return FutureBuilder(
      future: walletHistoryKline.isNotEmpty ? priceWithInterval() : null,
      builder: (context, _) {
        return SizedBox(
          height: 189..h,
          child: walletHistoryKline.isNotEmpty
              ? LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: false,
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: SideTitles(showTitles: false),
                      topTitles: SideTitles(showTitles: false),
                      bottomTitles: SideTitles(showTitles: false),
                      leftTitles: SideTitles(showTitles: false),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          for (final item in walletHistoryKline) ...[
                            FlSpot(
                              item!.timestamp!.toDouble(),
                              item.high!,
                            ),
                          ]
                        ],
                        isCurved: true,
                        curveSmoothness: 0.02,
                        preventCurveOverShooting: true,
                        preventCurveOvershootingThreshold: 0,
                        colors: [
                          AppColors.whiteColorText,
                          getWalletColor(
                            walletState.lightBgColor1,
                            walletState.darkBgColor1,
                            isLightTheme(context),
                          ),
                          getWalletColor(
                            walletState.lightBgColor1,
                            walletState.darkBgColor1,
                            isLightTheme(context),
                          ),
                        ],
                        barWidth: 1,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: false,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          colors: isLightTheme(context)
                              ? [
                                  getWalletColor(
                                    walletState.lightBgColor1,
                                    walletState.darkBgColor1,
                                    isLightTheme(context),
                                  ).withOpacity(0.25),
                                  getWalletColor(
                                    walletState.lightBgColor1,
                                    walletState.darkBgColor1,
                                    isLightTheme(context),
                                  ).withOpacity(0.25)
                                ]
                              : [
                                  getWalletColor(
                                    walletState.lightBgColor1,
                                    walletState.darkBgColor1,
                                    isLightTheme(context),
                                  ),
                                  getWalletColor(
                                    walletState.lightBgColor1,
                                    walletState.darkBgColor1,
                                    isLightTheme(context),
                                  ).withOpacity(0.1),
                                ],
                          gradientFrom: const Offset(0.5, 0),
                          gradientTo: const Offset(0.5, 1),
                        ),
                      ),
                    ],
                  ),
                )
              : Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 189..h,
                      child: SvgPicture.asset(
                        emptySimpleChart,
                        colorFilter: ColorFilter.mode(
                          getWalletColor(
                            walletState.lightBgColor1,
                            walletState.darkBgColor1,
                            isLightTheme(context),
                          ).withOpacity(0.25),
                          BlendMode.srcIn,
                        ),
                        width: double.infinity,
                        height: 189.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 193.w,
                      height: 98..h,
                      child: SvgPicture.asset(
                        isLightTheme(context)
                            ? unableToLoadChartLight
                            : unableToLoadChartDark,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
