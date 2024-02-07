import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/trade_history/trade_history_future_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/presentation/app/trade/mobile/components/market_trading_history/components/header_market_history_trade.dart';
import 'package:user_app/presentation/app/trade/mobile/components/market_trading_history/components/public_trade_history_item.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_subscription.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_subscription.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_subscription.var.gql.dart';
import 'package:user_app/domain/trade/trade_history/trade_history_item.dart'
    as TradeHistoryItemDTO;

class MarketPublicTradesHistoryMobile extends HookConsumerWidget {
  const MarketPublicTradesHistoryMobile({
    required this.scrollController,
    super.key,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeMarketWatch = ref.watch(selectMarketsNotifierProvider);
    final refreshValue = useState(1);

    final getPublicTradesHistory = ref.watch(
      getPublicTradesHistoryFutureProvider(RefreshRequestPublicTradeHistory(
        marketId: activeMarketWatch.id,
        refresh: '$refreshValue'
      )),
    );
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    return getPublicTradesHistory.when(
      data: (data) {
        var publicHistoryTrades = data;

        return Operation(
          client: subscriptionClient(globalData.url),
          operationRequest: GPublicTradesSubscriptionReq(
            (b) => b..vars.market = activeMarketWatch.id,
          ),
          builder: (
            BuildContext context,
            OperationResponse<GPublicTradesSubscriptionData,
                    GPublicTradesSubscriptionVars>?
                response,
            Object? error,
          ) {
            if (response!.data != null &&
                response.data!.publicTrades != null &&
                response.data!.publicTrades!.amount != null &&
                response.data!.publicTrades!.price != null &&
                response.data!.publicTrades!.createdAt != null) {
              DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                  int.tryParse(response.data!.publicTrades!.createdAt!)!,
                  isUtc: true);

              String formattedDateItem =
                  dateTime.toUtc().toIso8601String().substring(0, 23);

              TradeHistoryItemDTO.TradeHistoryItem item =
                  TradeHistoryItemDTO.TradeHistoryItem(
                price: response.data!.publicTrades!.price!,
                amount: response.data!.publicTrades!.amount!,
                date: formattedDateItem,
                side: response.data!.publicTrades!.makerOrderSide!,
              );
              publicHistoryTrades = [item, ...publicHistoryTrades];
            }
            return publicHistoryTrades.isEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 36..h),
                    child: Text(
                      'No recent trades'.hardcoded,
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
                : Padding(
                    padding: EdgeInsets.only(
                      left: 25.w,
                      right: 25.w,
                      top: 12..h,
                      bottom: 10..h
                    ),
                    child: Column(
                      children: [
                        const HeaderMarketHistoryMobile(),
                        ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 11.h,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: publicHistoryTrades.length,
                          itemBuilder: (context, i) {
                            var item = publicHistoryTrades[i];
                            return PublicTradeHistoryItemMobile(
                              item: item,
                            );
                          },
                        )
                      ],
                    ),
                  );
          },
        );
      },
      error: (error, _) => UserAppError(errorMessage: error.toString()),
      loading: () => Padding(
        padding: EdgeInsets.only(top: 30..h),
        child: const MainLoaderMobile(
          loaderSize: 100,
        ),
      ),
    );
  }
}
