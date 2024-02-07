// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:user_app/presentation/app/navigation/navigation_mobile.dart';
import 'package:user_app/presentation/app/profile/web/profile_web.dart';

class Profile extends StatefulWidget {
  const Profile({
    this.indexSelectedTab,
    Key? key,
  }) : super(key: key);

  static const routeName = '/profile';

  final Object? indexSelectedTab;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int? selectedIndexTab;
  @override
  void initState() {
    selectedIndexTab =
        widget.indexSelectedTab == null ? 0 : widget.indexSelectedTab as int;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return ProfileWeb(indexSelectedTab: selectedIndexTab);
        } else {
          return const Navigation(tabIndex: 4);
        }
      },
    );
  }
}
