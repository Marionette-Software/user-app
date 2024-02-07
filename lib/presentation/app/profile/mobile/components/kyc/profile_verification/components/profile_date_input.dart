import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/identity_state_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ProfileDateInputMobile extends HookConsumerWidget {
  const ProfileDateInputMobile({
    required this.dateCtlController,
    super.key,
  });

  final TextEditingController dateCtlController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final identityState = ref.read(identityStateNotifierProvider.notifier);

    return TextFormField(
      readOnly: true,
      controller: dateCtlController,
      keyboardType: TextInputType.url,
      onTap: () async {
        DateTime? date;
        FocusScope.of(context).requestFocus(
          FocusNode(),
        );
        date = await showDatePicker(
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Theme.of(context).primaryColorLight,
                  onSurface: isLightTheme(context)
                      ? AppColors.blackColor
                      : AppColors.whiteColor,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: isLightTheme(context)
                        ? Theme.of(context).primaryColor
                        : AppColors.whiteColor,
                  ),
                ),
              ),
              child: child!,
            );
          },
          keyboardType: TextInputType.url,
          context: context,
          initialEntryMode: DatePickerEntryMode.calendar,
          initialDate: DateTime.now(),
          firstDate: DateTime(1920),
          lastDate: DateTime.now(),
        );
        if (date != null) {
          dateCtlController.text = date.toString().split(' ')[0];
          identityState.updateDateOfBirth(date.toString().split(' ')[0]);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return '';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        floatingLabelAlignment: FloatingLabelAlignment.center,
        filled: false,
        errorStyle: const TextStyle(
          fontSize: 0,
          height: 0,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.25),
            width: 5..h,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.25),
            width: 5..h,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: MainColorsApp.redColor, width: 5..h),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.whiteColor.withOpacity(0.25),
            width: 5..h,
          ),
        ),
        hintText: tr('profile.identity_date_of_birth'),
        hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.75.sp,
            color: isLightTheme(context)
                ? AppColors.aboutHeaderLight
                : AppColors.whiteColor.withOpacity(0.5)),
        isCollapsed: false,
      ),
      style: TextStyle(
        fontSize: 15.sp,
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
        letterSpacing: -0.75.sp,
      ),
    );
  }
}
