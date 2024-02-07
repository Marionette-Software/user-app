import 'package:flutter/material.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/trade/components/trade_tab_bar/components/trade_tab_bar_item.dart';

class TradeTabBar extends StatelessWidget {
  const TradeTabBar({
    Key? key,
    required this.leftTabOnTap,
    required this.leftTabActive,
    required this.leftTabTitle,
    required this.rightTabOnTap,
    required this.rightTabActive,
    required this.rightTabTitle,
    required this.platformType,
  }) : super(key: key);

  final Function() leftTabOnTap;
  final bool leftTabActive;
  final String leftTabTitle;
  final Function() rightTabOnTap;
  final bool rightTabActive;
  final String rightTabTitle;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TradeTabBarItem(
            platformType: platformType,
            onTap: leftTabOnTap,
            active: leftTabActive,
            title: leftTabTitle,
            side: 'left',
          ),
        ),
        Expanded(
          child: TradeTabBarItem(
            platformType: platformType,
            onTap: rightTabOnTap,
            active: rightTabActive,
            title: rightTabTitle,
            side: 'right',
          ),
        ),
      ],
    );
  }
}
