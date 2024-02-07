import 'package:hooks_riverpod/hooks_riverpod.dart';

final feeWithdrawalNotifierProvider =
    StateNotifierProvider<FeeWithdrawalNotifierProvider, dynamic>(
  (ref) => FeeWithdrawalNotifierProvider(),
);

class FeeWithdrawalNotifierProvider extends StateNotifier<dynamic> {
  FeeWithdrawalNotifierProvider()
      : super({
          'fee': '0',
        });

  void updateFee(String fee) {
    state = {
      'fee': fee,
    };
  }
}
