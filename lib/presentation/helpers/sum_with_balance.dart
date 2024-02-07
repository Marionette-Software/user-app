import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/domain/wallet/user_wallet.dart';
import 'package:intl/intl.dart' as intl;
import 'formatters/number_format_with_precision.dart';

String getCoinSum({
  required UserWallet wallet,
  required bool withAbbreviateSum,
  required UserBalance userBalance,
}) {
  if (userBalance.balance == null ||
      userBalance.advancedTradingBalance == null ||
      userBalance.advancedTradingLockedBalance == null ||
      userBalance.lockedBalance == null) {
    return 'N/A';
  }

  final double balance = userBalance.advancedTradingBalance! +
      userBalance.balance! +
      userBalance.advancedTradingLockedBalance! +
      userBalance.lockedBalance!;

  return withAbbreviateSum
      ? abbreviateNumber(number: balance, precision: wallet.precision)
      : numberFormatWithPrecision(wallet.precision).format(balance);
}

String getUsdSumForWallet({
  required UserWallet wallet,
  required bool withAbbreviateSum,
  required UserBalance userBalance,
}) {
  final formatter = intl.NumberFormat('#,###,##0.00');

  if (userBalance.balance == null ||
      userBalance.advancedTradingBalance == null ||
      userBalance.advancedTradingLockedBalance == null ||
      userBalance.lockedBalance == null) {
    return 'N/A';
  }

  final double balance = userBalance.advancedTradingBalance! +
      userBalance.balance! +
      userBalance.advancedTradingLockedBalance! +
      userBalance.lockedBalance!;

  if (wallet.id.toLowerCase() == 'usdt') {
    return '≈ \$${withAbbreviateSum ? abbreviateNumber(number: balance, precision: 2) : formatter.format(balance)}';
  }

  if (wallet.markets.isEmpty) {
    return 'N/A';
  }

  for (var market in wallet.markets) {
    final quoteCurrency = market.quote_currency.id.toLowerCase();
    final baseCurrency = market.base_currency.id.toLowerCase();
    double usdSum;

    if (quoteCurrency == 'usdt') {
      usdSum = market.rate * balance;
      return '≈ \$${withAbbreviateSum ? abbreviateNumber(number: usdSum, precision: 2) : formatter.format(usdSum)}';
    } else if (baseCurrency == 'usdt') {
      usdSum = userBalance.balance! / market.rate;
      return '≈ \$${withAbbreviateSum ? abbreviateNumber(number: usdSum, precision: 2) : formatter.format(usdSum)}';
    }
  }

  return 'N/A';
}

convertBalanceToUsdt(
    List<UserWallet> wallets, int i, List<UserBalance> balances) {
  double sumBalanceToUsdt = 0;
  if (wallets[i].id.toLowerCase() != 'usdt') {
    if (wallets[i].markets.isNotEmpty) {
      for (var element in wallets[i].markets) {
        UserBalance balance = balances.firstWhere((e) => e.id == wallets[i].id);
        if (element.quote_currency.id.toLowerCase() == 'usdt') {
          sumBalanceToUsdt = element.rate *
              (balance.balance! +
                  balance.advancedTradingBalance! +
                  balance.advancedTradingLockedBalance! +
                  balance.lockedBalance!);
        } else if (element.base_currency.id.toLowerCase() == 'usdt') {
          if (element.rate != 0) {
            sumBalanceToUsdt = (balance.balance! +
                    balance.advancedTradingBalance! +
                    balance.advancedTradingLockedBalance! +
                    balance.lockedBalance!) /
                element.rate;
          } else {
            sumBalanceToUsdt = 0;
          }
        }
      }
    }
  } else {
    final balance = balances.firstWhere((e) => e.id.toLowerCase() == 'usdt');

    sumBalanceToUsdt = (balance.balance! +
        balance.advancedTradingBalance! +
        balance.advancedTradingLockedBalance! +
        balance.lockedBalance!);
  }

  return sumBalanceToUsdt;
}
