import 'package:flutter/material.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MainDecorationForm extends StatelessWidget {
  const MainDecorationForm({
    super.key,
    required this.platformType,
    required this.content,
  });

  final PlatformTypeState platformType;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: platformType == PlatformTypeState.mobile
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  isLightTheme(context)
                      ? AppColors.whiteColor
                      : AppColors.whiteColor.withOpacity(0.1),
                  isLightTheme(context)
                      ? AppColors.whiteColor
                      : AppColors.whiteColor.withOpacity(0.0),
                ],
              )
            : null,
        border: platformType == PlatformTypeState.mobile
            ? Border(
                top: BorderSide(
                  width: 1.0,
                  color: isLightTheme(context)
                      ? Colors.transparent
                      : AppColors.whiteColor.withOpacity(0.25),
                ),
              )
            : null,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: content,
      ),
    );
  }
}
