import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/presentation/app/history/history.dart';
import 'package:user_app/presentation/constants/colors.dart';

class FullHistoryButton extends StatelessWidget {
  const FullHistoryButton({
    Key? key,
    required this.color,
    this.disableColor = MainColorsApp.accentColor,
  }) : super(key: key);

  final Color color;
  final Color disableColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        context.go(History.routeName);
      },
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                tr('wallet.full_history'),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: 20.sp,
                      letterSpacing: -1.sp,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
