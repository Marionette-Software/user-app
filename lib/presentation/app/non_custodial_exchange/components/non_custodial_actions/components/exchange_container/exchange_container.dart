import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/actions/non_custodial_actions.dart';
import 'package:user_app/application/non_custodial/main_data_non_custodial_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_future_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/decoration_non_custodial_form.dart';
import 'package:user_app/presentation/app/exchange/components/exchange_box/components/exchange_field.dart';
import 'package:user_app/presentation/app/exchange/components/exchange_box/components/exchange_field_to.dart';
import 'package:user_app/presentation/app/exchange/components/exchange_box/components/exchange_info_row/exchange_info_row.dart';
import 'package:user_app/presentation/app/exchange/components/exchange_box/components/wallet_connect_row.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class ExchangeContainer extends HookConsumerWidget {
  const ExchangeContainer({
    super.key,
    this.enabledNonCustodialWalletConnect,
    required this.platformType,
  });

  final bool? enabledNonCustodialWalletConnect;

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshValue = useState(1);

    bool enabledNonCustodialWalletConnect = false;

    Future<void> getGlobalConfig() async {
      var box = Hive.box<GlobalConfigData>(Constants.globalConfig);

      GlobalConfigData globalData = box.getAt(0)!;

      enabledNonCustodialWalletConnect = globalData.enabledNonCustodialWalletConnect;
    }

    useEffect(() {
      if (refreshValue.value == 0) {
        refreshValue.value++;
      }
      return null;
    }, []);

    final currenciesFuture = ref.watch(
      getNonCustodialCurrenciesFutureProvider(
        RefreshRequest(refresh: '$refreshValue'),
      ),
    );

    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);
    final mainDataNonCustodialWatch =
        ref.watch(mainDataNonCustodialNotifierProvider);

    var fromValueController = useTextEditingController(
      text: mainDataNonCustodialWatch.fromAmount ?? '1',
    );
    var toValueController = useTextEditingController(text: '');

    return Column(
      children: [
        DecorationNonCustodialForm(
          width: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 600.w,
            tabletValue: 475.w,
            mobileValue: 300.w,
          ),
          platformType: platformType,
          content: Padding(
            padding: EdgeInsets.only(
              left: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 25.w,
                tabletValue: 25.w,
                mobileValue: 15.w,
              ),
              right: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 25.w,
                tabletValue: 25.w,
                mobileValue: 15.w,
              ),
              top: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 25.h,
                tabletValue: 25.h,
                mobileValue: 15.h,
              ),
              bottom: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 25.h,
                tabletValue: 25.h,
                mobileValue: 15.h,
              ),
            ),
            child: currenciesFuture.when(
              data: (data) {
                NonCustodialActionsGeneral nonCustodialActions =
                    NonCustodialActionsGeneral();

                String minAmount = nonCustodialActions.getMinAmount(ref: ref);

                return FutureBuilder(
                  future: nonCustodialActions.updateRate(
                    ref: ref,
                    toValueController: toValueController,
                    fromValueController: fromValueController,
                  ),
                  builder: (context, _) {
                    return Column(
                      children: [
                        ExchangeField(
                          controller: fromValueController,
                          precision:
                              currencyStateWatch.selectedFromCurrency.precision,
                          platformType: platformType,
                          onChanged: (String value) {
                            nonCustodialActions.fromOnChangeInput(
                              fromValueController: fromValueController,
                              toValueController: toValueController,
                              ref: ref,
                              value: value,
                            );
                          },
                          items: currencyStateWatch.currencies,
                          dropdownOnChanged: (value) {
                            nonCustodialActions.fromDropdownInput(
                              data: data,
                              fromValueController: fromValueController,
                              toValueController: toValueController,
                              ref: ref,
                              value: value,
                            );
                          },
                          oppositeController: toValueController,
                          title:
                              '${tr('non_custodial_exchange.send')} (${tr('non_custodial_exchange.min')} $minAmount ${currencyStateWatch.selectedFromCurrency.id.toUpperCase()})',
                        ),
                        ExchangeInfoRow(
                          fromValueController: fromValueController,
                          toValueController: toValueController,
                          data: data,
                          platformType: platformType,
                        ),
                        ExchangeFieldTo(
                          precision:
                              currencyStateWatch.selectedToCurrency.precision,
                          platformType: platformType,
                          onChanged: (String value) {},
                          items: currencyStateWatch.markets,
                          dropdownOnChanged: (value) {
                            nonCustodialActions.toDropdownInput(
                              fromValueController: fromValueController,
                              ref: ref,
                              data: data,
                              value: value,
                            );
                          },
                          oppositeController: fromValueController,
                          title: '${tr('non_custodial_exchange.receive')}:',
                          controller: toValueController,
                        ),
                        FutureBuilder(
                          future: getGlobalConfig(),
                          builder: (context, _) {
                            return enabledNonCustodialWalletConnect
                                ? WalletConnectRow(
                                    platformType: platformType,
                                  )
                                : const SizedBox();
                          },
                        )
                      ],
                    );
                  },
                );
              },
              error: (error, stacktrace) {
                return UserAppError(
                  errorMessage: error.toString(),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
