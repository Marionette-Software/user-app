import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_payment_interface.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_notifier.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_receive_state_provider.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_payment_interface.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_receive_data.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/non_custodial_exchange/non_custodial_exchange_service.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/decoration_non_custodial_form.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/get_address/components/choose_pi.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/important_box_component.dart';
import 'package:user_app/presentation/components/custom_text_input.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class GetAddressWeb extends HookConsumerWidget {
  const GetAddressWeb({
    required this.platformType,
    Key? key,
  }) : super(key: key);

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);
    final currencyStateRead =
        ref.read(nonCustodialCurrenciesStateNotifierProvider.notifier);
    final paymentInterfaceRead =
        ref.read(nonCustodialPaymentInterfaceNotifierProvider.notifier);
    final paymentInterfaceWatch =
        ref.watch(nonCustodialPaymentInterfaceNotifierProvider);
    final receiveStateRead =
        ref.read(nonCustodialReceiveNotifierProvider.notifier);
    final progressState = ref.read(nonCustodialStateProvider.notifier);
    final progressIndexRead =
        ref.read(nonCustodialProgressStateProvider.notifier);

    final loaderState = useState(LoadState.notLoading);

    final addressController = useTextEditingController();

    INonCustodialExchangeService service = NonCustodialExchangeService();
    List<NonCustodialPaymentInterfacesState> sendPaymentInterface = [];

    useEffect(() {
      if (currencyStateWatch.receivePaymentInterface.isNotEmpty) {
        paymentInterfaceRead
            .updateInterface(currencyStateWatch.receivePaymentInterface[0]);
      }
      return null;
    }, []);

    return currencyStateWatch.markets.isEmpty
        ? const SizedBox()
        : Form(
            key: formKey,
            child: DecorationNonCustodialForm(
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
                    webValue: 25,
                    tabletValue: 25,
                    mobileValue: 21,
                  ).h,
                  bottom: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 50,
                    tabletValue: 50,
                    mobileValue: 30,
                  ).h,
                  left: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 21,
                    tabletValue: 21,
                    mobileValue: 15,
                  ).w,
                  right: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 21,
                    tabletValue: 21,
                    mobileValue: 15,
                  ).w,
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
                            webValue: 35,
                            tabletValue: 36,
                            mobileValue: 26,
                          ).h,
                          child: AutoSizeText(
                            tr('non_custodial_exchange.receive'),
                            minFontSize: 3,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
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
                            webValue: 11,
                            tabletValue: 15,
                            mobileValue: 9,
                          ).w,
                        ),
                        UserAppImage(
                          clipBehavior: Clip.hardEdge,
                          path: currencyStateWatch.selectedToCurrency.iconUrl,
                          isNetwork: true,
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
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 15.h,
                        bottom: 15.h,
                      ),
                      child: ChoosePi(
                        platformType: platformType,
                      ),
                    ),
                    ImportantBoxComponent(
                      platformType: platformType,
                      title: tr('non_custodial_exchange.important'),
                      description:
                          '${tr('wallet.enter_only')} ${'${currencyStateWatch.selectedToCurrency.id.toUpperCase()} ${paymentInterfaceWatch.title} ${tr('wallet.network')} (${paymentInterfaceWatch.subtitle})'} ${tr('wallet.for_withdrawal')}',
                      height: 116.h,
                    ),
                    SizedBox(
                      height: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 25,
                        tabletValue: 18,
                        mobileValue: 15,
                      ).h,
                    ),
                    CustomInputWidget(
                      platformType: platformType,
                      controller: addressController,
                      hintText:
                          tr('non_custodial_exchange.enter_blockchain_address'),
                      onValidate: (text) {
                        if (text!.isEmpty) {
                          final snackBar = SnackBar(
                            elevation: 0,
                            clipBehavior: Clip.none,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              titleFontSize: 30.sp,
                              messageFontSize: 20.sp,
                              title: tr('snack_bar_message.errors.error'),
                              message: tr(
                                  'snack_bar_message.errors.blockchain_address_validation'),
                              contentType: ContentType.failure,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);

                          return '';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 25,
                        tabletValue: 15,
                        mobileValue: 15,
                      ).h,
                    ),
                    loaderState.value == LoadState.loading
                        ? const CircularProgressIndicator()
                        : MainButton(
                            onTap: () async {
                              if (receiveStateRead.state.amountFrom.isEmpty ||
                                  receiveStateRead.state.amountFrom == '') {
                                final snackBar = SnackBar(
                                  elevation: 0,
                                  clipBehavior: Clip.none,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    titleFontSize: 30.sp,
                                    messageFontSize: 20.sp,
                                    title: tr('snack_bar_message.errors.error'),
                                    message: tr(
                                        'snack_bar_message.errors.please_enter_amount'),
                                    contentType: ContentType.failure,
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);
                              } else {
                                if (formKey.currentState!.validate()) {
                                  loaderState.value = LoadState.loading;

                                  var res = await service.createRecipient(
                                    paymentInterfaceId:
                                        paymentInterfaceWatch.id,
                                    currencyId: currencyStateWatch
                                        .selectedToCurrency.id,
                                    data:
                                        '{"address":"${addressController.text}"}',
                                    description: '',
                                  );
                                  if (res is String) {
                                    receiveStateRead.updateReceiveState(
                                      NonCustodialReceiveDataState(
                                        recipientId: res,
                                        receiveAddress: addressController.text,
                                        paymentInterfaceTitle:
                                            paymentInterfaceWatch.title,
                                        paymentInterfaceType:
                                            paymentInterfaceWatch.type,
                                        paymentInterfaceSubtitle:
                                            paymentInterfaceWatch.subtitle,
                                        amountFrom:
                                            receiveStateRead.state.amountFrom,
                                        amountTo:
                                            receiveStateRead.state.amountTo,
                                      ),
                                    );

                                    for (var element
                                        in currencyStateWatch.currencies) {
                                      if (element.id ==
                                          currencyStateWatch
                                              .selectedFromCurrency.id) {
                                        for (var p0
                                            in element.paymentInterfaces) {
                                          sendPaymentInterface.add(
                                            NonCustodialPaymentInterfacesState(
                                              id: p0!.paymentInterface!.id!,
                                              title:
                                                  p0.paymentInterface!.title!,
                                              logoUrl:
                                                  p0.paymentInterface!.logoUrl!,
                                              subtitle: p0
                                                  .paymentInterface!.subtitle!,
                                              type: p0.type!,
                                            ),
                                          );
                                        }
                                      }

                                      currencyStateRead
                                          .updateSendPaymentInterface(
                                              sendPaymentInterface);

                                      if (sendPaymentInterface.isNotEmpty) {
                                        paymentInterfaceRead.updateInterface(
                                            sendPaymentInterface.first);
                                      } else {
                                        paymentInterfaceRead.updateInterface(
                                          const NonCustodialPaymentInterfacesState(
                                            id: '',
                                            title: '',
                                            logoUrl: '',
                                            subtitle: '',
                                            type: '',
                                          ),
                                        );
                                      }
                                    }

                                    loaderState.value = LoadState.notLoading;
                                    progressState.state =
                                        NonCustodialState.send;

                                    progressIndexRead.state++;
                                  } else if (res is GraphQlError) {
                                    loaderState.value = LoadState.notLoading;

                                    final snackBar = SnackBar(
                                      elevation: 0,
                                      clipBehavior: Clip.none,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        titleFontSize: 30.sp,
                                        messageFontSize: 20.sp,
                                        title: tr(
                                            'snack_bar_message.errors.error'),
                                        message: tr(
                                            'snack_bar_message.errors.${res.message}'),
                                        contentType: ContentType.failure,
                                      ),
                                    );

                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);
                                  }
                                }
                              }
                            },
                            text: tr('non_custodial_exchange.next_step'),
                            height: getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 60,
                              tabletValue: 45,
                              mobileValue: 35,
                            ).h,
                            fontSize: getSizeFromPlatformType(
                              platformType: platformType,
                              webValue: 20,
                              tabletValue: 15,
                              mobileValue: 13,
                            ),
                            color: Theme.of(context).primaryColorLight,
                          ),
                  ],
                ),
              ),
            ),
          );
  }
}
