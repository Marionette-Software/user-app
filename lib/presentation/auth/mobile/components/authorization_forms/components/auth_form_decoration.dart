import 'package:flutter/material.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AuthContainerDecoration extends StatelessWidget {
  const AuthContainerDecoration({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
  }) : super(key: key);

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: isLightTheme(context)
                  ? AppColors.whiteColor
                  : MainColorsApp.safeAreaDarkColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColorLight.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.whiteColor.withOpacity(0.25),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child,
      ],
    );
  }
}
