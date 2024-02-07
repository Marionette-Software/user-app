import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/wallet/recipient.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SelectRecipientContainerWeb extends StatelessWidget {
  const SelectRecipientContainerWeb({
    required this.selectedRecipient,
    super.key,
  });

  final ValueNotifier<Recipient> selectedRecipient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: Colors.transparent,
        // color: isLightTheme(context)
        //     ? AppColors.whiteColor
        //     : AppColors.mainBackgroundDarkColor,
        border: Border.all(
          width: 5.w,
          color: isLightTheme(context)
              ? AppColors.mainBackgroundLightColor
              : AppColors.mainBackgroundDarkColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 23.w, right: 15.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 350.w,
              child: Text(
                  selectedRecipient.value.description!.isEmpty
                      ? 'Select Recipient'.hardcoded
                      : selectedRecipient.value.description!,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.sp,
                      )),
            ),
            Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Theme.of(context).textTheme.headlineMedium!.color,
              size: 25.w,
            )
          ],
        ),
      ),
    );
  }
}
