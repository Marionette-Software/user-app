import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/wallet_history/components/empty_item_mobile.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class EmptyHistoryListMobile extends StatelessWidget {
  const EmptyHistoryListMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> emptyIconHistoryList = [
      receiveWalletIcon,
      sendWalletIcon,
      sellWalletIcon,
      buyWalletIcons,
      swapTab,
    ];

    Widget separateLine() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 13..h,
          ),
          Container(
            width: double.infinity,
            height: 1..h,
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.05),
          ),
          SizedBox(
            height: 13..h,
          ),
        ],
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => separateLine(),
      itemCount: 5,
      itemBuilder: (context, i) {
        return EmptyHistoryItemMobile(
          emptyIconHistory: emptyIconHistoryList[i],
        );
      },
    );
  }
}
