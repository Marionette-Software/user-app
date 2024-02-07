// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/move/move_state_provider.dart';
import 'package:user_app/application/move/net_move_amount_state_notifier_provider.dart';
import 'package:user_app/application/wallets/actions/wallet_actions.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/move/move_state.dart';
import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/presentation/app/wallets/wallets.dart';
import 'package:user_app/presentation/app/wallets/components/primary_wallet/components/move/web/components/move_input_web.dart';
import 'package:user_app/presentation/app/wallets/components/primary_wallet/components/move/web/components/move_wallets_container.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MoveWeb extends HookConsumerWidget {
  const MoveWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moveWatch = ref.watch(moveStateProvider);
    final walletState = ref.watch(walletDataStateNotifierProvider);
    final getNetAmount = ref.watch(netMoveAmountNotifierProvider);

    final amountController = useTextEditingController(text: '');

    final loaderState = useState(LoadState.notLoading);

    WalletActionsGeneral walletActionsGeneral = WalletActionsGeneral();

    validateMoveInput(UserBalance userBalance) {
      if (double.parse(getNetAmount['amount']) == 0) {
        return false;
      }
      if (moveWatch == MoveState.primaryWallet) {
        if (double.parse(getNetAmount['amount']) > userBalance.balance!) {
          return false;
        }
      } else {
        if (double.parse(getNetAmount['amount']) >
            userBalance.advancedTradingBalance!) {
          return false;
        }
      }
      return true;
    }

    return Container(
      width: 600.w,
      height: 504.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 25.w,
          right: 25.w,
          top: 27.h,
          bottom: 50.h,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isLightTheme(context)
                    ? AppColors.whiteColor
                    : Colors.transparent,
                border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.25),
                  width: 1,
                ),
              ),
              child: MoveWalletsContainerWeb(
                controller: amountController,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            MoveInputWeb(
              controller: amountController,
            ),
            SizedBox(
              height: 18.h,
            ),
            loaderState.value == LoadState.loading
                ? const CircularProgressIndicator()
                : Consumer(
                    builder: (_, ref, __) {
                      final userBalances =
                          ref.watch(userBalancesStateNotifierProvider);
                      UserBalance userBalance = userBalances.firstWhere(
                          (element) => element.id == walletState.id);

                      return MainButton(
                        disableColor:
                            MainColorsApp.accentColor.withOpacity(0.5),
                        onTap: validateMoveInput(userBalance)
                            ? () async {
                                loaderState.value = LoadState.loading;
                                if (moveWatch == MoveState.primaryWallet) {
                                  var resMoveTo =
                                      await walletActionsGeneral.moveToTrading(
                                          amount: double.parse(
                                              getNetAmount['amount']),
                                          currencyId: walletState.id);

                                  if (resMoveTo) {
                                    loaderState.value = LoadState.notLoading;

                                    final snackBar = SnackBar(
                                      elevation: 0,
                                      clipBehavior: Clip.none,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        titleFontSize: 30.sp,
                                        messageFontSize: 20.sp,
                                        title: tr(
                                            'snack_bar_message.success.success'),
                                        message: tr(
                                            'snack_bar_message.success.successful'),
                                        contentType: ContentType.success,
                                      ),
                                    );

                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);

                                    context.go(Wallets.routeName);
                                  } else if (resMoveTo is GraphQlError) {
                                    loaderState.value = LoadState.notLoading;

                                    final snackBar = SnackBar(
                                      elevation: 0,
                                      clipBehavior: Clip.none,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        titleFontSize: 30.sp,
                                        messageFontSize: 20.sp,
                                        title: tr(
                                            'snack_bar_message.errors.error'),
                                        message: resMoveTo.message,
                                        contentType: ContentType.failure,
                                      ),
                                    );

                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);
                                  }
                                } else if (moveWatch ==
                                    MoveState.advancedWallet) {
                                  var resMoveTo = await walletActionsGeneral
                                      .moveFromTrading(
                                    amount:
                                        double.parse(getNetAmount['amount']),
                                    currencyId: walletState.id,
                                  );

                                  if (resMoveTo) {
                                    loaderState.value = LoadState.notLoading;
                                    context.go(Wallets.routeName);

                                    final snackBar = SnackBar(
                                      elevation: 0,
                                      clipBehavior: Clip.none,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        titleFontSize: 30.sp,
                                        messageFontSize: 20.sp,
                                        title: tr(
                                            'snack_bar_message.success.success'),
                                        message: tr(
                                            'snack_bar_message.success.successful'),
                                        contentType: ContentType.success,
                                      ),
                                    );

                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);
                                  } else if (resMoveTo is GraphQlError) {
                                    loaderState.value = LoadState.notLoading;

                                    final snackBar = SnackBar(
                                      elevation: 0,
                                      clipBehavior: Clip.none,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        titleFontSize: 30.sp,
                                        messageFontSize: 20.sp,
                                        title: tr(
                                            'snack_bar_message.errors.error'),
                                        message: resMoveTo.message,
                                        contentType: ContentType.failure,
                                      ),
                                    );

                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);
                                  }
                                }
                              }
                            : null,
                        text: tr('wallet.submit'),
                        height: 60.h,
                        color: Theme.of(context).primaryColorLight,
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
