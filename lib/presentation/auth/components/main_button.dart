import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';

class MainButtonMobile extends StatelessWidget {
  const MainButtonMobile({
    Key? key,
    required this.onTap,
    required this.text,
    required this.height,
    required this.color,
    this.fontSize = 20,
    this.borderRadius = 5.0,
    this.fontWeight = FontWeight.w500,
    this.disableColor = MainColorsApp.accentColor,
  }) : super(key: key);

  final Function()? onTap;
  final String text;
  final double height;
  final double fontSize;
  final Color color;
  final double borderRadius;
  final Color disableColor;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        child: Ink(
          width: double.infinity,
          child: Container(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: fontSize.sp,
                      fontWeight: fontWeight,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
