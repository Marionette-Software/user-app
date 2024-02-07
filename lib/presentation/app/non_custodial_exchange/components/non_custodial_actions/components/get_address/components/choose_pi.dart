import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_payment_interface.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/get_address/components/button_with_icon.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class ChoosePi extends HookConsumerWidget {
  const ChoosePi({
    required this.platformType,
    super.key,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressController = useTextEditingController();

    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);

    final paymentInterfaceRead =
        ref.read(nonCustodialPaymentInterfaceNotifierProvider.notifier);
    final paymentInterfaceWatch =
        ref.watch(nonCustodialPaymentInterfaceNotifierProvider);

    return currencyStateWatch.receivePaymentInterface.length == 1 ||
            currencyStateWatch.receivePaymentInterface.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 19,
                    tabletValue: 15,
                    mobileValue: 13,
                  ).h,
                ),
                child: SizedBox(
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 20,
                    tabletValue: 18,
                    mobileValue: 13,
                  ).h,
                  child: AutoSizeText(
                    tr('non_custodial_exchange.select_network_for_transaction'),
                    maxFontSize: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 20,
                      tabletValue: 15,
                      mobileValue: 13,
                    ),
                    minFontSize: 5,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 20,
                            tabletValue: 15,
                            mobileValue: 13,
                          ),
                        ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 600,
                  tabletValue: 475,
                  mobileValue: 300,
                ).w,
                child: SingleChildScrollView(
                  child: Wrap(
                    runSpacing: 10,
                    spacing: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 12,
                      tabletValue: 10,
                      mobileValue: 0,
                    ).w,
                    alignment: WrapAlignment.center,
                    children: List.generate(
                      currencyStateWatch.receivePaymentInterface.length,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 5.w,
                            right: 5.w,
                            bottom: 10.h,
                          ),
                          child: Container(
                            width: getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 165,
                              tabletValue: 136,
                              mobileValue: 75,
                            ).w,
                            height: getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 60,
                              tabletValue: 45,
                              mobileValue: 35,
                            ).h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                getSizeFromPlatformType(
                                  platformType: platformType,
                                  webValue: 10,
                                  tabletValue: 10,
                                  mobileValue: 5,
                                ),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                addressController.clear();
                                paymentInterfaceRead.updateInterface(
                                  currencyStateWatch
                                      .receivePaymentInterface[index],
                                );
                              },
                              child: ButtonWithIcon(
                                platformType: platformType,
                                title: currencyStateWatch
                                    .receivePaymentInterface[index].title
                                    .split(' ')[0],
                                iconUrl: currencyStateWatch
                                    .receivePaymentInterface[index].logoUrl,
                                isActive: currencyStateWatch
                                            .receivePaymentInterface[index]
                                            .id ==
                                        paymentInterfaceWatch.id
                                    ? true
                                    : false,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
