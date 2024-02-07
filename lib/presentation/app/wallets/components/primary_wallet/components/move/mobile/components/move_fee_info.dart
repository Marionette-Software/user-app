import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/move/net_move_amount_state_notifier_provider.dart';
import 'package:user_app/domain/wallet/user_wallet.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';

class MoveFeeInfoMobile extends HookConsumerWidget {
  final UserWallet wallet;
  const MoveFeeInfoMobile({
    super.key,
    this.amount,
    required this.wallet,
  });

  final String? amount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getNetAmount = ref.watch(netMoveAmountNotifierProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 12.h,
                child: AutoSizeText(
                  tr('wallet.transfer_fee'),
                  maxFontSize: 10,
                  minFontSize: 8,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              SizedBox(
                height: 12.h,
                child: AutoSizeText(
                  '${0.toStringAsFixed(wallet.precision)} ${wallet.id.toUpperCase()}',
                  minFontSize: 8,
                  maxFontSize: 10,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h, bottom: 8.h),
            child: Divider(
              height: 1,
              color: Theme.of(context).primaryColor.withOpacity(0.3),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 12.h,
                child: AutoSizeText(
                  tr('wallet.net_transfer_amount'),
                  maxFontSize: 10,
                  minFontSize: 8,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              SizedBox(
                height: 12.h,
                child: AutoSizeText(
                  '${numberFormatWithPrecision(wallet.precision).format(getNetAmount['amount'].toString().isEmpty ? 0 : double.parse(getNetAmount['amount']))} ${wallet.id.toUpperCase()}',
                  minFontSize: 8,
                  maxFontSize: 10,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
