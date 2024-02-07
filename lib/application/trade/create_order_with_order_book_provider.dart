import 'package:hooks_riverpod/hooks_riverpod.dart';

final priceWithOrderBookProvider = StateProvider<double>(
  (ref) => 0,
);

final amountWithOrderBookProvider = StateProvider<double>(
  (ref) => 0,
);
