import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';

class PriceErrorMessage extends HookConsumerWidget {
  const PriceErrorMessage({
    super.key,
    required this.platformType,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketDataWatch = ref.watch(selectMarketsNotifierProvider);

    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${tr('trade.min')}: ${marketDataWatch.trading_min_price.toStringAsFixed(marketDataWatch.trading_price_precision)} - ${tr('trade.max')}: ${marketDataWatch.trading_max_price.toStringAsFixed(marketDataWatch.trading_price_precision)}',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: MainColorsApp.redColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.65.sp,
                    ),
              ),
            ],
          ),
        ),
        SvgPicture.asset(
          swapMinimumContainer,
          height: 47.h,
        ),
      ],
    );
  }
}
