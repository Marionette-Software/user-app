import 'dart:convert';
import 'package:ferry/ferry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/wallet/user_wallet.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_wallets.data.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_wallets.var.gql.dart';
import 'package:user_app/infrastructure/user/user_service.dart';

final walletDataStateNotifierProvider =
    StateNotifierProvider<WalletDataStateNotifier, UserWallet>(
  (ref) => WalletDataStateNotifier(),
);

class WalletDataStateNotifier extends StateNotifier<UserWallet> {
  WalletDataStateNotifier()
      : super(
          UserWallet.initialData(),
        );

  void updateWalletData(UserWallet wallet) {
    state = wallet;
  }
}

final walletsListDataStateNotifierProvider =
    StateNotifierProvider<WalletsListDataStateNotifier, List<UserWallet>>(
  (ref) => WalletsListDataStateNotifier(),
);

class WalletsListDataStateNotifier extends StateNotifier<List<UserWallet>> {
  WalletsListDataStateNotifier()
      : super(
          [],
        );

  void updateWalletsListData(List<UserWallet> wallets) {
    state = wallets;
  }

  void setFavoriteWallet(String walletId, bool isFavorite) {
    int indexWallet = state.indexWhere((element) => element.id == walletId);

    state[indexWallet].isFavorite = isFavorite;

    state = List.from(state);
  }
}

final getWalletsFutureProvider =
    FutureProvider.autoDispose.family<List<UserWallet>, RefreshRequest>(
  (ref, request) async {
    IUserService service = UserService();

    OperationResponse<GGetUserWalletsData, GGetUserWalletsVars>
        walletsResponse = await service.getUserWallets();

    final list = walletsResponse.data!.user!.currencies!.toList();
    final jsonData = jsonEncode(list);
    Iterable data = json.decode(jsonData);

    List<UserWallet> wallets = List<UserWallet>.from(
      data.map(
        (model) => UserWallet.fromJson(model),
      ),
    );

    wallets.sort(
      (a, b) => a.position.compareTo(b.position),
    );

    ref
        .read(walletsListDataStateNotifierProvider.notifier)
        .updateWalletsListData(wallets);

    ref
        .read(walletDataStateNotifierProvider.notifier)
        .updateWalletData(wallets.first);

    return wallets;
  },
);
