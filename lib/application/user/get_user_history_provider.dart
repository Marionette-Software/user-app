import 'package:ferry/typed_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/filter/filter_currency_provider.dart';
import 'package:user_app/domain/trade/market/get_market_req.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.data.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.var.gql.dart';
import 'package:user_app/infrastructure/user/user_service.dart';

final userHistoryNotifierProvider = StateNotifierProvider.autoDispose<
    UserHistoryDataStateNotifier, GGetUserHistoryData_history>(
  (ref) => UserHistoryDataStateNotifier(),
);

class UserHistoryDataStateNotifier
    extends StateNotifier<GGetUserHistoryData_history> {
  UserHistoryDataStateNotifier()
      : super(
          GGetUserHistoryData_history(),
        );

  void updateUserHistoryData(GGetUserHistoryData_history history) {
    state = history;
  }
}

final userGetHistoryFutureProvider = FutureProvider.autoDispose
    .family<OperationResponse<GGetUserHistoryData, GGetUserHistoryVars>, int>(
        (ref, pageKey) async {
  IUserService service = UserService();
  return await service.getFullUserHistory(limit: 13, page: pageKey);
});
