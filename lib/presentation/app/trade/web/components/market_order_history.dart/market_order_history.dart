import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/user_orders/user_order_future_provider.dart';
import 'package:user_app/domain/trade/order_req.dart';
import 'package:user_app/presentation/app/trade/web/components/market_order_history.dart/components/header_market_order_history.dart';
import 'package:user_app/presentation/app/trade/web/components/market_order_history.dart/components/market_order_history_item.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MarketOrderHistoryWeb extends HookConsumerWidget {
  const MarketOrderHistoryWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectMarketWatch = ref.watch(selectMarketsNotifierProvider);
    final refreshValue = useState(1);

    final marketOrdersHistory = ref.watch(
      orderFutureProvider(
        OrderReqData(
          market: selectMarketWatch.id,
          status: 'closed|canceled',
          refresh: '$refreshValue',
        ),
      ),
    );

    ScrollController controllerScroll = ScrollController();

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: marketOrdersHistory.when(
          data: (data) {
            var marketOrdersHistory = data;

            return Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HeaderMarketOrderHistoryWeb(),
                    marketOrdersHistory.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(top: 74.h),
                            child: Text(
                              'No order history',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -1.sp,
                                    color: isLightTheme(context)
                                        ? AppColors.aboutHeaderLight
                                        : AppColors.whiteColor.withOpacity(0.5),
                                  ),
                            ),
                          )
                        : ListView.separated(
                            controller: controllerScroll,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                            itemCount: marketOrdersHistory.length,
                            itemBuilder: (context, i) {
                              return MarketOrderHistoryItemWeb(
                                item: marketOrdersHistory[i],
                              );
                            },
                          )
                  ],
                ),
              ),
            );
          },
          error: (error, _) => UserAppError(
            errorMessage: error.toString(),
          ),
          loading: () => const MainLoader(),
        ),
      ),
    );
  }
}
