import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/exchange/non_custodial_exchange_rate.dart';

final nonCustodialRateStateNotifierProvider = StateNotifierProvider.autoDispose<
    NonCustodialRateStateNotifier, NonCustodialExchangeRate>(
  (ref) => NonCustodialRateStateNotifier(),
);

class NonCustodialRateStateNotifier
    extends StateNotifier<NonCustodialExchangeRate> {
  NonCustodialRateStateNotifier()
      : super(
          const NonCustodialExchangeRate(
            currencyTo: 'currencyTo',
            currencyFrom: 'currencyFrom',
            rate: 0,
          ),
        );

  void updateData(NonCustodialExchangeRate data) {
    state = data;
  }
}
