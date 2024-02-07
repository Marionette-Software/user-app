import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/non_custodial_exchange/main_non_custodial_value.dart';

final mainDataNonCustodialNotifierProvider = StateNotifierProvider<
    MainDataNonCustodialNotifierProvider, MainNonCustodialValue>(
  (ref) => MainDataNonCustodialNotifierProvider(),
);

class MainDataNonCustodialNotifierProvider
    extends StateNotifier<MainNonCustodialValue> {
  MainDataNonCustodialNotifierProvider()
      : super(
          MainNonCustodialValue(
            toCurrencyIndex: 0,
            fromAmount: '',
            toAmount: '',
            fromCurrencyIndex: 0,
            toCurrencyId: '',
            fromCurrencyId: '',
          ),
        );

  void update(MainNonCustodialValue data) {
    state = data;
  }
}
