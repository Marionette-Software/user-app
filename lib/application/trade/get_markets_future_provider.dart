import 'dart:convert';

import 'package:ferry/typed_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/market_dynamic_state_notifier_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/trade/market/get_market_req.dart';
import 'package:user_app/domain/trade/market_dynamic/market_dynamic.dart';
import 'package:user_app/domain/trade/market_trade.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_markets.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_markets.var.gql.dart';
import 'package:user_app/infrastructure/trade/trade_service.dart';

final getMarketsNotifierProvider =
    StateNotifierProvider<GetMarketsDataStateNotifier, List<MarketTrade>>(
  (ref) => GetMarketsDataStateNotifier(),
);

class GetMarketsDataStateNotifier extends StateNotifier<List<MarketTrade>> {
  GetMarketsDataStateNotifier()
      : super(
          [],
        );

  void updateMarketsData(List<MarketTrade> markets) {
    state = markets;
  }

  void setFavoriteMarket(String marketId, bool isFavorite) {
    int indexMarket = state.indexWhere((element) => element.id == marketId);

    state[indexMarket].isFavorite = isFavorite;

    state = List.from(state);
  }
}

final getMarketFutureProvider =
    FutureProvider.autoDispose.family<GlobalConfigData, GetMarketReqData>(
  (ref, getMarketReq) async {
    ITradeService service = TradeService();

    OperationResponse<GGetMarketsData, GGetMarketsVars> getMarketsResponse =
        await service.getMarkets();

    final jsonData = jsonEncode(getMarketsResponse.data!.markets!.toList());
    Iterable data = json.decode(jsonData);

    List<MarketTrade> markets = List<MarketTrade>.from(
      data.map(
        (model) => MarketTrade.fromJson(model),
      ),
    );

    final selectMarketRead = ref.read(selectMarketsNotifierProvider.notifier);

    List<MarketTrade> marketsForTrade = [];

    for (var p0 in markets) {
      if (p0.enable_trading &&
          (p0.base_currency.userBalanceEnable &&
              p0.quote_currency.userBalanceEnable)) {
        marketsForTrade.add(p0);
      }
    }
    marketsForTrade.sort(
      (a, b) => a.trading_position.compareTo(b.trading_position),
    );

    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;
    var userBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userBox.getAt(0)!;

    ref
        .read(getMarketsNotifierProvider.notifier)
        .updateMarketsData(marketsForTrade);

    if (userData.selectedMarketId == null) {
      MarketDynamic marketDynamic;
      if (marketsForTrade.first.marketDynamics != null) {
        marketDynamic = MarketDynamic(
          highPrice: marketsForTrade.first.marketDynamics!.highPrice,
          lowPrice: marketsForTrade.first.marketDynamics!.lowPrice,
          amount24h: marketsForTrade.first.marketDynamics!.amount24h,
        );
      } else {
        marketDynamic = MarketDynamic(
          highPrice: null,
          lowPrice: null,
          amount24h: null,
        );
      }

      ref
          .watch(marketDynamicStateNotifierProvider.notifier)
          .updateData(marketDynamic);

      selectMarketRead.selectMarketData(marketsForTrade.first);
    } else {
      var market = marketsForTrade.firstWhere(
        (element) => element.id == userData.selectedMarketId,
      );
      MarketDynamic marketDynamic;
      if (market.marketDynamics != null) {
        marketDynamic = MarketDynamic(
          highPrice: market.marketDynamics!.highPrice,
          lowPrice: market.marketDynamics!.lowPrice,
          amount24h: market.marketDynamics!.amount24h,
        );
      } else {
        marketDynamic = MarketDynamic(
          highPrice: null,
          lowPrice: null,
          amount24h: null,
        );
      }

      ref
          .watch(marketDynamicStateNotifierProvider.notifier)
          .updateData(marketDynamic);

      selectMarketRead.selectMarketData(market);
    }

    return globalData;
  },
);
