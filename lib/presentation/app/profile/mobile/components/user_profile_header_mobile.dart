import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileHeaderMobile extends StatelessWidget {
  const UserProfileHeaderMobile({
    super.key,
    required this.email,
    required this.name,
  });

  final String email;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 25.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  letterSpacing: -1.25.sp,
                  fontWeight: FontWeight.w600,
                  fontSize: 25.sp,
                ),
          ),
          SizedBox(
            height: 5..h,
          ),
          Text(
            email,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  letterSpacing: -0.65.sp,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp,
                ),
          ),
        ],
      ),
    );
  }
}
