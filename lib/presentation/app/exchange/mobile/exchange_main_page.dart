import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/exchange/mobile/components/benefits_container_mobile.dart';
import 'package:user_app/presentation/app/exchange/mobile/components/decoration_exchange_main_page.dart';
import 'package:user_app/presentation/app/exchange/mobile/components/download_app_banner_mobile.dart';
import 'package:user_app/presentation/app/exchange/mobile/components/footer_container.dart';
import 'package:user_app/presentation/app/exchange/mobile/components/header_exchange_page.dart';
import 'package:user_app/presentation/app/exchange/components/exchange_box/exchange_box.dart';
import 'package:user_app/presentation/auth/mobile/components/authorization_header.dart';
import 'package:user_app/presentation/auth/mobile/components/drawer/auth_drawer.dart';

import '../../../../domain/constants/constants.dart';

class ExchangeMobile extends HookConsumerWidget {
  const ExchangeMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool enabledNonCustodialWalletConnect = false;

    getGlobalConfig() async {
      var box = Hive.box<GlobalConfigData>(Constants.globalConfig);

      GlobalConfigData globalData = box.getAt(0)!;

      enabledNonCustodialWalletConnect = globalData.enabledNonCustodialWalletConnect;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const AuthDrawer(),
      body: DecorationExchangeMainPageMobile(
        content: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
                top: 16.h,
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Builder(
                        builder: (context) {
                          return AuthorizationHeader(
                            onTap: () => {Scaffold.of(context).openDrawer()},
                          );
                        },
                      ),
                      const HeaderExchangePageMobile(),
                      FutureBuilder(
                        future: getGlobalConfig(),
                        builder: (context, result) {
                          return ExchangeBox(
                            platformType: PlatformTypeState.mobile,
                            enabledNonCustodialWalletConnect:
                                enabledNonCustodialWalletConnect,
                          );
                        },
                      ),
                      const BenefitsContainerMobile(),
                      const DownloadAppBannerMobile(),
                      const FooterContainerExchangeMobile()
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
