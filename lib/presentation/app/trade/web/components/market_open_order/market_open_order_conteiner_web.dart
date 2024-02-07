import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/user_orders/user_order_future_provider.dart';
import 'package:user_app/application/trade/user_orders/user_orders_subscriptions.dart';
import 'package:user_app/domain/trade/order_req.dart';
import 'package:user_app/presentation/app/trade/web/components/market_open_order/components/header_table_market_open_order.dart';
import 'package:user_app/presentation/app/trade/web/components/market_open_order/components/markets_open_orders_list.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MarketOpenOrderContainerWeb extends HookConsumerWidget {
  const MarketOpenOrderContainerWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketOrdersWatch = ref.watch(marketOrdersNotifierProvider);
    final refreshValue = useState(1);
    final stream = ref.watch(userOrdersStream);
    final activeMarketWatch = ref.watch(selectMarketsNotifierProvider);

    final getOrders = ref.watch(
      orderFutureProvider(
        OrderReqData(
          market: activeMarketWatch.id,
          status: 'open',
          refresh: '$refreshValue',
        ),
      ),
    );

    return Expanded(
      child: getOrders.when(
        data: (data) {
          stream.whenData(
            (value) {
              value.listen(
                (event) {
                  refreshValue.value++;
                },
              );
            },
          );
          return Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HeaderMarketOpenOrderWeb(),
                    marketOrdersWatch.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(top: 74.h),
                            child: Text(
                              'There are no open orders',
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
                        : const MarketOpenOrdersListWeb(),
                  ],
                ),
              ),
            ),
          );
        },
        error: (error, _) => UserAppError(
          errorMessage: error.toString(),
        ),
        loading: () => const MainLoader(),
      ),
    );
  }
}
