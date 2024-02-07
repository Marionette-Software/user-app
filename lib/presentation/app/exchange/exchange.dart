import 'package:flutter/material.dart';
import 'package:user_app/presentation/app/exchange/mobile/exchange_main_page.dart';
import 'package:user_app/presentation/app/exchange/web/exchange_web.dart';

class Exchange extends StatelessWidget {
  static const routeName = '/exchange';

  const Exchange({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return const ExchangeWeb();
        } else {
          return const ExchangeMobile();
        }
      },
    );
  }
}
