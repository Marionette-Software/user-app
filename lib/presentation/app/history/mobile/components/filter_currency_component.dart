import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/filter/filter_currency_provider.dart';
import 'package:user_app/application/history/get_currency_for_filter_history_future_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/infrastructure/filter/filter_currency.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class FilterCurrencyComponentMobile extends HookConsumerWidget {
  const FilterCurrencyComponentMobile({
    required this.searchCurrencyControllerValue,
    super.key,
  });

  final ValueNotifier<String> searchCurrencyControllerValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterCurrencyState = ref.read(filterCurrencyStateProvider.notifier);
    final filterCurrencyWatch = ref.watch(filterCurrencyStateProvider);
    final refreshValue = useState(1);

    final getFilterCurrencyListFuture = ref.watch(
      getCurrencyForFilterHistoryFutureProvider('${refreshValue.value}'),
    );

    List<FilterCurrency> localArray = filterCurrencyWatch;

    List<FilterCurrency> getSearchedCurrency() {
      if (searchCurrencyControllerValue.value.isNotEmpty) {
        return filterCurrencyWatch
            .where((element) =>
                capitalize(element.id).contains(
                    capitalize(searchCurrencyControllerValue.value)) ||
                element.id.toUpperCase().contains(
                    searchCurrencyControllerValue.value.toUpperCase()) ||
                element.id.toLowerCase().contains(
                    searchCurrencyControllerValue.value.toLowerCase()))
            .toList();
      }
      return filterCurrencyWatch;
    }

    return SizedBox(
      height: 170..h,
      child: SingleChildScrollView(
        child: getFilterCurrencyListFuture.when(
          data: (data) {
            return Column(
              children: [
                getSearchedCurrency().isEmpty
                    ? Padding(
                        padding: EdgeInsets.only(top: 85..h),
                        child: Center(
                          child: Text(
                            'No matches'.hardcoded,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: isLightTheme(context)
                                      ? AppColors.aboutHeaderLight
                                      : AppColors.whiteColor.withOpacity(0.5),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp,
                                  letterSpacing: -0.75.sp,
                                ),
                          ),
                        ),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: getSearchedCurrency().length,
                        itemBuilder: (context, i) {
                          var item = getSearchedCurrency()[i];
                          return Row(
                            children: [
                              SizedBox(
                                width: 30.w,
                                height: 30..h,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .fillColor,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Checkbox(
                                    side: MaterialStateBorderSide.resolveWith(
                                      (states) => BorderSide(
                                        width: 0,
                                        color: Theme.of(context)
                                            .inputDecorationTheme
                                            .fillColor!,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.r),
                                    ),
                                    activeColor: AppColors.checkboxActiveColors,
                                    checkColor:
                                        Theme.of(context).primaryColorLight,
                                    overlayColor:
                                        MaterialStateProperty.all<Color>(
                                      Theme.of(context)
                                          .inputDecorationTheme
                                          .fillColor!,
                                    ),
                                    tristate: false,
                                    value: item.isSelected,
                                    splashRadius: 3,
                                    onChanged: (value) {
                                      // historyState.state = 0;
                                      item.isSelected = value!;
                                      filterCurrencyState.state = [];
                                      filterCurrencyState.state = localArray;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                item.id,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.75.sp,
                                    ),
                              ),
                            ],
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2,
                        ),
                      )
              ],
            );
          },
          error: (error, _) => UserAppError(
            errorMessage: error.toString(),
          ),
          loading: () => const MainLoaderMobile(
            loaderSize: 100,
          ),
        ),
      ),
    );
  }
}
