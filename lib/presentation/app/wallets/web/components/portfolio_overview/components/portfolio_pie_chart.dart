import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/app/wallets/web/components/portfolio_overview/portfolio_overview.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PortfolioPieChart extends StatelessWidget {
  const PortfolioPieChart({
    Key? key,
    required this.allSumBalanceToUsdt,
    required this.statisticBalanceAndName,
    required this.statsColors,
  }) : super(key: key);

  final double allSumBalanceToUsdt;
  final List<PieChartItemState> statisticBalanceAndName;
  final List<Color> statsColors;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 283.h,
          width: 283.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: SfCircularChart(
            series: <CircularSeries>[
              DoughnutSeries<PieChartItemState, dynamic>(
                dataSource: statisticBalanceAndName,
                pointColorMapper: (PieChartItemState item, _) => item.color,
                xValueMapper: (PieChartItemState item, _) => item.id,
                yValueMapper: (PieChartItemState item, _) => item.balanceToUsdt,
                cornerStyle: CornerStyle.bothFlat,
                radius: '110%',
                innerRadius: '75%',
                // explode: true,
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\$${abbreviateNumber(number: allSumBalanceToUsdt, precision: 2)}',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1.5.sp,
                    fontStyle: FontStyle.normal,
                  ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              tr('wallet.total_value'),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1.sp,
                    fontStyle: FontStyle.normal,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
