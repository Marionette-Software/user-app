import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/auth/components/footer_components/main_label.dart';
import 'package:user_app/presentation/auth/components/footer_components/sub_label.dart';
import 'package:user_app/presentation/auth/mobile/components/footer_components/components/footer_column.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/assets_path.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20.w,
        50.h,
        20.w,
        15.h,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 48.h,
            width: 130.w,
            child: const UserAppImage(
              path: logoLarge,
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FooterColumnMobile(
                title: tr('authorization.partners'),
                subtitle1: tr('authorization.chaninstack'),
                subtitle2: tr('authorization.fireblocks'),
                subtitle3: tr('authorization.gas_tracker'),
                url1: 'https://chainstack.com/protocols/',
                url2: 'https://www.fireblocks.com/',
                url3: 'https://etherscan.io/gastracker',
                url4: 'https://discord.gg/uvJE5WsU',
                iconPath: discordIcon,
              ),
              SizedBox(
                width: 62.w,
              ),
              FooterColumnMobile(
                title: tr('authorization.useful_links'),
                subtitle1: tr('authorization.comparison'),
                subtitle2: tr('authorization.documentation'),
                subtitle3: tr('authorization.presentation'),
                url1:
                    'https://docs.google.com/spreadsheets/d/1sOdPG3pq_PbdsTx3_NX2-_Q78FDNlftaPIvNbdeSCoA/edit#gid=0',
                url2:
                    'https://tunex.atlassian.net/wiki/spaces/ID/pages/4325435/User+App+Architecture',
                url3: 'https://marionette.dev/presentation/',
                url4: 'https://www.facebook.com/marionettesoftware',
                iconPath: fbIcon,
              ),
            ],
          ),
          SizedBox(
            height: 32.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FooterColumnMobile(
                title: tr('authorization.legal'),
                subtitle1: tr('authorization.privacy_policy'),
                subtitle2: tr('authorization.term_of_use'),
                subtitle3: tr('authorization.eula'),
                url1: 'https://marionette.dev/privacypolicy/',
                url2: 'https://marionette.dev/termsofuse/',
                url3: 'https://marionette.dev/eula/',
                url4: 'https://www.linkedin.com/showcase/marionette-software',
                iconPath: linkedinIcon,
              ),
              SizedBox(
                width: 62.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 91.w,
                    alignment: Alignment.center,
                    child: MainLabel(
                      label: tr('authorization.follow_us'),
                      platformType: PlatformTypeState.mobile,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SubLabel(
                    label: tr('authorization.legal'),
                    url: 'https://discord.gg/uvJE5WsU',
                    platformType: PlatformTypeState.mobile,
                    iconPath: discordIcon,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SubLabel(
                    label: tr('authorization.facebook'),
                    url: 'https://www.facebook.com/marionettesoftware',
                    platformType: PlatformTypeState.mobile,
                    iconPath: fbIcon,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SubLabel(
                    label: tr('authorization.linkedIn'),
                    url:
                        'https://www.linkedin.com/showcase/marionette-software',
                    platformType: PlatformTypeState.mobile,
                    iconPath: linkedinIcon,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 31.h,
          ),
          Text(
            tr('authorization.all_right_reserved'),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                  fontSize: 18.sp,
                ),
          ),
        ],
      ),
    );
  }
}
