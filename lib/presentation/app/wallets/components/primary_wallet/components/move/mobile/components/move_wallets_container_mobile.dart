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

class MoveWalletsContainerMobile extends HookConsumerWidget {
  const MoveWalletsContainerMobile({super.key, required this.controller});

  final TextEditingController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moveState = ref.read(moveStateProvider.notifier);
    final moveWatch = ref.watch(moveStateProvider);

    final updateNetAmount = ref.read(netMoveAmountNotifierProvider.notifier);
    final walletState = ref.watch(walletDataStateNotifierProvider);
    return Container(
      width: 320.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: isLightTheme(context) ? cardColor : Colors.transparent,
        border: Border.all(
          color: isLightTheme(context)
              ? Colors.transparent
              : AppColors.whiteColor.withOpacity(0.25),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 16.h,
          bottom: 16.h,
          left: 23.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20.w,
                      height: 12.h,
                      child: AutoSizeText(
                        tr('wallet.from'),
                        maxFontSize: 10,
                        minFontSize: 5,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 10,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.h,
                          child: AutoSizeText(
                            moveWatch == MoveState.primaryWallet
                                ? tr('wallet.primary_wallet_long')
                                : tr('wallet.trading_wallet'),
                            maxFontSize: 13,
                            minFontSize: 5,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Consumer(
                          builder: (_, ref, __) {
                            final userBalances =
                                ref.watch(userBalancesStateNotifierProvider);
                            UserBalance userBalance = userBalances.firstWhere(
                                (element) => element.id == walletState.id);

                            return SizedBox(
                              height: 12.h,
                              child: AutoSizeText(
                                moveWatch == MoveState.primaryWallet
                                    ? tr(
                                        '${tr('wallet.available')} ${userBalance.balance} ${walletState.id.toUpperCase()}')
                                    : tr(
                                        '${tr('wallet.available')} ${userBalance.advancedTradingBalance} ${walletState.id.toUpperCase()}'),
                                maxFontSize: 10,
                                minFontSize: 5,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
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
                Padding(
                  padding: EdgeInsets.only(
                    left: 30.w,
                    top: 10.h,
                    bottom: 10.h,
                  ),
                  child: Container(
                    width: 159.w,
                    height: 1.h,
                    color: Theme.of(context).primaryColor.withOpacity(0.25),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20.w,
                      height: 12.h,
                      child: AutoSizeText(
                        tr('wallet.to'),
                        maxFontSize: 12,
                        minFontSize: 5,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.h,
                          child: AutoSizeText(
                            moveWatch != MoveState.advancedWallet
                                ? tr('wallet.trading_wallet')
                                : tr('wallet.primary_wallet_long'),
                            maxFontSize: 13,
                            minFontSize: 5,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          height: 12.h,
                          child: Consumer(
                            builder: (_, ref, __) {
                              final userBalances =
                                  ref.watch(userBalancesStateNotifierProvider);
                              UserBalance userBalance = userBalances.firstWhere(
                                  (element) => element.id == walletState.id);

                              return AutoSizeText(
                                moveWatch != MoveState.advancedWallet
                                    ? tr(
                                        '${tr('wallet.available')} ${userBalance.advancedTradingBalance} ${walletState.id.toUpperCase()}')
                                    : tr(
                                        '${tr('wallet.available')} ${userBalance.balance} ${walletState.id.toUpperCase()}'),
                                maxFontSize: 10,
                                minFontSize: 5,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
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
              ],
            ),
            InkWell(
              onTap: () {
                (moveWatch == MoveState.primaryWallet)
                    ? moveState.state = MoveState.advancedWallet
                    : moveState.state = MoveState.primaryWallet;

                controller.clear();
                updateNetAmount.updateNetAmount('0');
              },
              child: SvgPicture.asset(
                moveIconPath,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColorLight,
                  BlendMode.srcIn,
                ),
                width: 54.w,
                height: 37.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
