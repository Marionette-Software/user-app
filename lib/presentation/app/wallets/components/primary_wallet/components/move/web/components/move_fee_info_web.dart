import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/move/net_move_amount_state_notifier_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';

class MoveFeeInfoWeb extends HookConsumerWidget {
  const MoveFeeInfoWeb({super.key, this.amount});

  final String? amount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final getNetAmount = ref.watch(netMoveAmountNotifierProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 21.h,
                child: AutoSizeText(
                  tr('wallet.transfer_fee'),
                  maxFontSize: 17,
                  minFontSize: 8,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 17,
                      ),
                ),
              ),
              SizedBox(
                height: 21.h,
                child: AutoSizeText(
                  '${0.toStringAsFixed(walletData.precision)} ${walletData.id.toUpperCase()}',
                  minFontSize: 8,
                  maxFontSize: 17,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5.h,
            ),
            child: Divider(
              color: Theme.of(context).primaryColor.withOpacity(0.25),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 21.h,
                child: AutoSizeText(
                  tr('wallet.net_transfer_amount'),
                  maxFontSize: 17,
                  minFontSize: 8,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SizedBox(
                height: 21.h,
                child: AutoSizeText(
                  '${numberFormatWithPrecision(walletData.precision).format(getNetAmount['amount'].toString().isEmpty ? 0 : double.parse(getNetAmount['amount']))} ${walletData.id.toUpperCase()}',
                  minFontSize: 8,
                  maxFontSize: 17,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
