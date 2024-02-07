import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/app/exchange/web/components/benefits_row/components/benefit_item.dart';

class BenefitsRow extends StatelessWidget {
  const BenefitsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 21.h,
        left: 20.w,
        right: 20.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BenefitItem(
            title: '150+',
            subTitle: tr('non_custodial_exchange.digital_assets'),
          ),
          BenefitItem(
            title: '10+',
            subTitle: tr('non_custodial_exchange.exchange_options'),
          ),
          BenefitItem(
            title: '230k',
            subTitle: tr('non_custodial_exchange.transactions'),
          ),
          BenefitItem(
            title: '<0.05',
            subTitle: tr('non_custodial_exchange.low_commissions'),
          ),
        ],
      ),
    );
  }
}
