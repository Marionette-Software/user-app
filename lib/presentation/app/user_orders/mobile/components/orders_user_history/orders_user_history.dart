import 'package:ferry/typed_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_app/domain/trade/market/market_item.dart';
import 'package:user_app/domain/trade/user_orders/user_order.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_orders.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_orders.var.gql.dart';
import 'package:user_app/infrastructure/trade/trade_service.dart';
import 'package:user_app/presentation/app/history/web/components/history_list_container.dart';
import 'package:user_app/presentation/app/user_orders/mobile/components/orders_user_history/components/order_user_history_item.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class UserOrdersHistoryMobile extends HookConsumerWidget {
  const UserOrdersHistoryMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<PagingController<int, UserOrderItem?>> pagingController =
        useState(
      PagingController(firstPageKey: 1),
    );

    useEffect(() {
      pagingController.value.addPageRequestListener((pageKey) {
        _fetchPage(
          ref: ref,
          pageKey: pageKey,
          pagingController: pagingController,
        );
      });

      return () {
        pagingController.dispose();
      };
    }, []);

    return PagedListView<int, UserOrderItem?>(
      pagingController: pagingController.value,
      shrinkWrap: true,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) {
          return OrderUserHistoryItemMobile(item: item!);
        },
        firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
          error: pagingController.value.error,
          onTryAgain: () => pagingController.value.refresh(),
        ),
        newPageErrorIndicatorBuilder: (context) => ErrorIndicator(
          error: pagingController.value.error,
          onTryAgain: () => pagingController.value.refresh(),
        ),
        noItemsFoundIndicatorBuilder: (context) => Padding(
          padding: EdgeInsets.only(top: 36..h),
          child: Column(
            children: [
              SvgPicture.asset(
                emptyIcon,
                width: 36.w,
                height: 50..h,
                colorFilter: ColorFilter.mode(
                  isLightTheme(context)
                      ? AppColors.aboutHeaderLight
                      : AppColors.whiteColor.withOpacity(0.25),
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(
                height: 24..h,
              ),
              Text(
                'Buy or sell to display your trade history here',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 15.sp,
                      color: isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.75.sp,
                    ),
              ),
            ],
          ),
        ),
        firstPageProgressIndicatorBuilder: (context) => const MainLoader(),
        newPageProgressIndicatorBuilder: (context) => SizedBox(
          width: 300.w,
          height: 200.h,
          child: const MainLoader(),
        ),
      ),
    );
  }

  Future<void> _fetchPage({
    required int pageKey,
    required ValueNotifier<PagingController<int, UserOrderItem?>>
        pagingController,
    required WidgetRef ref,
  }) async {
    try {
      ITradeService service = TradeService();

      OperationResponse<GGetUseOrdersData, GGetUseOrdersVars>
          userOrderResponse = await service.getUserOrders(
        market: '',
        status: 'closed|canceled',
        page: pageKey,
        limit: 15,
      );

      List<UserOrderItem> userOrders = [];

      for (int i = 0;
          i < userOrderResponse.data!.userOrders!.result!.length;
          i++) {
        var marketItem = MarketItem(
            id: userOrderResponse.data!.userOrders!.result![i]!.Market!.id ??
                '',
            tradingPricePrecision: userOrderResponse.data!.userOrders!
                    .result![i]!.Market!.trading_price_precision ??
                0,
            tradingAmountPrecision: userOrderResponse.data!.userOrders!
                    .result![i]!.Market!.trading_amount_precision ??
                0,
            quoteCurrencyPrecision: userOrderResponse.data!.userOrders!
                .result![i]!.Market!.quote_currency!.precision);
        var item = UserOrderItem(
          id: userOrderResponse.data!.userOrders!.result![i]!.id ?? '',
          date: userOrderResponse.data!.userOrders!.result![i]!.createdAt ?? '',
          market: userOrderResponse.data!.userOrders!.result![i]!.market ?? '',
          side: userOrderResponse.data!.userOrders!.result![i]!.side ?? '',
          type: userOrderResponse.data!.userOrders!.result![i]!.type ?? '',
          price: userOrderResponse.data!.userOrders!.result![i]!.price ?? 0.0,
          amount: userOrderResponse.data!.userOrders!.result![i]!.amount ?? 0.0,
          total:
              userOrderResponse.data!.userOrders!.result![i]!.executedAmount ??
                  0.0,
          executed:
              userOrderResponse.data!.userOrders!.result![i]!.executedVolume ??
                  0.0,
          status: userOrderResponse.data!.userOrders!.result![i]!.status ?? '',
          marketItem: marketItem,
        );
        userOrders.add(item);
      }

      final isLastPage = userOrders.length < 15;
      if (isLastPage) {
        pagingController.value.appendLastPage(userOrders);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.value.appendPage(userOrders, nextPageKey);
      }
    } catch (error) {
      pagingController.value.error = error;
    }
  }
}
