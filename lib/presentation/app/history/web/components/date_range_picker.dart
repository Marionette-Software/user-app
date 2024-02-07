import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/filter/filter_state_provider.dart';
import 'package:user_app/application/history/history_from_state_provider.dart';
import 'package:user_app/application/history/history_to_state_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/app/history/web/components/filter_components/date_picker.dart';
import 'package:user_app/presentation/constants/colors.dart';

class DateRangePickerComponent extends HookConsumerWidget {
  const DateRangePickerComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.read(filterStateProvider.notifier);
    final dateFromController = ref.watch(historySelectedDateFromProvider);
    final dateFromState = ref.read(historySelectedDateFromProvider.notifier);
    final dateToController = ref.watch(historySelectedDateToProvider);
    final dateToState = ref.read(historySelectedDateToProvider.notifier);

    return Row(
      children: [
        dateFromController != '' && dateToController != ''
            ? Container(
                alignment: Alignment.center,
                height: 30.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: const Color(0xff1e065440),
                    width: 1.w,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dateFromController != '' && dateToController != ''
                            ? formatMillisecondToData(dateFromController) +
                                ' - ' +
                                formatMillisecondToData(dateToController)
                            : '',
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: 13.sp,
                                  color: AppColors.whiteColor,
                                ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
        SizedBox(
          width: 10.w,
        ),
        InkWell(
          onTap: () {
            filterState.state = true;
          },
          child: SizedBox(
            child: dateFromController == '' && dateToController == ''
                ? Tooltip(
                  message: 'Select date range'.hardcoded,
                  verticalOffset: -60.h,
                  child: Icon(
                      Icons.calendar_month,
                      color: Theme.of(context).primaryColorLight,
                      size: 30.w,
                    ),
                )
                : InkWell(
                    onTap: () {
                      dateFromState.state = '';
                      dateToState.state = '';
                    },
                    child: Icon(
                      Icons.clear,
                      color: Theme.of(context).primaryColorLight,
                      size: 30.w,
                    ),
                  ),
          ),
        )
      ],
    );
  }
}
