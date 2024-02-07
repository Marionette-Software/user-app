import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class HeaderItemWeb extends StatelessWidget {
  const HeaderItemWeb({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.active,
    this.isRightIcon = false,
    this.isProfile = false,
  }) : super(key: key);

  final Function()? onTap;
  final bool active;
  final String icon;
  final String title;
  final bool isRightIcon;
  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: active && !isProfile
          ? Theme.of(context).primaryColorLight
          : Colors.transparent,
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: InkWell(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isRightIcon == false
                  ? SvgPicture.asset(
                      height: 25.h,
                      icon,
                      colorFilter: ColorFilter.mode(
                        active
                            ? AppColors.whiteColor
                            : isLightTheme(context)
                                ? MainColorsApp.primaryColor
                                : AppColors.whiteColor,
                        BlendMode.srcIn,
                      ),
                    )
                  : const SizedBox(),
              isRightIcon == false
                  ? SizedBox(
                      width: 6.w,
                    )
                  : const SizedBox(),
              isRightIcon == false
                  ? Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 20.sp,
                            color: (active || isProfile)
                                ? AppColors.whiteColor
                                : isLightTheme(context)
                                    ? MainColorsApp.primaryColor
                                    : AppColors.whiteColor,
                          ),
                    )
                  : const SizedBox(),
              isRightIcon
                  ? () {
                      return Container(
                        constraints: BoxConstraints(maxWidth: 300.w),
                        child: Tooltip(
                          message: title.length > 20 ? title : '',
                          verticalOffset: 30.h,
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: 20.sp,
                                  color: active
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      );
                    }()
                  : const SizedBox(),
              isRightIcon
                  ? SizedBox(
                      width: 6.w,
                    )
                  : const SizedBox(),
              isRightIcon
                  ? () {
                      return SvgPicture.asset(
                        colorFilter: ColorFilter.mode(
                          active
                              ? Theme.of(context).primaryColorLight
                              : isLightTheme(context)
                                  ? MainColorsApp.primaryColor
                                  : AppColors.whiteColor,
                          BlendMode.srcIn,
                        ),
                        height: 22.h,
                        icon,
                      );
                    }()
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
