import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxShadowWeb extends StatelessWidget {
  const BoxShadowWeb({
    super.key,
    required this.positionedLeft,
    required this.positionedBottom,
    required this.positionedTop,
    required this.color,
  });

  final double positionedLeft;
  final double positionedBottom;
  final double positionedTop;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: positionedLeft.w,
      bottom: positionedBottom .h,
      top: positionedTop.h,
      child: Container(
        height: 600.h,
        width: 600.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: color.withOpacity(0.000001),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              spreadRadius: 40,
              blurRadius: 2000000000000000000,
              offset: const Offset(
                0,
                10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
