import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/presentation/app/trade/web/components/market_trading_history/components/market_public_trades_history.dart';

class MarketTradingHistoryContainerWeb extends HookConsumerWidget {
  const MarketTradingHistoryContainerWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 373.w,
      height: 580.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, bottom: 20.h, left: 15.w),
            child: Text(
              tr('trade.tradeHistory'),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 20.sp,
                    letterSpacing: -1.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, bottom: 10.w),
              child: const MarketPublicTradesHistoryWeb(),
            ),
          ),
        ],
      ),
    );
  }
}
