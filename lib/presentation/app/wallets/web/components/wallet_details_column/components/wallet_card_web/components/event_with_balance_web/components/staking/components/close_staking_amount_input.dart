import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/currency_staking_futere_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class CloseStakingAmountInputWeb extends HookConsumerWidget {
  const CloseStakingAmountInputWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final stakingCurrencyWatch =
        ref.watch(stakingCurrencyDataStateNotifierProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: UserAppImage(
            clipBehavior: Clip.hardEdge,
            path: walletData.iconUrl,
            width: 50.w,
            height: 50.h,
            isNetwork: true,
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        Text(
          walletData.id.toUpperCase(),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                letterSpacing: -1.sp,
              ),
        ),
        Expanded(
          child: TextFormField(
            readOnly: true,
            keyboardType: TextInputType.number,
            initialValue: (stakingCurrencyWatch.active_balance! +
                    stakingCurrencyWatch.locked_balance!)
                .toStringAsFixed(walletData.precision),
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              floatingLabelAlignment: FloatingLabelAlignment.center,
              filled: false,
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
              contentPadding: EdgeInsets.only(left: 11.w, bottom: 0, top: 0),
              fillColor: isLightTheme(context)
                  ? cardColor
                  : Theme.of(context).inputDecorationTheme.fillColor,
              hoverColor: isLightTheme(context)
                  ? cardColor
                  : Theme.of(context).inputDecorationTheme.fillColor,
              focusColor: isLightTheme(context)
                  ? cardColor
                  : Theme.of(context).inputDecorationTheme.fillColor,
              isCollapsed: false,
            ),
            style: TextStyle(
              fontSize: 40.sp,
              color: isLightTheme(context)
                  ? AppColors.aboutHeaderLight
                  : AppColors.whiteColor.withOpacity(0.5),
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              letterSpacing: -2.sp,
            ),
          ),
        ),
      ],
    );
  }
}
