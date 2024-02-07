import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_notifier.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_receive_state_provider.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/exchange/components/exchange_box/components/exchange_info_row/components/exchange_info.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/decoration_non_custodial_form.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/sending_address_details/components/result_row_with_address.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class ReceiveContainerDetails extends HookConsumerWidget {
  const ReceiveContainerDetails({
    required this.platformType,
    super.key,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiveStateWatch = ref.watch(nonCustodialReceiveNotifierProvider);
    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);
    final progressState = ref.read(nonCustodialStateProvider.notifier);
    final progressIndexRead =
        ref.read(nonCustodialProgressStateProvider.notifier);

    return DecorationNonCustodialForm(
      width: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 600,
        tabletValue: 475,
        mobileValue: 300,
      ).w,
      platformType: platformType,
      content: Padding(
        padding: EdgeInsets.only(
          top: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 28,
            tabletValue: 25,
            mobileValue: 15,
          ).h,
          left: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 25,
            tabletValue: 25,
            mobileValue: 15,
          ).w,
          right: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 25,
            tabletValue: 25,
            mobileValue: 15,
          ).w,
          bottom: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 32,
            tabletValue: 25,
            mobileValue: 13,
          ).h,
        ),
        child: Column(
          children: [
            ResultRowWithAddress(
              platformType: platformType,
              iconUrl: currencyStateWatch.selectedToCurrency.iconUrl,
              title: '${tr('non_custodial_exchange.receive')}:',
              address: receiveStateWatch.receiveAddress,
              value:
                  '${receiveStateWatch.amountTo.split(' ')[1]} ${currencyStateWatch.selectedToCurrency.id.toUpperCase()}',
              toAddressTitle:
                  '${tr('non_custodial_exchange.to')} ${receiveStateWatch.paymentInterfaceType != 'coin' ? receiveStateWatch.paymentInterfaceSubtitle.toUpperCase() : receiveStateWatch.paymentInterfaceSubtitle.split(' ').sublist(1, receiveStateWatch.paymentInterfaceSubtitle.split(' ').length).join(' ').toUpperCase()} address',
            ),
            SizedBox(
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 25,
                tabletValue: 25,
                mobileValue: 19,
              ).h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 21,
                  tabletValue: 15,
                  mobileValue: 10,
                ).w,
              ),
              child: ExchangeInfo(
                platformType: platformType,
              ),
            ),
            SizedBox(
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 20,
                tabletValue: 15,
                mobileValue: 10,
              ).h,
            ),
            MainButton(
              onTap: () {
                progressState.state = NonCustodialState.receive;
                progressIndexRead.state = 2;
              },
              text: tr('non_custodial_exchange.previous_step'),
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 60,
                tabletValue: 45,
                mobileValue: 35,
              ).h,
              color: Theme.of(context).primaryColorLight,
              fontSize: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 20,
                tabletValue: 18,
                mobileValue: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
