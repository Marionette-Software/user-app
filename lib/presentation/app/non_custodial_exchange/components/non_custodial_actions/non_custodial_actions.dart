import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/auth/auth_controller_state_notifier_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_notifier.dart';
import 'package:user_app/domain/auth/auth_state.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/confirm_exchange/confirm_exchange.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/exchange_container/exchange_container.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/exchange_failed.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/get_address/get_address.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/request_successfully_submitted.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/sending_address_details/sending_address_details.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/thanks_component.dart';
import 'package:user_app/presentation/components/auth/sign_in_container.dart';
import 'package:user_app/presentation/components/auth/sign_up_container.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class NonCustodialActions extends HookConsumerWidget {
  const NonCustodialActions({
    required this.platformType,
    Key? key,
  }) : super(key: key);

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(nonCustodialStateProvider);

    return Padding(
      padding: EdgeInsets.only(
        bottom: 61.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
            visible: (progress == NonCustodialState.wCLoader ||
                    progress == NonCustodialState.error ||
                    progress == NonCustodialState.thanks ||
                    progress == NonCustodialState.send)
                ? false
                : true,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 25.w,
              ),
              child: ExchangeContainer(
                platformType: platformType,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 0,
                tabletValue: 0,
                mobileValue: 10.w,
              ),
              right: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 0,
                tabletValue: 0,
                mobileValue: 10.w,
              ),
            ),
            child: Visibility(
              visible:
                  progress == NonCustodialState.authentication ? true : false,
              child: ref.watch(authControllerStateProvider) == AuthState.signUp
                  ? SignUpContainer(
                      platformType: platformType,
                      signUpWithNonCustodial: true,
                    )
                  : SignInContainer(
                      loginWithNonCustodial: true,
                      platformType: platformType,
                    ),
            ),
          ),
          Visibility(
            visible:
                progress == NonCustodialState.walletConnected ? true : false,
            child: const ConfirmExchangeWeb(),
          ),
          Visibility(
            visible: progress != NonCustodialState.authentication &&
                    progress == NonCustodialState.receive
                ? true
                : false,
            child: GetAddressWeb(
              platformType: platformType,
            ),
          ),
          Visibility(
            visible: progress == NonCustodialState.send ? true : false,
            child: SendingAddressDetails(platformType: platformType),
          ),
          Visibility(
            visible: progress == NonCustodialState.wCLoader ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 25.h,
              ),
              child: const RequestSuccessfullySubmittedWeb(),
            ),
          ),
          Visibility(
            visible: progress == NonCustodialState.error ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 25.h,
              ),
              child: const ExchangeFailedWeb(),
            ),
          ),
          Visibility(
            visible: progress == NonCustodialState.thanks ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: platformType == PlatformTypeState.web ? 25.h : 180.h,
              ),
              child: ThanksComponentWeb(platformType: platformType),
            ),
          ),
        ],
      ),
    );
  }
}
