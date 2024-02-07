import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_payment_interface.dart';
import 'package:user_app/application/non_custodial/non_custodial_receive_state_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/decoration_non_custodial_form.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/get_address/components/button_with_icon.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/sending_address_details/components/container_with_qr_code.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class SendContainerDetails extends HookConsumerWidget {
  const SendContainerDetails({
    required this.platformType,
    super.key,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiveStateWatch = ref.watch(nonCustodialReceiveNotifierProvider);
    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);
    final paymentInterfaceRead =
        ref.read(nonCustodialPaymentInterfaceNotifierProvider.notifier);
    final paymentInterfaceWatch =
        ref.watch(nonCustodialPaymentInterfaceNotifierProvider);

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
            webValue: 22,
            tabletValue: 27,
            mobileValue: 19,
          ).h,
          bottom: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 50,
            tabletValue: 50,
            mobileValue: 30,
          ).h,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 30,
                    tabletValue: 36,
                    mobileValue: 24,
                  ).h,
                  child: AutoSizeText(
                    '${tr('non_custodial_exchange.send')} ${double.parse(receiveStateWatch.amountFrom).toStringAsFixed(currencyStateWatch.selectedFromCurrency.precision)} ${currencyStateWatch.selectedFromCurrency.id.toUpperCase()}',
                    minFontSize: 3,
                    maxFontSize: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 30,
                      tabletValue: 30,
                      mobileValue: 20,
                    ),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 30,
                            tabletValue: 30,
                            mobileValue: 20,
                          ),
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 16,
                    tabletValue: 15,
                    mobileValue: 6,
                  ).w,
                ),
                UserAppImage(
                  clipBehavior: Clip.hardEdge,
                  path: currencyStateWatch.selectedFromCurrency.iconUrl,
                  width: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 48,
                    tabletValue: 40,
                    mobileValue: 25,
                  ).w,
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 48,
                    tabletValue: 40,
                    mobileValue: 25,
                  ).h,
                  isNetwork: true,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                left: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 21,
                  tabletValue: 25,
                  mobileValue: 15,
                ).w,
                right: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 21,
                  tabletValue: 25,
                  mobileValue: 15,
                ).w,
              ),
              child: currencyStateWatch.sendPaymentInterfaces.length == 1
                  ? const SizedBox()
                  : Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 19,
                              tabletValue: 25,
                              mobileValue: 10,
                            ).h,
                          ),
                          child: SizedBox(
                            height: getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 20,
                              tabletValue: 18,
                              mobileValue: 16,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
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
                                currencyStateWatch.sendPaymentInterfaces.length,
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
                                          paymentInterfaceRead.updateInterface(
                                            currencyStateWatch
                                                .sendPaymentInterfaces[index],
                                          );
                                        },
                                        child: ButtonWithIcon(
                                          platformType: platformType,
                                          title: currencyStateWatch
                                              .sendPaymentInterfaces[index]
                                              .title
                                              .split(' ')[0],
                                          iconUrl: currencyStateWatch
                                              .sendPaymentInterfaces[index]
                                              .logoUrl,
                                          isActive: currencyStateWatch
                                                      .sendPaymentInterfaces[
                                                          index]
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
                    ),
            ),
            ContainerWithQrCode(
              platformType: platformType,
            )
          ],
        ),
      ),
    );
  }
}
