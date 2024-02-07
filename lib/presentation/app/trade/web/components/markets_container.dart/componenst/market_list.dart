import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/open_market_list_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/trade/market_trade.dart';
import 'package:user_app/presentation/app/trade/web/components/markets_container.dart/componenst/filter_market_item_by_id.dart';
import 'package:user_app/presentation/app/trade/web/components/markets_container.dart/componenst/header_market_list.dart';
import 'package:user_app/presentation/app/trade/web/components/markets_container.dart/componenst/market_item.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MarketListWeb extends StatefulHookConsumerWidget {
  const MarketListWeb({
    super.key,
    required this.allMarkets,
  });

  final List<MarketTrade> allMarkets;

  @override
  ConsumerState<MarketListWeb> createState() => _MarketListWebState();
}

List<MarketTrade> sortedMarkets = [];

class _MarketListWebState extends ConsumerState<MarketListWeb> {
  List<String> quoteList = ['All'];
  String selectedMarket = 'All';
  bool isFavorite = false;
  bool hoveredFavorite = false;

  @override
  initState() {
    sortedMarkets = widget.allMarkets;
    super.initState();
    quoteList.addAll(
      widget.allMarkets
          .map((e) => e.quote_currency.id.toString())
          .toSet()
          .toList(),
    );
  }

  _switchMarket(String market) {
    selectedMarket = market;
    if (market == 'All') {
      setState(() {
        sortedMarkets = widget.allMarkets;
        isFavorite = false;
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
    final openMarketListRead = ref.read(openMarketListProvider.notifier);
    final searchMarketControllerValue = useState('');

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            left: 15.w,
            right: 15.w,
            bottom: 20.h,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (value) {
                      searchMarketControllerValue.value = value;

                      final List<MarketTrade> searchOnChangeMarkets = [];
                      String valueUpperCase =
                          searchMarketControllerValue.value.toUpperCase();
                      String valueLowerCase =
                          searchMarketControllerValue.value.toLowerCase();
                      for (var element in widget.allMarkets) {
                        String marketName =
                            '${element.id.split('-')[0]}/${element.id.split('-')[1]}';
                        if (marketName.contains(valueUpperCase) ||
                            marketName.contains(valueLowerCase)) {
                          searchOnChangeMarkets.add(element);
                        }
                      }

                      setState(() {
                        sortedMarkets = searchOnChangeMarkets;
                        isFavorite = false;
                        selectedMarket = 'All';
                      });
                    },
                    decoration: InputDecoration(
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      hintText: tr('trade.search'),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        size: 20.w,
                      ),
                      fillColor:
                          Theme.of(context).primaryColor.withOpacity(0.1),
                      contentPadding: EdgeInsets.only(
                        top: 8.h,
                        bottom: 8.h,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(
                            fontSize: 20.sp,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                            letterSpacing: -1.sp,
                          ),
                    ),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -1.sp,
                        ),
                  ),
                ),
              ),
              SizedBox(
                width: 14.w,
              ),
              InkWell(
                onTap: () {
                  openMarketListRead.state = false;
                },
                child: Icon(
                  Icons.close,
                  color: isLightTheme(context)
                      ? AppColors.aboutHeaderLight
                      : AppColors.whiteColor.withOpacity(0.5),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
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
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SvgPicture.asset(
                    isFavorite
                        ? starFavoriteWallet
                        : unselectedStarFavoriteWallet,
                    width: 15.w,
                    height: 15.h,
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
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: SizedBox(
                  height: 29.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20.w,
                    ),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: quoteList.length,
                    itemBuilder: (ctx, index) {
                      return FilterMarketItemByIdWeb(
                        text: quoteList[index],
                        onTap: (value) {
                          _switchMarket(value);
                        },
                        isSelected:
                            quoteList[index] == selectedMarket ? true : false,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Divider(
          height: 2.h,
          color: isLightTheme(context)
              ? AppColors.mainBackgroundLightColor
              : AppColors.whiteColor.withOpacity(0.05),
        ),
        SizedBox(
          height: 20.h,
        ),
        const HeaderMarketListWeb(),
        SizedBox(
          height: 11.h,
        ),
        sortedMarkets.isEmpty
            ? Padding(
                padding: EdgeInsets.only(top: 200.h),
                child: Text(
                  'No matches'.hardcoded,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: isLightTheme(context)
                            ? AppColors.aboutHeaderLight
                            : AppColors.whiteColor.withOpacity(0.5),
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        letterSpacing: -1.sp,
                      ),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: sortedMarkets.length,
                itemBuilder: (context, i) {
                  var item = sortedMarkets[i];
                  return MarketItem(
                    item: item,
                  );
                },
              ),
      ],
    );
  }
}
