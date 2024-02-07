import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderMarketHistoryTradeWeb extends StatelessWidget {
  const HeaderMarketHistoryTradeWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: Row(
        children: [
          SizedBox(
            width: 90.w,
            child: Text(
              tr('trade.price'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 15.sp,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 90.w,
            child: Text(
              tr('trade.amount'),
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 15.sp,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 90.w,
            child: Text(
              tr('trade.time'),
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 15.sp,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
