import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ModalWindowWallet extends HookConsumerWidget {
  const ModalWindowWallet({
    super.key,
    required this.title,
    required this.content,
    required this.titleSize,
    this.shapeRadius = 6.0,
    this.imageIcon = '',
    this.width = 347,
    this.backgroundColor,
    this.alertDialogSide = false,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final String title;
  final Widget content;
  final double titleSize;
  final double shapeRadius;
  final String imageIcon;
  final double width;
  final Color? backgroundColor;
  final bool? alertDialogSide;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    title.isEmpty
                        ? AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            backgroundColor: backgroundColor,
                            content: content,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0.r),
                              side: alertDialogSide!
                                  ? BorderSide(
                                      color: AppColors.whiteColor
                                          .withOpacity(0.25),
                                      width: 1,
                                    )
                                  : const BorderSide(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                            ),
                          )
                        : AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            title: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        imageIcon.isEmpty
                                            ? Container()
                                            : SizedBox(
                                                width: 50.w,
                                                height: 50.r,
                                                child: Image.asset(imageIcon),
                                              ),
                                        SizedBox(
                                          child: Text(
                                            title,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: titleSize.sp,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Inter',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            content: content,
                          ),
                    InkWell(
                      borderRadius: BorderRadius.circular(100.r),
                      onTap: () {
                        context.pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isLightTheme(context)
                              ? AppColors.whiteColor
                              : isLightTheme(context)
                                  ? AppColors.whiteColor
                                  : Theme.of(context)
                                      .dialogTheme
                                      .backgroundColor,
                          border: Border.all(
                            color: isLightTheme(context)
                                ? Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.25)
                                : AppColors.whiteColor.withOpacity(0.25),
                            width: 1,
                          ),
                          shape: BoxShape.circle,
                        ),
                        height: 50.w,
                        width: 50.h,
                        child: Center(
                          child: SvgPicture.asset(
                            closeIcon,
                            colorFilter: ColorFilter.mode(
                              isLightTheme(context)
                                  ? Theme.of(context).primaryColor
                                  : AppColors.whiteColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
