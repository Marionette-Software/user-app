import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_user_history.data.gql.dart';
import 'package:user_app/presentation/app/history/mobile/components/filter_components/components/date_picker.dart';
import 'package:user_app/presentation/app/history/mobile/components/filter_components/components/date_range_picker.dart';
import 'package:user_app/presentation/app/history/mobile/components/filter_components/components/payment_type_picker.dart';
import 'package:user_app/presentation/app/history/mobile/components/filter_currency_component.dart';
import 'package:user_app/presentation/components/flat_custom_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/sizes.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class FilterBoxComponentMobile extends HookConsumerWidget {
  const FilterBoxComponentMobile({
    required this.pagingController,
    super.key,
  });

  final ValueNotifier<
          PagingController<int, GGetUserHistoryData_history_result?>>
      pagingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchCurrencyControllerValue = useState('');

    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 20..h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              tr('history.date'),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.75.sp,
                                  ),
                            ),
                            const Spacer(),
                            DateRangePickerComponentMobile(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (builder) {
                                    return const Wrap(
                                      children: [
                                        CustomDatePickerMobile(),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12..h,
                        ),
                        Divider(
                          height: 1..h,
                          color: isLightTheme(context)
                              ? AppColors.separatorLightTheme
                              : AppColors.separatorDarkTheme,
                        ),
                        SizedBox(
                          height: 15..h,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            tr('history.type'),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 15.sp,
                                  letterSpacing: -0.75.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 15..h,
                        ),
                        const PaymentTypePickerMobile(),
                        gapH16,
                        Divider(
                          height: 1..h,
                          color: isLightTheme(context)
                              ? AppColors.separatorLightTheme
                              : AppColors.separatorDarkTheme,
                        ),
                        SizedBox(
                          height: 15..h,
                        ),
                        Row(
                          children: [
                            Text(
                              tr('history.currencies'),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    letterSpacing: -0.75.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20..h,
                        ),
                        Container(
                          height: 30..h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
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
                              prefixIcon: SizedBox(
                                width: 16.w,
                                height: 18..h,
                                child: Icon(
                                  Icons.search,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                  size: 20.w,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: MainColorsApp.accentColor,
                                  width: 1.0.w,
                                ),
                                borderRadius: BorderRadius.circular(
                                  25.r,
                                ),
                              ),
                              fillColor: isLightTheme(context)
                                  ? cardColor
                                  : AppColors.whiteColor.withOpacity(0.05),
                              contentPadding: EdgeInsets.only(
                                top: 6..h,
                                bottom: 6..h,
                                left: 8.w,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontSize: 13.sp,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.65.sp,
                                  ),
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.65.sp,
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 15..h,
                        ),
                        FilterCurrencyComponentMobile(
                          searchCurrencyControllerValue:
                              searchCurrencyControllerValue,
                        ),
                        SizedBox(
                          height: 40..h,
                        ),
                        FlatCustomButton(
                          height: 40..h,
                          radius: 21.r,
                          color: Theme.of(context).primaryColorLight,
                          onTap: () {
                            pagingController.value.refresh();
                           context.pop();
                          },
                          child: Text(
                            tr('history.apply'),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.05.sp,
                                  color: AppColors.whiteColor,
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 30..h,
                        ),
                      ],
                    ),
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
