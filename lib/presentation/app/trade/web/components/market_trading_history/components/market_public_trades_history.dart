import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/application/trade/trade_history/trade_history_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_subscription.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_subscription.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_subscription.var.gql.dart';
import 'package:user_app/presentation/app/trade/web/components/market_trading_history/components/empty_market_trade_history.dart';
import 'package:user_app/presentation/app/trade/web/components/market_trading_history/components/header_market_history_trade.dart';
import 'package:user_app/presentation/app/trade/web/components/market_trading_history/components/market_trade_history_item.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/domain/trade/trade_history/trade_history_item.dart'
    as TradeHistoryItemDTO;

class MarketPublicTradesHistoryWeb extends HookConsumerWidget {
  const MarketPublicTradesHistoryWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    final activeMarketWatch = ref.watch(selectMarketsNotifierProvider);
    final refreshValue = useState(1);

    final getPublicTradesHistory = ref.watch(
      getPublicTradesHistoryFutureProvider(
        RefreshRequestPublicTradeHistory(
          marketId: activeMarketWatch.id,
          refresh: '$refreshValue',
        ),
      ),
    );

    return getPublicTradesHistory.when(
      data: (data) {
        var publicHistoryTrades = data;

        return Center(
          child: Column(
            children: [
              const HeaderMarketHistoryTradeWeb(),
              SizedBox(
                height: 11.h,
              ),
              Expanded(
                child: Scrollbar(
                  child: Operation(
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
                            int.tryParse(
                                response.data!.publicTrades!.createdAt!)!,
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
                      return SingleChildScrollView(
                        child: publicHistoryTrades.isEmpty
                            ? const EmptyMarketTradeHistoryWeb()
                            : ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 11.h,
                                ),
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: publicHistoryTrades.length,
                                itemBuilder: (context, i) {
                                  var item = publicHistoryTrades[i];
                                  return MarketTradeHistoryItem(
                                    price: item.price,
                                    amount: item.amount,
                                    createdAt: item.date,
                                    side: item.side,
                                  );
                                },
                              ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (error, _) => UserAppError(
        errorMessage: error.toString(),
      ),
      loading: () => const MainLoader(),
    );
  }
}
