import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/wallet/statistic_wallet_data.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';

class PortfolioItem extends StatelessWidget {
  const PortfolioItem({
    Key? key,
    required this.item,
    required this.allSumBalanceToUsdt,
  }) : super(key: key);

  final StatisticWalletDataState item;
  final double allSumBalanceToUsdt;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      // decoration: BoxDecoration(
      //   color: item.color,
      //   borderRadius: const BorderRadius.all(
      //     Radius.circular(10.0),
      //   ),
      // ),
      message:
          item.amount.isEmpty ? '' : '${item.amount} ${item.id.toUpperCase()}',
      verticalOffset: -60.h,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 250.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: item.color,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                right: 23.w,
                left: 37.w,
                top: 3.h,
                bottom: 3.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      item.id,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 20.sp,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -1.sp,
                            fontStyle: FontStyle.normal,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                  ),
                  Text(
                    '${((item.balanceToUsdt * 100) / allSumBalanceToUsdt).toStringAsFixed(2)} %',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 20.sp,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -1.sp,
                          fontStyle: FontStyle.normal,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: -17.w,
            child: UserAppImage(
              clipBehavior: Clip.hardEdge,
              path: item.iconUrl,
              width: 40.w,
              height: 40.h,
              isNetwork: true,
            ),
          ),
        ],
      ),
    );
  }
}
