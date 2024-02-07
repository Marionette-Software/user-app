import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/presentation/app/wallets/web/components/wallet_details_column/components/wallet_card_web/components/event_with_balance_web/components/buy/buy.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ListBuyOptionWeb extends HookConsumerWidget {
  const ListBuyOptionWeb({
    required this.selectedBuyOption,
    required this.buyOptions,
    super.key,
  });

  final List<BuyOption> buyOptions;
  final ValueNotifier<int> selectedBuyOption;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      runSpacing: 25.h,
      spacing: 1.w,
      alignment: WrapAlignment.center,
      children: List.generate(
        buyOptions.length,
        (index) {
          BuyOption item = buyOptions[index];
          return Padding(
            padding: EdgeInsets.only(
              left: 12.5.w,
              right: 12.5.w,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10.r),
              onTap: () async {
                selectedBuyOption.value = index;
              },
              child: Container(
                width: 167.h,
                height: 102.h,
                decoration: BoxDecoration(
                  color: selectedBuyOption.value == index
                      ? MainColorsApp.accentColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: selectedBuyOption.value == index
                        ? Colors.transparent
                        : isLightTheme(context)
                            ? AppColors.borderSideColor.withOpacity(0.25)
                            : AppColors.whiteColor.withOpacity(0.25),
                    width: selectedBuyOption.value == index ? 0 : 1.5.w,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      item.icon,
                      height: 33.h,
                      colorFilter: ColorFilter.mode(
                        isLightTheme(context)
                            ? selectedBuyOption.value == index
                                ? AppColors.whiteColor
                                : AppColors.darkColorText
                            : AppColors.whiteColor,
                        BlendMode.srcIn,
                      ),
                      fit: BoxFit.fitHeight,
                      placeholderBuilder: (context) =>
                          const CircularProgressIndicator(),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: isLightTheme(context)
                                ? selectedBuyOption.value == index
                                    ? AppColors.whiteColor
                                    : AppColors.darkColorText
                                : AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                            letterSpacing: -1.sp,
                          ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
