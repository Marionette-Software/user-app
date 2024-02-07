import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/platform/platform_utils.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/sizes.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class AboutMobileModal extends StatelessWidget {
  const AboutMobileModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.9,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: isLightTheme(context)
            ? Theme.of(context).primaryColor.withOpacity(0.1)
            : walletBackgroundColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gapH4,
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: SizedBox(
                      width: 85.w,
                      child: Divider(
                        color: isLightTheme(context)
                            ? Theme.of(context).primaryColor.withOpacity(0.1)
                            : AppColors.whiteColor.withOpacity(0.8),
                        thickness: 3,
                      ),
                    ),
                  ),
                ),
                gapH20,
                HeaderAboutMobile(
                  text: "Partners".hardcoded,
                ),
                gapH8,
                SubAboutMobile(
                  text: "Chainstack".hardcoded,
                  link: "https://chainstack.com/protocols/".linkHardcoded,
                ),
                gapH8,
                SubAboutMobile(
                  text: "Fireblocks".hardcoded,
                  link: "https://www.fireblocks.com/".linkHardcoded,
                ),
                gapH8,
                SubAboutMobile(
                  text: "GasTracker".hardcoded,
                  link: "https://etherscan.io/gastracker".linkHardcoded,
                ),
                gapH20,
                HeaderAboutMobile(
                  text: "Useful Links".hardcoded,
                ),
                gapH8,
                SubAboutMobile(
                  text: "Comparison".hardcoded,
                  link:
                      "https://docs.google.com/spreadsheets/d/1sOdPG3pq_PbdsTx3_NX2-_Q78FDNlftaPIvNbdeSCoA/edit#gid=0"
                          .linkHardcoded,
                ),
                gapH8,
                SubAboutMobile(
                  text: "Documentation".hardcoded,
                  link:
                      "https://tunex.atlassian.net/wiki/spaces/ID/pages/4325435/User+App+Architecture"
                          .linkHardcoded,
                ),
                gapH8,
                SubAboutMobile(
                    text: "Presentation".hardcoded,
                    link: "https://marionette.dev/presentation/".linkHardcoded),
                gapH20,
                HeaderAboutMobile(
                  text: "Legal".hardcoded,
                ),
                gapH8,
                SubAboutMobile(
                  text: "Privacy policy".hardcoded,
                  link: "https://marionette.dev/privacypolicy/".linkHardcoded,
                ),
                gapH8,
                SubAboutMobile(
                  text: "Terms of use".hardcoded,
                  link: "https://marionette.dev/termsofuse/".linkHardcoded,
                ),
                gapH8,
                SubAboutMobile(
                  text: "EULA".hardcoded,
                  link: "https://marionette.dev/eula/".linkHardcoded,
                ),
                gapH20,
                HeaderAboutMobile(
                  text: "Follow us".hardcoded,
                ),
                gapH8,
                SubAboutMobile(
                  text: "Discord".hardcoded,
                  prefixIcon: SvgPicture.asset(
                    discordIcon,
                    colorFilter: const ColorFilter.mode(
                      MainColorsApp.accentColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  link: "https://discord.gg/uvJE5WsU".linkHardcoded,
                ),
                gapH8,
                SubAboutMobile(
                  text: "Facebook".hardcoded,
                  prefixIcon: SvgPicture.asset(
                    fbIcon,
                    colorFilter: const ColorFilter.mode(
                      MainColorsApp.accentColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  link: "https://www.facebook.com/marionettesoftware"
                      .linkHardcoded,
                ),
                gapH8,
                SubAboutMobile(
                  text: "LinkedIn".hardcoded,
                  prefixIcon: SvgPicture.asset(
                    linkedinIcon,
                    colorFilter: const ColorFilter.mode(
                      MainColorsApp.accentColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  link: "https://www.linkedin.com/showcase/marionette-software/"
                      .linkHardcoded,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderAboutMobile extends StatelessWidget {
  final String text;
  const HeaderAboutMobile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: -1.sp,
              color: isLightTheme(context)
                  ? AppColors.aboutHeaderLight
                  : AppColors.whiteColor.withOpacity(0.25),
            ),
      ),
    );
  }
}

class SubAboutMobile extends StatelessWidget {
  final String text;
  final Widget? prefixIcon;
  final String? link;
  const SubAboutMobile({
    super.key,
    required this.text,
    this.prefixIcon,
    this.link,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.1),
      onTap: link == null ? null : () => PlatformUtils.openLink(link),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            if (prefixIcon != null)
              Row(
                children: [
                  SizedBox.fromSize(size: Size(14.h, 14.w), child: prefixIcon!),
                  gapW8,
                ],
              ),
            Text(
              text,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1.sp,
                    color: isLightTheme(context)
                        ? Theme.of(context).primaryColor
                        : AppColors.whiteColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
