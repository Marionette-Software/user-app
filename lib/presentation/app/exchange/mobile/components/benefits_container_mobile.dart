import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BenefitsContainerMobile extends StatelessWidget {
  const BenefitsContainerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 47.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.h,
                  child: AutoSizeText(
                    '150+',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                  child: AutoSizeText(
                    tr('non_custodial_exchange.digital_assets'),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 10,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.h,
                  child: AutoSizeText(
                    '\$423',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                  child: AutoSizeText(
                    tr('non_custodial_exchange.exchange_options'),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 10,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 32.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.h,
                  child: AutoSizeText(
                    '230k',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                  child: AutoSizeText(
                    tr('non_custodial_exchange.transactions'),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 10,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.h,
                  child: AutoSizeText(
                    '<0.05',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                  child: AutoSizeText(
                    tr('non_custodial_exchange.low_commissions'),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 10,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 40.h,
        ),
        SizedBox(
          width: 262.w,
          height: 72.h,
          child: AutoSizeText(
            tr('non_custodial_exchange.simple_dimple'),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 34,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        SizedBox(
          height: 22.h,
        ),
        SizedBox(
          height: 19.h,
          child: AutoSizeText(
            tr('non_custodial_exchange.try_all_functional_by_yourself'),
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        SizedBox(
          height: 23.h,
        ),
      ],
    );
  }
}
