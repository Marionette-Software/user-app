import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/auth/components/footer_components/footer_column.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/constants/colors.dart';

class FooterPopUpMobile extends StatelessWidget {
  const FooterPopUpMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isLightTheme(context)
                ? AppColors.whiteColor
                : AppColors.whiteColor.withOpacity(0.1),
            isLightTheme(context)
                ? AppColors.whiteColor
                : AppColors.whiteColor.withOpacity(0.0),
          ],
        ),
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: isLightTheme(context)
                ? Colors.transparent
                : AppColors.whiteColor.withOpacity(0.25),
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12 .h,
          ),
          Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: 85 .w,
              child: Divider(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                thickness: 3,
              ),
            ),
          ),
          SizedBox(
            height: 15 .h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20 .w),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30 .w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            FooterColumn(
                              platformType: PlatformTypeState.mobile,
                              title: tr('authorization.partners'),
                              subtitle1: tr('authorization.chaninstack'),
                              subtitle2: tr('authorization.fireblocks'),
                              subtitle3: tr('authorization.gas_tracker'),
                              url1: 'https://chainstack.com/protocols/',
                              url2: 'https://www.fireblocks.com/',
                              url3: 'https://etherscan.io/gastracker',
                            ),
                            SizedBox(
                              width: 51 .w,
                            ),
                            FooterColumn(
                              platformType: PlatformTypeState.mobile,
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
                          ],
                        ),
                        SizedBox(
                          height: 50 .h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FooterColumn(
                              platformType: PlatformTypeState.mobile,
                              title: tr('authorization.legal'),
                              subtitle1: tr('authorization.privacy_policy'),
                              subtitle2: tr('authorization.term_of_use'),
                              subtitle3: tr('authorization.eula'),
                              url1: 'https://marionette.dev/privacypolicy/',
                              url2: 'https://marionette.dev/termsofuse/',
                              url3: 'https://marionette.dev/eula/',
                            ),
                            SizedBox(
                              width: 51 .w,
                            ),
                            FooterColumn(
                              platformType: PlatformTypeState.mobile,
                              title: tr('authorization.follow_us'),
                              subtitle1: tr('authorization.discord'),
                              subtitle2: tr('authorization.facebook'),
                              subtitle3: tr('authorization.linkedIn'),
                              url1: 'https://discord.gg/uvJE5WsU',
                              url2:
                                  'https://www.facebook.com/marionettesoftware',
                              url3:
                                  'https://www.linkedin.com/showcase/marionette-software',
                              iconSubtitle1: discordIcon,
                              iconSubtitle2: fbIcon,
                              iconSubtitle3: linkedinIcon,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: 21 .h,
          ),
        ],
      ),
    );
  }
}
