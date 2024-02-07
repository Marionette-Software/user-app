import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

mainShowModalBottomSheet({
  required BuildContext context,
  required content,
  required bool longShowModalBottom,
}) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          child: GestureDetector(
            behavior: HitTestBehavior
                .opaque, // Capture tap events outside the text field
            onTap: () {
              FocusScope.of(context)
                  .unfocus(); // Optional: This will unfocus the text field when tapping outside
            },
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: isLightTheme(context)
                      ? AppColors.whiteColor
                      : walletBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                padding: EdgeInsets.only(
                  bottom: longShowModalBottom
                      ? 0
                      : MediaQuery.of(context).viewInsets.bottom,
                ),
                child: content,
              ),
            ),
          ),
        ),
      );
    },
  );
}
