import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_notifier.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_provider.dart';
import 'package:user_app/domain/auth/auth_state.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/non_custodial_actions.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/mobile/components/header_non_custodial_mobile.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/stepper_container_mobile.dart';
import 'package:user_app/presentation/app/exchange/mobile/components/decoration_exchange_main_page.dart';

class NonCustodialExchangeMobile extends HookConsumerWidget {
  const NonCustodialExchangeMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressRead = ref.read(nonCustodialStateProvider.notifier);
    final progressIndexRead =
        ref.read(nonCustodialProgressStateProvider.notifier);

    Future<void> checkUser() async {
      var userBox = Hive.box<UserConfigData>(Constants.userConfig);
      UserConfigData userData = userBox.getAt(0)!;
      ref.read(authControllerStateProvider.notifier).state = AuthState.exchange;
      if (userData.token != null) {
        progressRead.state = NonCustodialState.isWalletConnected;

        progressRead.state = NonCustodialState.receive;

        progressIndexRead.state = 2;
      } else {
        progressIndexRead.state = 1;
        progressRead.state = NonCustodialState.authentication;
      }
    }

    useEffect(() {
      checkUser();
      return null;
    }, []);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: DecorationExchangeMainPageMobile(
          content: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 16.h,
                  bottom: 25.h,
                ),
                child: Column(
                  children: [
                    const HeaderNonCustodialMobile(),
                    const NonCustodialActions(
                      platformType: PlatformTypeState.mobile,
                    ),
                    StepperContainerMobile()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
