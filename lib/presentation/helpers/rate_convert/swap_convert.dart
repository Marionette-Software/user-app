import 'package:user_app/domain/wallet/market.dart';

double swapConvert({
  required Market market,
  required String currencyFrom,
  required String currencyTo,
  required double amount,
}) {
  if (market.commission_currency == 'quote') {
    /// Commission in quote currency
    if (market.base_currency.id == currencyFrom) {
      /// Sell currency. Amount in base currency
      var amountTo = amount * market.rate;
      var commission = amountTo * (market.sell_commission / 100);
      if (commission < market.sell_min_commission) {
        commission = market.sell_min_commission;
      }
      if (commission > market.sell_max_commission) {
        commission = market.sell_max_commission;
      }
      amountTo = amountTo - commission;
      return amountTo;
    } else {
      /// Buy currency. Amount in quote
      var commission = market.buy_commission / 100 * amount;
      if (commission < market.buy_min_commission) {
        commission = market.buy_min_commission;
      }
      if (commission > market.buy_max_commission) {
        commission = market.buy_max_commission;
      }
      var amountTo = (amount - commission) / market.rate;
      return amountTo;
    }
  } else {
    /// Commission in base currency
    if (market.base_currency.id == currencyFrom) {
      /// Sell currency. Amount in base currency
      var commission = amount * market.sell_commission/ 100;
      if (commission < market.sell_min_commission) {
        commission = market.sell_min_commission;
      }
      if (commission > market.sell_max_commission) {
        commission = market.sell_max_commission;
      }
      var amountFromMinusCommission = amount - commission;
      var amountTo = amountFromMinusCommission * market.rate;
      return amountTo;
    } else {
      /// Buy currency. Amount in quote
      var amountToWithCommission = amount / market.rate;

      var commission = amountToWithCommission * market.buy_commission/ 100;
      if (commission < market.buy_min_commission) {
        commission = market.buy_min_commission;
      }
      if (commission > market.buy_max_commission) {
        commission = market.buy_max_commission;
      }

      return amountToWithCommission - commission;
    }
  }
}
