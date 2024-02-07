import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/wallets/components/primary_wallet/primary_wallet.dart';
import 'package:user_app/presentation/app/wallets/components/wallet_card/wallet_card.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_chart_web/wallet_chart_web.dart';

class WalletDetailsColumn extends StatelessWidget {
  const WalletDetailsColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    return SizedBox(
      width: 672.w,
      child: Column(
        children: [
          WalletCard(
            platformType: PlatformTypeState.web,
            withTradingBalance: globalData.withTradingBalance,
          ),
          globalData.withTradingBalance
              ? Padding(
                  padding: EdgeInsets.only(
                    top: 25.h,
                  ),
                  child: const PrimaryWallet(
                    platformType: PlatformTypeState.web,
                  ),
                )
              : const SizedBox(),
          globalData.enabledTradingPage
              ? const WalletChartWeb()
              : const SizedBox(),
        ],
      ),
    );
  }
}
