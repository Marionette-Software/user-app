import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/select_deposit_network_state_provider.dart';
import 'package:user_app/application/wallets/select_deposit_options_state_provider.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SelectDepositOption extends HookConsumerWidget {
  const SelectDepositOption({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedWatch = ref.watch(selectDepositOptionsStateProvider);
    final selectedRead = ref.read(selectDepositOptionsStateProvider.notifier);
    final selectedNetworkRead =
        ref.read(selectDepositNetworkStateProvider.notifier);

    List<DepositOption> listOptions = [
      DepositOption(
        icon: walletConnect,
        name: tr('wallet_connect.wallet_connect'),
        isActive: true,
        haveIcon: true,
      ),
      DepositOption(
        icon: cardOption,
        name: tr('wallet_connect.buy_usdt'),
        isActive: false,
        haveIcon: true,
      ),
      DepositOption(
        icon: 'icon',
        name: tr('wallet_connect.generate_address'),
        isActive: true,
        haveIcon: false,
      ),
    ];
    return Column(
      children: [
        SizedBox(
          height: 25.h,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            tr('wallet_connect.select_deposit_option'),
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: isLightTheme(context)
                      ? AppColors.darkColorText
                      : AppColors.whiteColor,
                  fontSize: 30.sp,
                ),
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 25.w,
            left: 25.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              for (var i = 0; i < listOptions.length; i++)
                InkWell(
                  onTap: () {
                    selectedNetworkRead.state = 0;
                    selectedRead.state = i;
                  },
                  child: listOptions[i].isActive == true
                      ? Container(
                          width: 166.w,
                          height: 102.h,
                          decoration: BoxDecoration(
                            color: selectedWatch == i
                                ? Theme.of(context).primaryColorLight
                                : Colors.transparent,
                            border: Border.all(
                              color: selectedWatch == i
                                  ? Colors.transparent
                                  : isLightTheme(context)
                                      ? AppColors.borderSideColor
                                          .withOpacity(0.25)
                                      : AppColors.whiteColor.withOpacity(0.25),
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              listOptions[i].haveIcon == true
                                  ? SizedBox(
                                      width: 40.w,
                                      height: 25.h,
                                      child: SvgPicture.asset(
                                        listOptions[i].icon,
                                        colorFilter: ColorFilter.mode(
                                          selectedWatch == i
                                              ? Colors.white
                                              : Theme.of(context).primaryColor,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              listOptions[i].haveIcon == true
                                  ? SizedBox(
                                      height: 10.h,
                                    )
                                  : const SizedBox(),
                              Text(
                                listOptions[i].name,
                                maxLines: listOptions[i].haveIcon ? 1 : 2,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontSize: 21.sp,
                                      color: selectedWatch == i
                                          ? Colors.white
                                          : Theme.of(context).primaryColor,
                                      fontWeight: selectedWatch == i
                                          ? FontWeight.w700
                                          : FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ),
            ],
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
      ],
    );
  }
}

class DepositOption {
  String name;
  String icon;
  bool isActive;
  bool haveIcon;
  DepositOption({
    required this.icon,
    required this.name,
    required this.isActive,
    required this.haveIcon,
  });
}
