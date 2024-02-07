import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ProfileMobileRow extends StatelessWidget {
  final VoidCallback onTap;
  final Widget? icon;
  final Widget leftChild;
  final Widget rightChild;
  const ProfileMobileRow({
    super.key,
    required this.onTap,
    this.icon,
    required this.leftChild,
    required this.rightChild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57..h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2..h,
            color: isLightTheme(context)
                ? AppColors.separatorLightTheme
                : AppColors.separatorDarkTheme,
          ),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon != null
                ? Row(
                    children: [
                      SizedBox(
                        width: 25.w,
                      ),
                      icon!,
                      SizedBox(
                        width: 8.w,
                      ),
                    ],
                  )
                : const SizedBox(),
            Expanded(
              child: InkWell(
                onTap: onTap,
                child: Padding(
                  padding: EdgeInsets.only(left: icon != null ? 0.w : 25.w),
                  child: leftChild,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 25.w),
              child: rightChild,
            ),
          ],
        ),
      ),
    );
  }
}
