import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_future_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_exchange_rate_state_notifier.dart';
import 'package:user_app/domain/exchange/non_custodial_exchange_rate.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/app/exchange/components/exchange_box/components/container_with_input.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/rate_convert/non_custodial_convert.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ExchangeBox extends HookConsumerWidget {
  const ExchangeBox({
    super.key,
    required this.enabledNonCustodialWalletConnect,
    required this.platformType,
  });

  final bool enabledNonCustodialWalletConnect;
  final PlatformTypeState platformType;
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshValue = useState(1);

    final fromValueController = useTextEditingController(text: '1');
    final toValueController = useTextEditingController(text: '');

    final currenciesFuture = ref.watch(
      getNonCustodialCurrenciesFutureProvider(
        RefreshRequest(refresh: '$refreshValue'),
      ),
    );

    final currencyStateWatch =
        ref.watch(nonCustodialCurrenciesStateNotifierProvider);

    useEffect(() {
      if (refreshValue.value == 0) {
        refreshValue.value++;
      }
      return null;
    }, []);

    return Form(
      key: formKey,
      child: Container(
        width: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 600.w,
          tabletValue: 475.w,
          mobileValue: 300.w,
        ),
        height: getSizeFromPlatformType(
          platformType: platformType,
          webValue: (enabledNonCustodialWalletConnect ? 560 : 480).h,
          tabletValue: 467.h,
          mobileValue: 350.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getSizeFromPlatformType(
              platformType: platformType,
              webValue: 10,
              tabletValue: 5,
              mobileValue: 5,
            ),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              isLightTheme(context)
                  ? AppColors.whiteColorText
                  : AppColors.backgroundFormColor.withOpacity(0.9),
              isLightTheme(context)
                  ? AppColors.whiteColorText
                  : AppColors.backgroundFormColor.withOpacity(0.8),
            ],
          ),
          border: Border.all(
            color: AppColors.whiteColorText.withOpacity(0.25),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColorLight.withOpacity(0.5),
              spreadRadius: 10,
              blurRadius: 140,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: currenciesFuture.when(
          data: (data) {
            String getMinAmount() {
              String minAmount = '0';

              for (var element in currencyStateWatch.currencies) {
                if (element.id == currencyStateWatch.selectedFromCurrency.id) {
                  for (var e0 in element.markets) {
                    if (e0!.id ==
                        currencyStateWatch.selectedToCurrency.marketId) {
                      if (e0.base_currency_id ==
                          currencyStateWatch.selectedFromCurrency.id) {
                        minAmount = e0.minBaseCurrencyAmount!
                            .toStringAsFixed(e0.base_currency!.precision!);
                      } else {
                        minAmount = e0.minQuoteCurrencyAmount!
                            .toStringAsFixed(e0.quote_currency!.precision!);
                      }
                    }
                  }
                }
              }

              return minAmount;
            }

            fromValueController.text =
                (double.parse(getMinAmount()) * 10).toString();
            var convertedValue = nonCustodialSwap(
              market: currencyStateWatch.activeMarket,
              currencyFrom: currencyStateWatch.selectedFromCurrency.id,
              currencyTo: currencyStateWatch.selectedToCurrency.id,
              amount: double.parse(fromValueController.text),
            );
            toValueController.text =
                '≈ ${convertedValue.toStringAsFixed(currencyStateWatch.selectedToCurrency.precision)}';
            Future<void> updateRate() async {
              ref
                  .read(nonCustodialRateStateNotifierProvider.notifier)
                  .updateData(
                    NonCustodialExchangeRate(
                      currencyTo: currencyStateWatch.selectedToCurrency.id,
                      currencyFrom: currencyStateWatch.selectedFromCurrency.id,
                      rate: convertedValue /
                          double.parse(fromValueController.text),
                    ),
                  );
            }

            return FutureBuilder(
              future: updateRate(),
              builder: (context, _) {
                return ContainerWithInput(
                  platformType: platformType,
                  toValueController: toValueController,
                  fromValueController: fromValueController,
                  data: data,
                  enabledNonCustodialWalletConnect: enabledNonCustodialWalletConnect,
                  getMinAmount: getMinAmount,
                );
              },
            );
          },
          error: (error, _) {
            return UserAppError(
              errorMessage: error.toString(),
            );
          },
          loading: () => const MainLoader(),
        ),
      ),
    );
  }
}
