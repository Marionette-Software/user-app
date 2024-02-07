import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';

part 'bottom_navigation_index.g.dart';

@HiveType(typeId: 5)
class BottomNavigationIndexData extends HiveObject {
  BottomNavigationIndexData({
    required this.selectedIndex,
  });

  @HiveField(0)
  final int selectedIndex;
}

class BottomNavigationIndexHelper {
  static void update({
    required int selectedIndex,
  }) {
    var box = Hive.box<BottomNavigationIndexData>(Constants.userConfig);

    var data = BottomNavigationIndexData(
      selectedIndex: selectedIndex,
    );
    box.putAt(0, data);
  }
}
