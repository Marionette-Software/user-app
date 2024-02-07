import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/platform/platform_utils.dart';
import 'package:user_app/presentation/components/custom_text_input.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/input_validation.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SendForm extends StatefulWidget {
  final bool showBookCall;

  const SendForm({super.key, this.showBookCall = true});

  @override
  State<SendForm> createState() => _SendFormState();
}

bool isClicked = false;

class _SendFormState extends State<SendForm> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController messageController = TextEditingController();

    return Column(
      children: [
        Container(
          width: 404.w,
          height: 532.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.whiteColor,
            gradient: isLightTheme(context)
                ? null
                : const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff1C252D), Color(0xff020C15)],
                  ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: 25.w, right: 25.w, top: 25.h, bottom: 40.h),
            child: Column(
              children: [
                Text(
                  tr('marionette_form.contact_form'),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30.sp,
                    letterSpacing: -1.5.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 31.h,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 80.h,
                  ),
                  child: CustomInputWidget(
                    platformType: PlatformTypeState.web,
                    controller: nameController,
                    hintText: tr('marionette_form.name'),
                    onValidate: (text) {
                      if (text!.isEmpty) {
                        return '';
                      } else if (!InputValidation.simpleEmailValidation(
                          text.toString())) {
                        return '';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 80.h,
                  ),
                  child: CustomInputWidget(
                    platformType: PlatformTypeState.web,
                    controller: emailController,
                    hintText: tr('marionette_form.email'),
                    onValidate: (text) {
                      if (text!.isEmpty) {
                        return '';
                      } else if (!InputValidation.simpleEmailValidation(
                          text.toString())) {
                        return '';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 100.h,
                  ),
                  child: TextFormField(
                    controller: messageController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: getSizeFromPlatformType(
                            platformType: PlatformTypeState.web,
                            webValue: 20,
                            tabletValue: 15,
                            mobileValue: 13,
                          ).sp,
                        ),
                    decoration: InputDecoration(
                      isDense: true,
                      errorStyle: const TextStyle(
                        fontSize: 0,
                        height: 0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          getSizeFromPlatformType(
                            platformType: PlatformTypeState.web,
                            webValue: 10,
                            tabletValue: 10,
                            mobileValue: 5,
                          ),
                        ),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                      hintText: tr('marionette_form.message'),
                      contentPadding: EdgeInsets.only(
                        top: getSizeFromPlatformType(
                          platformType: PlatformTypeState.web,
                          webValue: 28,
                          tabletValue: 21,
                          mobileValue: 20,
                        ).h,
                        bottom: getSizeFromPlatformType(
                          platformType: PlatformTypeState.web,
                          webValue: 28,
                          tabletValue: 21,
                          mobileValue: 20,
                        ).h,
                        left: getSizeFromPlatformType(
                          platformType: PlatformTypeState.web,
                          webValue: 23,
                          tabletValue: 15,
                          mobileValue: 11,
                        ).w,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 25.h,
                ),
                MainButton(
                  onTap: () {
                    if (nameController.text.isNotEmpty ||
                        emailController.text.isNotEmpty ||
                        messageController.text.isNotEmpty) {
                      setState(() {
                        isClicked = true;
                      });
                      Bot(
                        token: '5876417027:AAEQjfQiKgddaqKZ4j5x9CedvoaTrZHre3A',
                        onReady: (bot) => bot.start(clean: true),
                      ).sendMessage(ChatID(-1001895508764),
                          'BOOM! New message from ${nameController.text} (${emailController.text})\n\n${messageController.text} (from Demo)');
                      final snackBar = SnackBar(
                        elevation: 0,
                        clipBehavior: Clip.none,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          titleFontSize: 30.sp,
                          messageFontSize: 20.sp,
                          title: tr('snack_bar_message.success.success'),
                          message:
                              tr('marionette_form.message_send_successfully'),
                          contentType: ContentType.success,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    } else {
                      final snackBar = SnackBar(
                        elevation: 0,
                        clipBehavior: Clip.none,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          titleFontSize: 30.sp,
                          messageFontSize: 20.sp,
                          title: tr('snack_bar_message.errors.error'),
                          message: tr('marionette_form.email_and_name_empty'),
                          contentType: ContentType.failure,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    }
                  },
                  text: tr('marionette_form.submit'),
                  height: 60.h,
                  disableColor: MainColorsApp.accentColor.withOpacity(0.5),
                  color: Theme.of(context).primaryColorLight,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        widget.showBookCall
            ? InkWell(
                onTap: () {
                  PlatformUtils.openLink(
                      'https://calendly.com/marionette-stack/demo');
                },
                child: Container(
                  width: 404.w,
                  height: 50.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Center(
                    child: SizedBox(
                      height: 28.h,
                      child: AutoSizeText(
                        tr('Schedule Review'),
                        minFontSize: 3,
                        maxFontSize: 20,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
