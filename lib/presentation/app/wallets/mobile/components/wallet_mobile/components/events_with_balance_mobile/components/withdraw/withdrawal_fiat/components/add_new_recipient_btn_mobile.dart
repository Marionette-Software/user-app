import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/withdrawal/withdraw_payment_interface_state_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/wallet/fiat_recipient.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/withdraw/withdrawal_fiat/components/create_recipient_form_mobile.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AddNewRecipientBtnMobile extends HookConsumerWidget {
  const AddNewRecipientBtnMobile({
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
      width: double.infinity,
      height: 45..h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: isLightTheme(context)
            ? AppColors.aboutHeaderLight
            : AppColors.whiteColor.withOpacity(0.25),
      ),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateRecipientFormMobile(
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
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.75.sp,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
