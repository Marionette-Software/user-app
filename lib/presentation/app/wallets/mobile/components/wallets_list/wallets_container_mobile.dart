import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/wallet/user_wallet.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallets_list/components/search_wallet_input_mobile.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallets_list/components/wallet_list.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class WalletsContainerMobile extends HookConsumerWidget {
  const WalletsContainerMobile({
    Key? key,
    required this.wallets,
  }) : super(key: key);

  final List<UserWallet> wallets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hidZeroBalance = useState(false);
    final searchControllerValue = useState('');
    final stakingFilter = useState(false);
    final isFavorite = useState(false);
    final userBalances = ref.watch(userBalancesStateNotifierProvider);
    final walletsWatch = ref.watch(walletsListDataStateNotifierProvider);

    List<UserWallet> searchFunction(List<UserWallet> searchedList) {
      if (searchControllerValue.value.isNotEmpty) {
        return searchedList
            .where((element) =>
                capitalize(element.name)
                    .contains(capitalize(searchControllerValue.value)) ||
                element.id
                    .toUpperCase()
                    .contains(searchControllerValue.value.toUpperCase()) ||
                element.id
                    .toLowerCase()
                    .contains(searchControllerValue.value.toLowerCase()))
            .toList();
      } else {
        return walletsWatch;
      }
    }

    List<UserWallet> getFilteredWalletsList() {
      if (hidZeroBalance.value) {
        List<UserWallet> hidZeroBalanceWallets = [];

        for (var element in userBalances) {
          final totalBalance = element.advancedTradingBalance! +
              element.balance! +
              element.advancedTradingLockedBalance! +
              element.lockedBalance!;

          if (totalBalance > 0) {
            hidZeroBalanceWallets.add(
              walletsWatch.firstWhere(
                  (wallet) => wallet.id.toUpperCase() == element.id),
            );
          }
        }

        if (hidZeroBalanceWallets.isEmpty) {
          hidZeroBalance.value = false;
          return walletsWatch;
        }

        ref
            .read(walletDataStateNotifierProvider.notifier)
            .updateWalletData(hidZeroBalanceWallets.first);

        return hidZeroBalanceWallets;
      }

      if (isFavorite.value) {
        List<UserWallet> favoriteList = [];

        for (var element in walletsWatch) {
          if (element.isFavorite) {
            favoriteList.add(element);
          }
        }
        if (favoriteList.isNotEmpty) {
          return favoriteList;
        } else {
          isFavorite.value = false;
          return walletsWatch;
        }
      }

      if (stakingFilter.value) {
        List<UserWallet> stakingWallets = [];
        for (var element in walletsWatch) {
          if (element.staking_enabled) {
            stakingWallets.add(element);
          }
        }
        if (stakingWallets.isNotEmpty) {
          return stakingWallets;
        } else {
          stakingFilter.value = false;
          return walletsWatch;
        }
      }

      return searchFunction(walletsWatch);
    }

    return Column(
      children: [
        SearchWalletInputMobile(
          stakingFilter: stakingFilter,
          hidZeroBalance: hidZeroBalance,
          isFavorite: isFavorite,
          searchControllerValue: searchControllerValue,
          getWalletsList: getFilteredWalletsList,
        ),
        SizedBox(
          height: 5..h,
        ),
        getFilteredWalletsList().isEmpty
            ? Padding(
                padding: EdgeInsets.only(top: 100..h),
                child: Text(
                  'No matches'.hardcoded,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: isLightTheme(context)
                            ? AppColors.aboutHeaderLight
                            : AppColors.whiteColor.withOpacity(0.5),
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              )
            : Expanded(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: WalletListMobile(
                      wallets: getFilteredWalletsList(),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
