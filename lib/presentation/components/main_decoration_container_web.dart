import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MainDecorationContainerWeb extends StatelessWidget {
  const MainDecorationContainerWeb({
    required this.content,
    this.borderRadius = 10,
    super.key,
  });

  final Widget content;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
        color: Colors.white,
        gradient: isLightTheme(context)
            ? null
            : const LinearGradient(
                begin: Alignment(0, -1),
                end: Alignment(0, 1),
                colors: [Color(0xff1c252d), Color(0x001c252d)],
                stops: [0, 1],
              ),
        boxShadow: [
          isLightTheme(context)
              ? BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(0, 3),
                )
              : BoxShadow(
                  color: Theme.of(context).primaryColorLight.withOpacity(0.0),
                  spreadRadius: 15,
                  blurRadius: 30,
                  offset: const Offset(0, 3),
                )
        ],
      ),
      child: content,
    );
  }
}
