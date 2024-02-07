import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/move/move_state_provider.dart';
import 'package:user_app/application/move/net_move_amount_state_notifier_provider.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/move/move_state.dart';
import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/presentation/app/wallets/components/primary_wallet/components/move/web/components/move_fee_info_web.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MoveInputWeb extends HookConsumerWidget {
  const MoveInputWeb({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final moveWatch = ref.watch(moveStateProvider);
    final updateNetAmount = ref.read(netMoveAmountNotifierProvider.notifier);

    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: isLightTheme(context) ? cardColor : Colors.transparent,
            border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.25),
              width: 1,
            ),
          ),
          child: Form(
            child: Padding(
              padding: EdgeInsets.only(
                right: 27.w,
                top: 10.h,
                bottom: 10.h,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 270.w,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (str) {},
                          controller: controller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return tr('wallet.enter_fill_fild');
                            } else {
                              return null;
                            }
                          },
                          inputFormatters: [
                            RegExInputFormatter.withRegex(
                              '^\$|^(0|([1-9.][0-9.]{0,9}))(\\.[0-9]{0,9})?\$',
                            ),
                            NumberTextInputFormatter(
                              decimalRange: walletData.precision,
                            ),
                          ],
                          onChanged: (value) {
                            updateNetAmount.updateNetAmount(
                              value.isEmpty && value == '' ? '0' : value,
                            );
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            // errorBorder: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            hintText: tr('wallet.amount'),
                            contentPadding: EdgeInsets.only(
                              // bottom: 10.h,
                              left: 23.w,
                            ),
                            fillColor: isLightTheme(context)
                                ? cardColor
                                : Colors.transparent,
                            hoverColor: isLightTheme(context)
                                ? cardColor
                                : Colors.transparent,
                            focusColor: isLightTheme(context)
                                ? cardColor
                                : Colors.transparent,
                            isCollapsed: false,
                          ),
                          style: TextStyle(
                            fontSize: 27.h,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Consumer(
                    builder: (_, ref, __) {
                      final userBalances =
                          ref.watch(userBalancesStateNotifierProvider);
                      UserBalance userBalance = userBalances
                          .firstWhere((element) => element.id == walletData.id);

                      return InkWell(
                        onTap: () {
                          if (moveWatch == MoveState.primaryWallet) {
                            controller.text = userBalance.balance.toString();
                            updateNetAmount.updateNetAmount(
                              userBalance.balance.toString(),
                            );
                          } else {
                            controller.text =
                                userBalance.advancedTradingBalance.toString();
                            updateNetAmount.updateNetAmount(
                              userBalance.advancedTradingBalance.toString(),
                            );
                          }
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 60.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: isLightTheme(context)
                                ? AppColors.whiteColorText
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 20.h,
                              child: AutoSizeText(
                                tr('wallet.max'),
                                maxFontSize: 20,
                                minFontSize: 5,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: isLightTheme(context)
                                          ? Theme.of(context).primaryColorLight
                                          : AppColors.whiteColor,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 22.w,
                  ),
                  Container(
                    width: 1.5,
                    height: 34.h,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 22.w,
                  ),
                  UserAppImage(
                    clipBehavior: Clip.hardEdge,
                    path: walletData.iconUrl,
                    width: 46.w,
                    height: 46.h,
                    isNetwork: true,
                  ),
                  SizedBox(
                    width: 28.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                    ),
                    child: SizedBox(
                      height: 37.h,
                      child: AutoSizeText(
                        walletData.id.toUpperCase(),
                        maxFontSize: 20,
                        minFontSize: 5,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        const MoveFeeInfoWeb(),
      ],
    );
  }
}
