import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:user_app/application/filter/filter_state_provider.dart';
import 'package:user_app/application/history/history_from_state_provider.dart';
import 'package:user_app/application/history/history_state_provider.dart';
import 'package:user_app/application/history/history_to_state_provider.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class CustomDatePickerWeb extends HookConsumerWidget {
  const CustomDatePickerWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.read(filterStateProvider.notifier);
    final dateFromController = ref.watch(historySelectedDateFromProvider);
    final dateFromState = ref.read(historySelectedDateFromProvider.notifier);
    final dateToController = ref.watch(historySelectedDateToProvider);
    final dateToState = ref.read(historySelectedDateToProvider.notifier);
    final historyState = ref.read(historySelectedProvider.notifier);

    return Container(
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
        borderRadius: BorderRadius.circular(10.h),
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
        padding: EdgeInsets.fromLTRB(
          25.w,
          35.h,
          25.h,
          50.w,
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10.w),
                InkWell(
                  onTap: () {
                    filterState.state = false;
                    dateToState.state = '';
                    dateFromState.state = '';
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).primaryColor,
                    size: 25.w,
                  ),
                ),
                SizedBox(width: 25.w),
                Text(
                  tr('history.select_date_range'),
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 30.sp,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            SfDateRangePicker(
              initialSelectedRange: PickerDateRange(
                DateTime.now().subtract(const Duration(days: 1)),
                DateTime.now(),
              ),
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                final DateTime rangeStartDate = args.value.startDate;
                final DateTime rangeEndDate = args.value.endDate;

                var visibleDates = args.value;
                if (visibleDates.startDate != null) {
                  dateFromState.state =
                      (rangeStartDate.millisecondsSinceEpoch).toString();
                }
                if (visibleDates.endDate != null) {
                  dateToState.state =
                      (rangeEndDate.millisecondsSinceEpoch).toString();
                }
              },
              monthViewSettings: DateRangePickerMonthViewSettings(
                viewHeaderStyle: DateRangePickerViewHeaderStyle(
                  textStyle: TextStyle(
                    fontSize: 20.sp,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              monthCellStyle: DateRangePickerMonthCellStyle(
                trailingDatesTextStyle: TextStyle(
                  fontSize: 20.sp,
                  color: Theme.of(context).primaryColor,
                ),
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                  color: Theme.of(context).primaryColor,
                ),
                todayTextStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                  color: Theme.of(context).primaryColor,
                ),
                weekendTextStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                  color: Theme.of(context).primaryColor,
                ),
                disabledDatesTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  fontSize: 20.sp,
                  fontFamily: 'Roboto',
                ),
              ),
              yearCellStyle: DateRangePickerYearCellStyle(
                disabledDatesTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.sp,
                ),
                leadingDatesTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.sp,
                ),
                textStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.sp,
                ),
                todayTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.sp,
                ),
              ),
              headerStyle: DateRangePickerHeaderStyle(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              maxDate: DateTime.now(),
              startRangeSelectionColor: Theme.of(context).primaryColorLight,
              endRangeSelectionColor: Theme.of(context).primaryColorLight,
              rangeSelectionColor:
                  Theme.of(context).primaryColorLight.withOpacity(0.2),
              selectionMode: DateRangePickerSelectionMode.range,
              todayHighlightColor: Theme.of(context).primaryColorLight,
              selectionColor: isLightTheme(context)
                  ? Theme.of(context).primaryColorLight.withOpacity(0.8)
                  : Theme.of(context).primaryColor.withOpacity(0.8),
              rangeTextStyle:
                  Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        fontSize: 20.sp,
                      ),
            ),
            dateFromController != ''
                ? Row(
                    children: [
                      Text(
                        '${tr('history.date_from')}:',
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: 20.sp,
                                ),
                        textAlign: TextAlign.start,
                      ),
                      const Spacer(),
                      Text(
                        formatMillisecondToData(dateFromController),
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: 20.sp,
                                ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  )
                : const SizedBox(),
            SizedBox(
              height: 8.h,
            ),
            dateToController != ''
                ? Row(
                    children: [
                      Text(
                        '${tr('history.date_to')}:',
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: 20.sp,
                                ),
                        textAlign: TextAlign.start,
                      ),
                      const Spacer(),
                      Text(
                        formatMillisecondToData(dateToController),
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: 20.sp,
                                ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  )
                : const SizedBox(),
            SizedBox(
              height: 20.h,
            ),
            MainButton(
              disableColor: MainColorsApp.accentColor.withOpacity(0.5),
              onTap: () {
                if (dateFromController == '' || dateToController == '') {
                  historyState.state = 0;
                  dateToState.state = DateTime.now()
                      .millisecondsSinceEpoch
                      .toString(); // set default date to today
                  dateFromState.state = DateTime.now()
                      .add(const Duration(days: -1))
                      .millisecondsSinceEpoch
                      .toString();
                }
                filterState.state = false;
              },
              text: tr('history.set_range'),
              height: 60.h,
              color: Theme.of(context).primaryColorLight,
            ),
          ],
        ),
      ),
    );
  }
}

formatMillisecondToData(time) {
  DateTime dt = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
  return DateFormat("d MMM yyyy").format(dt);
}
