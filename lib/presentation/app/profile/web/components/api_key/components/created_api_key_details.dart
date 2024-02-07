import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class CreatedApiKeyDetailsWeb extends StatelessWidget {
  const CreatedApiKeyDetailsWeb({
    required this.apiKeyToken,
    super.key,
  });

  final String apiKeyToken;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600.w,
      height: 333.h,
      child: Padding(
        padding: EdgeInsets.only(
          left: 25.w,
          right: 25.w,
          top: 35.h,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Text(
                tr('profile.new_api_token_created'),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 30.sp,
                    ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                tr('profile.do_not_publish_or_share'),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                width: 550.w,
                height: 80.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: isLightTheme(context)
                      ? cardColor
                      : Theme.of(context).inputDecorationTheme.fillColor,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 23.w,
                    right: 23.w,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: SizedBox(
                              width: 449.w,
                              height: 30.h,
                              child: AutoSizeText(
                                '${apiKeyToken.replaceRange(14, apiKeyToken.length - 14, '......')} ',
                                maxLines: 1,
                                maxFontSize: 30,
                                minFontSize: 5,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Tooltip(
                        message: 'Copy to clipboard',
                        verticalOffset: -60.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: InkWell(
                                onTap: () {
                                  Clipboard.setData(
                                    ClipboardData(
                                      text: apiKeyToken,
                                    ),
                                  );
                                  final snackBar = SnackBar(
                                    elevation: 0,
                                    clipBehavior: Clip.none,
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    content: AwesomeSnackbarContent(
                                      titleFontSize: 30.sp,
                                      messageFontSize: 20.sp,
                                      title: tr(
                                          'snack_bar_message.success.success'),
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
                              ),
                            ),
                          ],
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
    );
  }
}
