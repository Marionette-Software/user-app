import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/infrastructure/filter/filter_operations.dart';
import 'package:user_app/presentation/app/history/web/components/filter_components/filter_operations.dart';

class PaymentTypePicker extends HookConsumerWidget {
  const PaymentTypePicker({super.key, required this.paymentTypePickerState});

  final ValueNotifier<FilterOperation> paymentTypePickerState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              paymentTypePickerState.value = item;
            },
            child: FilterOperationsComponentWeb(
              text: item.name,
              isSelected:
                  paymentTypePickerState.value.id == item.id ? true : false,
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
