import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_app/application/trade/get_markets_future_provider.dart';
import 'package:user_app/domain/trade/market/get_market_req.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.data.gql.dart';
import 'package:user_app/presentation/app/history/mobile/components/history_list_container.dart';
import 'package:user_app/presentation/app/history/mobile/history_filter_mobile.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class HistoryMainPageMobile extends StatefulHookConsumerWidget {
  const HistoryMainPageMobile({
    Key? key,
    required this.withNavBar,
  }) : super(key: key);

  final bool withNavBar;

  @override
  ConsumerState<HistoryMainPageMobile> createState() =>
      _HistoryMainPageMobileState();
}

class _HistoryMainPageMobileState extends ConsumerState<HistoryMainPageMobile> {
  @override
  Widget build(BuildContext context) {
    final refreshValue = useState(1);

    ValueNotifier<PagingController<int, GGetUserHistoryData_history_result?>>
        pagingController = useState(
      PagingController(firstPageKey: 1),
    );

    final getMarkets = ref.watch(
      getMarketFutureProvider(
        GetMarketReqData(
          refresh: '${refreshValue.value}',
        ),
      ),
    );

    return SafeArea(
      child: getMarkets.when(
        data: (res) {
          return Scaffold(
            backgroundColor: AppColors.mainBackgroundDarkColor,
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                50..h,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 15..h, left: 10.w, right: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: widget.withNavBar ? 0 : 1,
                      child: BackButtonMobile(
                        onTap: widget.withNavBar
                            ? null
                            : () {
                                context.pop();
                              },
                      ),
                    ),
                    Text(
                      tr('app_title.history'),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 15.sp,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.75,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    MobileAppBarButton(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HistoryFilterMobile(
                              pagingController: pagingController,
                            ),
                          ),
                        );
                      },
                      picPath: historyFilterMobile,
                    ),
                  ],
                ),
              ),
            ),
            body: Container(
              margin: EdgeInsets.only(
                top: 10..h,
              ),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: isLightTheme(context)
                    ? AppColors.whiteColor
                    : walletBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: HistoryListContainerMobile(
                pagingController: pagingController,
                withNavBar: widget.withNavBar,
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
