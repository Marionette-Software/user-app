import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/buy/components/list_buy_option.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/buy/components/list_supported_bunks.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class BuyWeb extends HookConsumerWidget {
  const BuyWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);

    List<BuyOption> buyOptions = [
      BuyOption(
        icon: bankIcon,
        name: 'Bank',
        supportedList: [
          isLightTheme(context) ? unicreditLogoLight : unicreditLogoDark,
          citiLogo,
          isLightTheme(context) ? bnpParibasLogoLight : bnpParibasLogoDark,
          isLightTheme(context) ? hsbcLogoLight : hsbcLogoDark,
        ],
      ),
      BuyOption(
        icon: cardIcon,
        name: 'Card',
        supportedList: [
          masterCardLogo,
          visaLogo,
          isLightTheme(context) ? payLogoLight : payLogoDark,
          isLightTheme(context) ? googlePayLogoLight : googlePayLogoDark,
        ],
      ),
      BuyOption(
        icon: gatewayIcon,
        name: 'Gateway',
        supportedList: [
          payPalLogo,
          skrillLogo,
          stripeLogo,
          isLightTheme(context) ? moonPayLogoLight : moonPayLogoDark,
        ],
      )
    ];

    final selectedBuyOption = useState(0);

    return Column(
      children: [
        Container(
          width: 600.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
            gradient: isLightTheme(context)
                ? null
                : const LinearGradient(
                    begin: Alignment(0, -1),
                    end: Alignment(0, 1),
                    colors: [Color(0xff1c252d), Color(0x001c252d)],
                    stops: [0, 1],
                  ),
            boxShadow: [
              isLightTheme(context)
                  ? BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      spreadRadius: 10,
                      blurRadius: 20,
                      offset: const Offset(0, 3),
                    )
                  : BoxShadow(
                      color:
                          Theme.of(context).primaryColorLight.withOpacity(0.0),
                      spreadRadius: 15,
                      blurRadius: 30,
                      offset: const Offset(0, 3),
                    )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 25.h,
              bottom: 50.h,
            ),
            child: Column(
              children: [
                Text(
                  '${tr('wallet.buy')} ${capitalize(walletData.name)}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: isLightTheme(context)
                            ? AppColors.darkColorText
                            : AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                        letterSpacing: -1.5.sp,
                      ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                ListBuyOptionWeb(
                  buyOptions: buyOptions,
                  selectedBuyOption: selectedBuyOption,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        Container(
          width: 600.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
            gradient: isLightTheme(context)
                ? null
                : const LinearGradient(
                    begin: Alignment(0, -1),
                    end: Alignment(0, 1),
                    colors: [Color(0xff1c252d), Color(0x001c252d)],
                    stops: [0, 1],
                  ),
            boxShadow: [
              isLightTheme(context)
                  ? BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      spreadRadius: 10,
                      blurRadius: 20,
                      offset: const Offset(0, 3),
                    )
                  : BoxShadow(
                      color:
                          Theme.of(context).primaryColorLight.withOpacity(0.0),
                      spreadRadius: 15,
                      blurRadius: 30,
                      offset: const Offset(0, 3),
                    )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 25.h,
              bottom: 50.h,
            ),
            child: Column(
              children: [
                Text(
                  tr('wallet.supported_banks'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: isLightTheme(context)
                            ? AppColors.darkColorText
                            : AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                        letterSpacing: -1.5.sp,
                      ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                ListSupportedBunks(
                  buyOptions: buyOptions,
                  selectedBuyOption: selectedBuyOption,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  tr('wallet.not_functional_on_this_testnet_demo'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: isLightTheme(context)
                            ? Theme.of(context).primaryColor.withOpacity(0.5)
                            : AppColors.whiteColor.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        letterSpacing: -1.sp,
                      ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BuyOption {
  String name;
  String icon;
  List supportedList;
  BuyOption({
    required this.icon,
    required this.name,
    required this.supportedList,
  });
}
