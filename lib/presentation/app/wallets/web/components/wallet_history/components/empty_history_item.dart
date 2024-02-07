import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class EmptyHistoryItemWeb extends HookConsumerWidget {
  const EmptyHistoryItemWeb({
    required this.emptyIconHistory,
    super.key,
  });

  final String emptyIconHistory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);

    return SizedBox(
      height: 35.h,
      child: Row(
        children: [
          SizedBox(
            width: 22.w,
            height: 22.h,
            child: SvgPicture.asset(
              emptyIconHistory,
              allowDrawingOutsideViewBox: true,
              colorFilter: ColorFilter.mode(
                getWalletColor(
                  walletData.lightBgColor1,
                  walletData.darkBgColor1,
                  isLightTheme(context),
                ).withOpacity(0.25),
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 69.w,
                height: 17.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: getWalletColor(
                    walletData.lightBgColor1,
                    walletData.darkBgColor1,
                    isLightTheme(context),
                  ).withOpacity(0.25),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Container(
                width: 142.w,
                height: 11.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: getWalletColor(
                    walletData.lightBgColor1,
                    walletData.darkBgColor1,
                    isLightTheme(context),
                  ).withOpacity(0.25),
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 129.w,
                height: 17.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: getWalletColor(
                    walletData.lightBgColor1,
                    walletData.darkBgColor1,
                    isLightTheme(context),
                  ).withOpacity(0.25),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Container(
                width: 142.w,
                height: 11.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: getWalletColor(
                    walletData.lightBgColor1,
                    walletData.darkBgColor1,
                    isLightTheme(context),
                  ).withOpacity(0.25),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
