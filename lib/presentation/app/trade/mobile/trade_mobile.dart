import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/get_markets_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/trade/market/get_market_req.dart';
import 'package:user_app/domain/trade/market_trade.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/presentation/app/trade/mobile/components/market_list/markets_list.dart';
import 'package:user_app/presentation/auth/authentication.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class TradeMobile extends StatefulHookConsumerWidget {
  const TradeMobile({super.key});

  static const routeName = '/unAuthorizationTrade';

  @override
  ConsumerState<TradeMobile> createState() => _TradeMobileState();
}

class _TradeMobileState extends ConsumerState<TradeMobile> {
  @override
  Widget build(BuildContext context) {
    final refreshValueBlockchain = useState(1);
    final getMarketsWatch = ref.watch(getMarketsNotifierProvider);

    final getMarkets = ref.watch(
      getMarketFutureProvider(
        GetMarketReqData(
          refresh: '${refreshValueBlockchain.value}',
        ),
      ),
    );

    final searchMarketControllerValue = useState('');
    final showSearchInput = useState(false);
    List<MarketTrade> searchMarkets = getMarketsWatch;

    var userConfigBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userConfigBox.getAt(0)!;

    return SafeArea(
      child: getMarkets.when(
        data: (data) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.mainBackgroundDarkColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                50..h,
              ),
              child: showSearchInput.value
                  ? Padding(
                      padding: EdgeInsets.only(
                        top: 10..h,
                        right: 25.w,
                        left: 25.w,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 283.w,
                            height: 30..h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.center,
                              onChanged: (value) {
                                searchMarketControllerValue.value = value;
                              },
                              decoration: InputDecoration(
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center,
                                hintText: tr('trade.search'),
                                prefixIcon: SizedBox(
                                  child: Icon(
                                    Icons.search,
                                    color:
                                        AppColors.whiteColor.withOpacity(0.5),
                                    size: 20.w,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MainColorsApp.accentColor,
                                    width: 1.0.w,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    25.r,
                                  ),
                                ),
                                fillColor:
                                    AppColors.whiteColor.withOpacity(0.25),
                                contentPadding: EdgeInsets.only(
                                  top: 6..h,
                                  bottom: 6..h,
                                  left: 8.w,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.r),
                                ),
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 13.sp,
                                      color:
                                          AppColors.whiteColor.withOpacity(0.5),
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.65.sp,
                                    ),
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontSize: 13.sp,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.65.sp,
                                  ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showSearchInput.value = false;
                              searchMarketControllerValue.value = '';
                            },
                            child: Text(
                              'Close'.hardcoded,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 13.sp,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.65,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                        top: 15..h,
                        left: 10.w,
                        right: 25.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          userData.token != null
                              ? SizedBox(
                                  width: 70.w,
                                  height: 25..h,
                                )
                              : BackButtonMobile(
                                  onTap: () =>
                                      context.go(Authentication.routeName),
                                ),
                          Text(
                            tr('trade.markets'),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: 15.sp,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.75,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          SearchButtonMobile(
                            onTap: () {
                              showSearchInput.value = true;
                            },
                          ),
                        ],
                      ),
                    ),
            ),
            body: Container(
              margin: EdgeInsets.only(
                top: 10.h,
              ),
              decoration: BoxDecoration(
                color: isLightTheme(context)
                    ? AppColors.whiteColor
                    : walletBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: MarketListMobile(
                          allMarkets: searchMarkets,
                          showSearchInput: showSearchInput,
                          searchMarketControllerValue:
                              searchMarketControllerValue,
                        ),
                      ),
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
        loading: () => const MainLoaderMobile(),
      ),
    );
  }
}
