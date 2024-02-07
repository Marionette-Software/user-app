import 'package:flutter/material.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class ExchangeDecorationWeb extends StatelessWidget {
  const ExchangeDecorationWeb({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: isLightTheme(context)
            ? const RadialGradient(
                center: Alignment(
                  0.6,
                  -0.4,
                ),
                colors: [
                  Color(0xff627EEA),
                  AppColors.whiteColor,
                ],
                radius: 0.75,
              )
            : RadialGradient(
                center: const Alignment(
                  0.6,
                  -0.4,
                ),
                colors: [
                  Theme.of(context).colorScheme.background,
                  Theme.of(context).colorScheme.background,
                ],
                radius: 0.75,
              ),
      ),
      child: child,
    );
  }
}
