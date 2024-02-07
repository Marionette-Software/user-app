import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/sell/components/sell_list_bunk.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SellWeb extends HookConsumerWidget {
  const SellWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);

    return Container(
      width: 600.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        gradient: isLightTheme(context)
            ? null
            : const LinearGradient(
                begin: Alignment(0, -1),
                end: Alignment(0, 1),
                colors: [Color(0xff1c252d), Color(0x001c252d)],
                stops: [0, 1],
              ),
        boxShadow: [
          isLightTheme(context)
              ? BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(0, 3),
                )
              : BoxShadow(
                  color: Theme.of(context).primaryColorLight.withOpacity(0.0),
                  spreadRadius: 15,
                  blurRadius: 30,
                  offset: const Offset(0, 3),
                )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 25.h,
          bottom: 30.h,
        ),
        child: Column(
          children: [
            Text(
              '${tr('wallet.sell')} ${capitalize(walletData.name)}',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: isLightTheme(context)
                        ? AppColors.darkColorText
                        : AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 30.sp,
                    letterSpacing: -1.5.sp,
                  ),
            ),
            SizedBox(
              height: 25.h,
            ),
            const SellListBunkWeb(),
            SizedBox(
              height: 25.h,
            ),
            Text(
              tr('wallet.not_functional_on_this_testnet_demo'),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: isLightTheme(context)
                        ? Theme.of(context).primaryColor.withOpacity(0.5)
                        : AppColors.whiteColor.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    letterSpacing: -1.sp,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
