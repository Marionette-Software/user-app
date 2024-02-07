import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceRow extends StatelessWidget {
  const BalanceRow({
    Key? key,
    required this.balance,
    required this.id,
  }) : super(key: key);

  final String id;
  final String balance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.h,
        bottom: 5.h
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          '${tr('wallet.available')} $balance ${id.toUpperCase()}',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.9.sp,
              ),
        ),
      ),
    );
  }
}
