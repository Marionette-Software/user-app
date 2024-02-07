import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/trade/market_trade.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_wallet_history_kline.data.gql.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class TradeChartMobile extends HookConsumerWidget {
  const TradeChartMobile({
    super.key,
    required this.walletHistoryKline,
    required this.market,
  });

  final List<GWalletHistoryKlineData_kline?> walletHistoryKline;
  final MarketTrade market;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var priceArray = [];

    priceWithInterval() {
      double interval = double.parse(
        ((walletHistoryKline.map((e) => e!.high!).reduce(max) -
                    walletHistoryKline.map((e) => e!.high!).reduce(min)) /
                4)
            .toStringAsFixed(market.trading_price_precision),
      );

      priceArray.add(
        numberFormatWithPrecision(market.trading_price_precision).format(
          walletHistoryKline.map((e) => e!.high!).reduce(min),
        ),
      );

      for (int i = 1; i < 4; i++) {
        double minValue = walletHistoryKline.map((e) => e!.high!).reduce(min) +
            (interval * i);
        priceArray.add(
          numberFormatWithPrecision(market.trading_price_precision)
              .format(minValue),
        );
      }
      priceArray.add(
        numberFormatWithPrecision(market.trading_price_precision).format(
          walletHistoryKline.map((e) => e!.high!).reduce(max),
        ),
      );
    }

    bool isNegativeLastPrice =
        (market.marketDynamics!.lastPrice! - market.marketDynamics!.startPrice!)
            .isNegative;

    return FutureBuilder(
      future: walletHistoryKline.isNotEmpty ? priceWithInterval() : null,
      builder: (context, _) {
        return SizedBox(
          height: 147..h,
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
                        colors: isNegativeLastPrice
                            ? [
                                AppColors.whiteColorText,
                                MainColorsApp.redColor.withOpacity(0.5),
                                MainColorsApp.redColor.withOpacity(0.5),
                                MainColorsApp.redColor.withOpacity(0.5),
                                MainColorsApp.redColor.withOpacity(0.25),
                              ]
                            : [
                                AppColors.whiteColorText,
                                MainColorsApp.greenColor.withOpacity(0.5),
                                MainColorsApp.greenColor.withOpacity(0.5),
                                MainColorsApp.greenColor.withOpacity(0.5),
                                MainColorsApp.greenColor.withOpacity(0.25),
                              ],
                        barWidth: 1,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: false,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          colors: isNegativeLastPrice
                              ? [
                                  MainColorsApp.redColor.withOpacity(0.5),
                                  MainColorsApp.redColor.withOpacity(0.25)
                                ]
                              : [
                                  MainColorsApp.greenColor.withOpacity(0.5),
                                  MainColorsApp.greenColor.withOpacity(0.25)
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
                          isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : AppColors.whiteColor.withOpacity(0.25),
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
