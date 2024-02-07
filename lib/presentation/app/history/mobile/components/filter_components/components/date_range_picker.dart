import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/filter/filter_state_provider.dart';
import 'package:user_app/application/history/history_from_state_provider.dart';
import 'package:user_app/application/history/history_to_state_provider.dart';
import 'package:user_app/presentation/app/history/web/components/filter_components/date_picker.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class DateRangePickerComponentMobile extends HookConsumerWidget {
  final VoidCallback? onTap;
  const DateRangePickerComponentMobile({super.key, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.read(filterStateProvider.notifier);
    final dateFromController = ref.watch(historySelectedDateFromProvider);
    final dateToController = ref.watch(historySelectedDateToProvider);

    return Row(
      children: [
        dateFromController != '' && dateToController != ''
            ? MobileGenericButton(
                onTap: () {
                  filterState.state = true;
                  onTap!();
                },
                color: MainColorsApp.accentColor,
                child: Text(
                  dateFromController != '' && dateToController != ''
                      ? formatMillisecondToData(dateFromController) +
                          ' - ' +
                          formatMillisecondToData(dateToController)
                      : '',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.whiteColor,
                      ),
                ),
              )
            : const SizedBox(),
        SizedBox(
          width: 6.w,
        ),
        dateFromController == '' && dateToController == ''
            ? MobileGenericButton(
              height: 25..h,
                onTap: () {
                  filterState.state = true;
                  onTap!();
                },
                color: isLightTheme(context)
                    ? AppColors.separatorLightTheme
                    : AppColors.mobileBackButtonColor,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      isLightTheme(context) ? calenderLight : calendarDark,
                      height: 13..h,
                      width: 13.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      tr('history.set_date'),
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.65.sp,
                            color: isLightTheme(context)
                                ? AppColors.mobileBackButtonColor
                                : AppColors.whiteColor,
                          ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
