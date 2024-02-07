import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/buy/buy.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ListSupportedBunks extends HookConsumerWidget {
  const ListSupportedBunks({
    required this.selectedBuyOption,
    required this.buyOptions,
    super.key,
  });

  final List<BuyOption> buyOptions;
  final ValueNotifier<int> selectedBuyOption;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      runSpacing: 15.h,
      spacing: 1.w,
      alignment: WrapAlignment.center,
      children: List.generate(
        buyOptions[selectedBuyOption.value].supportedList.length,
        (index) {
          var item = buyOptions[selectedBuyOption.value].supportedList[index];
          return Padding(
            padding: EdgeInsets.only(
              left: 12.5.w,
              right: 12.5.w,
            ),
            child: Container(
              width: 262.h,
              height: 102.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: isLightTheme(context)
                      ? AppColors.borderSideColor.withOpacity(0.25)
                      : AppColors.whiteColor.withOpacity(0.25),
                  width: 1.5.w,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  item,
                  height: 40.h,
                  fit: BoxFit.fitHeight,
                  placeholderBuilder: (context) =>
                      const CircularProgressIndicator(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
