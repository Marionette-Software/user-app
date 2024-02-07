import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/move/move_state_provider.dart';
import 'package:user_app/application/move/net_move_amount_state_notifier_provider.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/move/move_state.dart';
import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MoveWalletsContainerWeb extends HookConsumerWidget {
  const MoveWalletsContainerWeb({super.key, required this.controller});

  final TextEditingController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletDataStateNotifierProvider);

    final moveState = ref.read(moveStateProvider.notifier);
    final moveWatch = ref.watch(moveStateProvider);

    final updateNetAmount = ref.read(netMoveAmountNotifierProvider.notifier);

    return Container(
      width: 550.w,
      height: 160.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isLightTheme(context) ? cardColor : Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 16.h,
          bottom: 16.h,
          left: 23.w,
          right: 32.w,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 35.w,
                      height: 18.h,
                      child: AutoSizeText(
                        tr('wallet.from'),
                        maxFontSize: 15,
                        minFontSize: 5,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 27.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24.h,
                          child: AutoSizeText(
                            moveWatch == MoveState.primaryWallet
                                ? tr('wallet.primary_wallet_long')
                                : tr('wallet.trading_wallet'),
                            maxFontSize: 20,
                            minFontSize: 5,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          height: 18.h,
                          child: Consumer(
                            builder: (_, ref, __) {
                              final userBalances =
                                  ref.watch(userBalancesStateNotifierProvider);
                              UserBalance userBalance = userBalances.firstWhere(
                                  (element) => element.id == walletState.id);
                              return AutoSizeText(
                                moveWatch == MoveState.primaryWallet
                                    ? tr(
                                        '${tr('wallet.available')} ${userBalance.balance} ${walletState.id.toUpperCase()}')
                                    : tr(
                                        '${tr('wallet.available')} ${userBalance.advancedTradingBalance} ${walletState.id.toUpperCase()}'),
                                maxFontSize: 15,
                                minFontSize: 5,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                    ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 62.w,
                    top: 14.5.h,
                    bottom: 13.5.h,
                  ),
                  child: Container(
                    width: 346.w,
                    height: 1.h,
                    color: Theme.of(context).primaryColor.withOpacity(0.25),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 35.w,
                      height: 18.h,
                      child: AutoSizeText(
                        tr('wallet.to'),
                        maxFontSize: 15,
                        minFontSize: 5,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 27.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24.h,
                          child: AutoSizeText(
                            moveWatch != MoveState.advancedWallet
                                ? tr('wallet.trading_wallet')
                                : tr('wallet.primary_wallet_long'),
                            maxFontSize: 20,
                            minFontSize: 5,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Consumer(
                          builder: (_, ref, __) {
                            final userBalances =
                                ref.watch(userBalancesStateNotifierProvider);
                            UserBalance userBalance = userBalances.firstWhere(
                                (element) => element.id == walletState.id);
                            return SizedBox(
                              height: 18.h,
                              child: AutoSizeText(
                                moveWatch != MoveState.advancedWallet
                                    ? tr(
                                        '${tr('wallet.available')} ${userBalance.advancedTradingBalance} ${walletState.id.toUpperCase()}')
                                    : tr(
                                        '${tr('wallet.available')} ${userBalance.balance} ${walletState.id.toUpperCase()}'),
                                maxFontSize: 15,
                                minFontSize: 5,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                    ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                (moveWatch == MoveState.primaryWallet)
                    ? moveState.state = MoveState.advancedWallet
                    : moveState.state = MoveState.primaryWallet;

                controller.clear();
                updateNetAmount.updateNetAmount('0');
              },
              child: SizedBox(
                width: 87.w,
                height: 60.h,
                child: SvgPicture.asset(
                  moveIconPath,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColorLight,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
