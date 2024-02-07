import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/presentation/constants/colors.dart';

class EventItemWeb extends StatefulWidget {
  const EventItemWeb({
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
  State<EventItemWeb> createState() => _EventItemWebState();
}

class _EventItemWebState extends State<EventItemWeb>
    with TickerProviderStateMixin {
  bool isHover = false;
  late AnimationController resizableController;
  @override
  void initState() {
    resizableController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
    resizableController.addStatusListener(
      (animationStatus) {
        switch (animationStatus) {
          case AnimationStatus.completed:
            resizableController.reverse();
            break;
          case AnimationStatus.dismissed:
            resizableController.forward();
            break;
          case AnimationStatus.forward:
            break;
          case AnimationStatus.reverse:
            break;
        }
      },
    );
    resizableController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: resizableController,
      builder: (context, child) {
        return InkWell(
          borderRadius: BorderRadius.circular(10.r),
          onHover: (value) {
            if (value) {
              setState(() {
                isHover = true;
              });
            } else {
              setState(() {
                isHover = false;
              });
            }
          },
          onTap: widget.disableButton ? null : widget.onTap,
          child: Container(
            width: 116.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: isHover
                  ? widget.colorIcon.withOpacity(0.7)
                  : widget.colorIcon,
              borderRadius: BorderRadius.circular(10.r),
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
                        colorFilter: const ColorFilter.mode(
                          AppColors.whiteColor,
                          BlendMode.srcIn,
                        ),
                        allowDrawingOutsideViewBox: true,
                        width: 22.w,
                        height: 22.h,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        widget.title,
                        maxLines: 1,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.whiteColorText,
                                  fontSize: 20.sp,
                                  letterSpacing: -1.sp,
                                ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
