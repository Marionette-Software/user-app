import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoWithDescription extends StatelessWidget {
  const LogoWithDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 37.h,
          ),
          child: SizedBox(
            width: 587.w,
            height: 176.h,
            child: AutoSizeText(
              tr('non_custodial_exchange.simple_dimple'),
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 80,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
        SizedBox(
          width: 633.w,
          height: 72.h,
          child: AutoSizeText(
            tr('non_custodial_exchange.fast_secure_v1'),
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ],
    );
  }
}
