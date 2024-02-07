import 'package:flutter/material.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class DecorationNonCustodialForm extends StatelessWidget {
  const DecorationNonCustodialForm({
    required this.content,
    required this.width,
    required this.platformType,
    this.height,
    super.key,
  });

  final Widget content;
  final double width;
  final double? height;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          getSizeFromPlatformType(
            platformType: platformType,
            webValue: 10,
            tabletValue: 10,
            mobileValue: 5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.boxShadowColor,
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isLightTheme(context)
                ? AppColors.whiteColorText
                : AppColors.backgroundFormColor.withOpacity(0.9),
            isLightTheme(context)
                ? AppColors.whiteColorText
                : AppColors.backgroundFormColor.withOpacity(0.8),
          ],
        ),
        border: Border.all(
          color: AppColors.whiteColorText.withOpacity(0.25),
          width: 1,
        ),
      ),
      child: content,
    );
  }
}
