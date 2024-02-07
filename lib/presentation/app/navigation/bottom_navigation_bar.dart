import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/exchange/exchange_state_provider.dart';
import 'package:user_app/application/swap/submit_button_state_provider.dart';
import 'package:user_app/application/wallets/user_balances_state_notifier.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/exchange/currency_from.dart';
import 'package:user_app/domain/exchange/exchange_rate.dart';
import 'package:user_app/domain/exchange/precision_currency_state.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/navigation_bar/bottom_navigation_index.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/presentation/app/history/mobile/history_main_mobile.dart';
import 'package:user_app/presentation/app/navigation/components/navigation_item_component.dart';
import 'package:user_app/presentation/app/profile/mobile/profile_mobile.dart';
import 'package:user_app/presentation/app/trade/mobile/trade_mobile.dart';
import 'package:user_app/presentation/app/wallets/mobile/components/wallet_mobile/components/events_with_balance_mobile/components/swap/swap_with_nav_bar.dart';
import 'package:user_app/presentation/app/wallets/mobile/wallets_mobile.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/rate_convert/swap_convert.dart';
import 'package:user_app/presentation/helpers/theme.dart';

List<CustomNavigationItem> navigationPages = [
  CustomNavigationItem(
    enabled: true,
    label: tr('app_title.wallets'),
    iconDisabled: walletTab,
    page: const WalletsMobile(),
  ),
  CustomNavigationItem(
    enabled: true,
    label: tr('app_title.trade'),
    iconDisabled: tradeTab,
    page: const TradeMobile(),
  ),
  CustomNavigationItem(
    enabled: true,
    label: tr('app_title.swap'),
    iconDisabled: swapTab,
    page: const SizedBox(),
    isPage: false,
  ),
  CustomNavigationItem(
    enabled: true,
    label: tr('app_title.history'),
    iconDisabled: historyTab,
    page: const HistoryMainPageMobile(withNavBar: true),
  ),
  CustomNavigationItem(
    enabled: true,
    label: tr('app_title.account'),
    iconDisabled: accountTab,
    page: const ProfileMobile(),
  ),
];

class CustomNavigationBar extends StatefulHookConsumerWidget {
  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
  });

  final ValueNotifier<int> selectedIndex;

  @override
  ConsumerState<CustomNavigationBar> createState() =>
      _CustomNavigationBarState();
}

