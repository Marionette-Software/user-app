import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/non_custodial_exchange/stepper_item.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class StepperItemWeb extends StatelessWidget {
  const StepperItemWeb({
    super.key,
    required this.item,
    required this.index,
    required this.itemsCount,
    required this.selectedIndex,
  });

  final StepItemData item;
  final int index;
  final int itemsCount;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 352.w,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: isLightTheme(context)
                ? index == selectedIndex
                    ? Theme.of(context).primaryColorLight
                    : bgElementColor
                : index == selectedIndex
                    ? Theme.of(context).primaryColorLight
                    : AppColors.whiteColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 15.h,
            ),
            child: Row(
              children: [
                (index < selectedIndex || selectedIndex == 3)
                    ? Icon(
                        Icons.done,
                        color: index == 3
                            ? AppColors.whiteColor
                            : Theme.of(context).primaryColorLight,
                        size: 20.h,
                      )
                    : index == selectedIndex
                        ? Icon(
                            Icons.circle,
                            color: AppColors.whiteColor,
                            size: 15.h,
                          )
                        : SizedBox(
                            child: SizedBox(
                              height: 24.h,
                              child: AutoSizeText(
                                (index + 1).toString(),
                                minFontSize: 3,
                                maxFontSize: 20,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      fontSize: 20,
                                      color: const Color(0xFFB3ADC1),
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                SizedBox(
                  width: 17.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.h,
                      child: AutoSizeText(
                        item.title,
                        maxFontSize: 20,
                        minFontSize: 3,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: (index < selectedIndex)
                                      ? stepColor
                                      : index == selectedIndex
                                          ? AppColors.whiteColor
                                          : Theme.of(context).primaryColor,
                                ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 3.w,
                    ),
                    SizedBox(
                      height: 45.h,
                      child: AutoSizeText(
                        item.description,
                        maxFontSize: 20,
                        minFontSize: 3,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: (index < selectedIndex)
                                      ? stepColor
                                      : index == selectedIndex
                                          ? AppColors.whiteColor
                                          : Theme.of(context).primaryColor,
                                ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        itemsCount - 1 != index
            ? SizedBox(
                height: 25.h,
              )
            : const SizedBox()
      ],
    );
  }
}
