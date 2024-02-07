import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/presentation/constants/colors.dart';

class EventItemMobile extends StatefulWidget {
  const EventItemMobile({
    Key? key,
    this.onTap,
    required this.title,
    required this.iconPath,
    required this.colorIcon,
    this.disableButton = false,
  }) : super(key: key);

  final Function()? onTap;
  final String title;
  final String iconPath;
  final Color colorIcon;
  final bool disableButton;

  @override
  State<EventItemMobile> createState() => _EventItemMobileState();
}

class _EventItemMobileState extends State<EventItemMobile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.onTap == null ? 0.3 : 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onHover: (value) {
          if (value) {
            setState(
              () {
                isHover = true;
              },
            );
          } else {
            setState(
              () {
                isHover = false;
              },
            );
          }
        },
        onTap: widget.disableButton ? null : widget.onTap,
        child: Container(
          width: 62.w,
          height: 54..h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.whiteColor.withOpacity(0.05),
            border: Border.all(
              width: 1.w,
              color: AppColors.whiteColor.withOpacity(0.5),
            ),
          ),
          child: widget.disableButton
              ? const SizedBox(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.whiteColor,
                    ),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      widget.iconPath,
                      width: 20.w,
                      height: 15..h,
                      colorFilter: ColorFilter.mode(
                        isHover ? widget.colorIcon : AppColors.whiteColor,
                        BlendMode.srcIn,
                      ),
                      allowDrawingOutsideViewBox: true,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 13.sp,
                            color: AppColors.whiteColorText,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.65.sp,
                          ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
