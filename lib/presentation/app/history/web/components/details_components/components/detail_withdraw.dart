import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_app/presentation/app/history/web/components/details_components/components/detail_item_component.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/check_type.dart';
import 'package:user_app/presentation/helpers/formatters/format_string.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class DetailWithdrawComponent extends StatelessWidget {
  const DetailWithdrawComponent({
    super.key,
    required this.iconUrl,
    required this.currency,
    required this.network,
    required this.date,
    required this.type,
    required this.amount,
    required this.fee,
    required this.precision,
    required this.peymentInterfaceType,
    required this.link,
    required this.status,
  });
  final String? iconUrl;
  final String currency;
  final String network;
  final String date;
  final String type;
  final String amount;
  final String fee;
  final int precision;
  final String peymentInterfaceType;
  final String link;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 402.w,
      alignment: Alignment.center,
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
                : AppColors.whiteColor.withOpacity(0),
          ],
        ),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          isLightTheme(context)
              ? BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                )
              : BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 25.h,
          left: 25.w,
          right: 25.w,
        ),
        child: Column(
          children: [
            Text(
              tr('history.details'),
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 30.sp,
                  ),
            ),
            Container(
              height: 80.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).primaryColor.withOpacity(0.25),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    tr('history.currency'),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 20.sp,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                  ),
                  const Spacer(),
                  UserAppImage(
                    clipBehavior: Clip.hardEdge,
                    path: iconUrl!,
                    width: 35.w,
                    height: 35.h,
                    isNetwork: true,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    currency,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 20.sp,
                        ),
                  ),
                ],
              ),
            ),
            DetailItemComponent(
              isBorder: true,
              name: tr('history.network'),
              value: cutString(network, 20),
              alt: network,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponent(
              isBorder: true,
              name: tr('history.date'),
              value: date,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponent(
              isBorder: true,
              name: tr('history.type'),
              value: type,
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponent(
              isBorder: true,
              name: tr('history.amount'),
              value: '$amount $currency',
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponent(
              isBorder: true,
              name: tr('history.fee'),
              value:
                  '${numberFormatWithPrecision(precision).format(double.parse(fee))} $currency',
              valueColor: Theme.of(context).primaryColor,
            ),
            DetailItemComponent(
              isBorder: true,
              name: tr('history.status'),
              value: '• ${walletHistoryStatus(status)}',
              valueColor: walletHistoryStatus(status) == 'Success'
                  ? MainColorsApp.greenColor
                  : walletHistoryStatus(status) == 'Rejected'
                      ? MainColorsApp.redColor
                      : MainColorsApp.yellowLogoColor,
            ),
            link.isNotEmpty
                ? Container(
                    height: 1.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.25),
                          width: 1.0,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            link.isNotEmpty
                ? Container(
                    height: 80.h,
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
                                  fontSize: 20.sp,
                                  color: Theme.of(context).primaryColorLight,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
