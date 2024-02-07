import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/trade/market_trade.dart';
import 'package:user_app/presentation/app/trade/mobile/components/market_list/components/market_item.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MarketListMobile extends StatefulWidget {
  const MarketListMobile({
    super.key,
    required this.allMarkets,
    required this.searchMarketControllerValue,
    required this.showSearchInput,
  });

  final List<MarketTrade> allMarkets;
  final ValueNotifier<String> searchMarketControllerValue;
  final ValueNotifier<bool> showSearchInput;

  @override
  State<MarketListMobile> createState() => _MarketListMobileState();
}

List<MarketTrade> sortedMarkets = [];

class _MarketListMobileState extends State<MarketListMobile> {
  List<String> quoteList = ['All'];
  String selectedMarket = 'All';
  bool isFavorite = false;
  bool hoveredFavorite = false;

  @override
  @override
  initState() {
    sortedMarkets = widget.allMarkets;
    super.initState();
    quoteList.addAll(widget.allMarkets
        .map((e) => e.quote_currency.id.toString())
        .toSet()
        .toList());
  }

  _switchMarket(String market) {
    selectedMarket = market;

    if (market == 'All') {
      setState(() {
        isFavorite = false;
        sortedMarkets = widget.allMarkets;
      });
    } else {
      setState(() {
        isFavorite = false;
        sortedMarkets = widget.allMarkets
            .where((element) =>
                element.quote_currency.id == market ||
                element.base_currency.id == market)
            .toList();
      });
    }
  }

  getMarketList() {
    if (isFavorite) {
      List<MarketTrade> favoriteList = [];

      for (var element in widget.allMarkets) {
        if (element.isFavorite) {
          favoriteList.add(element);
        }
      }
      if (favoriteList.isNotEmpty) {
        setState(() {
          sortedMarkets = favoriteList;
        });
      } else {
        setState(() {
          isFavorite = false;
          sortedMarkets = widget.allMarkets;
        });
      }
    } else {
      setState(() {
        selectedMarket = 'All';
        sortedMarkets = widget.allMarkets;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.searchMarketControllerValue.addListener(() {
      isFavorite = false;
      selectedMarket = 'All';
      final List<MarketTrade> searchChangedMarkets = [];
      String valueUpperCase =
          widget.searchMarketControllerValue.value.toUpperCase();
      String valueLowerCase =
          widget.searchMarketControllerValue.value.toLowerCase();
      for (var element in widget.allMarkets) {
        String marketName =
            '${element.id.split('-')[0]}/${element.id.split('-')[1]}';
        if (marketName.contains(valueUpperCase) ||
            marketName.contains(valueLowerCase)) {
          searchChangedMarkets.add(element);
        }
      }

      if (widget.searchMarketControllerValue.value.isNotEmpty) {
        setState(() {
          sortedMarkets = searchChangedMarkets;
        });
      } else {
        setState(() {
          sortedMarkets = widget.allMarkets;
        });
      }
    });

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            top: 24..h,
          ),
          child: Row(
            children: [
              InkWell(
                onHover: (value) {
                  setState(() {
                    hoveredFavorite = !hoveredFavorite;
                  });
                },
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                    selectedMarket = '';
                  });
                  getMarketList();
                },
                child: SvgPicture.asset(
                  isFavorite
                      ? starFavoriteWallet
                      : unselectedStarFavoriteWallet,
                  width: 16.w,
                  height: 16..h,
                  colorFilter: ColorFilter.mode(
                    hoveredFavorite
                        ? isLightTheme(context)
                            ? AppColors.aboutHeaderLight.withOpacity(0.5)
                            : AppColors.whiteColor.withOpacity(0.5)
                        : isFavorite
                            ? isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : AppColors.whiteColor
                            : isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : AppColors.whiteColor.withOpacity(0.25),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 26..h,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: quoteList.length,
                      itemBuilder: (ctx, index) {
                        return MarketButtonSelectMobile(
                          text: quoteList[index],
                          onTap: (value) {
                            _switchMarket(value);
                            widget.showSearchInput.value = false;
                            widget.searchMarketControllerValue.value = '';
                          },
                          isSelected:
                              quoteList[index] == selectedMarket ? true : false,
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 14..h,
        ),
        sortedMarkets.isEmpty
            ? Padding(
                padding: EdgeInsets.only(top: 100..h),
                child: Text(
                  'No matches'.hardcoded,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: isLightTheme(context)
                            ? AppColors.aboutHeaderLight
                            : AppColors.whiteColor.withOpacity(0.5),
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        letterSpacing: -0.75.sp,
                      ),
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(
                  height: 2.h,
                  color: isLightTheme(context)
                      ? AppColors.mainBackgroundLightColor
                      : AppColors.whiteColor.withOpacity(0.05),
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sortedMarkets.length,
                itemBuilder: (context, i) {
                  var item = sortedMarkets[i];
                  return MarketItemMobile(
                    item: item,
                    isFavorite: false,
                  );
                },
              ),
      ],
    );
  }
}
