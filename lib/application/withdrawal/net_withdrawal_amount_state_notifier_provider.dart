import 'package:hooks_riverpod/hooks_riverpod.dart';

final netWithdrawalAmountNotifierProvider = StateNotifierProvider.autoDispose<
    NetWithdrawalAmountNotifierProvider, dynamic>(
  (ref) => NetWithdrawalAmountNotifierProvider(),
);

class NetWithdrawalAmountNotifierProvider extends StateNotifier<dynamic> {
  NetWithdrawalAmountNotifierProvider()
      : super({
          'amount': '0',
        });

  void updateNetAmount(String amount) {
    state = {
      'amount': amount,
    };
  }
}
