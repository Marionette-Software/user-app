import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/history/expanded_state_provider.dart';
import 'package:user_app/application/wallets/save_chart_time_state_notifire.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/wallet/user_wallet.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/wallet_mobile.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallets_list/components/wallet_list_item_mobile.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class WalletListMobile extends HookConsumerWidget {
  const WalletListMobile({
    required this.wallets,
    super.key,
  });

  final List<UserWallet> wallets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget horizontalLine() {
      return Divider(
        height: 2.h,
        color: isLightTheme(context)
            ? AppColors.mainBackgroundLightColor
            : AppColors.whiteColor.withOpacity(0.05),
      );
    }

    return Column(
      children: [
        ListView.separated(
          separatorBuilder: (context, index) => horizontalLine(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: wallets.length,
          itemBuilder: (context, i) {
            var item = wallets[i];
            return WalletListItemMobile(
              onTap: () async {
                ref.read(chartTimeStateProvider.notifier).state = '1d';
                ref.read(historyExpandedProvider.notifier).state = false;
                final walletRead =
                    ref.read(walletDataStateNotifierProvider.notifier);

                walletRead.updateWalletData(item);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WalletMobile(),
                  ),
                );
              },
              item: item,
            );
          },
        ),
      ],
    );
  }
}
