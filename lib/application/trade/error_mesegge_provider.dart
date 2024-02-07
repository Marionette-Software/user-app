import 'package:hooks_riverpod/hooks_riverpod.dart';

final errorMinOrMaxPriceProvider = StateProvider<bool>(
  (ref) => false,
);

final errorMinAmountProvider = StateProvider<bool>(
  (ref) => false,
);
