import 'package:ferry/ferry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/filter/filter_currency_provider.dart';
import 'package:user_app/infrastructure/filter/filter_currency.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_currency_for_filter_history.data.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_currency_for_filter_history.var.gql.dart';
import 'package:user_app/infrastructure/user/user_service.dart';

final getCurrencyForFilterHistoryFutureProvider = FutureProvider.family<
    OperationResponse<GGetCurrencyForFilterHistoryData,
        GGetCurrencyForFilterHistoryVars>, String>((ref, data) async {
  IUserService service = UserService();

  OperationResponse<GGetCurrencyForFilterHistoryData,
          GGetCurrencyForFilterHistoryVars> filterCurrencyResponse =
      await service.getCurrencyForFilterHistory();

  List<FilterCurrency> filterCurrency = [];

  for (var p0 in filterCurrencyResponse.data!.user!.currencies!) {
    filterCurrency.add(
      FilterCurrency(
        id: p0!.id!,
        isSelected: false,
      ),
    );
  }
  ref.read(filterCurrencyStateProvider.notifier).state = filterCurrency;

  return filterCurrencyResponse;
});
