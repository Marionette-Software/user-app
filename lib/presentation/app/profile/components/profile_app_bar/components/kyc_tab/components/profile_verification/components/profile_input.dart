import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ProfileInput extends StatelessWidget {
  const ProfileInput({
    required this.platformType,
    required this.controller,
    required this.hintText,
    required this.onValidator,
    required this.onChanged,
    required this.lengthLimiting,
    super.key,
  });

  final PlatformTypeState platformType;
  final TextEditingController controller;
  final String hintText;
  final Function(String value) onValidator;
  final Function(String value) onChanged;
  final int lengthLimiting;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 80,
        tabletValue: 60,
        mobileValue: 50,
      ).h,
      child: TextFormField(
        autocorrect: true,
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.text,
        controller: controller,
        onChanged: (String? value) {
          onChanged(value!);
        },
        validator: (String? value) {
          return onValidator(value!);
        },
        inputFormatters: [LengthLimitingTextInputFormatter(lengthLimiting)],
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              getSizeFromPlatformType(
                platformType: platformType,
                webValue: 10,
                tabletValue: 10,
                mobileValue: 5,
              ).r,
            ),
          ),
          hintText: hintText,
          isDense: true,
          errorStyle: const TextStyle(
            fontSize: 0,
            height: 0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              getSizeFromPlatformType(
                platformType: platformType,
                webValue: 10,
                tabletValue: 10,
                mobileValue: 5,
              ).r,
            ),
            borderSide: BorderSide(
              color: isLightTheme(context)
                  ? Theme.of(context).primaryColor.withOpacity(0.05)
                  : AppColors.whiteColor.withOpacity(0.25),
              width: 1.0,
            ),
          ),
          contentPadding: EdgeInsets.only(
            top: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 28,
              tabletValue: 21,
              mobileValue: 17,
            ).h,
            bottom: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 28,
              tabletValue: 21,
              mobileValue: 17,
            ).h,
            left: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 23,
              tabletValue: 15,
              mobileValue: 11,
            ).h,
          ),
          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                fontSize: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 20,
                  tabletValue: 15,
                  mobileValue: 10,
                ).sp,
              ),
        ),
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 20,
                tabletValue: 15,
                mobileValue: 10,
              ).sp,
            ),
      ),
    );
  }
}
