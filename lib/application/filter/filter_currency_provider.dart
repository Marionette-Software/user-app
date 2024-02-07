import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/infrastructure/filter/filter_currency.dart';

final filterCurrencyStateProvider = StateProvider<List<FilterCurrency>>(
  (ref) => [],
);

final testHistory = StateProvider<int>(
  (ref) => 0,
);
