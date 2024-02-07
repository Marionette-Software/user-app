import 'package:flutter/material.dart';
import 'package:user_app/presentation/app/user_orders/mobile/user_orders_mobile.dart';
import 'package:user_app/presentation/app/user_orders/web/user_orders_web.dart';

class UserOrders extends StatelessWidget {
  const UserOrders({
    Key? key,
  }) : super(key: key);

  static const routeName = '/userOrders';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return const UserOrderWeb();
        } else {
          return const UserProfileOrdersMobile();
        }
      },
    );
  }
}
