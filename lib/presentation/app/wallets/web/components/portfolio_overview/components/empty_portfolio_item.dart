import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class EmptyPortfolioItem extends HookConsumerWidget {
  const EmptyPortfolioItem({
    required this.withEmptyPortfolio,
    Key? key,
  }) : super(key: key);

  final bool withEmptyPortfolio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletDataStateNotifierProvider);

    return Stack(
      alignment: AlignmentDirectional.centerStart,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 250.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: getWalletColor(
              walletState.lightBgColor1,
              walletState.darkBgColor1,
              isLightTheme(context),
            ).withOpacity(0.25),
          ),
          child: Padding(
            padding:
                EdgeInsets.only(right: 23.w, left: 37.w, top: 3.h, bottom: 3.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Text(
                  withEmptyPortfolio ? '${(0).toStringAsFixed(2)} %' : '',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 20.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.sp,
                        fontStyle: FontStyle.normal,
                      ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: -17.w,
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: getWalletColor(
                walletState.lightBgColor1,
                walletState.darkBgColor1,
                isLightTheme(context),
              ).withOpacity(0.95),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
