import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.height,
    required this.color,
    this.fontSize = 20,
    this.borderRadius = 10,
    this.disableColor = MainColorsApp.accentColor,
    this.isWeb = true,
  }) : super(key: key);

  final Function()? onTap;
  final String text;
  final double height;
  final double fontSize;
  final Color color;
  final Color disableColor;
  final double borderRadius;
  final bool isWeb;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
            ),
          ),
          padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return disableColor;
              }
              return color;
            },
          ),
        ),
        onPressed: onTap,
        child: Ink(
          width: double.infinity,
          child: Container(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: fontSize.sp,
                      letterSpacing: -1.sp,
                      fontWeight: isWeb ? FontWeight.w600 : FontWeight.w400,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
