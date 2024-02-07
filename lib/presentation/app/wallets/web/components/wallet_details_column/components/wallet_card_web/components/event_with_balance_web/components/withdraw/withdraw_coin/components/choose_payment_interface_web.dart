import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/withdrawal/withdraw_payment_interface_state_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/wallet/withdraw_payment_interface.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/application/withdrawal/fee_withdraw_state_provider.dart';
import 'package:user_app/application/withdrawal/net_withdrawal_amount_state_notifier_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ChoosePaymentInterfaceWeb extends HookConsumerWidget {
  const ChoosePaymentInterfaceWeb({
    Key? key,
    required this.amountController,
    required this.walletAddressController,
    required this.paymentInterfacesList,
  }) : super(key: key);

  final TextEditingController amountController;
  final TextEditingController walletAddressController;
  final List<WithdrawPaymentInterface> paymentInterfacesList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final updateWithdrawalFee =
        ref.read(feeWithdrawalNotifierProvider.notifier);
    final updateNetAmount =
        ref.read(netWithdrawalAmountNotifierProvider.notifier);
    final paymentInterfaceRead =
        ref.read(withdrawPaymentInterfaceNotifierProvider.notifier);
    final paymentInterfaceWatch =
        ref.watch(withdrawPaymentInterfaceNotifierProvider);
    int paymentInterfacesListLength = paymentInterfacesList.length;

    return paymentInterfacesListLength == 1
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${tr('wallet.network')}: ',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -1.sp,
                    ),
              ),
              UserAppImage(
                clipBehavior: Clip.hardEdge,
                path: paymentInterfacesList.first.paymentInterface.logoUrl!,
                height: 30.h,
                width: 30.h,
                isNetwork: true,
              ),
              Text(
                ' ${paymentInterfacesList.first.paymentInterface.title!.split(' ').first} (${paymentInterfacesList.first.paymentInterface.subtitle})',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1.sp,
                    ),
              ),
            ],
          )
        : Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Column(
              children: [
                Text(
                  'Network for Transaction'.hardcoded,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.sp,
                      ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 60.h,
                  child: Wrap(
                    runSpacing: 15.h,
                    spacing: 1.w,
                    alignment: WrapAlignment.center,
                    children: List.generate(
                      paymentInterfacesListLength,
                      (i) {
                        var item = paymentInterfacesList[i];

                        return Padding(
                          padding: EdgeInsets.only(
                            left: 8.5.w,
                            right: 8.5.w,
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              paymentInterfaceRead.updateInterface(item);
                              amountController.text =
                                  0.toStringAsFixed(walletData.precision);
                              walletAddressController.clear();
                              updateNetAmount.updateNetAmount(
                                double.parse('0')
                                    .toStringAsFixed(walletData.precision),
                              );

                              updateWithdrawalFee.updateFee(
                                item.minWithdrawFee
                                    .toStringAsFixed(walletData.precision),
                              );
                            },
                            child: Container(
                              width: 165.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: paymentInterfaceWatch
                                              .paymentInterface.id ==
                                          item.paymentInterface.id
                                      ? Theme.of(context).primaryColorLight
                                      : Colors.white.withOpacity(0.25),
                                  width: 1,
                                ),
                                color: isLightTheme(context)
                                    ? (item.paymentInterface.id !=
                                            paymentInterfaceWatch
                                                .paymentInterface.id
                                        ? cardColor
                                        : Theme.of(context).primaryColorLight)
                                    : (item.paymentInterface.id !=
                                            paymentInterfaceWatch
                                                .paymentInterface.id
                                        ? Colors.transparent
                                        : Theme.of(context).primaryColorLight),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  UserAppImage(
                                    clipBehavior: Clip.hardEdge,
                                    path: item.paymentInterface.logoUrl!,
                                    isNetwork: true,
                                    width: 35.w,
                                    height: 35.h,
                                  ),
                                  SizedBox(
                                    width: 11.5.w,
                                  ),
                                  Text(
                                    item.paymentInterface.title!.split(' ')[0],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontSize: 20.sp,
                                          color: item.paymentInterface.id !=
                                                  paymentInterfaceWatch
                                                      .paymentInterface.id
                                              ? Theme.of(context).primaryColor
                                              : AppColors.whiteColorText,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
