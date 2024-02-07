import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/presentation/app/navigation/bottom_navigation_bar.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class NavigationItemComponent extends StatelessWidget {
  final CustomNavigationItem item;
  final bool isSelected;
  final bool isCenter;
  final bool leftLine;
  final bool rightLine;

  const NavigationItemComponent({
    super.key,
    required this.item,
    this.isSelected = false,
    this.isCenter = false,
    required this.leftLine,
    required this.rightLine,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          item.iconDisabled,
          width: 20.w,
          height: 20..h,
          colorFilter: ColorFilter.mode(
            isSelected
                ? MainColorsApp.accentColor
                : isLightTheme(context)
                    ? MainColorsApp.primaryColor.withOpacity(0.25)
                    : AppColors.whiteColor.withOpacity(0.5),
            BlendMode.srcIn,
          ),
        ),
        SizedBox(
          height: 7..h,
        ),
        Text(
          item.label,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: isLightTheme(context)
                    ? isSelected == true
                        ? MainColorsApp.accentColor
                        : Theme.of(context).primaryColor.withOpacity(0.5)
                    : isSelected == true
                        ? MainColorsApp.accentColor
                        : Theme.of(context).primaryColor.withOpacity(0.5),
                fontSize: 13.sp,
                letterSpacing: -0.65,
                fontWeight: FontWeight.w400,
              ),
        )
      ],
    );
  }
}
