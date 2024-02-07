import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_utils.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class CalendarFormWeb extends StatelessWidget {
  const CalendarFormWeb({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();

    return Container(
      width: 404.w,
      height: 532.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.whiteColor,
        gradient: isLightTheme(context)
            ? null
            : const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff1C252D), Color(0xff020C15)],
              ),
      ),
      padding: EdgeInsets.only(
        left: 23.w,
        right: 23.w,
        bottom: 40.h,
        top: 25.h,
      ),
      child: Column(
        children: [
          Text(
            tr('Have questions?\nBook a call!'),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 30.sp,
              letterSpacing: -1.5.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          SizedBox(
            width: 358.w,
            height: 280.h,
            child: CalendarDatePicker2(
              onValueChanged: (value) {
                selectedDate = value.first!;
              },
              config: CalendarDatePicker2Config(
                dayTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w400,
                ),
                controlsTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w400,
                ),
                todayTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w400,
                ),
                selectedDayTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                selectedYearTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w400,
                ),
                weekdayLabelTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w400,
                ),
                disabledDayTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  fontWeight: FontWeight.w400,
                ),
                yearTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w400,
                ),
                nextMonthIcon: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).primaryColor,
                  size: 15.h,
                ),
                lastMonthIcon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).primaryColor,
                  size: 15.h,
                ),
                selectedDayHighlightColor: Theme.of(context).primaryColorLight,
                selectableDayPredicate: (day) => day.isAfter(
                  DateTime.now(),
                ),
              ),
              value: [],
              // initialValue: const [],
            ),
          ),
          const Spacer(),
          MainButton(
            onTap: () {
              PlatformUtils.openLink(
                  "https://calendly.com/marionette-stack/demo?month=${selectedDate.year}${selectedDate.month}&date=${selectedDate.year}-${selectedDate.month}-${selectedDate.day}");
            },
            text: tr('marionette_form.schedule_review'),
            height: 60.h,
            disableColor: MainColorsApp.accentColor.withOpacity(0.5),
            color: Theme.of(context).primaryColorLight,
          )
        ],
      ),
    );
  }
}
