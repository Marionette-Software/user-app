import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/non_custodial_currencies_state_provider.dart';
import 'package:user_app/application/non_custodial/non_custodial_exchange_rate_state_notifier.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class ExchangeInfo extends HookConsumerWidget {
  const ExchangeInfo({
    this.platformType = PlatformTypeState.web,
    Key? key,
  }) : super(key: key);

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var reversedRate = useState(false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 10.w,
                tabletValue: 8.w,
                mobileValue: 5.w,
              ),
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 10.h,
                tabletValue: 8.h,
                mobileValue: 5.h,
              ),
              decoration: const BoxDecoration(
                color: iconColor,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 9.w,
                tabletValue: 5.w,
                mobileValue: 6.w,
              ),
            ),
            SizedBox(
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 18.h,
                tabletValue: 16.h,
                mobileValue: 12.h,
              ),
              child: AutoSizeText(
                tr('non_custodial_exchange.exchange_fee_zero'),
                maxFontSize: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 15,
                  tabletValue: 14,
                  mobileValue: 10,
                ),
                minFontSize: 5,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 15,
                        tabletValue: 14,
                        mobileValue: 10,
                      ),
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 10.w,
                tabletValue: 8.w,
                mobileValue: 5.w,
              ),
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 10.h,
                tabletValue: 8.h,
                mobileValue: 5.h,
              ),
              decoration: const BoxDecoration(
                color: iconColor,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 9.w,
                tabletValue: 8.w,
                mobileValue: 6.w,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 18.h,
                    tabletValue: 16.h,
                    mobileValue: 12.h,
                  ),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final currencyStateWatch = ref
                          .watch(nonCustodialCurrenciesStateNotifierProvider);
                      return AutoSizeText(
                        tr('non_custodial_exchange.estimated_rate') +
                            (reversedRate.value
                                ? ' ${currencyStateWatch.selectedFromCurrency.id.toUpperCase()}'
                                : ' ${currencyStateWatch.selectedToCurrency.id.toUpperCase()}'),
                        maxFontSize: getSizeFromPlatformType(
                          platformType: platformType,
                          webValue: 15,
                          tabletValue: 14,
                          mobileValue: 10,
                        ),
                        minFontSize: 5,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: getSizeFromPlatformType(
                                platformType: platformType,
                                webValue: 15,
                                tabletValue: 14,
                                mobileValue: 10,
                              ),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                            ),
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    reversedRate.value = !reversedRate.value;
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                    ),
                    child: SvgPicture.asset(
                      swapIconRateInWallet,
                      width: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 20.w,
                        tabletValue: 16.w,
                        mobileValue: 12.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getSizeFromPlatformType(
                    platformType: platformType,
                    webValue: 18.h,
                    tabletValue: 16.h,
                    mobileValue: 12.h,
                  ),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final currencyStateWatch = ref
                          .watch(nonCustodialCurrenciesStateNotifierProvider);

                      final exchangeRateData =
                          ref.watch(nonCustodialRateStateNotifierProvider);

                      return reversedRate.value
                          ? AutoSizeText(
                              ' ${(exchangeRateData.rate.toStringAsFixed((exchangeRateData.currencyFrom.toUpperCase()) == currencyStateWatch.activeMarket.base_currency!.id!.toUpperCase() ? currencyStateWatch.activeMarket.swapBaseToQuotePricePrecision! : currencyStateWatch.activeMarket.swapQuoteToBasePricePrecision!))} ${(exchangeRateData.currencyTo.toUpperCase())}',
                              maxFontSize: getSizeFromPlatformType(
                                platformType: platformType,
                                webValue: 15,
                                tabletValue: 14,
                                mobileValue: 10,
                              ),
                              minFontSize: 5,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontSize: getSizeFromPlatformType(
                                      platformType: platformType,
                                      webValue: 15,
                                      tabletValue: 14,
                                      mobileValue: 10,
                                    ),
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                  ),
                            )
                          : AutoSizeText(
                              ' ${(1 / exchangeRateData.rate).toStringAsFixed((exchangeRateData.currencyTo.toUpperCase()) == currencyStateWatch.activeMarket.base_currency!.id!.toUpperCase() ? currencyStateWatch.activeMarket.swapBaseToQuotePricePrecision! : currencyStateWatch.activeMarket.swapQuoteToBasePricePrecision!)} ${exchangeRateData.currencyFrom.toUpperCase()}',
                              maxFontSize: getSizeFromPlatformType(
                                platformType: platformType,
                                webValue: 15,
                                tabletValue: 14,
                                mobileValue: 10,
                              ),
                              minFontSize: 5,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontSize: getSizeFromPlatformType(
                                      platformType: platformType,
                                      webValue: 15,
                                      tabletValue: 14,
                                      mobileValue: 10,
                                    ),
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                  ),
                            );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
