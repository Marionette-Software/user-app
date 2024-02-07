import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';

class SubLabel extends StatefulWidget {
  const SubLabel({
    super.key,
    required this.label,
    required this.url,
    required this.platformType,
    this.iconPath = '',
  });
  final String label;
  final String iconPath;
  final String url;
  final PlatformTypeState platformType;

  @override
  State<SubLabel> createState() => _SubLabelState();
}

class _SubLabelState extends State<SubLabel> {
  bool hovered = false;

  @override
  void dispose() {
    
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          hovered = !hovered;
        });
      },
      onTap: () async {
        final Uri parseUrl = Uri.parse(widget.url);
        if (!await launchUrl(parseUrl)) {
          throw Exception('Could not launch $parseUrl');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: hovered ? MainColorsApp.accentColor : Colors.transparent,
        ),
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 4.h, bottom: 4.h),
        child: Row(
          children: [
            widget.iconPath != ''
                ? Row(
                    children: [
                      SvgPicture.asset(
                        widget.iconPath,
                        width: 20.w,
                        colorFilter: ColorFilter.mode(
                          hovered
                              ? AppColors.whiteColor
                              : Theme.of(context).primaryColorLight,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(
                        width: (widget.platformType == PlatformTypeState.mobile
                                ? 10
                                : 14)
                            .w,
                      ),
                    ],
                  )
                : const SizedBox(),
            Text(
              widget.label,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: hovered
                        ? AppColors.whiteColor
                        : Theme.of(context).primaryColor.withOpacity(0.5),
                    letterSpacing: -0.75.sp,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
