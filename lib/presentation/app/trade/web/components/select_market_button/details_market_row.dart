import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/open_market_list_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/presentation/app/trade/web/components/select_market_button/components/market_name.dart';
import 'package:user_app/presentation/app/trade/web/components/select_market_button/components/market_info/market_info_row.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';

class DetailsMarketRowWeb extends HookConsumerWidget {
  const DetailsMarketRowWeb({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openMarketListWatch = ref.watch(openMarketListProvider);
    final openMarketListRead = ref.read(openMarketListProvider.notifier);

    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    Widget switchMArketButton() {
      return InkWell(
        onTap: () {
          openMarketListRead.state = !openMarketListWatch;
        },
        child: Container(
          alignment: Alignment.center,
          width: 122.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Theme.of(context).primaryColorLight,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                openMarketListWatch ? arrowUpIcon : arrowDownIcon,
                colorFilter: const ColorFilter.mode(
                  AppColors.whiteColor,
                  BlendMode.srcIn,
                ),
                width: 10.w,
                height: 9.h,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                tr('trade.markets'),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 20.sp,
                      color: AppColors.whiteColorText,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -1.sp,
                    ),
              ),
            ],
          ),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!globalData.orderBookMiddle) ...[switchMArketButton()],
        const MarketNameWeb(),
        const MarketInfoRowWeb(),
        if (globalData.orderBookMiddle) ...[switchMArketButton()],
      ],
    );
  }
}
