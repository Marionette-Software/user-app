import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/components/modal_window_wallet.dart';
import 'package:user_app/presentation/auth/components/send_reset_password_modal.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class ResetPasswordWeb extends StatelessWidget {
  const ResetPasswordWeb({
    super.key,
    required this.platformType,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        child: Text(
          '${tr('authorization.forgot_password')}?',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColorLight,
                letterSpacing: -1.sp,
                fontSize: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 20,
                  tabletValue: 18,
                  mobileValue: 10,
                ).sp,
              ),
        ),
        onTap: () {
          showDialog(
                  barrierColor: AppColors.placeHolderGrey,
                  context: context,
                  builder: (context) => const ModalWindowWallet(
                    titleSize: 0,
                    title: '',
                    mainAxisAlignment: MainAxisAlignment.center,
                    content: SendResetWebPassword(),
                    alertDialogSide: false,
                  ),
                );
        },
      ),
    );
  }
}
