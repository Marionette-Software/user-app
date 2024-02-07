import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/presentation/app/trade/components/trade_chart.dart';
import 'package:user_app/presentation/app/trade/web/components/select_market_button/details_market_row.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class TradeChartContainer extends HookConsumerWidget {
  const TradeChartContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 1024.w,
              height: 633.h,
              decoration: BoxDecoration(
                color: isLightTheme(context)
                    ? AppColors.whiteColor
                    : walletBackgroundColor,
                boxShadow: [
                  isLightTheme(context)
                      ? BoxShadow(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          spreadRadius: 10,
                          blurRadius: 20,
                          offset: const Offset(0, 3),
                        )
                      : BoxShadow(
                          color:
                              Theme.of(context).primaryColorLight.withOpacity(
                                    0.0,
                                  ),
                          spreadRadius: 15,
                          blurRadius: 30,
                          offset: const Offset(0, 3),
                        )
                ],
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                  left: 20.w,
                  right: 20.w,
                  bottom: 10.h,
                ),
                child: Column(
                  children: [
                    const DetailsMarketRowWeb(),
                    SizedBox(
                      height: 8.h,
                    ),
                    TradeChartWeb(
                      url: globalData.url,
                      marketId: marketDataWatch.id,
                      themeMode: isLightTheme(context) ? 'light' : 'dark',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
