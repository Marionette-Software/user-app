import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/navigation_bar/bottom_navigation_index.dart';
import 'package:user_app/presentation/app/navigation/bottom_navigation_bar.dart';

class Navigation extends HookWidget {
  const Navigation({
    super.key,
    this.tabIndex = 0,
  });

  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    var box =
        Hive.box<BottomNavigationIndexData>(Constants.bottomNavigationIndex);
    BottomNavigationIndexData boxValue = box.getAt(0)!;

    final selectedIndex = useState(boxValue.selectedIndex);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: selectedIndex,
      ),
      body: navigationPages[selectedIndex.value].page,
    );
  }
}
