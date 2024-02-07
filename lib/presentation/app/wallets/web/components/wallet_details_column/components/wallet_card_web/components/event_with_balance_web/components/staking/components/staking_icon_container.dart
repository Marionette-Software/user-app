import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';

class StakingIconContainerWeb extends StatelessWidget {
  const StakingIconContainerWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SvgPicture.asset(
            stakeWalletIcon,
            width: 48.w,
            height: 48.h,
            colorFilter: const ColorFilter.mode(
              MainColorsApp.accentColor,
              BlendMode.srcIn,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 243.w,
                height: 3.h,
                decoration: BoxDecoration(
                  color: MainColorsApp.accentColor,
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      MainColorsApp.accentColor.withOpacity(0.01),
                      MainColorsApp.accentColor.withOpacity(0.2),
                      MainColorsApp.accentColor,
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 62.w,
              ),
              Container(
                width: 243.w,
                height: 3.h,
                decoration: BoxDecoration(
                  color: MainColorsApp.accentColor,
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      MainColorsApp.accentColor,
                      MainColorsApp.accentColor.withOpacity(0.2),
                      MainColorsApp.accentColor.withOpacity(0.01),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
