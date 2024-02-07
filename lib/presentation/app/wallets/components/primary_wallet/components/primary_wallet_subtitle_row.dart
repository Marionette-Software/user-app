import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';

class PrimaryWalletSubtitle extends StatelessWidget {
  const PrimaryWalletSubtitle({
    Key? key,
    required this.platformType,
    required this.lockedBalance,
    required this.lockedBalanceToBase,
  }) : super(key: key);

  final PlatformTypeState platformType;
  final String lockedBalance;
  final String lockedBalanceToBase;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.lock,
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          size: (platformType == PlatformTypeState.web
                  ? 14
                  : (platformType == PlatformTypeState.tablet ? 10 : 8))
              .w,
        ),
        SizedBox(
          width: (platformType == PlatformTypeState.web
                  ? 8.7
                  : (platformType == PlatformTypeState.tablet ? 6 : 2.7))
              .w,
        ),
        SizedBox(
          height: (platformType == PlatformTypeState.web
                  ? 18.15
                  : (platformType == PlatformTypeState.tablet ? 16 : 12))
              .h,
          child: AutoSizeText(
            lockedBalance,
            minFontSize: 5,
            maxFontSize: (platformType == PlatformTypeState.web
                ? 15
                : (platformType == PlatformTypeState.tablet ? 13 : 10)),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: (platformType == PlatformTypeState.web
                    ? 15
                    : (platformType == PlatformTypeState.tablet ? 13 : 10)),
                color: Theme.of(context).primaryColor.withOpacity(0.5)),
          ),
        ),
        const Spacer(),
        SizedBox(
          height: (platformType == PlatformTypeState.web
                  ? 18.15
                  : (platformType == PlatformTypeState.tablet ? 16 : 12))
              .h,
          child: AutoSizeText(
            lockedBalanceToBase,
            minFontSize: 5,
            maxFontSize: (platformType == PlatformTypeState.web
                ? 15
                : (platformType == PlatformTypeState.tablet ? 13 : 10)),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: (platformType == PlatformTypeState.web
                    ? 15
                    : (platformType == PlatformTypeState.tablet ? 13 : 10)),
                color: Theme.of(context).primaryColor.withOpacity(0.5)),
          ),
        ),
      ],
    );
  }
}
