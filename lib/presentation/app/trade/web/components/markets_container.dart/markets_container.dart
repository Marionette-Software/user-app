import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/trade/get_markets_future_provider.dart';
import 'package:user_app/presentation/app/trade/web/components/markets_container.dart/componenst/market_list.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';

class MarketsContainerWeb extends HookConsumerWidget {
  const MarketsContainerWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 373.w,
        height: 1105.h,
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: MarketListWeb(
                    allMarkets: ref.watch(getMarketsNotifierProvider),
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
