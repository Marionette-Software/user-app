import 'package:easy_localization/easy_localization.dart';
import 'package:hive/hive.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';

class FilterOperation {
  String name;
  String id;
  bool isSelected;
  FilterOperation({
    required this.name,
    required this.id,
    required this.isSelected,
  });
}

var box = Hive.box<GlobalConfigData>(Constants.globalConfig);
GlobalConfigData globalData = box.getAt(0)!;

List<FilterOperation> historyArrayOperations = [
  FilterOperation(
    name: tr('history.deposit'),
    id: 'custodial_deposit|deposit',
    isSelected: false,
  ),
  FilterOperation(
    name: tr('history.withdraw'),
    id: 'custodial_withdrawal',
    isSelected: false,
  ),
  FilterOperation(
    name: tr('history.swap'),
    id: 'exchange',
    isSelected: false,
  ),
  if (globalData.withTradingBalance)
    FilterOperation(
      name: tr('history.balance_transfer'),
      id: 'move_to_advanced|move_from_advanced',
      isSelected: false,
    ),
  if (globalData.enabledTradingPage)
    FilterOperation(
      name: tr('history.trade'),
      id: 'trading',
      isSelected: false,
    ),
  if (globalData.enabledStaking)
    FilterOperation(
      name: 'Staking',
      id: 'staking_rewards',
      isSelected: false,
    ),
  if (globalData.enabledReferrals)
    FilterOperation(
      name: 'Referral',
      id: 'deposit_reward|trade_reward',
      isSelected: false,
    ),
];
