import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webviewx/webviewx.dart';

class TradeChartWeb extends StatefulHookConsumerWidget {
  const TradeChartWeb({
    Key? key,
    required this.marketId,
    required this.url,
    required this.themeMode,
  }) : super(key: key);

  final String marketId;
  final String url;
  final String themeMode;
  @override
  ConsumerState<TradeChartWeb> createState() => _TradeChartWebState();
}

class _TradeChartWebState extends ConsumerState<TradeChartWeb> {
  late WebViewXController webviewController;

  @override
  void dispose() {
    webviewController.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.marketId != oldWidget.marketId || widget.themeMode != oldWidget.themeMode) {
      webviewController.loadContent(
        'https://${widget.url}/tradingview/?id=${widget.marketId}&theme=${widget.themeMode}',
        SourceType.url,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebViewX(
      onWebViewCreated: (controller) => webviewController = controller,
      initialContent:
          'https://${widget.url}/tradingview/?id=${widget.marketId}&theme=${widget.themeMode}',
      initialSourceType: SourceType.url,
      width: 984.w,
      height: 555.h,
    );
  }
}