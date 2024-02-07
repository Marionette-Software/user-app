import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/history/expanded_state_provider.dart';
import 'package:user_app/application/wallets/save_chart_time_state_notifire.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/wallet/user_wallet.dart';
import 'package:user_app/presentation/app/wallets/components/wallets_list/components/wallets_list_item.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class WalletsList extends HookConsumerWidget {
  const WalletsList({
    super.key,
    required this.wallets,
  });

  final List<UserWallet> wallets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget horizontalLine() {
      return Container(
        width: 430.w,
        height: 2.h,
        color: isLightTheme(context)
            ? AppColors.mainBackgroundLightColor
            : AppColors.whiteColor.withOpacity(0.05),
      );
    }

    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: wallets.length,
        separatorBuilder: (context, index) => horizontalLine(),
        itemBuilder: (context, i) {
          var item = wallets[i];
          return WalletsListItem(
            onTap: () async {
              ref.read(chartTimeStateProvider.notifier).state = '1d';
              ref.read(historyExpandedProvider.notifier).state = false;
              ref
                  .read(walletDataStateNotifierProvider.notifier)
                  .updateWalletData(item);
            },
            item: item,
          );
        },
      ),
    );
  }
}
