import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_provider.dart';
import 'package:user_app/domain/non_custodial_exchange/stepper_item.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/web/components/stepper_item.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class StepperContainerWeb extends HookConsumerWidget {
  StepperContainerWeb({super.key});
  final List<StepItemData> data = [
    StepItemData(
      title: tr('non_custodial_exchange.step_item_title_1'),
      description: tr('non_custodial_exchange.step_item_description_1'),
      headerText: tr('non_custodial_exchange.step_item_header_text_1'),
    ),
    StepItemData(
      title: tr('non_custodial_exchange.step_item_title_2'),
      description: tr('non_custodial_exchange.step_item_description_2'),
      headerText: tr('non_custodial_exchange.step_item_header_text_2'),
    ),
    StepItemData(
      title: tr('non_custodial_exchange.step_item_title_3'),
      description: tr('non_custodial_exchange.step_item_description_3'),
      headerText: tr('non_custodial_exchange.step_item_header_text_3'),
    ),
    StepItemData(
      title: tr('non_custodial_exchange.step_item_title_4'),
      description: tr('non_custodial_exchange.step_item_description_4'),
      headerText: tr('non_custodial_exchange.step_item_header_text_4'),
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(nonCustodialProgressStateProvider);

    return Column(
      children: [
        Container(
          width: 402.w,
          height: 726.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                isLightTheme(context)
                    ? AppColors.whiteColorText
                    : AppColors.backgroundFormColor.withOpacity(0.9),
                isLightTheme(context)
                    ? AppColors.whiteColorText
                    : AppColors.backgroundFormColor.withOpacity(0.8),
              ],
            ),
            border: Border.all(
              color: AppColors.whiteColorText.withOpacity(0.25),
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 26.w,
              vertical: 22.h,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                  width: 402.w,
                  child: AutoSizeText(
                    data[progress - 1].headerText,
                    maxFontSize: 30,
                    minFontSize: 8,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 30,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 37.h,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 261.w,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: progress * 0.25,
                              minHeight: 12.h,
                              color: Theme.of(context).primaryColorLight,
                              backgroundColor: bgElementColor,
                              valueColor: AlwaysStoppedAnimation(
                                Theme.of(context).progressIndicatorTheme.color,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 27.w,
                        ),
                        Container(
                          width: 58.w,
                          height: 28.h,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 17.h,
                              child: AutoSizeText(
                                '$progress of ${data.length}',
                                minFontSize: 3,
                                maxFontSize: 15,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      color: AppColors.whiteColor,
                                      fontSize: 15,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: isLightTheme(context)
                          ? AppColors.blackColor.withOpacity(0.25)
                          : AppColors.whiteColor.withOpacity(0.25),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                  ],
                ),
                SizedBox(
                  width: 402.w,
                  height: 500.h,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return StepperItemWeb(
                        item: data[index],
                        index: index,
                        itemsCount: data.length,
                        selectedIndex: progress - 1,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 100.h,
        ),
      ],
    );
  }
}
