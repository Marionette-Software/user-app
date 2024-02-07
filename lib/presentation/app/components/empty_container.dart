import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class EmptyContainerWeb extends StatelessWidget {
  const EmptyContainerWeb({
    super.key,
    required this.title,
    this.heightRow,
  });

  final String title;
  final double? heightRow;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          emptyIcon,
          colorFilter: ColorFilter.mode(
            isLightTheme(context)
                ? AppColors.aboutHeaderLight
                : AppColors.whiteColor.withOpacity(0.25),
            BlendMode.srcIn,
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 20.sp,
              ),
        ),
      ],
    );
  }
}
