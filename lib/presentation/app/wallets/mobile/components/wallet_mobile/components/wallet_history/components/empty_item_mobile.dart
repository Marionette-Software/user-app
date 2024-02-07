import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class EmptyHistoryItemMobile extends HookConsumerWidget {
  const EmptyHistoryItemMobile({
    required this.emptyIconHistory,
    super.key,
  });

  final String emptyIconHistory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);

    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 10.w,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 18.w,
            height: 18..h,
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
            width: 15.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 61.w,
                height: 10..h,
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
                height: 6..h,
              ),
              Container(
                width: 106.w,
                height: 8..h,
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
                width: 72.w,
                height: 10..h,
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
                height: 6..h,
              ),
              Container(
                width: 81.w,
                height: 8..h,
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
