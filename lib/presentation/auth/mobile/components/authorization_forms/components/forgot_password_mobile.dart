import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/auth/mobile/components/authorization_forms/components/send_reset_mobile_password.dart';
import 'package:user_app/presentation/components/modal_window_mobile/modal_window_mobile.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ForgotPasswordMobile extends StatelessWidget {
  const ForgotPasswordMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          showDialog(
            barrierColor: AppColors.placeHolderGrey,
            context: context,
            builder: (context) => ModalWindowMobile(
              content: Container(
                height: 205.0.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: isLightTheme(context)
                      ? AppColors.whiteColor
                      : MainColorsApp.safeAreaDarkColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const SendResetMobilePassword(),
              ),
            ),
          );
        },
        child: Text(
          tr('authorization.forgot_password'),
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 10.sp,
                color: Theme.of(context).primaryColorLight,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    );
  }
}
