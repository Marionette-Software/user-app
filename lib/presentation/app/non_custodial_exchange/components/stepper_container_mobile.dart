import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_provider.dart';
import 'package:user_app/domain/non_custodial_exchange/stepper_item.dart';
import 'package:user_app/presentation/constants/colors.dart';

class StepperContainerMobile extends HookConsumerWidget {
  StepperContainerMobile({super.key});
  final List<StepItemData> data = [
    StepItemData(
      title: tr('non_custodial_exchange.step_item_title_1'),
      description: tr('non_custodial_exchange.step_item_description_1'),
      headerText: '${tr('non_custodial_exchange.step')} 1',
    ),
    StepItemData(
      title: tr('non_custodial_exchange.step_item_title_2'),
      description: tr('non_custodial_exchange.step_item_description_2'),
      headerText: '${tr('non_custodial_exchange.step')} 2',
    ),
    StepItemData(
      title: tr('non_custodial_exchange.step_item_title_3'),
      description: tr('non_custodial_exchange.step_item_description_3'),
      headerText: '${tr('non_custodial_exchange.step')} 3',
    ),
    StepItemData(
      title: tr('non_custodial_exchange.step_item_title_4'),
      description: tr('non_custodial_exchange.step_item_description_4'),
      headerText: '${tr('non_custodial_exchange.step')} 4',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(nonCustodialProgressStateProvider);

    return Column(
      children: [
        Container(
          width: 320.w,
          height: 130.h,
          color: MainColorsApp.accentColor,
          child: Padding(
            padding: EdgeInsets.only(
              top: 22.h,
              bottom: 15.h,
              left: 25.w,
              right: 25.w,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 35.h,
                      width: 135.w,
                      child: AutoSizeText(
                        data[progress - 1].title,
                        maxFontSize: 15,
                        minFontSize: 5,
                        style: Theme.of(context).textTheme.labelLarge,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 127.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColorText,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 25.h,
                          width: 115.w,
                          child: AutoSizeText(
                            data[progress - 1].description,
                            maxFontSize: 10,
                            minFontSize: 5,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: MainColorsApp.primaryOp25Color,
                                ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 22.h,
                  child: ListView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Container(
                          height: 22.h,
                          width: 57.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: progress - 1 == index
                                ? AppColors.whiteColorText
                                : AppColors.whiteColorText.withOpacity(0.5),
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 12.h,
                              child: AutoSizeText(
                                data[index].headerText,
                                maxFontSize: 10,
                                minFontSize: 5,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 10,
                                      color: MainColorsApp.accentColor,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
