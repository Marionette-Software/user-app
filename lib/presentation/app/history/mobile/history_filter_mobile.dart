import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_app/application/filter/filter_currency_provider.dart';
import 'package:user_app/application/filter/filter_operations_provider.dart';
import 'package:user_app/application/history/history_from_state_provider.dart';
import 'package:user_app/application/history/history_to_state_provider.dart';
import 'package:user_app/infrastructure/filter/filter_currency.dart';
import 'package:user_app/infrastructure/filter/filter_operations.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.data.gql.dart';
import 'package:user_app/presentation/app/history/mobile/components/filter_components/filter_box_component.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class HistoryFilterMobile extends StatefulHookConsumerWidget {
  const HistoryFilterMobile({required this.pagingController, super.key});

  final ValueNotifier<
          PagingController<int, GGetUserHistoryData_history_result?>>
      pagingController;

  @override
  ConsumerState<HistoryFilterMobile> createState() =>
      _HistoryFilterMobileState();
}

class _HistoryFilterMobileState extends ConsumerState<HistoryFilterMobile> {
  @override
  Widget build(BuildContext context) {
    final dateFromState = ref.read(historySelectedDateFromProvider.notifier);
    final dateToState = ref.read(historySelectedDateToProvider.notifier);

    final filterCurrencyState = ref.read(filterCurrencyStateProvider.notifier);
    final filterOperationsState =
        ref.read(filterOperationsStateProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.mainBackgroundDarkColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          50..h,
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 15..h, left: 25.w, right: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BackButtonMobile(
                  onTap: () {
                    context.pop();
                  },
                ),
                Text(
                  tr('history.filter'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75,
                      ),
                  textAlign: TextAlign.center,
                ),
                MobileGenericButton(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  onTap: () {
                    List<FilterCurrency> clearFilterCurrency = [];
                    dateFromState.state = '';
                    dateToState.state = '';

                    // searchCurrencyControllerValue.value = '';

                    filterOperationsState.state = FilterOperation(
                      id: 'move_to_advanced|move_from_advanced|custodial_withdrawal|custodial_deposit|exchange|deposit|staking_rewards|deposit_reward|trade_reward|trading',
                      isSelected: false,
                      name: '',
                    );

                    for (var element in filterCurrencyState.state) {
                      clearFilterCurrency.add(
                        FilterCurrency(
                          id: element.id,
                          isSelected: false,
                        ),
                      );
                    }

                    filterCurrencyState.state = clearFilterCurrency;
                    widget.pagingController.value.refresh();
                    context.pop();
                  },
                  child: Text(
                    tr('history.reset_btn'),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 13.sp,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.65.sp,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          margin: EdgeInsets.only(
            top: 10..h,
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
          child: FilterBoxComponentMobile(
            pagingController: widget.pagingController,
          ),
        ),
      ),
    );
  }
}
