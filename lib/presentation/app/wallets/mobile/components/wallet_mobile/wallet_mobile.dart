import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/wallet_card.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/wallet_chart/container_wallet_chart_mobile.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/wallet_history/wallet_history_mobile.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class WalletMobile extends HookConsumerWidget {
  const WalletMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = ScrollController();
    final wallet = ref.watch(walletDataStateNotifierProvider);

    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    return SafeArea(
      child: Scaffold(
        backgroundColor: getWalletColor(
          wallet.lightBgColor1,
          wallet.darkBgColor1,
          isLightTheme(context),
        ),
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            const WalletCardMobile(),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                  color: isLightTheme(context)
                      ? AppColors.whiteColor
                      : walletBackgroundColor,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      globalData.enabledTradingPage
                          ? ContainerWalletChartMobile(
                              scrollController: scrollController,
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: 15..h,
                      ),
                      const WalletHistoryMobile(),
                      SizedBox(
                        height: 30.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
