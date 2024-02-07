import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';

class ItemMenuComponent extends StatelessWidget {
  const ItemMenuComponent({
    super.key,
    required this.title,
    required this.haveBorder,
    required this.onTap,
    required this.platformType,
  });

  final String title;
  final bool haveBorder;
  final void Function() onTap;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Theme.of(context).primaryColor.withOpacity(0.25),
          height: 1.h,
        ),
        SizedBox(
          height: 29.h,
        ),
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1.sp,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 29.h,
        ),
      ],
    );
  }
}
