import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/trade_history/trade_history_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_private_trades_subscription.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_private_trades_subscription.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_private_trades_subscription.var.gql.dart';
import 'package:user_app/presentation/app/trade/mobile/components/market_trading_history/components/header_market_history_trade.dart';
import 'package:user_app/presentation/app/trade/mobile/components/market_trading_history/components/my_trade_history_item.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/domain/trade/trade_history/trade_history_item.dart'
    as TradeHistoryItemDTO;
import 'package:user_app/presentation/helpers/theme.dart';

class MarketMyTradesHistoryMobile extends HookConsumerWidget {
  const MarketMyTradesHistoryMobile({
    required this.scrollController,
    super.key,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectMarketWatch = ref.watch(selectMarketsNotifierProvider);
    final getUserTradesHistory = ref.watch(
      getUserTradesHistoryFutureProvider(
        selectMarketWatch.id,
      ),
    );
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    var uBox = Hive.box<UserConfigData>(Constants.userConfig);

    GlobalConfigData globalData = box.getAt(0)!;
    UserConfigData userData = uBox.getAt(0)!;

    return getUserTradesHistory.when(
      data: (data) {
        var userHistoryTrades = data;

        return Operation(
          operationRequest: GGetPrivateTradesReq(
            (b) => b
              ..vars.market = selectMarketWatch.id
              ..vars.token = userData.token,
          ),
          client: subscriptionClient(globalData.url),
          builder: (
            BuildContext context,
            OperationResponse<GGetPrivateTradesData, GGetPrivateTradesVars>?
                response,
            Object? error,
          ) {
            if (response!.data != null &&
                response.data!.privateTrades != null &&
                response.data!.privateTrades!.amount != null &&
                response.data!.privateTrades!.price != null &&
                response.data!.privateTrades!.createdAt != null) {
              DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                int.tryParse(response.data!.privateTrades!.createdAt!)!,
                isUtc: true,
              );

              String formattedDateItem =
                  dateTime.toUtc().toIso8601String().substring(0, 23);

              TradeHistoryItemDTO.TradeHistoryItem item =
                  TradeHistoryItemDTO.TradeHistoryItem(
                price: response.data!.privateTrades!.price!,
                amount: response.data!.privateTrades!.amount!,
                date: formattedDateItem,
                side: response.data!.privateTrades!.side!,
              );
              userHistoryTrades = [item, ...userHistoryTrades];
            }
            return userHistoryTrades.isEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 36..h),
                    child: Text(
                      'No order history',
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
                      bottom: 10..h,
                    ),
                    child: Column(
                      children: [
                        const HeaderMarketHistoryMobile(),
                        ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 6..h,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: userHistoryTrades.length,
                          itemBuilder: (context, i) {
                            return MyTradeItemMobile(
                              item: userHistoryTrades[i],
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
