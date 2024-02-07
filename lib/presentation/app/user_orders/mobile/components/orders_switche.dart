import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/components/flat_custom_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class OrdersSwitchMobile extends StatefulWidget {
  final Function(int page)? changeType;
  final List<String>? options;

  const OrdersSwitchMobile({
    Key? key,
    required this.changeType,
    required this.options,
  }) : super(key: key);

  @override
  OrdersSwitchMobileState createState() => OrdersSwitchMobileState();
}

class OrdersSwitchMobileState extends State<OrdersSwitchMobile> {
  var _active = 0;
  final _duration = const Duration(milliseconds: 500);

  currentPage(int p) {
    setState(() {
      _active = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 234.w,
      height: 45..h,
      child: Container(
        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          color: isLightTheme(context)
              ? AppColors.mainBackgroundLightColor
              : AppColors.mainBackgroundDarkColor,
          borderRadius: BorderRadius.circular(42.0.r),
        ),
        child: Row(
          children: [
            for (var i = 0; i < widget.options!.length; i++)
              AnimatedContainer(
                decoration: BoxDecoration(
                  color: _active == i
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
                    setState(() {
                      _active = i;
                    });
                    widget.changeType!(i);
                  },
                  splashColor: Colors.transparent,
                  child: Center(
                    child: SizedBox(
                      width: 115.w,
                      height: 40..h,
                      child: Center(
                        child: Text(
                          widget.options![i],
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.w500,
                                color: isLightTheme(context)
                                    ? _active == i
                                        ? AppColors.darkColorText
                                        : AppColors.aboutHeaderLight
                                    : _active == i
                                        ? AppColors.whiteColor
                                        : AppColors.whiteColor.withOpacity(0.5),
                                letterSpacing: -0.75.sp,
                                fontSize: 15.sp,
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
