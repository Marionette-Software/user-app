import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/general/extensions.dart';

class ActiveStakingRowWeb extends StatelessWidget {
  const ActiveStakingRowWeb({required this.activeStaking, super.key});

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
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: -1.sp,
              ),
        ),
        Text(
          activeStaking,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: -1.sp,
              ),
        ),
      ],
    );
  }
}
