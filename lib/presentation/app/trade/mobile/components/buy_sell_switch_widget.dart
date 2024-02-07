import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/market_or_limit_provider.dart';
import 'package:user_app/domain/trade/order_type.dart';
import 'package:user_app/presentation/components/flat_custom_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class MarketLimitSwitchMobile extends StatefulHookConsumerWidget {
  final Function(int page)? changeType;
  final List<OrderType> options;

  const MarketLimitSwitchMobile({
    Key? key,
    this.changeType,
    required this.options,
  }) : super(key: key);

  @override
  ConsumerState<MarketLimitSwitchMobile> createState() =>
      _MarketLimitSwitchMobileState();
}

class _MarketLimitSwitchMobileState extends ConsumerState<MarketLimitSwitchMobile> {
  final _duration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    final marketOrLimitProviderWatch = ref.watch(marketOrLimitProvider);
    final marketOrLimitProviderRead = ref.read(marketOrLimitProvider.notifier);

    return SizedBox(
      width: 250.w,
      height: 41..h,
      child: Container(
        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          color: isLightTheme(context)
              ? AppColors.mainBackgroundLightColor
              : AppColors.mainBackgroundDarkColor,
          borderRadius: BorderRadius.circular(42.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < widget.options.length; i++)
              Expanded(
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    color: marketOrLimitProviderWatch == widget.options[i]
                        ? !isLightTheme(context)
                            ? walletBackgroundColor
                            : Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(39.0.r),
                  ),
                  duration: _duration,
                  child: FlatCustomButton(
                    radius: 42.0.r,
                    color: Colors.transparent,
                    onTap: () {
                      marketOrLimitProviderRead.state = widget.options[i];
                      widget.changeType!(i);
                    },
                    splashColor: Colors.transparent,
                    child: Center(
                      child: SizedBox(
                       width: 250 / widget.options.length,
                        height: 41..h,
                        child: Center(
                          child: Text(
                            capitalize(widget.options[i].name),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: isLightTheme(context)
                                      ? marketOrLimitProviderWatch ==
                                              widget.options[i]
                                          ? AppColors.darkColorText
                                          : AppColors.aboutHeaderLight
                                      : marketOrLimitProviderWatch ==
                                              widget.options[i]
                                          ? AppColors.whiteColor
                                          : AppColors.whiteColor
                                              .withOpacity(0.5),
                                  letterSpacing: -0.75.sp,
                                  fontSize: 15.sp,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
