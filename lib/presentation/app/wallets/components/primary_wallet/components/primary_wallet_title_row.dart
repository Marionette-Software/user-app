import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';

class PrimaryWalletTitleRow extends StatelessWidget {
  const PrimaryWalletTitleRow({
    Key? key,
    required this.platformType,
    required this.title,
    required this.balance,
    required this.currencyId,
  }) : super(key: key);

  final PlatformTypeState platformType;
  final String title;
  final String balance;
  final String currencyId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: (platformType == PlatformTypeState.web
                  ? 36
                  : (platformType == PlatformTypeState.tablet ? 24 : 16))
              .h,
          child: AutoSizeText(
            title,
            maxFontSize: platformType == PlatformTypeState.web
                ? 30
                : (platformType == PlatformTypeState.tablet ? 20 : 13),
            minFontSize: 2,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: platformType == PlatformTypeState.web
                      ? FontWeight.w600
                      : (platformType == PlatformTypeState.tablet
                          ? FontWeight.w700
                          : FontWeight.normal),
                  fontSize: platformType == PlatformTypeState.web
                      ? 30
                      : (platformType == PlatformTypeState.tablet ? 20 : 13),
                ),
          ),
        ),
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: platformType == PlatformTypeState.web
                  ? 37
                  : (platformType == PlatformTypeState.tablet ? 24 : 16).h,
              child: AutoSizeText(
                balance,
                maxFontSize: platformType == PlatformTypeState.web
                    ? 30
                    : (platformType == PlatformTypeState.tablet ? 20 : 13),
                minFontSize: 2,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: platformType == PlatformTypeState.web
                          ? FontWeight.w600
                          : (platformType == PlatformTypeState.tablet
                              ? FontWeight.w700
                              : FontWeight.normal),
                      fontSize: platformType == PlatformTypeState.web
                          ? 30
                          : (platformType == PlatformTypeState.tablet
                              ? 20
                              : 13),
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: (platformType == PlatformTypeState.mobile ? 0 : 5).h,
              ),
              child: SizedBox(
                height: (platformType == PlatformTypeState.web
                        ? 24
                        : (platformType == PlatformTypeState.tablet ? 18 : 15))
                    .h,
                child: AutoSizeText(
                  currencyId,
                  maxFontSize: platformType == PlatformTypeState.web
                      ? 20
                      : (platformType == PlatformTypeState.tablet ? 15 : 13),
                  minFontSize: 2,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: platformType == PlatformTypeState.web
                            ? 20
                            : (platformType == PlatformTypeState.tablet
                                ? 15
                                : 13),
                        fontWeight: platformType == PlatformTypeState.web
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
