import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/loced_balance/item_locked_balance.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class LockedBalanceWeb extends HookConsumerWidget {
  const LockedBalanceWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletDataStateNotifierProvider);
    final userBalance = ref
        .watch(userBalancesStateNotifierProvider)
        .firstWhere((e) => e.id == walletState.id);

    var globalConfigBox = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = globalConfigBox.getAt(0)!;

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 600.w,
        child: Padding(
          padding: EdgeInsets.only(
            top: 25.h,
            bottom: 50.h,
            left: 25.w,
            right: 25.w,
          ),
          child: Column(
            children: [
              Text(
                '${capitalize(walletState.name)} ${tr('wallet.locked_in')}',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: isLightTheme(context)
                          ? Theme.of(context).primaryColor.withOpacity(0.5)
                          : AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 30.sp,
                    ),
              ),
              SizedBox(
                height: 25.h,
              ),
              ItemLockedBalance(
                title: tr('wallet.pending_withdrawals'),
                lockedBalance:
                    '${numberFormatWithPrecision(walletState.precision).format((userBalance.withdrawLockedBalance!))} ${walletState.id.toUpperCase()}',
              ),
              SizedBox(
                height: 20.h,
              ),
              ItemLockedBalance(
                title: tr('wallet.open_limit_orders'),
                lockedBalance:
                    '${numberFormatWithPrecision(walletState.precision).format(userBalance.advancedTradingLockedBalance)} ${walletState.id.toUpperCase()}',
              ),
              globalData.enabledStaking && walletState.staking_enabled
                  ? Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: ItemLockedBalance(
                        title: 'Staking:'.hardcoded,
                        lockedBalance:
                            '${numberFormatWithPrecision(walletState.precision).format(userBalance.activeStakingBalance! + userBalance.stakingLockedBalance!)} ${walletState.id.toUpperCase()}',
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
