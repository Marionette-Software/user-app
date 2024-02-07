import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';

final userDataFutureProvider = FutureProvider.autoDispose((ref) async {
  var box = Hive.box<UserConfigData>(Constants.userConfig);
  UserConfigData globalData = box.getAt(0)!;
  return globalData;
});

final configDataFutureProvider = FutureProvider.autoDispose((ref) async {
  var box = Hive.box<UserConfigData>(Constants.userConfig);
  UserConfigData globalData = box.getAt(0)!;
  var globalBox = Hive.box<GlobalConfigData>(Constants.globalConfig);
  GlobalConfigData gData = globalBox.getAt(0)!;
  Map<String, dynamic> data = {
    Constants.userConfig: globalData,
    Constants.globalConfig: gData,
  };
  return data;
});
