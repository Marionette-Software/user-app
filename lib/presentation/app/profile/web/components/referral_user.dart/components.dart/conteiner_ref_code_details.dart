import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ContainerReCodeDetailsWeb extends StatelessWidget {
  const ContainerReCodeDetailsWeb({
    required this.codeText,
    required this.iconDetail,
    super.key,
  });

  final String codeText;
  final String iconDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: isLightTheme(context)
            ? AppColors.mainBackgroundLightColor
            : AppColors.whiteColor.withOpacity(0.05),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 21.w,
          right: 23.w,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconDetail,
              width: 20.w,
              height: 20.h,
              colorFilter: ColorFilter.mode(
                isLightTheme(context)
                    ? AppColors.aboutHeaderLight
                    : AppColors.whiteColor.withOpacity(0.25),
                BlendMode.srcIn,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Tooltip(
              message: codeText,
              child: SizedBox(
                width: 400.w,
                child: Text(
                  codeText,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                        letterSpacing: -1.5.sp,
                      ),
                ),
              ),
            ),
            const Spacer(),
            Tooltip(
              message: 'Copy to clipboard'.hardcoded,
              verticalOffset: -60.h,
              child: InkWell(
                onTap: () {
                  Clipboard.setData(
                    ClipboardData(
                      text: codeText,
                    ),
                  );
                  final snackBar = SnackBar(
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    clipBehavior: Clip.none,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      titleFontSize: 30.sp,
                      messageFontSize: 20.sp,
                      title: tr('snack_bar_message.success.success'),
                      message: tr('snack_bar_message.success.copied'),
                      contentType: ContentType.success,
                    ),
                  );
            
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                },
                child: Icon(
                  Icons.copy,
                  color: Theme.of(context).primaryColorLight,
                  size: 25.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
