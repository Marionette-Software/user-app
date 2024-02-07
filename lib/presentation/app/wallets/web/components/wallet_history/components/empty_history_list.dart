import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_history/components/empty_history_item.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class EmptyHistoryListWeb extends StatelessWidget {
  const EmptyHistoryListWeb({
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
            height: 11.h,
          ),
          Container(
            width: 576.w,
            height: 2.h,
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.05),
          ),
          SizedBox(
            height: 12.h,
          ),
        ],
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => separateLine(),
      itemCount: 5,
      itemBuilder: (context, i) {
        return EmptyHistoryItemWeb(
          emptyIconHistory: emptyIconHistoryList[i],
        );
      },
    );
  }
}
