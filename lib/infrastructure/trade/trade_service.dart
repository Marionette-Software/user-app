import 'package:ferry/typed_links.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/cancel_all_orders.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/cancel_order.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/create_order.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_market.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_markets.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/get_user_order.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/market_dynamics_query.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/set_favorite_market.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_orders.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/user_trades_history.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/__generated__/wallets_data.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/history/__generated__/public_trades_history.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/orderbook/__generated__/public_orderbook.req.gql.dart';
import 'package:user_app/presentation/helpers/set_error_code.dart';

abstract class ITradeService {
  Future<dynamic> createLimitOrder({
    required String market,
    required String side,
    required String type,
    required double price,
    required double amount,
  });

  Future<dynamic> createMarketOrder({
    required String market,
    required String side,
    required String type,
    required double amount,
  });

  Future<dynamic> cancelOrder(String id);

  Future<dynamic> cancelAllOrder(String market);

  Future<dynamic> getUserOrders({
    required String market,
    required String status,
    required int page,
    required int limit,
  });

  Future<dynamic> getMarkets();

  Future<dynamic> getUserTradesHistory(String market);

  Future<dynamic> getPublicTradesHistory(String market);

  Future<dynamic> getPrivateTradesHistory(String market);

  Future<dynamic> getPublicOrderBook(String market);

  Future<dynamic> getMarketDynamics(String market);

  Future<dynamic> getMarket(String id);

  Future<dynamic> getUserWallets();

  Future<dynamic> getUserOrder(String id);

  Future<dynamic> setFavoriteMarket(String marketId);
}

class TradeService extends ITradeService {
  @override
  Future<dynamic> createLimitOrder({
    required String market,
    required String side,
    required String type,
    required double price,
    required double amount,
  }) async {
    final response = await initClientWithHeader()
        .request(
          GCreateOrderReq(
            (b) => b
              ..vars.market = market
              ..vars.side = side
              ..vars.type = type
              ..vars.price = price
              ..vars.amount = amount,
          ),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.openOrder;
    }
  }

  @override
  Future<dynamic> createMarketOrder({
    required String market,
    required String side,
    required String type,
    required double amount,
  }) async {
    final response = await initClientWithHeader()
        .request(
          GCreateOrderReq(
            (b) => b
              ..vars.market = market
              ..vars.side = side
              ..vars.type = type
              ..vars.amount = amount,
          ),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.openOrder;
    }
  }

  @override
  Future<dynamic> cancelOrder(
    String id,
  ) async {
    final response = await initClientWithHeader()
        .request(
          GCancelOrderActionReq(
            (b) => b..vars.id = id,
          ),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return true;
    }
  }

  @override
  Future<dynamic> cancelAllOrder(
    String market,
  ) async {
    final response = await initClientWithHeader()
        .request(
          GCancelAllOrdersReq(
            (b) => b..vars.market = market,
          ),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return true;
    }
  }

  @override
  Future<dynamic> getUserOrders({
    required String market,
    required String status,
    required int page,
    required int limit,
  }) async {
    final response = await initClientWithHeader()
        .request(
          GGetUseOrdersReq(
            (b) => b
              ..vars.market = market
              ..vars.status = status
              ..vars.page = page
              ..vars.limit = limit,
          ),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> getMarkets() async {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    var uBox = Hive.box<UserConfigData>(Constants.userConfig);

    GlobalConfigData globalData = box.getAt(0)!;
    UserConfigData? userData = uBox.getAt(0);

    final response = userData!.token == null
        ? await initClient(globalData.url)
            .request(
              GGetMarketsReq(),
            )
            .first
        : await initClientWithHeader()
            .request(
              GGetMarketsReq(),
            )
            .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> getPublicTradesHistory(String market) async {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    final response = await initClient(globalData.url)
        .request(GGetPublicTradesHistoryReq((b) => b..vars.market = market))
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> getUserTradesHistory(String market) async {
    final response = await initClientWithHeader()
        .request(
          GGetUserTradesHistoryReq((b) => b..vars.market = market),
        )
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> getPublicOrderBook(String market) async {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    final response = await initClient(globalData.url)
        .request(
          GPublicOrderBookReq((b) => b..vars.market = market),
        )
        .first;
    if (response.hasErrors) {
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> getMarketDynamics(String market) async {
    final response = await initClientWithHeader()
        .request(
          GGetMarketDynamicsReq((b) => b..vars.market = market),
        )
        .first;
    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> getMarket(String id) async {
    final response = await initClientWithHeader()
        .request(
          GGetMarketReq((b) => b..vars.id = id),
        )
        .first;
    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> getUserWallets() async {
    var userBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userBox.getAt(0)!;

    final response = await initClientWithHeader()
        .request(GTradeWalletsDataReq((b) => b..vars.id = userData.userId))
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> getUserOrder(String id) async {
    final response = await initClientWithHeader()
        .request(
          GGetUserOrderReq(
            (b) => b..vars.id = id,
          ),
        )
        .first;

    if (response.hasErrors) {
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response.data!.userOrder!;
    }
  }

  @override
  Future getPrivateTradesHistory(String market) async {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    final response = await initClient(globalData.url)
        .request(GGetUserTradesHistoryReq((b) => b..vars.market = market))
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }

  @override
  Future setFavoriteMarket(String marketId) async {
    final response = await initClientWithHeader()
        .request(GsetFavoriteMarketReq((b) => b..vars.marketId = marketId))
        .first;

    if (response.hasErrors) {
      setErrorCode(response.graphqlErrors![0].message);
      return GraphQlError(message: response.graphqlErrors![0].message);
    } else {
      return response;
    }
  }
}
