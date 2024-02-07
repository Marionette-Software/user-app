import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_app/application/trade/get_markets_future_provider.dart';
import 'package:user_app/domain/trade/market/get_market_req.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.data.gql.dart';
import 'package:user_app/presentation/app/components/header_web/header_web.dart';
import 'package:user_app/presentation/app/history/web/components/filter_box_component.dart';
import 'package:user_app/presentation/app/history/web/components/history_list_container.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class HistoryMainPageWeb extends StatefulHookConsumerWidget {
  const HistoryMainPageWeb({super.key});

  @override
  ConsumerState<HistoryMainPageWeb> createState() => _HistoryMainPageWebState();
}

class _HistoryMainPageWebState extends ConsumerState<HistoryMainPageWeb> {
  @override
  void dispose() {
    super.dispose();
  }

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

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: const HeaderWeb(),
      ),
      body: getMarkets.when(
        data: (resMarket) {
          return Scaffold(
            body: Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: isLightTheme(context)
                    ? const DecorationImage(
                        image: AssetImage('assets/icons/bg_inner.png'),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 50.h,
                  bottom: 26.h,
                  left: 228.w,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilterBoxComponent(
                      pagingController: pagingController,
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    HistoryListContainerWeb(
                      pagingController: pagingController,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        error: (error, _) => UserAppError(
          errorMessage: error.toString(),
        ),
        loading: () => const MainLoader(),
      ),
    );
  }
}
