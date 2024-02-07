import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/withdrawal/withdraw_payment_interface_state_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/wallet/fiat_recipient.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/withdraw/fiat_withdraw/components/create_recipient_form.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AddNewRecipientBtn extends HookConsumerWidget {
  const AddNewRecipientBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentInterfaceWatch =
        ref.watch(withdrawPaymentInterfaceNotifierProvider);

    List<FiatRecipientItem> listFiatRecipientData = [];

    Map<String, dynamic> recipientSchema =
        jsonDecode(paymentInterfaceWatch.recipientSchema!);
    Map<String, dynamic> properties = recipientSchema["properties"];

    properties.forEach(
      (key, value) {
        listFiatRecipientData.add(
          FiatRecipientItem(
            key: key,
            controller: TextEditingController(),
            label: value['label'],
            options: value['options'] ?? [],
          ),
        );
      },
    );

    return Container(
      width: 235.w,
      height: 44.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(49.r),
        color: isLightTheme(context)
            ? const Color(0xFF8F9BB3)
            : AppColors.whiteColor.withOpacity(0.25),
      ),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(49.r),
            onTap: () {
              context.pop();
              showDialog(
                barrierColor: AppColors.placeHolderGrey,
                context: context,
                builder: (context) => ModalWindowWallet(
                  titleSize: 30,
                  title: '',
                  content: CreateRecipientForm(
                    paymentInterfaceId:
                        paymentInterfaceWatch.paymentInterface.id,
                    walletId: paymentInterfaceWatch.currency.id,
                    listFiatRecipientData: listFiatRecipientData,
                  ),
                ),
              );
            },
            child: Text(
              '+ Add New Recipient'.hardcoded,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: AppColors.whiteColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1.sp,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
