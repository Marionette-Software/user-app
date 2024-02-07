import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/send_document_state_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/user_get_request.data.gql.dart';
import 'package:user_app/presentation/app/profile/actions/kyc/email_verification.dart';
import 'package:user_app/presentation/app/profile/actions/kyc/show_kyc_modal.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/button_status/deactivate_verify_button.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/button_status/pending_label.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/button_status/verified_label.dart';
import 'package:user_app/presentation/app/profile/components/profile_app_bar/components/kyc_tab/components/button_status/verify_button.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class KYCTab extends HookConsumerWidget {
  const KYCTab({
    super.key,
    required this.email,
    required this.user,
    required this.platformType,
  });

  final String email;
  final GGetUpdateUserData_user user;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sendDocumentWatch = ref.watch(sendDocumentProvider);

    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              emailLogoPath,
              width: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 34,
                tabletValue: 34,
                mobileValue: 25,
              ).w,
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 34,
                tabletValue: 34,
                mobileValue: 25,
              ).h,
            ),
            SizedBox(
              width: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 11,
                tabletValue: 13,
                mobileValue: 8,
              ).w,
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 70,
                tabletValue: 70,
                mobileValue: 60,
              ).h,
              child: Text(
                tr('profile.email_verification'),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 20,
                        tabletValue: 15,
                        mobileValue: 13,
                      ).sp,
                    ),
              ),
            ),
            const Spacer(),
            user.email_verified == true
                ? VerifiedLabel(
                    platformType: platformType,
                  )
                : VerifyButton(
                    platformType: platformType,
                    onTap: () {
                      EmailVerificationAction().emailVerification(
                        platformType: PlatformTypeState.web,
                        context: context,
                        email: email,
                      );
                    },
                  ),
            SizedBox(
              width: 6.w,
            )
          ],
        ),
        globalData.enabledPhoneVerificationStep
            ? Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Divider(
                        color: isLightTheme(context)
                            ? dividerColor
                            : AppColors.whiteColor.withOpacity(0.25),
                        height: 1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 70,
                      tabletValue: 70,
                      mobileValue: 60,
                    ).h,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          phoneLogoPath,
                          width: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 34,
                            tabletValue: 34,
                            mobileValue: 25,
                          ).w,
                          height: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 34,
                            tabletValue: 34,
                            mobileValue: 25,
                          ).h,
                        ),
                        SizedBox(
                          width: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 11,
                            tabletValue: 13,
                            mobileValue: 8,
                          ).w,
                        ),
                        Text(
                          tr('profile.phone_verification'),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                      fontSize: getSizeFromPlatformType(
                                    platformType: platformType,
                                    webValue: 20,
                                    tabletValue: 15,
                                    mobileValue: 13,
                                  ).sp),
                        ),
                        const Spacer(),
                        user.email_verified == false
                            ? DeactivateVerifyButton(
                                platformType: platformType,
                              )
                            : user.phone_verified == true
                                ? VerifiedLabel(
                                    platformType: platformType,
                                  )
                                : VerifyButton(
                                    platformType: platformType,
                                    onTap: () {
                                      ShowKYCModalAction()
                                          .showPhoneVerificationModal(
                                        context: context,
                                        platformType: platformType,
                                        ref: ref,
                                      );
                                    },
                                  ),
                        SizedBox(
                          width: 6.w,
                        )
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(
              color: isLightTheme(context)
                  ? dividerColor
                  : AppColors.whiteColor.withOpacity(0.25),
              height: 1,
            ),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(
              profileLogoPath,
              width: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 34,
                tabletValue: 34,
                mobileValue: 25,
              ).w,
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 34,
                tabletValue: 34,
                mobileValue: 25,
              ).h,
            ),
            SizedBox(
              width: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 11,
                tabletValue: 13,
                mobileValue: 8,
              ).w,
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 70,
                tabletValue: 70,
                mobileValue: 60,
              ).h,
              child: Text(
                tr('profile.identity_verification'),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 20,
                        tabletValue: 15,
                        mobileValue: 13,
                      ).sp,
                    ),
              ),
            ),
            const Spacer(),
            (user.email_verified == false || user.phone_verified == false)
                ? DeactivateVerifyButton(
                    platformType: platformType,
                  )
                : user.profile_verified == true
                    ? VerifiedLabel(
                        platformType: platformType,
                      )
                    : sendDocumentWatch == true
                        ? PendingLabel(platformType: platformType)
                        : VerifyButton(
                            platformType: platformType,
                            onTap: () {
                              ShowKYCModalAction()
                                  .showIdentityVerificationModal(
                                context: context,
                                ref: ref,
                                platformType: platformType,
                                user: user,
                              );
                            },
                          ),
            SizedBox(
              width: 6.w,
            )
          ],
        ),
      ],
    );
  }
}
