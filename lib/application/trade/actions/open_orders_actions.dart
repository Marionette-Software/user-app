import 'package:user_app/infrastructure/trade/trade_service.dart';

abstract class OpenOrdersInterface {
  Future<dynamic> cancelOrder({
    required String id,
  });
}

class OpenOrdersGeneral extends OpenOrdersInterface {
  @override
  Future<dynamic> cancelOrder({required String id}) async {
    ITradeService service = TradeService();
    var res = await service.cancelOrder(id);
    return res;
  }
}
