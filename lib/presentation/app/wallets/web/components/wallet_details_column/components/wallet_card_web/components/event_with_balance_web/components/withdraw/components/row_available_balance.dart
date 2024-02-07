import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/wallet/user_wallet.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/formatters/number_format_with_precision.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class RowAvailableBalanceWeb extends StatelessWidget {
  const RowAvailableBalanceWeb({
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
        top: 10.h,
        bottom: 25.h,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          '${tr('wallet.available')} ${numberFormatWithPrecision(walletData.precision).format(walletBalance)} ${walletData.id.toUpperCase()}',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.9.sp,
                color: isLightTheme(context)
                    ? AppColors.aboutHeaderLight
                    : Colors.white.withOpacity(0.5),
              ),
        ),
      ),
    );
  }
}
