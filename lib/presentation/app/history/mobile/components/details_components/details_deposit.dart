import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_app/presentation/app/history/mobile/components/details_components/components/detail_item_component_mobile.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class DetailDepositComponentMobile extends StatelessWidget {
  const DetailDepositComponentMobile({
    super.key,
    required this.iconUrl,
    required this.currency,
    required this.date,
    required this.type,
    required this.amount,
    required this.precision,
    required this.fee,
    required this.network,
    required this.peymentInterfaceType,
    required this.link,
    required this.status,
    this.isShowModalBottom = false,
  });

  final String? iconUrl;
  final String currency;
  final String date;
  final String type;
  final String amount;
  final int precision;
  final String fee;
  final String network;
  final String peymentInterfaceType;
  final String link;
  final String status;
  final bool isShowModalBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 15..h),
        child: Column(
          children: [
            isShowModalBottom
                ? Container(
                    width: 60.w,
                    height: 5..h,
                    padding: EdgeInsets.only(
                      bottom: 25..h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.r),
                      color: isLightTheme(context)
                          ? AppColors.aboutHeaderLight
                          : AppColors.whiteColor.withOpacity(0.25),
                    ),
                  )
                : const SizedBox(),
            Container(
              height: 50..h,
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isLightTheme(context)
                        ? AppColors.separatorLightTheme
                        : AppColors.separatorDarkTheme,
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    tr('history.currency'),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 15.sp,
                          letterSpacing: -0.75.sp,
                          fontWeight: FontWeight.w500,
                          color: isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColorText.withOpacity(0.5),
                        ),
                  ),
                  const Spacer(),
                  UserAppImage(
                    clipBehavior: Clip.hardEdge,
                    path: iconUrl!,
                    width: 20.w,
                    height: 20..h,
                    isNetwork: true,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    currency,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 15.sp,
                          letterSpacing: -0.75.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            DetailItemComponentMobile(
              isBorder: true,
              name: tr('history.network'),
              value: network,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponentMobile(
              isBorder: true,
              name: tr('history.date'),
              value: date,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponentMobile(
              isBorder: true,
              name: tr('history.type'),
              value: type,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponentMobile(
              isBorder: true,
              name: tr('history.amount'),
              value:
                  '${numberFormatWithPrecision(precision).format(double.parse(amount))} $currency',
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponentMobile(
              isBorder: true,
              name: tr('history.fee'),
              value:
                  '${numberFormatWithPrecision(precision).format(double.parse(fee))} $currency',
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponentMobile(
              isBorder: true,
              name: tr('history.status'),
              value: '• $status',
              valueColor: MainColorsApp.greenColor,
            ),
            link.isNotEmpty
                ? Container(
                    height: 45..h,
                    margin: EdgeInsets.only(
                      left: 20.w,
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            final Uri url = Uri.parse(link);
                            await launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          },
                          child: Text(
                            tr('history.blockchain_transaction'),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.75.sp,
                                  color: Theme.of(context).primaryColorLight,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Theme.of(context).primaryColorLight,
                                ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