class _CustomNavigationBarState extends ConsumerState<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final refreshValue = useState(1);
    final walletFuture = ref.watch(
      getWalletsFutureProvider(
        RefreshRequest(
          refresh: '$refreshValue',
        ),
      ),
    );
    final getUserBalanceFuture = ref.watch(
      getUserBalanceFutureProvider(
        RefreshRequest(
          refresh: '$refreshValue',
        ),
      ),
    );

    final exchangeDataRead = ref.read(exchangeStateNotifierProvider.notifier);
    final submitButtonSwapState =
        ref.read(submitButtonSwapStateProvider.notifier);
    final userBalances = ref.watch(userBalancesStateNotifierProvider);

    var box =
        Hive.box<BottomNavigationIndexData>(Constants.bottomNavigationIndex);

    var globalConfigBox = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = globalConfigBox.getAt(0)!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isLightTheme(context)
                ? AppColors.whiteColor
                : walletBackgroundColor,
            isLightTheme(context)
                ? AppColors.whiteColor.withOpacity(0.9)
                : walletBackgroundColor.withOpacity(0.9)
          ],
          stops: const [0, 1],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 25..h),
        child: Container(
          width: 370.w,
          height: 65..h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: isLightTheme(context)
                ? AppColors.whiteColor
                : AppColors.mainBackgroundDarkColor,
            boxShadow: [
              isLightTheme(context)
                  ? BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      spreadRadius: 10,
                      blurRadius: 20,
                      offset: const Offset(0, 3),
                    )
                  : const BoxShadow()
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 50.w,
                  icon: NavigationItemComponent(
                    item: navigationPages[0],
                    isSelected: widget.selectedIndex.value == 0,
                    leftLine: false,
                    rightLine: true,
                  ),
                  onPressed: () {
                    widget.selectedIndex.value = 0;
                    box.putAt(0, BottomNavigationIndexData(selectedIndex: 0));
                  },
                ),
                globalData.enabledTradingPage
                    ? IconButton(
                        iconSize: 50.w,
                        icon: NavigationItemComponent(
                          item: navigationPages[1],
                          isSelected: widget.selectedIndex.value == 1,
                          leftLine: false,
                          rightLine: true,
                        ),
                        onPressed: () {
                          widget.selectedIndex.value = 1;

                          box.putAt(
                              0, BottomNavigationIndexData(selectedIndex: 1));
                        },
                      )
                    : const SizedBox(),
                IconButton(
                  iconSize: 50.w,
                  icon: NavigationItemComponent(
                    item: navigationPages[2],
                    isSelected: widget.selectedIndex.value == 2,
                    leftLine: false,
                    rightLine: true,
                  ),
                  onPressed: () async {
                    var globalConfigBox =
                        Hive.box<GlobalConfigData>(Constants.globalConfig);
                    GlobalConfigData globalData = globalConfigBox.getAt(0)!;
                    walletFuture.when(
                      data: (wallets) {
                        return getUserBalanceFuture.when(
                          data: (getUserBalance) {
                            var amountTo = '0.0';
                            var amountFrom = '0.0';
                            List<Currency> listCurrencyFrom = [];
                            List<Currency> listCurrencyTo = [];

                            for (int i = 0;
                                i < wallets[0].markets.length;
                                i++) {
                              userBalances
                                  .firstWhere((element) =>
                                      element.id ==
                                      wallets[0].markets[i].base_currency.id)
                                  .advancedTradingBalance;

                              if (wallets[0]
                                      .markets[i]
                                      .enable_custodial_exchange &&
                                  (userBalances
                                          .firstWhere((element) =>
                                              element.id ==
                                              wallets[0]
                                                  .markets[i]
                                                  .base_currency
                                                  .id)
                                          .enabled &&
                                      userBalances
                                          .firstWhere((element) =>
                                              element.id ==
                                              wallets[0]
                                                  .markets[i]
                                                  .quote_currency
                                                  .id)
                                          .enabled)) {
                                if (wallets[0].id ==
                                    wallets[0].markets[i].base_currency.id) {
                                  listCurrencyTo.add(
                                    Currency(
                                      id: wallets[0]
                                          .markets[i]
                                          .quote_currency
                                          .id,
                                      name: wallets[0]
                                          .markets[i]
                                          .quote_currency
                                          .name,
                                      iconUrl: wallets[0]
                                          .markets[i]
                                          .quote_currency
                                          .icon_url,
                                      precision: wallets[0]
                                          .markets[i]
                                          .quote_currency
                                          .precision,
                                      swapQuoteToBasePricePrecision: wallets[0]
                                          .markets[i]
                                          .swapQuoteToBasePricePrecision,
                                      swapBaseToQuotePricePrecision: wallets[0]
                                          .markets[i]
                                          .swapBaseToQuotePricePrecision,
                                      minAmount: wallets[0]
                                              .markets[i]
                                              .minQuoteCurrencyAmount ??
                                          0,
                                      marketId: wallets[0].markets[i].id,
                                    ),
                                  );
                                } else {
                                  listCurrencyTo.add(
                                    Currency(
                                      id: wallets[0]
                                          .markets[i]
                                          .base_currency
                                          .id,
                                      name: wallets[0]
                                          .markets[i]
                                          .base_currency
                                          .name,
                                      iconUrl: wallets[0]
                                          .markets[i]
                                          .base_currency
                                          .icon_url,
                                      precision: wallets[0]
                                          .markets[i]
                                          .base_currency
                                          .precision,
                                      swapQuoteToBasePricePrecision: wallets[0]
                                          .markets[i]
                                          .swapQuoteToBasePricePrecision,
                                      swapBaseToQuotePricePrecision: wallets[0]
                                          .markets[i]
                                          .swapBaseToQuotePricePrecision,
                                      minAmount: wallets[0]
                                              .markets[i]
                                              .minBaseCurrencyAmount ??
                                          0,
                                      marketId: wallets[0].markets[i].id,
                                    ),
                                  );
                                }
                              }
                            }

                            wallets
                                .firstWhere(
                                    (e1) => e1.id == listCurrencyTo[0].id)
                                .markets
                                .forEach(
                              (e2) {
                                if (listCurrencyTo[0].id ==
                                    e2.base_currency.id) {
                                  listCurrencyFrom.add(
                                    Currency(
                                      id: e2.quote_currency.id,
                                      name: e2.quote_currency.name,
                                      iconUrl: e2.quote_currency.icon_url,
                                      precision: e2.quote_currency.precision,
                                      swapQuoteToBasePricePrecision:
                                          e2.swapQuoteToBasePricePrecision,
                                      swapBaseToQuotePricePrecision:
                                          e2.swapBaseToQuotePricePrecision,
                                      minAmount: e2.minQuoteCurrencyAmount ?? 0,
                                      marketId: e2.id,
                                    ),
                                  );
                                } else {
                                  listCurrencyFrom.add(
                                    Currency(
                                      id: e2.base_currency.id,
                                      name: e2.base_currency.name,
                                      iconUrl: e2.base_currency.icon_url,
                                      precision: e2.base_currency.precision,
                                      swapQuoteToBasePricePrecision:
                                          e2.swapQuoteToBasePricePrecision,
                                      swapBaseToQuotePricePrecision:
                                          e2.swapBaseToQuotePricePrecision,
                                      minAmount: e2.minBaseCurrencyAmount ?? 0,
                                      marketId: e2.id,
                                    ),
                                  );
                                }
                              },
                            );
                            int indexOfObjectToMove =
                                listCurrencyFrom.indexWhere(
                                    (element) => element.id == wallets[0].id);
                            Currency movedObject =
                                listCurrencyFrom.removeAt(indexOfObjectToMove);
                            listCurrencyFrom.insert(0, movedObject);

                            if (listCurrencyFrom.isNotEmpty &&
                                listCurrencyTo.isNotEmpty) {
                              exchangeDataRead
                                  .updateCurrencyFromList(listCurrencyFrom);
                              exchangeDataRead
                                  .updateCurrencyToList(listCurrencyTo);

                              exchangeDataRead
                                  .updateSelectedToCurrency(listCurrencyTo[0]);

                              exchangeDataRead.updateSelectedFromCurrency(
                                  listCurrencyFrom[0]);

                              exchangeDataRead.updatePrecision(
                                PrecisionCurrencyState(
                                  swapBaseToQuotePricePrecision:
                                      listCurrencyTo[0]
                                          .swapBaseToQuotePricePrecision!,
                                  swapQuoteToBasePricePrecision:
                                      listCurrencyTo[0]
                                          .swapQuoteToBasePricePrecision!,
                                ),
                                PrecisionCurrencyState(
                                  swapBaseToQuotePricePrecision:
                                      listCurrencyFrom[0]
                                          .swapBaseToQuotePricePrecision!,
                                  swapQuoteToBasePricePrecision:
                                      listCurrencyFrom[0]
                                          .swapQuoteToBasePricePrecision!,
                                ),
                              );

                              final activeMarket = wallets
                                  .firstWhere(
                                      (e1) => e1.id == listCurrencyFrom[0].id)
                                  .markets
                                  .firstWhere((e2) =>
                                      e2.id == listCurrencyFrom[0].marketId);

                              exchangeDataRead.updateActiveMarket(activeMarket);

                              amountFrom = (activeMarket.base_currency.id ==
                                          listCurrencyFrom[0].id
                                      ? activeMarket.minBaseCurrencyAmount!
                                      : activeMarket.minQuoteCurrencyAmount!)
                                  .toStringAsFixed(
                                      listCurrencyFrom[0].precision);

                              var convertedValue = swapConvert(
                                market: activeMarket,
                                currencyFrom: listCurrencyFrom[0].id,
                                currencyTo: listCurrencyTo[0].id,
                                amount: double.parse(amountFrom),
                              );

                              amountTo =
                                  '≈ ${convertedValue.toStringAsFixed(listCurrencyTo[0].precision)}';

                              var rate =
                                  (convertedValue / double.parse(amountFrom));

                              exchangeDataRead.updateRate(
                                ExchangeRate(
                                  currencyTo: listCurrencyTo[0],
                                  currencyFrom: listCurrencyFrom[0],
                                  rateWithPrecision: rate.toStringAsFixed(
                                      listCurrencyFrom[0].precision),
                                  rate: rate,
                                ),
                              );
                            }

                            if (listCurrencyFrom.isNotEmpty &&
                                listCurrencyTo.isNotEmpty) {
                              final balanceFrom = userBalances.firstWhere(
                                (element) => element.id == wallets[0].id,
                              );
                              double walletBalanceFrom =
                                  globalData.withTradingBalance
                                      ? balanceFrom.balance!
                                      : (balanceFrom.balance! +
                                          balanceFrom.advancedTradingBalance!);

                              if (double.parse(amountFrom) <=
                                  walletBalanceFrom) {
                                submitButtonSwapState.state = true;
                              } else {
                                submitButtonSwapState.state = false;
                              }

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SwapWithNavBarMobile(
                                    amountFrom: amountFrom,
                                    amountTo: amountTo,
                                  ),
                                ),
                              );
                            }
                            return Container(
                              width: 320.w,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    isLightTheme(context)
                                        ? AppColors.whiteColor
                                        : AppColors.whiteColor.withOpacity(0.1),
                                    isLightTheme(context)
                                        ? AppColors.whiteColor
                                        : AppColors.whiteColor.withOpacity(0.0),
                                  ],
                                ),
                                border: Border(
                                  top: BorderSide(
                                    width: 1.0,
                                    color: isLightTheme(context)
                                        ? Colors.transparent
                                        : AppColors.whiteColor
                                            .withOpacity(0.25),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 25.w,
                                  right: 25.w,
                                  bottom: 29.h,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    SizedBox(
                                      width: 85.w,
                                      child: Divider(
                                        color: isLightTheme(context)
                                            ? Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.1)
                                            : AppColors.whiteColor
                                                .withOpacity(0.8),
                                        thickness: 3,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18.h,
                                    ),
                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 80.h,
                                          ),
                                          SvgPicture.asset(
                                            emptyIcon,
                                            colorFilter: ColorFilter.mode(
                                              isLightTheme(context)
                                                  ? AppColors.aboutHeaderLight
                                                  : AppColors.whiteColor
                                                      .withOpacity(0.25),
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 18.h,
                                          ),
                                          SizedBox(
                                            height: 24.h,
                                            child: AutoSizeText(
                                              tr('wallet.swap_is_not_possible'),
                                              minFontSize: 3,
                                              maxFontSize: 20,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          error: (error, _) => UserAppError(
                            errorMessage: error.toString(),
                          ),
                          loading: () => const MainLoader(),
                        );
                      },
                      error: (error, _) => UserAppError(
                        errorMessage: error.toString(),
                      ),
                      loading: () => const MainLoader(),
                    );
                  },
                ),
                IconButton(
                  iconSize: 50.w,
                  icon: NavigationItemComponent(
                    item: navigationPages[3],
                    isSelected: widget.selectedIndex.value == 3,
                    leftLine: false,
                    rightLine: true,
                  ),
                  onPressed: () {
                    widget.selectedIndex.value = 3;

                    box.putAt(0, BottomNavigationIndexData(selectedIndex: 3));
                  },
                ),
                IconButton(
                  iconSize: 50.w,
                  icon: NavigationItemComponent(
                    item: navigationPages[4],
                    isSelected: widget.selectedIndex.value == 4,
                    leftLine: false,
                    rightLine: false,
                  ),
                  onPressed: () {
                    widget.selectedIndex.value = 4;
                    box.putAt(0, BottomNavigationIndexData(selectedIndex: 4));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNavigationItem {
  final String iconDisabled;
  final String label;
  final Widget page;
  final bool enabled;
  final bool isSelected;
  final bool isPage;

  CustomNavigationItem({
    required this.iconDisabled,
    required this.label,
    required this.page,
    required this.enabled,
    this.isSelected = false,
    this.isPage = true,
  });
}
