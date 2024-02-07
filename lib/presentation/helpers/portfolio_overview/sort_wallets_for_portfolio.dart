import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/domain/wallet/user_wallet.dart';

List<UserWallet> sortPortfolioWallets(
    List<UserWallet> wallets, List<UserBalance> balances) {
  List<UserWallet> walletsForPortfolio = [];

  wallets.forEach(
    ((element) {
      UserBalance balance = balances.firstWhere((e) => e.id == element.id);
      double? allBalance;
      if (balance.balance == null ||
          balance.advancedTradingBalance == null ||
          balance.advancedTradingLockedBalance == null ||
          balance.lockedBalance == null) {
        allBalance = null;
      } else {
        allBalance = (balance.balance! +
            balance.advancedTradingBalance! +
            balance.advancedTradingLockedBalance! +
            balance.lockedBalance!);
        if (allBalance > 0 && element.markets.isNotEmpty) {
          walletsForPortfolio.add(element);
        }
      }
    }),
  );

  return walletsForPortfolio;
}
