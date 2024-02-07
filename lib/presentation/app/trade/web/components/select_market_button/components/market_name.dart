import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/presentation/components/user_app_image.dart';

class MarketNameWeb extends HookConsumerWidget {
  const MarketNameWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectMarketWatch = ref.watch(selectMarketsNotifierProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserAppImage(
          path: selectMarketWatch.base_currency.icon_url,
          width: 35.w,
          height: 35.h,
          clipBehavior: Clip.hardEdge,
          isNetwork: true,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          '${selectMarketWatch.base_currency.id.toUpperCase()} / ${selectMarketWatch.quote_currency.id.toUpperCase()}',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
              letterSpacing: -0.75.sp),
        ),
        SizedBox(
          width: 5.w,
        ),
        UserAppImage(
          path: selectMarketWatch.quote_currency.icon_url,
          width: 35.w,
          height: 35.h,
          isNetwork: true,
          clipBehavior: Clip.hardEdge,
        ),
      ],
    );
  }
}
