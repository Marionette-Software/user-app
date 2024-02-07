import 'package:user_app/infrastructure/trade/trade_service.dart';

abstract class TradeActions {
  Future createMarketOrder({
    required String market,
    required String side,
    required String type,
    required double amount,
  });

  Future createLimitOrder({
    required String market,
    required String side,
    required String type,
    required double amount,
    required double price,
  });

  Future getUserOrder({
    required String id,
  });
  Future cancelOrder({
    required String id,
  });
}

class TradeActionsGeneral extends TradeActions {
  ITradeService service = TradeService();

  @override
  Future createMarketOrder({
    required String market,
    required String side,
    required String type,
    required double amount,
  }) async {
    return await service.createMarketOrder(
      market: market,
      side: side,
      type: type,
      amount: amount,
    );
  }

  @override
  Future createLimitOrder({
    required String market,
    required String side,
    required String type,
    required double amount,
    required double price,
  }) async {
    return await service.createLimitOrder(
      market: market,
      side: side,
      type: type,
      price: price,
      amount: amount,
    );
  }

  @override
  Future getUserOrder({
    required String id,
  }) async {
    return await service.getUserOrder(id);
  }

  @override
  Future cancelOrder({
    required String id,
  }) async {
    return await service.cancelOrder(id);
  }
}
