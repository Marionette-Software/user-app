import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderMarketHistoryMobile extends StatelessWidget {
  const HeaderMarketHistoryMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 12.h,
          width: 110.w,
          child: AutoSizeText(
            tr('trade.price'),
            maxFontSize: 10,
            minFontSize: 4,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                ),
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 12.h,
          width: 80.w,
          child: AutoSizeText(
            tr('trade.amount'),
            maxFontSize: 10,
            minFontSize: 4,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                ),
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 12.h,
          width: 80.w,
          child: AutoSizeText(
            tr('trade.time'),
            maxFontSize: 10,
            minFontSize: 4,
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                ),
          ),
        ),
      ],
    );
  }
}
