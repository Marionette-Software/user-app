// ignore_for_file: use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
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
import 'package:user_app/presentation/app/wallets/components/primary_wallet/components/move/mobile/components/move_input_mobile.dart';
import 'package:user_app/presentation/app/wallets/components/primary_wallet/components/move/mobile/components/move_wallets_container_mobile.dart';
import 'package:user_app/presentation/auth/components/main_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MoveMobile extends HookConsumerWidget {
  const MoveMobile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletDataStateNotifierProvider);
    final moveWatch = ref.watch(moveStateProvider);
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

    return SingleChildScrollView(
      child: Container(
        width: 320.w,
        height: 504.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              isLightTheme(context)
                  ? AppColors.whiteColor
                  : AppColors.whiteColor.withOpacity(0.1),
              isLightTheme(context)
                  ? AppColors.whiteColor
                  : AppColors.whiteColor.withOpacity(0.0),
            ],
          ),
          border: Border(
            top: BorderSide(
              width: 1.0,
              color: isLightTheme(context)
                  ? Colors.transparent
                  : AppColors.whiteColor.withOpacity(0.25),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 25.w,
            right: 25.w,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                width: 85.w,
                child: Divider(
                  color: isLightTheme(context)
                      ? Theme.of(context).primaryColor.withOpacity(0.1)
                      : Theme.of(context).primaryColor.withOpacity(0.8),
                  thickness: 3,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.viewInsetsOf(context).bottom,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                          height: 24.h,
                          child: AutoSizeText(
                            tr('wallet.transfer_balance'),
                            minFontSize: 4,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      MoveWalletsContainerMobile(
                        controller: amountController,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      MoveInputMobile(
                        controller: amountController,
                        wallet: walletState,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      loaderState.value == LoadState.loading
                          ? const CircularProgressIndicator()
                          : Consumer(
                              builder: (_, ref, __) {
                                final userBalances = ref
                                    .watch(userBalancesStateNotifierProvider);
                                UserBalance userBalance =
                                    userBalances.firstWhere((element) =>
                                        element.id == walletState.id);

                                return MainButtonMobile(
                                  onTap: validateMoveInput(userBalance)
                                      ? () async {
                                          loaderState.value = LoadState.loading;

                                          if (moveWatch ==
                                              MoveState.primaryWallet) {
                                            var resMoveTo =
                                                await walletActionsGeneral
                                                    .moveToTrading(
                                              amount: double.parse(
                                                  getNetAmount['amount']),
                                              currencyId: walletState.id,
                                            );
                                            if (resMoveTo) {
                                              loaderState.value =
                                                  LoadState.notLoading;

                                              final snackBar = SnackBar(
                                                elevation: 0,
                                                clipBehavior: Clip.none,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: AwesomeSnackbarContent(
                                                  titleFontSize: 30.sp,
                                                  messageFontSize: 20.sp,
                                                  title: tr(
                                                      'snack_bar_message.success.success'),
                                                  message: tr(
                                                      'snack_bar_message.success.successful'),
                                                  contentType:
                                                      ContentType.success,
                                                ),
                                              );

                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(snackBar);
                                              context.pop();
                                            } else if (resMoveTo
                                                is GraphQlError) {
                                              loaderState.value =
                                                  LoadState.notLoading;

                                              final snackBar = SnackBar(
                                                elevation: 0,
                                                clipBehavior: Clip.none,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: AwesomeSnackbarContent(
                                                  title: tr(
                                                      'snack_bar_message.errors.error'),
                                                  message: resMoveTo.message,
                                                  contentType:
                                                      ContentType.failure,
                                                ),
                                              );

                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(snackBar);
                                            }
                                          } else if (moveWatch ==
                                              MoveState.advancedWallet) {
                                            var resMoveTo =
                                                await walletActionsGeneral
                                                    .moveFromTrading(
                                              amount: double.parse(
                                                  getNetAmount['amount']),
                                              currencyId: walletState.id,
                                            );
                                            if (resMoveTo) {
                                              loaderState.value =
                                                  LoadState.notLoading;

                                              final snackBar = SnackBar(
                                                elevation: 0,
                                                clipBehavior: Clip.none,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: AwesomeSnackbarContent(
                                                  title: tr(
                                                      'snack_bar_message.success.success'),
                                                  message: tr(
                                                      'snack_bar_message.success.successful'),
                                                  contentType:
                                                      ContentType.success,
                                                ),
                                              );

                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(snackBar);
                                              context.pop();
                                            } else if (resMoveTo
                                                is GraphQlError) {
                                              loaderState.value =
                                                  LoadState.notLoading;

                                              final snackBar = SnackBar(
                                                elevation: 0,
                                                clipBehavior: Clip.none,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: AwesomeSnackbarContent(
                                                  title: tr(
                                                      'snack_bar_message.errors.error'),
                                                  message: resMoveTo.message,
                                                  contentType:
                                                      ContentType.failure,
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
                                  height: 35.h,
                                  color: Theme.of(context).primaryColorLight,
                                );
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
