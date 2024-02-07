import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/market_dynamic_state_notifier_provider.dart';
import 'package:user_app/application/wallets/save_chart_time_state_notifire.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/trade/market_trade.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class HeaderTradeChartMobile extends HookConsumerWidget {
  const HeaderTradeChartMobile({required this.market, super.key});

  final MarketTrade market;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartTimeStateRead = ref.read(chartTimeStateProvider.notifier);
    final chartTimeStateWatch = ref.watch(chartTimeStateProvider);

    final marketDynamicWatch = ref.watch(marketDynamicStateNotifierProvider);

    List<String> timeList = ['15m', '1h', '1d', '1w', '1M'];

    List<DropdownMenuItem<String>> addDividersAfterItems() {
      final List<DropdownMenuItem<String>> menuItems = [];
      for (final String item in timeList) {
        menuItems.addAll(
          [
            DropdownMenuItem<String>(
              value: item,
              child: Center(
                child: Text(
                  item == timeList[0] ? '15 min' : item.toUpperCase(),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.65.sp,
                      ),
                ),
              ),
            ),
            //If it's last item, we will not add Divider after it.
            if (item != timeList.last)
              DropdownMenuItem<String>(
                enabled: false,
                child: Padding(
                  padding: EdgeInsets.only(left: 21.w, right: 19.w),
                  child: Divider(
                    height: 1.h,
                    color: AppColors.whiteColor.withOpacity(0.25),
                  ),
                ),
              ),
          ],
        );
      }
      return menuItems;
    }

    List<double> getCustomItemsHeights() {
      final List<double> itemsHeights = [];
      for (int i = 0; i < (timeList.length * 2) - 1; i++) {
        if (i.isEven) {
          itemsHeights.add(29..h);
        }
        //Dividers indexes will be the odd indexes
        if (i.isOdd) {
          itemsHeights.add(1.h);
        }
      }
      return itemsHeights;
    }

    bool isNegativeLastPrice =
        (market.marketDynamics!.lastPrice! - market.marketDynamics!.startPrice!)
            .isNegative;

    return Padding(
      padding: EdgeInsets.only(left: 14.w, right: 15.w),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                market.id.replaceAll('-', ' / '),
                maxLines: 1,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.75.sp,
                    ),
              ),
              const Spacer(),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isDense: true,
                  isExpanded: true,
                  value: chartTimeStateWatch,
                  iconStyleData: const IconStyleData(
                    iconSize: 0.1,
                  ),
                  alignment: Alignment.center,
                  dropdownStyleData: DropdownStyleData(
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: isLightTheme(context)
                          ? AppColors.borderSideColor
                          : walletBackgroundColor,
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(
                        color: AppColors.whiteColor.withOpacity(0.25),
                        width: 1,
                      ),
                    ),
                    offset: Offset(0, 30.h),
                  ),
                  buttonStyleData: ButtonStyleData(
                    width: 60.w,
                    height: 25..h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: AppColors.mainBackgroundDarkColor,
                    ),
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    customHeights: getCustomItemsHeights(),
                    padding: const EdgeInsets.all(0),
                  ),
                  items: addDividersAfterItems(),
                  onChanged: (value) {
                    chartTimeStateRead.state = value!;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5..h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Last price: '.hardcoded,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.5),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.65.sp,
                    ),
              ),
              Text(
                marketDynamicWatch.lastPrice!
                    .toStringAsFixed(market.trading_price_precision),
                maxLines: 1,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: isNegativeLastPrice
                          ? MainColorsApp.redColor
                          : MainColorsApp.greenColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.65.sp,
                    ),
              ),
              isNegativeLastPrice
                  ? Icon(
                      Icons.arrow_drop_down,
                      size: 14.w,
                      color: MainColorsApp.redColor,
                    )
                  : Icon(
                      Icons.arrow_drop_up,
                      size: 14.w,
                      color: MainColorsApp.greenColor,
                    )
            ],
          ),
        ],
      ),
    );
  }
}
