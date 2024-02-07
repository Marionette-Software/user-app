import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/get_market_dynamyc_future_provider.dart';
import 'package:user_app/application/trade/market_dynamic_state_notifier_provider.dart';
import 'package:user_app/application/trade/selet_market_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/trade/market_dynamic/market_dynamic.dart';
import 'package:user_app/infrastructure/graphql_client.dart';
import 'package:user_app/infrastructure/trade/graphql/market_dynamics/__generated__/market_dynamics_subscription.data.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/market_dynamics/__generated__/market_dynamics_subscription.req.gql.dart';
import 'package:user_app/infrastructure/trade/graphql/market_dynamics/__generated__/market_dynamics_subscription.var.gql.dart';
import 'package:user_app/presentation/app/trade/web/components/select_market_button/components/market_info/market_info_details.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MarketInfoRowWeb extends HookConsumerWidget {
  const MarketInfoRowWeb({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectMarketWatch = ref.watch(selectMarketsNotifierProvider);
    final marketDynamicRead =
        ref.read(marketDynamicStateNotifierProvider.notifier);

    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    final refreshValue = useState(1);
    final getMarketDynamicsFuture = ref.watch(
      getMarketDynamicsFutureProvider(
        RefreshRequest(refresh: '$refreshValue'),
      ),
    );
    useEffect(() {
      if (refreshValue.value == 0) {
        refreshValue.value++;
      }
      return null;
    }, []);

    return Container(
      width: 600.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          width: 2.w,
          color: isLightTheme(context)
              ? AppColors.mainBackgroundLightColor
              : AppColors.whiteColor.withOpacity(0.1),
        ),
      ),
      child: getMarketDynamicsFuture.when(
        data: (responseMarketDynamics) {
          return Operation(
            client: subscriptionClient(globalData.url),
            operationRequest: GMarketDynamicsReq(
              (b) => b..vars.market = selectMarketWatch.id,
            ),
            builder: (
              BuildContext context,
              OperationResponse<GMarketDynamicsData, GMarketDynamicsVars>?
                  response,
              Object? error,
            ) {
              if (response!.data != null &&
                  response.data!.marketDynamics != null &&
                  response.data!.marketDynamics!.amount24h != null &&
                  response.data!.marketDynamics!.highPrice != null &&
                  response.data!.marketDynamics!.lowPrice != null) {
                Future.delayed(Duration.zero, () {
                  marketDynamicRead.updateData(
                    MarketDynamic(
                      highPrice: response.data!.marketDynamics!.highPrice!,
                      lowPrice: response.data!.marketDynamics!.lowPrice!,
                      amount24h: response.data!.marketDynamics!.amount24h!,
                      marketId: response.data!.marketDynamics!.marketId!,
                      startPrice: response.data!.marketDynamics!.startPrice!,
                      lastPrice: response.data!.marketDynamics!.lastPrice!,
                    ),
                  );
                });

                return const MarketInfoDetailsWeb();
              } else {
                Future.delayed(Duration.zero, () {
                  marketDynamicRead.updateData(
                    MarketDynamic(
                      highPrice: responseMarketDynamics.highPrice!,
                      lowPrice: responseMarketDynamics.lowPrice!,
                      amount24h: responseMarketDynamics.amount24h!,
                      marketId: '',
                      startPrice: responseMarketDynamics.startPrice!,
                      lastPrice: responseMarketDynamics.lastPrice!,
                    ),
                  );
                });
                return const MarketInfoDetailsWeb();
              }
            },
          );
        },
        error: (error, _) => UserAppError(
          errorMessage: error.toString(),
        ),
        loading: () => const MainLoader(
          loaderSize: 20,
        ),
      ),
    );
  }
}
