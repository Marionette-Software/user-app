import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/get_market_history_kline_futer_provider.dart';
import 'package:user_app/application/wallets/wallet_market_dynamics_state_notifier_provider.dart';
import 'package:user_app/domain/trade/chart_request.dart';
import 'package:user_app/domain/trade/market_trade.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_dynamics_query.data.gql.dart';
import 'package:user_app/presentation/app/trade/mobile/components/trade_chart/components/header_trade_chart.dart';
import 'package:user_app/presentation/app/trade/mobile/components/trade_chart/components/market_dynamics_trade.dart';
import 'package:user_app/presentation/app/trade/mobile/components/trade_chart/components/trade_chart.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:hive/hive.dart';
import 'package:user_app/application/trade/market_dynamic_state_notifier_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/trade/market_dynamic/market_dynamic.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/trade/graphql/market_dynamics/__generated__/market_dynamics_subscription.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/market_dynamics/__generated__/market_dynamics_subscription.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/market_dynamics/__generated__/market_dynamics_subscription.var.gql.dart';

class ContainerTradeChartMobile extends HookConsumerWidget {
  const ContainerTradeChartMobile({
    super.key,
    this.item,
    this.marketDynamics,
  });

  final GGetMarketDynamicsData_marketDynamics? marketDynamics;
  final MarketTrade? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshValue = useState(1);

    final marketHistoryKlineFuture = ref.watch(
      getMarketHistoryKlineFutureProvider(
        ChartRequest(
          refresh: '$refreshValue',
          marketId: item!.id,
        ),
      ),
    );

    final walletMarketDynamicsWatch =
        ref.watch(walletMarketDynamicsStateNotifierProvider);
    final marketDynamicRead =
        ref.read(marketDynamicStateNotifierProvider.notifier);

    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    return walletMarketDynamicsWatch.amount24h != null
        ? SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(top: 15..h, bottom: 15..h),
              child: marketHistoryKlineFuture.when(
                data: (data) {
                  var walletHistoryKline = data.data!.kline!.toList();

                  return Operation(
                    client: subscriptionClient(globalData.url),
                    operationRequest: GMarketDynamicsReq(
                      (b) => b..vars.market = item!.id,
                    ),
                    builder: (
                      BuildContext context,
                      OperationResponse<GMarketDynamicsData,
                              GMarketDynamicsVars>?
                          response,
                      Object? error,
                    ) {
                      if (response!.data != null &&
                          response.data!.marketDynamics != null &&
                          response.data!.marketDynamics!.amount24h != null &&
                          response.data!.marketDynamics!.highPrice != null &&
                          response.data!.marketDynamics!.lowPrice != null) {
                        Future.delayed(Duration.zero, () {
                          marketDynamicRead.updateData(
                            MarketDynamic(
                              highPrice:
                                  response.data!.marketDynamics!.highPrice!,
                              lowPrice:
                                  response.data!.marketDynamics!.lowPrice!,
                              amount24h:
                                  response.data!.marketDynamics!.amount24h!,
                              marketId:
                                  response.data!.marketDynamics!.marketId!,
                              startPrice:
                                  response.data!.marketDynamics!.startPrice!,
                              lastPrice:
                                  response.data!.marketDynamics!.lastPrice!,
                            ),
                          );
                        });
                      } else {
                        Future.delayed(Duration.zero, () {
                          marketDynamicRead.updateData(
                            MarketDynamic(
                              highPrice: item!.marketDynamics!.highPrice!,
                              lowPrice: item!.marketDynamics!.lowPrice!,
                              amount24h: item!.marketDynamics!.amount24h!,
                              marketId: '',
                              startPrice: item!.marketDynamics!.startPrice!,
                              lastPrice: item!.marketDynamics!.lastPrice!,
                            ),
                          );
                        });
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeaderTradeChartMobile(
                            market: item!,
                          ),
                          SizedBox(height: 11..h),
                          TradeChartMobile(
                            market: item!,
                            walletHistoryKline: walletHistoryKline,
                          ),
                          SizedBox(height: 14..h),
                          TradeMarketDynamicsMobile(
                            market: item!,
                          ),
                        ],
                      );
                    },
                  );
                },
                loading: () => SizedBox(
                  height: 250..h,
                  child: const MainLoaderMobile(
                    loaderSize: 100,
                  ),
                ),
                error: (error, _) => () {
                  return UserAppError(
                    errorMessage: error.toString(),
                  );
                }(),
              ),
            ),
          )
        : const SizedBox();
  }
}
