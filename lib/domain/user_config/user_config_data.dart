import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';

part 'user_config_data.g.dart';

@HiveType(typeId: 4)
class UserConfigData extends HiveObject {
  UserConfigData({
    this.userId,
    this.token,
    this.selectedMarketId,
    this.userName,
  });

  @HiveField(0)
  late String? userId;
  @HiveField(1)
  late String? token;
  @HiveField(2)
  late String? selectedMarketId;
  @HiveField(3)
  late String? userName;
}

class UserConfigHelper {
  static void update({
    String? userId,
    String? token,
    String? selectedMarketId,
    String? userName,
  }) {
    var box = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = box.getAt(0)!;
    var data = UserConfigData(
      userId: userId,
      token: token,
      selectedMarketId: selectedMarketId ?? userData.selectedMarketId,
      userName: userName,
    );
    box.putAt(0, data);
  }
}
