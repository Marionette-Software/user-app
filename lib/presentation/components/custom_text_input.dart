import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class CustomInputWidget extends StatefulWidget {
  const CustomInputWidget({
    Key? key,
    required this.controller,
    this.hintText,
    this.textInputType,
    this.autofillHints,
    this.onValidate,
    this.trailingIcon,
    this.fontWeight = FontWeight.w500,
    this.onChanged,
    this.fontSize = 14,
    this.textInputAction = TextInputAction.next,
    required this.platformType,
    this.autoFocus = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final TextInputType? textInputType;
  final List<String>? autofillHints;
  final String? Function(String?)? onValidate;
  final Widget? trailingIcon;
  final FontWeight? fontWeight;
  final String? Function(String?)? onChanged;
  final PlatformTypeState platformType;
  final bool autoFocus;
  final double fontSize;
  final TextInputAction textInputAction;

  @override
  _CustomInputWidgetState createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      autofocus: widget.autoFocus,
      controller: widget.controller,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: getSizeFromPlatformType(
              platformType: widget.platformType,
              webValue: 20,
              tabletValue: 15,
              mobileValue: 15,
            ).sp,
            fontWeight: widget.fontWeight!,
            letterSpacing: -0.75.sp,
          ),
      autofillHints: widget.autofillHints,
      decoration: InputDecoration(
        isDense: true,
        errorStyle: const TextStyle(
          fontSize: 0,
          height: 0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getSizeFromPlatformType(
              platformType: widget.platformType,
              webValue: 10,
              tabletValue: 10,
              mobileValue: 10,
            ).r,
          ),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        hintText: widget.hintText,
        helperStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: getSizeFromPlatformType(
                platformType: widget.platformType,
                webValue: 20,
                tabletValue: 15,
                mobileValue: 15,
              ).sp,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.75.sp,
            ),
        contentPadding: EdgeInsets.only(
          top: getSizeFromPlatformType(
            platformType: widget.platformType,
            webValue: 28.h,
            tabletValue: 21,
            mobileValue: 21..h,
          ),
          bottom: getSizeFromPlatformType(
            platformType: widget.platformType,
            webValue: 28.h,
            tabletValue: 21,
            mobileValue: 21..h,
          ),
          left: getSizeFromPlatformType(
            platformType: widget.platformType,
            webValue: 23,
            tabletValue: 15,
            mobileValue: 11,
          ).w,
        ),
        suffixIcon: widget.trailingIcon,
      ),
      validator: widget.onValidate,
    );
  }

  void saveAutofill() {
    if (widget.autofillHints != null) {
      TextInput.finishAutofillContext();
    }
  }
}
