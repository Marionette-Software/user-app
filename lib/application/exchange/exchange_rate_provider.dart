import 'package:hooks_riverpod/hooks_riverpod.dart';

final exchangeRateStateProvider = StateProvider.autoDispose<bool>(
  (ref) => true,
);

final activeInputExchangeProvider = StateProvider<bool>(
  (ref) => false,
);

final activeInputBuySellProvider = StateProvider.autoDispose<bool>(
  (ref) => false,
);
