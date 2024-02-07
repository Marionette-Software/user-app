import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';

class MainLabel extends StatelessWidget {
  const MainLabel({
    super.key,
    required this.label,
    required this.platformType,
  });
  final String label;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: platformType == PlatformTypeState.web ? 20.sp : 15.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: -1.sp,
            ),
      ),
    );
  }
}
