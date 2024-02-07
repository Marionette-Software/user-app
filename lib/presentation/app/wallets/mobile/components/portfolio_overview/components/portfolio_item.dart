import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/wallet/statistic_wallet_data.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';

class PortfolioItemMobile extends StatelessWidget {
  const PortfolioItemMobile({
    Key? key,
    required this.item,
    required this.allSumBalanceToUsdt,
  }) : super(key: key);

  final StatisticWalletDataState item;
  final double allSumBalanceToUsdt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 17.w),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.centerStart,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 235.w,
                height: 30..h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: item.color,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 23.w,
                    left: 37.w,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Tooltip(
                        message: item.id.length > 7 ? item.id : '',
                        child: SizedBox(
                          width: 100.w,
                          child: Text(
                            item.id,
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontSize: 20.sp,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -1.sp,
                                  fontStyle: FontStyle.normal,
                                  overflow: TextOverflow.ellipsis,
                                ),
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
                  height: 40..h,
                  isNetwork: item.id == 'Other' ? false : true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
