import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/move/move_state_provider.dart';
import 'package:user_app/application/move/net_move_amount_state_notifier_provider.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/domain/move/move_state.dart';
import 'package:user_app/domain/wallet/user_balance.dart';
import 'package:user_app/domain/wallet/user_wallet.dart';
import 'package:user_app/presentation/app/wallets/components/primary_wallet/components/move/mobile/components/move_fee_info.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/text_input_formater.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MoveInputMobile extends HookConsumerWidget {
  final UserWallet wallet;
  const MoveInputMobile({
    super.key,
    required this.controller,
    required this.wallet,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moveWatch = ref.watch(moveStateProvider);
    final updateNetAmount = ref.read(netMoveAmountNotifierProvider.notifier);

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: isLightTheme(context) ? cardColor : Colors.transparent,
            border: Border.all(
              color: isLightTheme(context)
                  ? Colors.transparent
                  : AppColors.whiteColor.withOpacity(0.25),
              width: 1,
            ),
          ),
          child: Form(
            child: Padding(
              padding: EdgeInsets.only(
                right: 11.w,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 140.w,
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
                              '^\$|^(0|([1-9.][0-9.]{0,7}))(\\.[0-9]{0,7})?\$',
                            ),
                            NumberTextInputFormatter(
                              decimalRange: wallet.precision,
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
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: 20.h,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                ),
                            hintText: tr('wallet.amount'),
                            contentPadding: EdgeInsets.only(
                              left: 11.w,
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
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 20.h,
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
                          .firstWhere((element) => element.id == wallet.id);

                      return InkWell(
                        onTap: () {
                          if (moveWatch == MoveState.primaryWallet) {
                            controller.text = userBalance.balance.toString();
                            updateNetAmount.updateNetAmount(
                                userBalance.balance.toString());
                          } else {
                            controller.text =
                                userBalance.advancedTradingBalance.toString();
                            updateNetAmount.updateNetAmount(
                                userBalance.advancedTradingBalance.toString());
                          }
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          alignment: Alignment.center,
                          width: 35.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: isLightTheme(context)
                                ? AppColors.whiteColorText
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 1,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          child: SizedBox(
                            height: 13.h,
                            child: AutoSizeText(
                              tr('wallet.max'),
                              maxFontSize: 13,
                              minFontSize: 5,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  Container(
                    width: 1.5,
                    height: 20.h,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  UserAppImage(
                    clipBehavior: Clip.hardEdge,
                    path: wallet.iconUrl,
                    width: 25.w,
                    height: 25.h,
                    isNetwork: true,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  SizedBox(
                    height: 16.h,
                    child: AutoSizeText(
                      wallet.id.toUpperCase(),
                      maxFontSize: 13,
                      minFontSize: 5,
                      style: Theme.of(context).textTheme.labelMedium,
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
        MoveFeeInfoMobile(
          wallet: wallet,
        ),
      ],
    );
  }
}
