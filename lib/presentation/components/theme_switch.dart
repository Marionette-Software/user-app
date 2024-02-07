import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    Key? key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.toggleSize,
  }) : super(key: key);

  final double width;
  final double height;
  final double borderRadius;
  final double toggleSize;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      duration: Duration.zero,
      width: width,
      height: height,
      toggleSize: toggleSize,
      value: isLightTheme(context) ? true : false,
      borderRadius: borderRadius,
      padding: 1,
      activeToggleColor: Theme.of(context).primaryColorLight,
      inactiveToggleColor: Theme.of(context).primaryColorLight,
      activeTextColor: const Color(0xFF2F363D),
      activeSwitchBorder: Border.all(
        color: Theme.of(context).primaryColor.withOpacity(0.25),
      ),
      inactiveSwitchBorder: Border.all(
        color: Colors.transparent,
      ),
      activeColor: AppColors.darkColorText,
      inactiveColor: AppColors.whiteColor,
      inactiveIcon: const Icon(
        Icons.nightlight_round,
        color: AppColors.whiteColor,
      ),
      activeIcon: const Icon(
        Icons.wb_sunny,
        color: AppColors.whiteColor,
      ),
      onToggle: (value) async {
        ThemeProvider.controllerOf(context).nextTheme();
      },
    );
  }
}
