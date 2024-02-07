import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/presentation/constants/colors.dart';

class RequestSuccessfullySubmittedWeb extends HookConsumerWidget {
  const RequestSuccessfullySubmittedWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 600.w,
      height: 310.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: AppColors.whiteColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 43.h,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 72.h,
              width: 600.w,
              child: AutoSizeText(
                tr('non_custodial_exchange.exchange_request_submit'),
                minFontSize: 3,
                maxFontSize: 30,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 30,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 37.h,
            ),
            SizedBox(
              height: 24.h,
              width: 600.w,
              child: AutoSizeText(
                tr('non_custodial_exchange.please_approve'),
                minFontSize: 3,
                maxFontSize: 20,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 20,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 37.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50.w,
                  height: 50.h,
                  child: Icon(
                    Icons.circle,
                    size: 50.h,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                SizedBox(
                  width: 50.w,
                  height: 50.h,
                  child: Icon(
                    Icons.circle,
                    size: 50.h,
                    color: iconColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
