import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/wallet/user_wallet.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class RowAvailableBalanceMobile extends StatelessWidget {
  const RowAvailableBalanceMobile({
    required this.walletBalance,
    required this.walletData,
    super.key,
  });

  final double walletBalance;
  final UserWallet walletData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 15.w,
        top: 5..h,
        bottom: 25..h,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          '${tr('wallet.available')} ${numberFormatWithPrecision(walletData.precision).format(walletBalance)} ${walletData.id.toUpperCase()}',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.65.sp,
                color: isLightTheme(context)
                    ? AppColors.aboutHeaderLight
                    : AppColors.whiteColor.withOpacity(0.5),
              ),
        ),
      ),
    );
  }
}
