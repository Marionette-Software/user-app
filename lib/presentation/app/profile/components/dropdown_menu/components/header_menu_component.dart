import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';

class HeaderMenuWeb extends StatelessWidget {
  const HeaderMenuWeb({
    super.key,
    required this.email,
    required this.name,
    required this.platformType,
  });

  final String email;
  final String name;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Tooltip(
          message: name.length > 20 ? name : '',
          child: SizedBox(
            width: 350.w,
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1.5.sp,
                  ),
            ),
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        Tooltip(
          message: email.length > 20 ? email : '',
          child: SizedBox(
            width: 350.w,
            child: Text(
              email,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 20.sp,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1.sp,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
