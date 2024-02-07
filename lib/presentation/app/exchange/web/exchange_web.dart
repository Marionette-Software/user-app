import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/exchange/components/exchange_box/exchange_box.dart';
import 'package:user_app/presentation/auth/components/auth_screen_components/components/app_benefits_row.dart';
import 'package:user_app/presentation/auth/web/components/auth_app_bar.dart';
import 'package:user_app/presentation/auth/web/components/footer_components/footer.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:hive/hive.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ExchangeWeb extends HookConsumerWidget {
  const ExchangeWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshValue = useState(1);

    bool enabledNonCustodialWalletConnect = false;

    useEffect(() {
      if (refreshValue.value == 0) {
        refreshValue.value++;
      }
      return null;
    }, []);

    getGlobalConfig() async {
      var box = Hive.box<GlobalConfigData>(Constants.globalConfig);

      GlobalConfigData globalData = box.getAt(0)!;

      enabledNonCustodialWalletConnect =
          globalData.enabledNonCustodialWalletConnect;
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          60.h,
        ),
        child: const AuthAppBar(isWeb: true),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 1594.h,
                width: 1920.w,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(
                        authBackground,
                        height: 1178.h,
                        width: 1178.w,
                      ),
                    ),
                    Positioned(
                      top: 322.h,
                      left: 462.w,
                      right: 462.w,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 90.w,
                            height: 100.h,
                            child: SvgPicture.asset(coin1),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 90.w,
                            height: 100.h,
                            child: SvgPicture.asset(coin4),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 505.h,
                      left: 391.w,
                      right: 391.w,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 135.w,
                            height: 150.h,
                            child: SvgPicture.asset(coin2),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 135.w,
                            height: 150.h,
                            child: SvgPicture.asset(coin5),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 733.h,
                      left: 459.w,
                      right: 459.w,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 108.w,
                            height: 120.h,
                            child: SvgPicture.asset(coin3),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 108.w,
                            height: 120.h,
                            child: SvgPicture.asset(coin6),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 50.h,
                      left: 660.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 48.h,
                            width: 307.w,
                            child: AutoSizeText(
                              tr('authorization.marionette_demo'),
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                          const AppBenefitsRow(
                            platformType: PlatformTypeState.web,
                          ),
                          SizedBox(
                            width: 289.w,
                            height: 48.h,
                            child: AutoSizeText(
                              tr('authorization.app_actions'),
                              minFontSize: 3,
                              maxFontSize: 24,
                              style: Theme.of(context).textTheme.titleSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 25.h,
                              bottom: 50.h,
                            ),
                            child: FutureBuilder(
                              future: getGlobalConfig(),
                              builder: (context, result) {
                                return ExchangeBox(
                                  platformType: PlatformTypeState.web,
                                  enabledNonCustodialWalletConnect:
                                      enabledNonCustodialWalletConnect,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 900.h,
                      child: Image.asset(
                        isLightTheme(context) ? authBanner : authBannerDark,
                        width: MediaQuery.of(context).size.width,
                        height: 680.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              const FooterWeb(),
            ],
          ),
        ),
      ),
    );
  }
}
