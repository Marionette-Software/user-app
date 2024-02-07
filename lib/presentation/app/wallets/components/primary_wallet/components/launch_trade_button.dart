import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';
import 'package:user_app/presentation/app/trade/trade.dart';

class LaunchTradeButton extends HookConsumerWidget {
  const LaunchTradeButton({
    Key? key,
    required this.platformType,
  }) : super(key: key);

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletDataStateNotifierProvider);

    return InkWell(
      borderRadius: BorderRadius.all(
        Radius.circular(
          (platformType == PlatformTypeState.web
                  ? 10
                  : (platformType == PlatformTypeState.tablet ? 6.73 : 5))
              .r,
        ),
      ),
      onTap: () async {
        context.go(Trade.routeName);
      },
      child: Container(
        width: (platformType == PlatformTypeState.web
                ? 550
                : (platformType == PlatformTypeState.tablet ? 422 : 270))
            .w,
        height: (platformType == PlatformTypeState.web
                ? 50
                : (platformType == PlatformTypeState.tablet ? 35 : 30))
            .h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            (platformType == PlatformTypeState.web
                    ? 10
                    : (platformType == PlatformTypeState.tablet ? 6.73 : 5))
                .r,
          ),
          color: getWalletColor(
            walletState.lightBgColor1,
            walletState.darkBgColor1,
            isLightTheme(context),
          ),
        ),
        child: Center(
          child: Text(
            tr('wallet.launch_trading_terminal'),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize:
                      (platformType == PlatformTypeState.web ? 20 : 13).sp,
                  color: AppColors.whiteColor,
                  fontWeight: platformType == PlatformTypeState.mobile
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
