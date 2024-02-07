import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ModalWindow extends StatelessWidget {
  const ModalWindow({
    super.key,
    required this.title,
    required this.content,
    this.titleSize,
    this.backgroundColor,
    this.headerLeftPadding = 26.0,
    this.headerRightPadding = 26.0,
  });

  final String title;
  final double headerLeftPadding;
  final double headerRightPadding;
  final Color? backgroundColor;
  final Widget content;
  final double? titleSize;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        backgroundColor: isLightTheme(context)
            ? AppColors.whiteColor
            : const Color(0xFF1C2142).withOpacity(0.55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),
          side: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.25),
            width: 1,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(
            left: headerLeftPadding.w,
            right: headerRightPadding.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: titleSize,
                      ),
                ),
              ),
              const Spacer(),
              InkWell(
                child: Icon(
                  Icons.close,
                  size: 30.w,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () {
                  context.pop();
                },
              )
            ],
          ),
        ),
        content: content,
      ),
    );
  }
}
