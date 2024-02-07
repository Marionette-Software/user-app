import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/user_orders/user_order_future_provider.dart';
import 'package:user_app/application/trade/user_orders/user_orders_subscriptions.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/trade/order_req.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/presentation/app/trade/mobile/components/market_open_order/components/cancel_all.dart';
import 'package:user_app/presentation/app/trade/mobile/components/market_open_order/components/market_orders_list.dart';
import 'package:user_app/presentation/app/user_orders/mobile/user_orders_mobile.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/components/main_show_modal_bottom_sheet.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MarketOpenOrderMobile extends HookConsumerWidget {
  const MarketOpenOrderMobile({
    required this.scrollController,
    super.key,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketOrdersWatch = ref.watch(marketOrdersNotifierProvider);
    final refreshValue = useState(1);
    final stream = ref.watch(userOrdersStream);
    final activeMarketWatch = ref.watch(selectMarketsNotifierProvider);
    var userConfigBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userConfigBox.getAt(0)!;

    final getOrders = ref.watch(
      orderFutureProvider(
        OrderReqData(
          market: activeMarketWatch.id,
          status: 'open',
          refresh: '${refreshValue.value}',
        ),
      ),
    );

    return getOrders.when(
      data: (data) {
        stream.whenData((value) {
          value.listen((event) {
            refreshValue.value++;
          });
        });
        return marketOrdersWatch.isEmpty
            ? Padding(
                padding: EdgeInsets.only(top: 36..h),
                child: Text(
                  'Open limit buy/sell order to display it here',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15.sp,
                        color: isLightTheme(context)
                            ? AppColors.aboutHeaderLight
                            : AppColors.whiteColor.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              )
            : Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 15..h, top: 15..h),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isLightTheme(context)
                              ? AppColors.mainBackgroundLightColor
                              : AppColors.whiteColor.withOpacity(0.05),
                          width: 2..h,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 15.w,
                        right: 15.w,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) =>
                                      const UserProfileOrdersMobile(),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(19.r),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Show for all markets'.hardcoded,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.75.sp,
                                      color: MainColorsApp.accentColor,
                                    ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          userData.token != null
                              ? marketOrdersWatch.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        mainShowModalBottomSheet(
                                          context: context,
                                          longShowModalBottom: false,
                                          content: Container(
                                            color: Colors.transparent,
                                            child: const CancelAllOrderWithMarketMobile(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 87.w,
                                        height: 25..h,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                          borderRadius:
                                              BorderRadius.circular(19.r),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              tr('trade.cancel_all'),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge!
                                                  .copyWith(
                                                    fontSize: 13.sp,
                                                    letterSpacing: -0.66.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors
                                                        .whiteColorText,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox()
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  MarketOrdersListMobile(scrollController: scrollController),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              );
      },
      error: (error, _) => UserAppError(
        errorMessage: error.toString(),
      ),
      loading: () => Padding(
        padding: EdgeInsets.only(top: 30..h),
        child: const MainLoaderMobile(
          loaderSize: 100,
        ),
      ),
    );
  }
}
