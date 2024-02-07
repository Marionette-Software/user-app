import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ModalWindowMobile extends StatelessWidget {
  const ModalWindowMobile({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: !isLightTheme(context) ? 5 : 0.1,
          sigmaY: !isLightTheme(context) ? 5 : 0.1,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlertDialog(
                contentPadding: EdgeInsets.zero,
                insetPadding: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                  top: 109.h,
                ),
                content: content,
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(
                    color: isLightTheme(context)
                        ? AppColors.whiteColor
                        : AppColors.whiteColor.withOpacity(0.25),
                    width: 1,
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                   context.pop();
                  },
                  child: CircleAvatar(
                    backgroundColor: isLightTheme(context)
                        ? AppColors.whiteColor
                        : isLightTheme(context)
                            ? AppColors.whiteColor
                            : Theme.of(context).dialogTheme.backgroundColor,
                    radius: 12,
                    child: Icon(
                      Icons.close,
                      size: 12.w,
                      color: isLightTheme(context)
                          ? Theme.of(context).primaryColor
                          : isLightTheme(context)
                              ? Theme.of(context).primaryColor
                              : AppColors.whiteColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
