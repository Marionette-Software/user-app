import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:user_app/application/non_custodial/init_non_custodial_classic_future_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_payment_interface.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_notifier.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_receive_state_provider.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/non_custodial_exchange/init_non_custodial_exchange_classic_state.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/important_box_component.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ContainerWithQrCode extends HookConsumerWidget {
  const ContainerWithQrCode({
    required this.platformType,
    super.key,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiveStateWatch = ref.watch(nonCustodialReceiveNotifierProvider);
    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);

    final paymentInterfaceWatch =
        ref.watch(nonCustodialPaymentInterfaceNotifierProvider);
    final progressState = ref.read(nonCustodialStateProvider.notifier);
    final progressIndexRead =
        ref.read(nonCustodialProgressStateProvider.notifier);

    final initNonCustodialClassicFuture = ref.watch(
      initNonCustodialClassicFutureProvider(
        InitNonCustodialExchangeClassicState(
          inCurrencyId: currencyStateWatch.selectedFromCurrency.id,
          inPaymentInterfaceId: paymentInterfaceWatch.id,
          recipientId: receiveStateWatch.recipientId,
          amount: receiveStateWatch.amountFrom.isEmpty
              ? 1.0
              : double.parse(receiveStateWatch.amountFrom),
        ),
      ),
    );
    var activeCopyBtn = useState(false);

    return Padding(
      padding: EdgeInsets.only(
        top: 15.h,
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
      child: initNonCustodialClassicFuture.when(
        data: (data) {
          final res = data.data!.initNonCustodialExchange;

          if (data is GraphQlError || res == null) {
            return const SizedBox();
          } else {
            return Column(
              children: [
                ImportantBoxComponent(
                  platformType: platformType,
                  title: tr('non_custodial_exchange.important'),
                  description:
                      '${tr('wallet.send_only')} ${'${currencyStateWatch.selectedFromCurrency.id.toUpperCase()} ${paymentInterfaceWatch.title} ${tr('wallet.network')} (${paymentInterfaceWatch.subtitle})'} ${tr('wallet.for_deposit')}',
                  height: 116,
                ),
                SizedBox(
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 25,
                    tabletValue: 25,
                    mobileValue: 15,
                  ).h,
                ),
                SizedBox(
                  width: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 184,
                    tabletValue: 130,
                    mobileValue: 120,
                  ).w,
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 184,
                    tabletValue: 130,
                    mobileValue: 120,
                  ).h,
                  child: QrImageView(
                    data: res.encodedAddress!,
                    gapless: true,
                    foregroundColor: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 25,
                    tabletValue: 15,
                    mobileValue: 8,
                  ).h,
                ),
                SizedBox(
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 18,
                    tabletValue: 18,
                    mobileValue: 15,
                  ).h,
                  child: AutoSizeText(
                    '${tr('non_custodial_exchange.scan_or_copy_the_address_below_to_send')} ${currencyStateWatch.selectedFromCurrency.id.toUpperCase()}: ${paymentInterfaceWatch.subtitle.toUpperCase()}',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 15,
                            tabletValue: 15,
                            mobileValue: 13,
                          ),
                          color: stepColor,
                        ),
                    textAlign: TextAlign.center,
                    maxFontSize: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 15,
                      tabletValue: 15,
                      mobileValue: 13,
                    ),
                    minFontSize: 3,
                  ),
                ),
                SizedBox(
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 25,
                    tabletValue: 25,
                    mobileValue: 10,
                  ).h,
                ),
                Container(
                  width: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 550,
                    tabletValue: 425,
                    mobileValue: 270,
                  ).w,
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 60,
                    tabletValue: 60,
                    mobileValue: 50,
                  ).h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 10,
                        tabletValue: 10,
                        mobileValue: 5,
                      ),
                    ),
                    color:
                        isLightTheme(context) ? cardColor : Colors.transparent,
                    border: Border.all(
                      color: isLightTheme(context)
                          ? cardColor
                          : Theme.of(context).primaryColor.withOpacity(0.25),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 26,
                        tabletValue: 15,
                        mobileValue: 11,
                      ).w,
                      right: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 26,
                        tabletValue: 15,
                        mobileValue: 11,
                      ).w,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 10.h,
                            ),
                            child: SizedBox(
                              height: getSizeFromPlatformType(
                                platformType: platformType,
                                webValue: 35,
                                tabletValue: 30,
                                mobileValue: 24,
                              ).h,
                              child: AutoSizeText(
                                res.address != 'Address (setter): n/a'
                                    ? res.address!.split(':')[1].isEmpty
                                        ? '--------------------'
                                        : '${res.address!.split(':')[1].replaceRange(15, res.address!.split(':')[1].length - 15, '......')} '
                                    : 'N/A',
                                maxFontSize: getSizeFromPlatformType(
                                  platformType: platformType,
                                  webValue: 30,
                                  tabletValue: 30,
                                  mobileValue: 20,
                                ),
                                minFontSize: 10,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: getSizeFromPlatformType(
                                    platformType: platformType,
                                    webValue: 30,
                                    tabletValue: 30,
                                    mobileValue: 20,
                                  ),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 20,
                            tabletValue: 18,
                            mobileValue: 16,
                          ).w,
                        ),
                        res.address!.split(':')[1].isEmpty
                            ? const SizedBox()
                            : Padding(
                                padding: EdgeInsets.only(
                                  top: 2.h,
                                ),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      activeCopyBtn.value = true;
                                      Clipboard.setData(
                                        ClipboardData(
                                          text: res.address!.split(':')[1],
                                        ),
                                      );
                                      final snackBar = SnackBar(
                                        elevation: 0,
                                        clipBehavior: Clip.none,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          titleFontSize: 30.sp,
                                          messageFontSize: 20.sp,
                                          title: tr(
                                              'snack_bar_message.success.success'),
                                          message: tr(
                                              'snack_bar_message.success.copied'),
                                          contentType: ContentType.success,
                                        ),
                                      );

                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(snackBar);
                                    },
                                    child: Icon(
                                      Icons.copy,
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 25,
                    tabletValue: 15,
                    mobileValue: 15,
                  ).w.h,
                ),
                MainButton(
                  onTap: activeCopyBtn.value
                      ? () {
                          progressIndexRead.state++;
                          progressState.state = NonCustodialState.thanks;
                        }
                      : null,
                  text: tr('non_custodial_exchange.ok'),
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
            );
          }
        },
        error: (error, _) {
          return UserAppError(errorMessage: error.toString());
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
