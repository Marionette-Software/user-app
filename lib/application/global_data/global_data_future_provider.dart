import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';

final globalDataFutureProvider = FutureProvider.autoDispose((ref) async {
  var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
  GlobalConfigData globalData = box.getAt(0)!;
  return globalData;
});
