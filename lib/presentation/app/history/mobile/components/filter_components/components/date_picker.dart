import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:user_app/application/filter/filter_state_provider.dart';
import 'package:user_app/application/history/history_from_state_provider.dart';
import 'package:user_app/application/history/history_to_state_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/components/flat_custom_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class CustomDatePickerMobile extends StatefulHookConsumerWidget {
  const CustomDatePickerMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<CustomDatePickerMobile> createState() =>
      _CustomDatePickerMobileState();
}

class _CustomDatePickerMobileState
    extends ConsumerState<CustomDatePickerMobile> {
  final DateRangePickerController _controller = DateRangePickerController();
  DateTime endDate = DateTime.now();
  DateTime? pickEnd;
  DateTime? pickStart;
  dynamic visibleDates;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final filterState = ref.read(filterStateProvider.notifier);
    final dateFromState = ref.read(historySelectedDateFromProvider.notifier);
    final dateToState = ref.read(historySelectedDateToProvider.notifier);
    final dialogFromState = ref.read(dialogSelectedDateFromProvider.notifier);
    var dialogToState = ref.read(dialogSelectedDateToProvider.notifier);

    return Container(
      height: 500..h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        color: isLightTheme(context)
            ? AppColors.whiteColor
            : walletBackgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          25.w,
          15..h,
          25.w,
          25..h,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 4..h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.whiteColor.withOpacity(0.5),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16..h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatCustomButton(
                  height: 34..h,
                  width: 34.w,
                  radius: 10.r,
                  borderWidth: 1,
                  borderColor: isLightTheme(context)
                      ? AppColors.aboutHeaderLight
                      : AppColors.whiteColor.withOpacity(0.5),
                  onTap: () {
                    _controller.backward!();
                  },
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20.w,
                      color: isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.5),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      DateFormat.MMMM().format(endDate),
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.5.sp,
                            color: isLightTheme(context)
                                ? AppColors.darkColorText
                                : AppColors.whiteColorText,
                          ),
                    ),
                    Text(
                      endDate.year.toString(),
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.5.sp,
                            color: isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : AppColors.whiteColorText.withOpacity(0.5),
                          ),
                    ),
                  ],
                ),
                FlatCustomButton(
                  height: 34..h,
                  width: 34.w,
                  radius: 10.r,
                  borderWidth: 1,
                  borderColor: isLightTheme(context)
                      ? AppColors.aboutHeaderLight
                      : AppColors.whiteColor.withOpacity(0.5),
                  onTap: () {
                    _controller.forward!();
                  },
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20.w,
                      color: isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32..h,
            ),
            SfDateRangePicker(
              initialSelectedRange: PickerDateRange(
                DateTime.now().subtract(const Duration(days: 1)),
                DateTime.now(),
              ),
              allowViewNavigation: false,
              headerHeight: 0,
              controller: _controller,
              selectionShape: DateRangePickerSelectionShape.rectangle,
              onViewChanged: (DateRangePickerViewChangedArgs args) {
                context.afterBuild(() {
                  setState(() {
                    endDate = args.visibleDateRange.endDate!;
                  });
                });
              },
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                pickStart = args.value.startDate;
                pickEnd = args.value.endDate;

                visibleDates = args.value;
                if (visibleDates.startDate != null) {
                  dialogFromState.state =
                      pickStart!.millisecondsSinceEpoch.toString();
                }
                if (visibleDates.endDate != null) {
                  dialogToState.state =
                      pickEnd!.millisecondsSinceEpoch.toString();
                }
              },
              monthViewSettings: DateRangePickerMonthViewSettings(
                showTrailingAndLeadingDates: false,
                firstDayOfWeek: 1,
                dayFormat: 'EEE',
                viewHeaderStyle: DateRangePickerViewHeaderStyle(
                  textStyle:
                      Theme.of(context).textTheme.displayMedium!.copyWith(
                            fontSize: 15.sp,
                          ),
                ),
              ),
              monthCellStyle: DateRangePickerMonthCellStyle(
                trailingDatesTextStyle: TextStyle(
                  fontSize: 15.sp,
                  color: Theme.of(context).primaryColor,
                ),
                textStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 15.sp,
                    ),
                weekendTextStyle:
                    Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 15.sp,
                        ),
                todayTextStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                  color: Theme.of(context).primaryColor,
                ),
                disabledDatesTextStyle: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      fontSize: 15.sp,
                    ),
              ),
              yearCellStyle: DateRangePickerYearCellStyle(
                disabledDatesTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                leadingDatesTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                textStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                todayTextStyle: TextStyle(
                  color: isLightTheme(context)
                      ? MainColorsApp.accentColor
                      : Theme.of(context).primaryColor,
                ),
              ),
              headerStyle: DateRangePickerHeaderStyle(
                textStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 15.sp,
                    ),
              ),
              maxDate: DateTime.now(),
              startRangeSelectionColor: Theme.of(context).primaryColorLight,
              endRangeSelectionColor: Theme.of(context).primaryColorLight,
              rangeSelectionColor:
                  Theme.of(context).primaryColorLight.withOpacity(0.2),
              selectionMode: DateRangePickerSelectionMode.range,
              todayHighlightColor: isLightTheme(context)
                  ? MainColorsApp.accentColor
                  : Theme.of(context).primaryColor,
              selectionColor: isLightTheme(context)
                  ? Theme.of(context).primaryColorLight.withOpacity(0.8)
                  : Theme.of(context).primaryColor.withOpacity(0.8),
              rangeTextStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    fontSize: 15.sp,
                  ),
            ),
            SizedBox(
              height: 35..h,
              child: FlatCustomButton(
                color: Theme.of(context).primaryColorLight,
                radius: 25.r,
                onTap: () {
                  // if (dateFromController == '' || dateToController == '') {
                  //   return;
                  // }
                  if (visibleDates.startDate != null) {
                    dateFromState.state =
                        pickStart!.millisecondsSinceEpoch.toString();
                  }
                  if (visibleDates.endDate != null) {
                    dateToState.state =
                        pickEnd!.millisecondsSinceEpoch.toString();
                  }
                  filterState.state = false;
                  context.pop();
                },
                height: 35..h,
                child: Text(
                  'Set Range',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 15.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.5.sp,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
