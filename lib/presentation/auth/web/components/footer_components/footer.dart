import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:user_app/application/global_data/actions/global_actions.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/auth/components/footer_components/footer_column.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class FooterWeb extends StatelessWidget {
  const FooterWeb({this.withAuthPage = false, super.key});

  final bool withAuthPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 379.h,
      decoration: withAuthPage
          ? BoxDecoration(
              color: isLightTheme(context)
                  ? AppColors.whiteColor
                  : AppColors.mainBackgroundDarkColor,
            )
          : BoxDecoration(
              color: Colors.white,
              gradient: isLightTheme(context)
                  ? null
                  : const LinearGradient(
                      begin: Alignment(0, -1),
                      end: Alignment(0, 1),
                      colors: [Color(0xff1c252d), Color(0x001c252d)],
                      stops: [0, 1],
                    ),
              boxShadow: [
                isLightTheme(context)
                    ? BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        spreadRadius: 10,
                        blurRadius: 20,
                        offset: const Offset(0, 3),
                      )
                    : BoxShadow(
                        color: Theme.of(context)
                            .primaryColorLight
                            .withOpacity(0.0),
                        spreadRadius: 15,
                        blurRadius: 30,
                        offset: const Offset(0, 3),
                      )
              ],
            ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 101.h,
          bottom: 25.h,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 286.w,
                  height: 113.h,
                  child: InkWell(
                    onTap: () async {
                      PackageInfo packageInfo =
                          await PackageInfo.fromPlatform();
                      var box =
                          Hive.box<GlobalConfigData>(Constants.globalConfig);
                      GlobalConfigData globalData = box.getAt(0)!;
                      final snackBar = SnackBar(
                        elevation: 0,
                        clipBehavior: Clip.none,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          titleFontSize: 30.sp,
                          messageFontSize: 20.sp,
                          title: globalData.url.toUpperCase(),
                          message: packageInfo.buildNumber.isNotEmpty
                              ? 'APP VERSION: ${packageInfo.version}+${packageInfo.buildNumber}'
                              : 'APP VERSION: ${packageInfo.version}',
                          contentType: ContentType.help,
                        ),
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    },
                    child: const UserAppImage(
                      path: logoLarge,
                    ),
                  ),
                ),
                FooterColumn(
                  platformType: PlatformTypeState.web,
                  title: tr('authorization.partners'),
                  subtitle1: tr('authorization.chaninstack'),
                  subtitle2: tr('authorization.fireblocks'),
                  subtitle3: tr('authorization.gas_tracker'),
                  url1: 'https://chainstack.com/protocols/',
                  url2: 'https://www.fireblocks.com/',
                  url3: 'https://etherscan.io/gastracker',
                ),
                FooterColumn(
                  platformType: PlatformTypeState.web,
                  title: tr('authorization.useful_links'),
                  subtitle1: tr('authorization.comparison'),
                  subtitle2: tr('authorization.documentation'),
                  subtitle3: tr('authorization.presentation'),
                  url1:
                      'https://docs.google.com/spreadsheets/d/1sOdPG3pq_PbdsTx3_NX2-_Q78FDNlftaPIvNbdeSCoA/edit#gid=0',
                  url2:
                      'https://tunex.atlassian.net/wiki/spaces/ID/pages/4325435/User+App+Architecture',
                  url3: 'https://marionette.dev/presentation/',
                ),
                FooterColumn(
                  platformType: PlatformTypeState.web,
                  title: tr('authorization.legal'),
                  subtitle1: tr('authorization.privacy_policy'),
                  subtitle2: tr('authorization.term_of_use'),
                  subtitle3: tr('authorization.eula'),
                  url1: 'https://marionette.dev/privacypolicy/',
                  url2: 'https://marionette.dev/termsofuse/',
                  url3: 'https://marionette.dev/eula/',
                ),
                FooterColumn(
                  platformType: PlatformTypeState.web,
                  title: tr('authorization.follow_us'),
                  subtitle1: tr('authorization.discord'),
                  subtitle2: tr('authorization.facebook'),
                  subtitle3: tr('authorization.linkedIn'),
                  url1: 'https://discord.gg/uvJE5WsU',
                  url2: 'https://www.facebook.com/marionettesoftware',
                  url3: 'https://www.linkedin.com/showcase/marionette-software',
                  iconSubtitle1: discordIcon,
                  iconSubtitle2: fbIcon,
                  iconSubtitle3: linkedinIcon,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 182.69.w,
                      height: 54.26.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(7.2.r),
                      ),
                      child: SvgPicture.asset(
                        appstoreButtonPath,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      width: 182.69.w,
                      height: 54.26.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(7.2.r),
                      ),
                      child: SvgPicture.asset(
                        googleButtonPath,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 30.h,
              alignment: Alignment.center,
              child: InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () async {
                  GlobalActionsGeneral globalActionsGeneral =
                      GlobalActionsGeneral();
                  globalActionsGeneral.openLink(url: 'https://marionette.dev/');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      logoSmall,
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      tr('authorization.powered_by'),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -1.sp,
                          ),
                    ),
                    Text(
                      tr('authorization.marionette_dev'),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: MainColorsApp.accentColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1.sp,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
