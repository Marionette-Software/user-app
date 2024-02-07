import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/save_chart_time_state_notifire.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/application/wallets/wallet_market_state_notifier_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class HeaderChart extends HookConsumerWidget {
  const HeaderChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartTimeStateRead = ref.read(chartTimeStateProvider.notifier);
    final chartTimeStateWatch = ref.watch(chartTimeStateProvider);
    final walletMarketWatch = ref.watch(walletMarketStateNotifierProvider);
    final walletState = ref.watch(walletDataStateNotifierProvider);

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
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.sp,
                      ),
                ),
              ),
            ),
            //If it's last item, we will not add Divider after it.
            if (item != timeList.last)
              DropdownMenuItem<String>(
                enabled: false,
                child: Padding(
                  padding: EdgeInsets.only(left: 14.w, right: 14.w),
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
          itemsHeights.add(32.h);
        }
        //Dividers indexes will be the odd indexes
        if (i.isOdd) {
          itemsHeights.add(1.h);
        }
      }
      return itemsHeights;
    }

    return Padding(
      padding: EdgeInsets.only(
        left: 25.w,
        right: 35.w,
      ),
      child: Row(
        children: [
          Text(
            walletMarketWatch.id!.replaceAll('-', '/'),
            maxLines: 1,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1.5.sp,
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
                width: 76.w,
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
                width: 76.w,
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: getWalletColor(
                    walletState.lightBgColor1,
                    walletState.darkBgColor1,
                    isLightTheme(context),
                  ),
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
    );
  }
}
