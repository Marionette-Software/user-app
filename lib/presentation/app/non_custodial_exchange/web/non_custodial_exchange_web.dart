import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_notifier.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_provider.dart';
import 'package:user_app/domain/auth/auth_state.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/presentation/app/components/header_web/header_web.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/non_custodial_actions.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/web/components/stepper_container.dart';
import 'package:user_app/presentation/auth/web/components/auth_app_bar.dart';
import 'package:user_app/presentation/auth/web/components/footer_components/footer.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class NonCustodialExchangeWeb extends HookConsumerWidget {
  const NonCustodialExchangeWeb({Key? key}) : super(key: key);

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

    var userConfigBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userConfigBox.getAt(0)!;

    useEffect(() {
      checkUser();
      return null;
    }, []);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          60.h,
        ),
        child: userData.token != null
            ? const HeaderWeb()
            : const AuthAppBar(
                isWeb: true,
              ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: isLightTheme(context)
              ? const DecorationImage(
                  image: AssetImage(bgInner),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 99.w,
            top: 25.h,
            right: 98.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StepperContainerWeb(),
                    SizedBox(
                      width: 25.w,
                    ),
                    const NonCustodialActions(
                      platformType: PlatformTypeState.web,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                const FooterWeb(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
