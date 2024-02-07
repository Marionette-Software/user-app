import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/send_code_state_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/profile/actions/kyc/phone_verification.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/phone_verification/componens/phone_input.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/phone_verification/componens/resent_code_container.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class PhoneVerification extends HookConsumerWidget {
  static final _formAddNumberKey = GlobalKey<FormState>();

  const PhoneVerification({
    required this.platformType,
    super.key,
  });
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sendCodeController = ref.watch(sendCodeStateProvider);
    final codeController = useTextEditingController();
    final phoneNumberController = useTextEditingController();

    CountdownTimerController? countdownTimerController =
        CountdownTimerController(
      endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 180,
      onEnd: () {},
    );

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 600,
          tabletValue: 475,
          mobileValue: 320,
        ).w,
        height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: sendCodeController ? 470 : 365,
                tabletValue: sendCodeController ? 342 : 280,
                mobileValue: sendCodeController == true
                    ? (350.0 + MediaQuery.of(context).viewInsets.bottom).h
                    : (320.0 + MediaQuery.of(context).viewInsets.bottom))
            .h,
        child: Padding(
          padding: EdgeInsets.only(
            top: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 36,
              tabletValue: 25,
              mobileValue: 26,
            ).h,
            left: 25.w,
            right: 25.w,
            bottom: 50.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                tr('profile.phone_verification'),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 30,
                        tabletValue: 20,
                        mobileValue: 20,
                      ).sp,
                    ),
              ),
              SizedBox(
                height: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 13,
                  tabletValue: 25,
                  mobileValue: 15,
                ).h,
              ),
              Text(
                tr('profile.please_submit_your_phone'),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 20,
                        tabletValue: 15,
                        mobileValue: 10,
                      ).sp,
                    ),
              ),
              SizedBox(
                height: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 37,
                  tabletValue: 15,
                  mobileValue: 16,
                ).h,
              ),
              Form(
                key: _formAddNumberKey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PhoneInput(
                      platformType: platformType,
                      phoneNumberController: phoneNumberController,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 25,
                  tabletValue: 15,
                  mobileValue: 10,
                ).h,
              ),
              sendCodeController == true
                  ? Column(
                      children: [
                        ResentCodeContainer(
                          platformType: platformType,
                          codeController: codeController,
                          phoneNumberController: phoneNumberController,
                          countdownTimerController: countdownTimerController,
                          formAddNumberKey: _formAddNumberKey,
                        ),
                        SizedBox(
                          height: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 25,
                            tabletValue: 15,
                            mobileValue: 10,
                          ).h,
                        ),
                      ],
                    )
                  : const SizedBox(),
              MainButton(
                borderRadius: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 10,
                  tabletValue: 8,
                  mobileValue: 5,
                ),
                text: sendCodeController == false
                    ? tr('profile.request_sms_code')
                    : tr('profile.submit'),
                height: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 60.h,
                  tabletValue: 45.h,
                  mobileValue: 40.h,
                ),
                color: Theme.of(context).primaryColorLight,
                fontSize: getSizeFromPlatformType(
                  platformType: platformType,
                  webValue: 20,
                  tabletValue: 15,
                  mobileValue: 13,
                ),
                onTap: () {
                  PhoneVerificationAction().phoneVerification(
                    context: context,
                    ref: ref,
                    formAddNumberKey: _formAddNumberKey,
                    phoneNumberController: phoneNumberController,
                    codeController: codeController,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
