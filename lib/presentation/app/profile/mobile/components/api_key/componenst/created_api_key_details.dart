import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class CreatedApiKeyDetailsMobile extends StatelessWidget {
  const CreatedApiKeyDetailsMobile({
    required this.apiKeyToken,
    super.key,
  });

  final String apiKeyToken;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainBackgroundDarkColor,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50..h),
          child: Padding(
            padding: EdgeInsets.only(
              top: 15..h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: BackButtonMobile(
                    onTap: () => context.pop(),
                  ),
                ),
                Text(
                  'API Keys',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                        letterSpacing: -0.75.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: 70.w,
                  height: 25..h,
                )
              ],
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 10..h,
          ),
          decoration: BoxDecoration(
            color: isLightTheme(context)
                ? AppColors.whiteColor
                : walletBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 20..h, left: 15.w, right: 15.w),
            child: Column(
              children: [
                Text(
                  tr('profile.new_api_token_created'),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1.sp,
                      ),
                ),
                SizedBox(
                  height: 20..h,
                ),
                Text(
                  tr('profile.do_not_publish_or_share'),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: MainColorsApp.redColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.75.sp,
                      ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isLightTheme(context)
                            ? AppColors.mainBackgroundLightColor
                            : AppColors.whiteColor.withOpacity(0.25),
                        width: 5..h,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 10..h,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${apiKeyToken.replaceRange(14, apiKeyToken.length - 14, '......')} ',
                          maxLines: 1,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -1.sp,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(
                              ClipboardData(
                                text: apiKeyToken,
                              ),
                            );
                            final snackBar = SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              clipBehavior: Clip.none,
                              padding: EdgeInsets.only(
                                bottom:
                                    // ignore: use_build_context_synchronously
                                    MediaQuery.viewInsetsOf(context).bottom + 30
                                      ..h,
                              ),
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                titleFontSize: 20.sp,
                                messageFontSize: 15.sp,
                                title: tr('snack_bar_message.success.success'),
                                message: tr(
                                    'snack_bar_message.success.api_token_copied'),
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
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
