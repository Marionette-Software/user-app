import 'package:easy_localization/easy_localization.dart';
import 'package:ferry/typed_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_app/application/filter/filter_currency_provider.dart';
import 'package:user_app/application/filter/filter_operations_provider.dart';
import 'package:user_app/application/history/history_from_state_provider.dart';
import 'package:user_app/application/history/history_state_provider.dart';
import 'package:user_app/application/history/history_to_state_provider.dart';
import 'package:user_app/application/trade/get_markets_future_provider.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.data.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.var.gql.dart';
import 'package:user_app/infrastructure/user/user_service.dart';
import 'package:user_app/presentation/app/history/web/components/details_components/detail_container.dart';
import 'package:user_app/presentation/app/history/web/components/empty_history.dart';
import 'package:user_app/presentation/app/history/web/components/item_data.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/formatters/format_date.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class HistoryListContainerWeb extends HookConsumerWidget {
  const HistoryListContainerWeb({
    super.key,
    required this.pagingController,
  });

  final ValueNotifier<
          PagingController<int, GGetUserHistoryData_history_result?>>
      pagingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyState = ref.read(historySelectedProvider.notifier);
    final historyWatch = ref.watch(historySelectedProvider);
    final getMarketsWatch = ref.watch(getMarketsNotifierProvider);

    var showDetails = useState(false);

    useEffect(() {
      pagingController.value.addPageRequestListener((pageKey) {
        _fetchPage(
          ref: ref,
          pageKey: pageKey,
          pagingController: pagingController,
          showDetails: showDetails,
        );
      });

      return () {
        // Cleanup function called when the widget is disposed
        print('Cleanup function called.');
        pagingController.dispose(); // Manually dispose of the PagingController
      };
    }, []);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 600.w,
          height: 904.h,
          alignment: Alignment.center,
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
                    : AppColors.whiteColor.withOpacity(0),
              ],
            ),
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              isLightTheme(context)
                  ? BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  : BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 35.h, bottom: 30.h),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  tr('history.history'),
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 30.sp,
                      ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                Expanded(
                  child:
                      PagedListView<int, GGetUserHistoryData_history_result?>(
                    pagingController: pagingController.value,
                    builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, item, index) {
                        String sideForTrade = '';
                        String marketId = '';
                        String amountTrade = '';

                        if (item!.initiator_type == 'trading') {
                          for (var element in getMarketsWatch) {
                            if (element.id ==
                                '${item.initiator_currency!.id}-${item.result_currency!.id}') {
                              sideForTrade = tr('history.sell');
                              marketId =
                                  '${element.base_currency.id.toUpperCase()}/${element.quote_currency.id.toUpperCase()}';
                              amountTrade = abbreviateNumber(
                                number: double.parse(item.initiator_amount!),
                                precision: element.trading_amount_precision,
                              );
                            } else if (element.id ==
                                '${item.result_currency!.id}-${item.initiator_currency!.id}') {
                              sideForTrade = tr('history.buy');
                              marketId =
                                  '${element.base_currency.id.toUpperCase()}/${element.quote_currency.id.toUpperCase()}';
                              amountTrade = abbreviateNumber(
                                number: double.parse(item.result_amount!),
                                precision: element.trading_amount_precision,
                              );
                            }
                          }
                        }

                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: 25.h, left: 25.w, right: 25.w),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10.r),
                            onTap: () {
                              historyState.state = index;
                            },
                            child: item.initiator_type == 'deposit_reward' ||
                                    item.initiator_type == 'trade_reward'
                                ? ItemHistoryDataComponent(
                                    operationType: 'Referral Reward',
                                    item: item,
                                    operationDate:
                                        '${formatShortDate(item.createdAt!)}',
                                    operationAmount: abbreviateNumber(
                                        number: double.parse(
                                            item.initiator_amount!),
                                        precision: item
                                            .initiator_currency!.precision!),
                                    operationCurrency: item
                                        .initiator_currency!.id!
                                        .toUpperCase(),
                                    isSelected:
                                        historyWatch == index ? true : false,
                                  )
                                : item.initiator_type == 'staking_rewards'
                                    ? ItemHistoryDataComponent(
                                        operationType: 'Staking reward',
                                        item: item,
                                        operationDate:
                                            '${formatShortDate(item.createdAt!)}',
                                        operationAmount: abbreviateNumber(
                                            number: double.parse(
                                                item.initiator_amount!),
                                            precision: item.initiator_currency!
                                                .precision!),
                                        operationCurrency: item
                                            .initiator_currency!.id!
                                            .toUpperCase(),
                                        isSelected: historyWatch == index
                                            ? true
                                            : false,
                                      )
                                    : item.initiator_type == 'exchange'
                                        ? () {
                                            return ItemHistoryDataComponent(
                                              operationType: tr('history.swap'),
                                              operationAmount: abbreviateNumber(
                                                number: double.parse(
                                                    item.initiator_amount!),
                                                precision: item
                                                    .initiator_currency!
                                                    .precision!,
                                              ),
                                              operationCurrency:
                                                  '${item.initiator_currency!.id!.toUpperCase()}/${item.result_currency!.id!.toUpperCase()}',
                                              operationDate:
                                                  '${formatShortDate(item.createdAt!)}',
                                              isSelected: historyWatch == index
                                                  ? true
                                                  : false,
                                              item: item,
                                            );
                                          }()
                                        : item.initiator_type ==
                                                'custodial_withdrawal'
                                            ? () {
                                                return ItemHistoryDataComponent(
                                                  operationType:
                                                      tr('history.withdraw'),
                                                  operationAmount:
                                                      abbreviateNumber(
                                                    number: double.parse(
                                                        item.initiator_amount!),
                                                    precision: item
                                                        .initiator_currency!
                                                        .precision!,
                                                  ),
                                                  operationCurrency: item
                                                      .initiator_currency!.id!
                                                      .toUpperCase(),
                                                  operationDate:
                                                      '${formatShortDate(item.createdAt!)}',
                                                  isSelected:
                                                      historyWatch == index
                                                          ? true
                                                          : false,
                                                  item: item,
                                                );
                                              }()
                                            : item.initiator_type ==
                                                        'move_to_advanced' ||
                                                    item.initiator_type ==
                                                        'move_from_advanced'
                                                ? () {
                                                    return ItemHistoryDataComponent(
                                                      operationType: tr(
                                                          'history.balance_transfer'),
                                                      operationAmount:
                                                          abbreviateNumber(
                                                        number: double.parse(item
                                                            .initiator_amount!),
                                                        precision: item
                                                            .initiator_currency!
                                                            .precision!,
                                                      ),
                                                      operationCurrency: item
                                                          .initiator_currency!
                                                          .id!
                                                          .toUpperCase(),
                                                      operationDate:
                                                          '${formatShortDate(item.createdAt!)}',
                                                      isSelected:
                                                          historyWatch == index
                                                              ? true
                                                              : false,
                                                      item: item,
                                                    );
                                                  }()
                                                : item.initiator_type ==
                                                        'trading'
                                                    ? () {
                                                        return ItemHistoryDataComponent(
                                                          operationType: tr(
                                                              'history.trade'),
                                                          sideFotTrade:
                                                              sideForTrade,
                                                          operationAmount:
                                                              amountTrade,
                                                          operationCurrency:
                                                              marketId,
                                                          operationDate:
                                                              '${formatShortDate(item.createdAt!)}',
                                                          isSelected:
                                                              historyWatch ==
                                                                      index
                                                                  ? true
                                                                  : false,
                                                          item: item,
                                                        );
                                                      }()
                                                    : item.initiator_type ==
                                                            'move_from_advanced'
                                                        ? () {
                                                            return ItemHistoryDataComponent(
                                                              operationType: tr(
                                                                  'history.balance_transfer'),
                                                              operationAmount:
                                                                  abbreviateNumber(
                                                                number: double
                                                                    .parse(item
                                                                        .initiator_amount!),
                                                                precision: item
                                                                    .initiator_currency!
                                                                    .precision!,
                                                              ),
                                                              operationCurrency: item
                                                                  .initiator_currency!
                                                                  .id!
                                                                  .toUpperCase(),
                                                              operationDate:
                                                                  '${formatShortDate(item.createdAt!)}',
                                                              isSelected:
                                                                  historyWatch ==
                                                                          index
                                                                      ? true
                                                                      : false,
                                                              item: item,
                                                            );
                                                          }()
                                                        : item.initiator_type ==
                                                                    'custodial_deposit' ||
                                                                item.initiator_type ==
                                                                    'deposit'
                                                            ? () {
                                                                return ItemHistoryDataComponent(
                                                                  operationType:
                                                                      tr('history.deposit'),
                                                                  operationAmount:
                                                                      abbreviateNumber(
                                                                    number: item.result_amount ==
                                                                            null
                                                                        ? double.parse(item
                                                                            .initiator_amount!)
                                                                        : double.parse(
                                                                            item.result_amount!),
                                                                    precision: item
                                                                        .initiator_currency!
                                                                        .precision!,
                                                                  ),
                                                                  operationCurrency: item
                                                                      .initiator_currency!
                                                                      .id!
                                                                      .toUpperCase(),
                                                                  operationDate:
                                                                      '${formatShortDate(item.createdAt!)}',
                                                                  isSelected:
                                                                      historyWatch ==
                                                                              index
                                                                          ? true
                                                                          : false,
                                                                  item: item,
                                                                );
                                                              }()
                                                            : () {
                                                                return Container();
                                                              }(),
                          ),
                        );
                      },
                      firstPageErrorIndicatorBuilder: (context) =>
                          ErrorIndicator(
                        error: pagingController.value.error,
                        onTryAgain: () => pagingController.value.refresh(),
                      ),
                      newPageErrorIndicatorBuilder: (context) => ErrorIndicator(
                        error: pagingController.value.error,
                        onTryAgain: () => pagingController.value.refresh(),
                      ),
                      noItemsFoundIndicatorBuilder: (context) =>
                          const EmptyHistoryComponent(),
                      firstPageProgressIndicatorBuilder: (context) =>
                          const MainLoader(),
                      newPageProgressIndicatorBuilder: (context) => SizedBox(
                        width: 300.w,
                        height: 200.h,
                        child: const MainLoader(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
        showDetails.value
            ? DetailContainer(
                localHistoryFiltered: pagingController.value.itemList,
              )
            : const SizedBox()
      ],
    );
  }

  Future<void> _fetchPage({
    required int pageKey,
    required ValueNotifier<
            PagingController<int, GGetUserHistoryData_history_result?>>
        pagingController,
    required WidgetRef ref,
    required ValueNotifier<bool> showDetails,
  }) async {
    try {
      final historyState = ref.read(historySelectedProvider.notifier);
      final filterOperationsWatch = ref.watch(filterOperationsStateProvider);
      final dateFromController = ref.watch(historySelectedDateFromProvider);
      final dateToController = ref.watch(historySelectedDateToProvider);

      final filterCurrencyWatch = ref.watch(filterCurrencyStateProvider);

      final List<String> selectedCurrencyIdList = [];

      for (var element in filterCurrencyWatch) {
        if (element.isSelected) {
          selectedCurrencyIdList.add(element.id.toLowerCase());
        }
      }

      IUserService service = UserService();
      OperationResponse<GGetUserHistoryData, GGetUserHistoryVars>
          historyResponse;

      historyResponse = await service.getFullUserHistory(
        limit: 15,
        page: pageKey,
        typeOperation: filterOperationsWatch.id,
        toData: dateToController,
        formData: dateFromController,
        currencyId: selectedCurrencyIdList.isEmpty
            ? ''
            : selectedCurrencyIdList.join('|'),
      );

      List<GGetUserHistoryData_history_result?> res =
          historyResponse.data!.history!.result!.toList();

      final isLastPage = res.length < 15;
      if (isLastPage) {
        pagingController.value.appendLastPage(res);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.value.appendPage(res, nextPageKey);
      }
      historyState.state = historyState.state + 1;
      historyState.state = 0;
      showDetails.value =
          res.isEmpty && pagingController.value.itemList!.isEmpty
              ? false
              : true;
    } catch (error) {
      pagingController.value.error = error;
    }
  }
}

class ErrorIndicator extends StatelessWidget {
  final Object? error;
  final VoidCallback onTryAgain;

  const ErrorIndicator({
    super.key,
    required this.error,
    required this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserAppError(errorMessage: '$error'),
          ElevatedButton(
            onPressed: onTryAgain,
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
