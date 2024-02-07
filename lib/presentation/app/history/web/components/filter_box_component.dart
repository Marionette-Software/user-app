import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_app/application/filter/filter_currency_provider.dart';
import 'package:user_app/application/filter/filter_operations_provider.dart';
import 'package:user_app/application/filter/filter_state_provider.dart';
import 'package:user_app/application/history/history_from_state_provider.dart';
import 'package:user_app/application/history/history_to_state_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/infrastructure/filter/filter_currency.dart';
import 'package:user_app/infrastructure/filter/filter_operations.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.data.gql.dart';
import 'package:user_app/presentation/app/history/web/components/date_range_picker.dart';
import 'package:user_app/presentation/app/history/web/components/filter_components/date_picker.dart';
import 'package:user_app/presentation/app/history/web/components/filter_components/payment_type_picker.dart';
import 'package:user_app/presentation/app/history/web/components/filter_currency_component.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class FilterBoxComponent extends HookConsumerWidget {
  const FilterBoxComponent({
    super.key,
    required this.pagingController,
  });
  final ValueNotifier<
          PagingController<int, GGetUserHistoryData_history_result?>>
      pagingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterController = ref.watch(filterStateProvider);
    final dateFromState = ref.read(historySelectedDateFromProvider.notifier);
    final dateToState = ref.read(historySelectedDateToProvider.notifier);

    final filterCurrencyState = ref.read(filterCurrencyStateProvider.notifier);

    final filterOperationsState =
        ref.read(filterOperationsStateProvider.notifier);
    final filterOperationsWatch = ref.watch(filterOperationsStateProvider);

    final searchCurrencyControllerValue = useState('');
    final paymentTypePickerState = useState(filterOperationsWatch);

    return Stack(
      children: [
        filterController == false
            ? Container(
                width: 402.w,
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
                    BoxShadow(
                      color: isLightTheme(context)
                          ? Theme.of(context).primaryColor.withOpacity(0.1)
                          : Colors.transparent,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 34.h,
                    bottom: 45.h,
                    left: 25.w,
                    right: 25.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tr('history.filter'),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 30.sp,
                                  letterSpacing: -1.5.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          // InkWell(
                          //   child: Align(
                          //     alignment: Alignment.centerLeft,
                          //     child: Text(
                          //       'Download CSV'.hardcoded,
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .displayMedium!
                          //           .copyWith(
                          //             fontSize: 15.sp,
                          //             fontWeight: FontWeight.w500,
                          //             letterSpacing: -0.75.sp,
                          //             color: MainColorsApp.accentColor,
                          //           ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Row(
                        children: [
                          Text(
                            tr('history.date'),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -1.sp,
                                ),
                          ),
                          const Spacer(),
                          const DateRangePickerComponent(),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Divider(
                        height: 1.h,
                        color: Theme.of(context).primaryColor.withOpacity(0.25),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          tr('history.type'),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 20.sp,
                                letterSpacing: -1.sp,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      PaymentTypePicker(
                        paymentTypePickerState: paymentTypePickerState,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Divider(
                        height: 1.h,
                        color: Theme.of(context).primaryColor.withOpacity(0.25),
                      ),
                      SizedBox(height: 25.h),
                      Row(
                        children: [
                          Tooltip(
                            message: 'Filter by currency ID'.hardcoded,
                            child: Text(
                              tr('history.currencies'),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontSize: 20.sp,
                                    letterSpacing: -1.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Container(
                        width: double.infinity,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.bottom,
                          onChanged: (value) {
                            searchCurrencyControllerValue.value = value;
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(15),
                          ],
                          decoration: InputDecoration(
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
                            hintText: tr('trade.search'),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              size: 18.w,
                            ),
                            fillColor:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            hintStyle: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontSize: 15.sp,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.75.sp,
                                ),
                          ),
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.75.sp,
                                  ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      FilterCurrencyComponent(
                        searchCurrencyControllerValue:
                            searchCurrencyControllerValue,
                      ),
                      SizedBox(height: 30.h),
                      Tooltip(
                        message: 'Apply to review all filtered operations',
                        verticalOffset: -80.h,
                        child: MainButton(
                          height: 60.h,
                          disableColor:
                              MainColorsApp.accentColor.withOpacity(0.5),
                          text: tr('Apply'),
                          color: Theme.of(context).primaryColorLight,
                          onTap: () {
                            filterOperationsState.state =
                                paymentTypePickerState.value;
                            pagingController.value.refresh();
                          },
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Tooltip(
                        message: 'Reset all selected filters'.hardcoded,
                        child: InkWell(
                          onTap: () {
                            List<FilterCurrency> clearFilterCurrency = [];
                            dateFromState.state = '';
                            dateToState.state = '';
                      
                            searchCurrencyControllerValue.value = '';
                            paymentTypePickerState.value = FilterOperation(
                              id: 'move_to_advanced|move_from_advanced|custodial_withdrawal|custodial_deposit|exchange|deposit|staking_rewards|deposit_reward|trade_reward|trading',
                              isSelected: false,
                              name: '',
                            );
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
                            pagingController.value.refresh();
                          },
                          borderRadius: BorderRadius.circular(15.r),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              tr('Reset filter'),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontSize: 20.sp,
                                    letterSpacing: -1.sp,
                                    fontWeight: FontWeight.w500,
                                    color: MainColorsApp.accentColor,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
        filterController == true
            ? const CustomDatePickerWeb()
            : const SizedBox()
      ],
    );
  }
}
