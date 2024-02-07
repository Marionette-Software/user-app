import 'package:user_app/domain/wallet/market.dart';

double createOrderConvert({
  required Market market,
  required String currencyFrom,
  required String currencyTo,
  required double amount,
}) {
  if (market.commission_currency == 'quote') {
    /// Commission in quote currency
    if (market.base_currency.id == currencyFrom) {
      /// Sell currency. Amount in base currency
      var amountTo = amount * market.marketDynamics!.lastPrice!;

      amountTo = amountTo;
      return amountTo;
    } else {
      var amountTo = amount / market.marketDynamics!.lastPrice!;
      return amountTo;
    }
  } else {
    /// Commission in base currency
    if (market.base_currency.id == currencyFrom) {
      var amountTo = amount * market.marketDynamics!.lastPrice!;
      return amountTo;
    } else {
      /// Buy currency. Amount in quote
      var amountToWithCommission = amount / market.marketDynamics!.lastPrice!;

      return amountToWithCommission;
    }
  }
}
