import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class EmptyMarketTradeHistoryWeb extends StatelessWidget {
  const EmptyMarketTradeHistoryWeb({super.key});

  @override
  Widget build(BuildContext context) {
    Widget emptyContainer() {
      return Container(
        width: 90.w,
        height: 24.h,
        color: isLightTheme(context)
            ? AppColors.mainBackgroundLightColor
            : AppColors.whiteColor.withOpacity(0.05),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => SizedBox(
        height: 10.h,
      ),
      itemCount: 14,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: Row(
            children: [
              emptyContainer(),
              const Spacer(),
              emptyContainer(),
              const Spacer(),
              emptyContainer(),
            ],
          ),
        );
      },
    );
  }
}
