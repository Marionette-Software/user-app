import 'package:flutter/material.dart';
import 'package:user_app/presentation/app/history/mobile/history_main_mobile.dart';
import 'package:user_app/presentation/app/history/web/history_main_web.dart';

class History extends StatelessWidget {
  const History({
    Key? key,
  }) : super(key: key);

  static const routeName = '/history';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return const HistoryMainPageWeb();
        } else {
          return const HistoryMainPageMobile(
            withNavBar: false,
          );
        }
      },
    );
  }
}
