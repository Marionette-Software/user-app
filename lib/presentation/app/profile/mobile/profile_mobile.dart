import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/send_document_state_provider.dart';
import 'package:user_app/application/two_fa/two_fa_state_provider.dart';
import 'package:user_app/application/user/profile_future_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/infrastructure/two_fa/two_fa_service.dart';
import 'package:user_app/presentation/app/history/mobile/history_main_mobile.dart';
import 'package:user_app/presentation/app/profile/actions/kyc/email_verification.dart';
import 'package:user_app/presentation/app/profile/actions/log_out.dart';
import 'package:user_app/presentation/app/profile/mobile/components/api_key/api_key_mobile.dart';
import 'package:user_app/presentation/app/profile/mobile/components/kyc/document_verification/document_verification_form.dart';
import 'package:user_app/presentation/app/profile/mobile/components/kyc/phone_verification/phone_veryfication.dart';
import 'package:user_app/presentation/app/profile/mobile/components/kyc/profile_verification/profile_verification_form.dart';
import 'package:user_app/presentation/app/profile/mobile/components/profile_mobile_row.dart';
import 'package:user_app/presentation/app/profile/mobile/components/referrals_user/referrals_user_mobile.dart';
import 'package:user_app/presentation/app/profile/mobile/components/user_profile_header_mobile.dart';
import 'package:user_app/presentation/app/profile/mobile/components/profile_mobile_change_pass.dart';
import 'package:user_app/presentation/app/profile/mobile/components/version_number_row.dart';
import 'package:user_app/presentation/app/user_orders/mobile/user_orders_mobile.dart';
import 'package:user_app/presentation/auth/mobile/components/about_mobile.dart';
import 'package:user_app/presentation/components/flat_custom_button.dart';
import 'package:user_app/presentation/components/main_loader.dart';
import 'package:user_app/presentation/components/main_show_modal_bottom_sheet.dart';
import 'package:user_app/presentation/components/theme_switch.dart';
import 'package:user_app/presentation/components/two_fa/mobile/disable_two_fa.dart';
import 'package:user_app/presentation/components/two_fa/mobile/enable_two_fa.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/error.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ProfileMobile extends HookConsumerWidget {
  const ProfileMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var rowStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.75,
          color: isLightTheme(context)
              ? AppColors.blackColor
              : AppColors.whiteColor,
        );
    final sendProfileInfoWatch = ref.watch(sendProfileInfoProvider.notifier);

    final sendDocumentWatch = ref.watch(sendDocumentProvider);
    final refreshValue = useState(1);
    final userFuture = ref.watch(
      userGetUserFutureProvider(
        RefreshRequest(refresh: '$refreshValue'),
      ),
    );

    final twoFAStateWatch = ref.watch(twoFaProvider);

    useEffect(() {
      if (refreshValue.value == 0) {
        refreshValue.value++;
      }
      return null;
    }, []);

    final loaderState = useState(LoadState.notLoading);

    var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
    GlobalConfigData globalData = box.getAt(0)!;

    return userFuture.when(
      data: (data) {
        var user = data.data!.user;

        return Scaffold(
          backgroundColor: AppColors.mainBackgroundDarkColor,
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              50..h,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 15..h, bottom: 13..h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    tr('app_title.account'),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 15.sp,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.75,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: isLightTheme(context)
                    ? AppColors.whiteColor
                    : walletBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Container(
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25..h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: UserProfileHeaderMobile(
                          email: user!.email!,
                          name: data.data!.user!.profiles!.isEmpty
                              ? tr('profile.user')
                              : '${data.data!.user!.profiles!.first!.first_name!} ${data.data!.user!.profiles!.first!.last_name!}',
                        ),
                      ),
                      SizedBox(
                        height: 25..h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 5..h,
                        color: isLightTheme(context)
                            ? AppColors.separatorLightTheme
                            : AppColors.separatorDarkTheme,
                      ),
                      ProfileMobileRow(
                        onTap: () {
                          EmailVerificationAction().emailVerification(
                            platformType: PlatformTypeState.mobile,
                            context: context,
                            email: user.email!,
                          );
                        },
                        icon: SvgPicture.asset(
                          emailMobile,
                          width: 16.w,
                          height: 16..h,
                        ),
                        leftChild: Text(
                          tr('profile.email_verification'),
                          style: rowStyle,
                        ),
                        rightChild: user.email_verified == false
                            ? Row(
                                children: [
                                  Container(
                                    height: 25..h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                      color: MainColorsApp.accentColor,
                                      borderRadius: BorderRadius.circular(21.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        tr('profile.verify'),
                                        style: rowStyle.copyWith(
                                          fontSize: 12.sp,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  SvgPicture.asset(
                                    verifiedMobile,
                                    colorFilter: const ColorFilter.mode(
                                      MainColorsApp.greenColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    tr('profile.verified'),
                                    style: rowStyle.copyWith(
                                        color: user.email_verified == false
                                            ? MainColorsApp.accentColor
                                            : MainColorsApp.greenColor),
                                  ),
                                ],
                              ),
                      ),
                      globalData.enabledPhoneVerificationStep
                          ? Padding(
                              padding: EdgeInsets.only(left: 25.w, right: 25.w),
                              child: Container(
                                height: 57..h,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 2..h,
                                      color: isLightTheme(context)
                                          ? AppColors.separatorLightTheme
                                          : AppColors.separatorDarkTheme,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      phoneLogoPath,
                                      width: 16.w,
                                      height: 16..h,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      tr('profile.phone_verification'),
                                      style: rowStyle,
                                    ),
                                    const Spacer(),
                                    (user.email_verified == false)
                                        ? Container(
                                            height: 25..h,
                                            width: 60.w,
                                            decoration: BoxDecoration(
                                              color: MainColorsApp.accentColor
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(21.r),
                                            ),
                                            child: Center(
                                              child: Text(
                                                tr('profile.verify'),
                                                style: rowStyle.copyWith(
                                                  fontSize: 12.sp,
                                                  color: AppColors.whiteColor,
                                                ),
                                              ),
                                            ),
                                          )
                                        : user.phone_verified == true
                                            ? Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    verifiedMobile,
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                      MainColorsApp.greenColor,
                                                      BlendMode.srcIn,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  Text(
                                                    tr('profile.verified'),
                                                    style: rowStyle.copyWith(
                                                        color:
                                                            user.email_verified ==
                                                                    false
                                                                ? MainColorsApp
                                                                    .accentColor
                                                                : MainColorsApp
                                                                    .greenColor),
                                                  ),
                                                ],
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const PhoneVerificationFormMobile(),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  height: 25..h,
                                                  width: 60.w,
                                                  decoration: BoxDecoration(
                                                    color: MainColorsApp
                                                        .accentColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            21.r),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      tr('profile.verify'),
                                                      style: rowStyle.copyWith(
                                                        fontSize: 12.sp,
                                                        color: AppColors
                                                            .whiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(),
                      Padding(
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Container(
                          height: 57..h,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2..h,
                                color: isLightTheme(context)
                                    ? AppColors.separatorLightTheme
                                    : AppColors.separatorDarkTheme,
                              ),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                identityMobile,
                                width: 16.w,
                                height: 16..h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                tr('profile.identity_verification'),
                                style: rowStyle,
                              ),
                              const Spacer(),
                              (user.email_verified == false ||
                                      user.phone_verified == false)
                                  ? Container(
                                      height: 25..h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                        color: MainColorsApp.accentColor
                                            .withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(21.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          tr('profile.verify'),
                                          style: rowStyle.copyWith(
                                            fontSize: 12.sp,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  : user.profile_verified == true
                                      ? Row(
                                          children: [
                                            SvgPicture.asset(
                                              verifiedMobile,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                MainColorsApp.greenColor,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              tr('profile.verified'),
                                              style: rowStyle.copyWith(
                                                  color: user.email_verified ==
                                                          false
                                                      ? MainColorsApp
                                                          .accentColor
                                                      : MainColorsApp
                                                          .greenColor),
                                            ),
                                          ],
                                        )
                                      : sendDocumentWatch == true
                                          ? Text(
                                              'Pending',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: -0.75,
                                                    color: iconColor,
                                                  ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => user
                                                                .profiles!
                                                                .isEmpty &&
                                                            !sendProfileInfoWatch
                                                                .state
                                                        ? const ProfileVerificationFormMobile()
                                                        : const DocumentVerificationFormMobile(),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 25..h,
                                                width: 60.w,
                                                decoration: BoxDecoration(
                                                  color:
                                                      MainColorsApp.accentColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          21.r),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    tr('profile.verify'),
                                                    style: rowStyle.copyWith(
                                                      fontSize: 12.sp,
                                                      color:
                                                          AppColors.whiteColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                            ],
                          ),
                        ),
                      ),
                      ProfileMobileRow(
                        onTap: () {},
                        icon: Image.asset(
                          twoFactorMobile,
                          width: 16,
                          height: 16,
                        ),
                        leftChild: Text(
                          tr('profile.2fa_status'),
                          style: rowStyle,
                        ),
                        rightChild: Switch(
                          activeTrackColor:
                              MainColorsApp.greenColor.withOpacity(0.5),
                          activeColor: MainColorsApp.greenColor,
                          inactiveTrackColor: MainColorsApp.redColor,
                          inactiveThumbColor:
                              MainColorsApp.redColor.withOpacity(0.5),
                          value: twoFAStateWatch,
                          onChanged: (state) async {
                            if (twoFAStateWatch) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DisableTwoFaMobile(),
                                ),
                              );
                            } else {
                              await TwoFaService().getTwoFaDetails().then(
                                (response) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EnableTwoFaMobile(
                                        res: response,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 3..h,
                        color: isLightTheme(context)
                            ? AppColors.separatorLightTheme
                            : AppColors.separatorDarkTheme,
                      ),
                      ProfileMobileRow(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HistoryMainPageMobile(
                                withNavBar: false,
                              ),
                            ),
                          );
                        },
                        leftChild: Text(
                          tr('profile.history'),
                          style: rowStyle,
                        ),
                        rightChild: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColor.withOpacity(0.25),
                          size: 15.sp,
                        ),
                      ),
                      globalData.enabledTradingPage
                          ? ProfileMobileRow(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) =>
                                        const UserProfileOrdersMobile(),
                                  ),
                                );
                              },
                              leftChild: Text(
                                tr('profile.open_orders'),
                                style: rowStyle,
                              ),
                              rightChild: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: isLightTheme(context)
                                    ? AppColors.aboutHeaderLight
                                    : AppColors.whiteColor.withOpacity(0.25),
                                size: 15.sp,
                              ),
                            )
                          : const SizedBox(),
                      ProfileMobileRow(
                        onTap: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => const ApiKeyMobile(),
                            ),
                          );
                        },
                        leftChild: Text(
                          tr('profile.api_keys'),
                          style: rowStyle,
                        ),
                        rightChild: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColor.withOpacity(0.25),
                          size: 15.sp,
                        ),
                      ),
                      globalData.enabledReferrals
                          ? ProfileMobileRow(
                              onTap: () async {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) =>
                                        const ReferralsUserMobile(),
                                  ),
                                );
                              },
                              leftChild: Text(
                                'Referrals'.hardcoded,
                                style: rowStyle,
                              ),
                              rightChild: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: isLightTheme(context)
                                    ? AppColors.aboutHeaderLight
                                    : AppColors.whiteColor.withOpacity(0.25),
                                size: 15.sp,
                              ),
                            )
                          : const SizedBox(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 3..h,
                        color: isLightTheme(context)
                            ? AppColors.separatorLightTheme
                            : AppColors.separatorDarkTheme,
                      ),
                      ProfileMobileRow(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ProfileChangePasswordMobile(),
                            ),
                          );
                        },
                        leftChild: Text(
                          tr('profile.title_change_password'),
                          style: rowStyle,
                        ),
                        rightChild: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColor.withOpacity(0.25),
                          size: 15.sp,
                        ),
                      ),
                      ProfileMobileRow(
                        onTap: () {},
                        leftChild: Text(
                          tr('authorization.language'),
                          style: rowStyle,
                        ),
                        rightChild: Row(
                          children: [
                            Text(
                              getSelectedLanguage(context),
                              style: rowStyle.copyWith(
                                color: isLightTheme(context)
                                    ? AppColors.aboutHeaderLight
                                    : AppColors.whiteColor.withOpacity(0.5),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: isLightTheme(context)
                                  ? AppColors.aboutHeaderLight
                                  : AppColors.whiteColor.withOpacity(0.25),
                              size: 15.sp,
                            ),
                          ],
                        ),
                      ),
                      ProfileMobileRow(
                        onTap: () {},
                        leftChild: Text(
                          tr('profile.dark_mode'),
                          style: rowStyle,
                        ),
                        rightChild: ThemeSwitch(
                          width: 53.w,
                          height: 26..h,
                          borderRadius: 20.0.r,
                          toggleSize: 28..h,
                        ),
                      ),
                      SizedBox(
                        height: 72..h,
                      ),
                      FlatCustomButton(
                        width: 360.w,
                        height: 45..h,
                        color: MainColorsApp.accentColor,
                        radius: 25.r,
                        onTap: () {
                          LogOutAction().logOut(
                            ref: ref,
                            context: context,
                            loaderState: loaderState,
                          );
                        },
                        child: Text(
                          tr('profile.log_out'),
                          style: rowStyle.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40..h,
                      ),
                      InkWell(
                        onTap: () {
                          mainShowModalBottomSheet(
                            context: context,
                            longShowModalBottom: false,
                            content: Container(
                              color: Colors.transparent,
                              child: const AboutMobileModal(),
                            ),
                          );
                        },
                        child: Text(
                          tr('profile.about_system'),
                          style: rowStyle.copyWith(
                            fontSize: 15.sp,
                            color: isLightTheme(context)
                                ? AppColors.aboutHeaderLight
                                : AppColors.whiteColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30..h,
                      ),
                      const VersionNumberRowMobile(),
                      SizedBox(
                        height: 40..h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      error: (error, _) => UserAppError(
        errorMessage: error.toString(),
      ),
      loading: () => const MainLoaderMobile(),
    );
  }
}

String getSelectedLanguage(BuildContext context) {
  var s = context.locale.toString();
  switch (s) {
    case "en_US":
      return "English";
  }
  return "English";
}
