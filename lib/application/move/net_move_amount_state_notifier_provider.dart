import 'package:hooks_riverpod/hooks_riverpod.dart';

final netMoveAmountNotifierProvider =
    StateNotifierProvider.autoDispose<NetMoveAmountNotifierProvider, dynamic>(
  (ref) => NetMoveAmountNotifierProvider(),
);

class NetMoveAmountNotifierProvider extends StateNotifier<dynamic> {
  NetMoveAmountNotifierProvider()
      : super({
          'amount': '0',
        });

  void updateNetAmount(String amount) {
    state = {
      'amount': amount,
    };
  }
}
