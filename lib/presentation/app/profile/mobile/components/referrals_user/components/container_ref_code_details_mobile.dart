import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ContainerReCodeDetailsMobile extends StatelessWidget {
  const ContainerReCodeDetailsMobile({
    required this.codeText,
    required this.iconDetail,
    super.key,
  });

  final String codeText;
  final String iconDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 9..h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 5..h,
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.05),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconDetail,
            width: 18.w,
            height: 18..h,
            colorFilter: ColorFilter.mode(
              isLightTheme(context)
                  ? AppColors.aboutHeaderLight
                  : AppColors.whiteColor.withOpacity(0.25),
              BlendMode.srcIn,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Tooltip(
            message: codeText,
            child: SizedBox(
              width: 260.w,
              child: Text(
                codeText,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      letterSpacing: -1.sp,
                    ),
              ),
            ),
          ),
          const Spacer(),
          InkWell(
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
                  titleFontSize: 20.sp,
                  messageFontSize: 15.sp,
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
              size: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}
