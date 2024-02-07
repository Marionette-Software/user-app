import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/profile/actions/kyc/phone_verification.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class ResentCodeContainer extends HookConsumerWidget {
  const ResentCodeContainer({
    required this.platformType,
    required this.phoneNumberController,
    required this.countdownTimerController,
    required this.codeController,
    required this.formAddNumberKey,
    super.key,
  });

  final CountdownTimerController countdownTimerController;
  final PlatformTypeState platformType;
  final TextEditingController phoneNumberController;
  final TextEditingController codeController;
  final GlobalKey<FormState> formAddNumberKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        TextFormField(
          maxLength: 10,
          cursorColor: Theme.of(context).primaryColor.withOpacity(0.5),
          keyboardType: TextInputType.number,
          onFieldSubmitted: (str) {},
          controller: codeController,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(
              RegExp('[0-9]'),
            ),
          ],
          validator: (value) {
            if (value!.isEmpty) {
              return '';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: tr('profile.code'),
            counterText: '',
            hintStyle: TextStyle(
              fontSize: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 20,
                tabletValue: 15,
                mobileValue: 10,
              ).sp,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
            contentPadding: EdgeInsets.only(
              top: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 28,
                tabletValue: 21,
                mobileValue: 17,
              ).w,
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
              ).w,
            ),
            errorMaxLines: 1,
            errorStyle: const TextStyle(
              height: 0.01,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 10,
                  tabletValue: 10,
                  mobileValue: 5,
                ).r,
              ),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 10,
                  tabletValue: 10,
                  mobileValue: 5,
                ).r,
              ),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(
            fontSize: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 24,
              tabletValue: 18,
              mobileValue: 15,
            ).sp,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Positioned(
          right: 26.w,
          child: SizedBox(
            child: CountdownTimer(
              controller: countdownTimerController,
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 20,
                      tabletValue: 15,
                      mobileValue: 12,
                    ).sp,
                  ),
              widgetBuilder: (ctx, time) {
                if (time == null) {
                  return InkWell(
                    onTap: () {
                      PhoneVerificationAction().resetCode(
                        context: context,
                        ref: ref,
                        countdownTimerController: countdownTimerController,
                        platformType: platformType,
                        phoneNumberController: phoneNumberController,
                        codeController: codeController,
                        formAddNumberKey: formAddNumberKey,
                      );
                    },
                    child: Text(
                      tr('profile.resend_code'),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
                return Center(
                  child: Text(
                    "${time.min != null ? time.min.toString() : '0'}:${time.sec != null ? time.sec.toString() : '0'}",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 20,
                            tabletValue: 15,
                            mobileValue: 10,
                          ).sp,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                );
              },
              endWidget: const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
