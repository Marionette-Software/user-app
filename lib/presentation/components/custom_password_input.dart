import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class CustomPasswordInput extends StatefulWidget {
  const CustomPasswordInput({
    Key? key,
    required this.controller,
    this.validationController,
    this.hint,
    this.onChanged,
    this.autofillHints,
    this.onValidate,
    this.onSubmitted,
    this.textInputAction = TextInputAction.done,
    required this.platformType,
  }) : super(key: key);

  final TextEditingController controller;
  final TextEditingController? validationController;
  final String? hint;
  final Function(String)? onChanged;
  final List<String>? autofillHints;
  final String? Function(String?)? onValidate;
  final String? Function(String?)? onSubmitted;
  final PlatformTypeState platformType;
  final TextInputAction textInputAction;

  @override
  _PasswordInputWidgetState createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<CustomPasswordInput> {
  bool _hidePassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: _hidePassword,
      controller: widget.controller,
      enableInteractiveSelection: true,
      autofillHints: const [AutofillHints.newPassword],
      textInputAction: widget.textInputAction,
      validator: widget.onValidate,
      onFieldSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        isDense: true,
        errorStyle: const TextStyle(
          fontSize: 0,
          height: 0,
        ),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            getSizeFromPlatformType(
              platformType: widget.platformType,
              webValue: 10,
              tabletValue: 10,
              mobileValue: 10,
            ).r,
          ),
          borderSide: const BorderSide(
            color: MainColorsApp.redColor,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: MainColorsApp.accentColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(
            getSizeFromPlatformType(
              platformType: widget.platformType,
              webValue: 10,
              tabletValue: 10,
              mobileValue: 10,
            ).r,
          ),
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
        hintText: widget.hint,
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
        suffixIcon: Padding(
          padding: EdgeInsets.only(
            right: getSizeFromPlatformType(
              platformType: widget.platformType,
              webValue: 23,
              tabletValue: 15,
              mobileValue: 10,
            ).w,
          ),
          child: Tooltip(
            verticalOffset: -50.h,
            message: _hidePassword ? 'Show' : 'Hide'.hardcoded,
            child: IconButton(
              color: Theme.of(context).inputDecorationTheme.hintStyle!.color,
              iconSize: getSizeFromPlatformType(
                platformType: widget.platformType,
                webValue: 30,
                tabletValue: 25,
                mobileValue: 20,
              ).w,
              icon: Icon(
                _hidePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(
                  () {
                    _hidePassword = !_hidePassword;
                  },
                );
              },
            ),
          ),
        ),
      ),
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: getSizeFromPlatformType(
              platformType: widget.platformType,
              webValue: 20,
              tabletValue: 15,
              mobileValue: 15,
            ).sp,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.75.sp,
          ),
    );
  }

  void hideShowPassword() => setState(() => _hidePassword = !_hidePassword);

  void saveAutofill() {
    if (widget.autofillHints != null) {
      TextInput.finishAutofillContext();
    }
  }
}
