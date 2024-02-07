import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/general/extensions.dart';

class ActiveStakingRowMobile extends StatelessWidget {
  const ActiveStakingRowMobile({
    required this.activeStaking,
    super.key,
  });

  final String activeStaking;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Active staking:'.hardcoded,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.75.sp,
              ),
        ),
        Text(
          activeStaking,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.75.sp,
              ),
        ),
      ],
    );
  }
}
