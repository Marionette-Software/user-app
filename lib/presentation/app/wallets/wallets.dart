import 'package:flutter/material.dart';
import 'package:user_app/presentation/app/navigation/navigation_mobile.dart';
import 'package:user_app/presentation/app/wallets/web/wallets_web.dart';

class Wallets extends StatelessWidget {
  const Wallets({
    Key? key,
  }) : super(key: key);

  static const routeName = '/wallets';

  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return const WalletsWeb();
        } else {
          return const Navigation();
        }
      },
    );
  }
}
