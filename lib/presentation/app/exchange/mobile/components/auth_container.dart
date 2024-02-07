import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/components/auth/sign_in_container.dart';
import 'package:user_app/presentation/components/auth/sign_up_container.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AuthContainerMobile extends StatelessWidget {
  const AuthContainerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            bottom: 10.h,
          ),
          child: MainButton(
            borderRadius: 6,
            disableColor: MainColorsApp.accentColor.withOpacity(0.5),
            color: Theme.of(context).primaryColorLight,
            onTap: () async {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInContainer(
                    platformType: PlatformTypeState.mobile,
                    loginWithNonCustodial: true,
                  ),
                ),
                (route) => false,
              );
            },
            text: tr('non_custodial_exchange.sign_in'),
            height: 35.h,
            fontSize: 13,
          ),
        ),
        InkWell(
          onTap: () async {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpContainer(
                  platformType: PlatformTypeState.mobile,
                  signUpWithNonCustodial: true,
                ),
              ),
              (route) => false,
            );
          },
          child: Container(
            width: 270.w,
            height: 35.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.transparent,
              border: Border.all(
                width: 1,
                color: isLightTheme(context)
                    ? AppColors.fillColor
                    : AppColors.whiteColorText,
              ),
            ),
            child: Center(
              child: SizedBox(
                height: 16.h,
                child: AutoSizeText(
                  tr('non_custodial_exchange.sign_up'),
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        SizedBox(
          height: 12.h,
          child: AutoSizeText(
            tr('non_custodial_exchange.or_sign_in_sign_up_with'),
            minFontSize: 5,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        SizedBox(
          height: 11.h,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 270.w,
            height: 35.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: isLightTheme(context)
                    ? Theme.of(context).primaryColor.withOpacity(0.25)
                    : Theme.of(context).primaryColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 18.w,
                  height: 18.h,
                  child: SvgPicture.asset(
                    googleLogoPath,
                  ),
                ),
                SizedBox(width: 4.w),
                SizedBox(
                  height: 16.h,
                  child: AutoSizeText(
                    tr('non_custodial_exchange.log_in_google'),
                    minFontSize: 13,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
