import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class LocalizationListContainer extends StatelessWidget {
  const LocalizationListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 80.w,
        top: 50.h,
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: Card(
          color: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Container(
            width: 100.w,
            height: supportedLocales.length * 40.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.whiteColorText.withOpacity(0.25),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  isLightTheme(context)
                      ? AppColors.whiteColorText
                      : AppColors.backgroundFormColor.withOpacity(0.9),
                  isLightTheme(context)
                      ? AppColors.whiteColorText
                      : AppColors.backgroundFormColor.withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context)
                      .primaryColor
                      .withOpacity(isLightTheme(context) ? 0.2 : 0),
                  blurRadius: 25.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: const Offset(
                    0, // Move to right 10  horizontally
                    0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            child: Center(
              child: ListView.builder(
                itemCount: supportedLocales.length,
                itemBuilder: ((context, index) => InkWell(
                      onTap: () async {
                        context.setLocale(
                          supportedLocales[index],
                        ); // change `easy_localization` locale

                        context.pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              // ignore: deprecated_member_use
                              CountryCode.fromCode(
                                supportedLocales[index].countryCode!,
                              ).flagUri!,
                              package: 'country_code_picker',
                              width: 25.w,
                              height: 25.h,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              supportedLocales[index]
                                  .languageCode
                                  .toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    color: (EasyLocalization.of(context)!
                                                .currentLocale!
                                                .countryCode! ==
                                            supportedLocales[index].countryCode)
                                        ? Theme.of(context).primaryColorLight
                                        : Theme.of(context).primaryColor,
                                  ),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
