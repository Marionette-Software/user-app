import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/filter/filter_operations_provider.dart';
import 'package:user_app/infrastructure/filter/filter_operations.dart';
import 'package:user_app/presentation/app/history/mobile/components/filter_components/components/filter_operation_item.dart';

class PaymentTypePickerMobile extends HookConsumerWidget {
  const PaymentTypePickerMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterOperationsWatch = ref.watch(filterOperationsStateProvider);
    final filterOperationsState =
        ref.read(filterOperationsStateProvider.notifier);

    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: historyArrayOperations.length,
      itemBuilder: (context, i) {
        var item = historyArrayOperations[i];
        return Padding(
          padding: EdgeInsets.only(right: 15.w, bottom: 15.h),
          child: InkWell(
            borderRadius: BorderRadius.circular(12.r),
            onTap: () {
              filterOperationsState.state = item;
            },
            child: FilterOperationsItemMobile(
              text: item.name,
              isSelected: filterOperationsWatch.id == item.id ? true : false,
            ),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.5,
      ),
    );
  }
}
