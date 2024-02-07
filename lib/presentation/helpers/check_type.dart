import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_history_by_wallet.data.gql.dart';
import 'package:user_app/presentation/constants/assets_path.dart';

Widget checkTypeIcoMobile(
  GGetUserHistoryByIdData_history_result item,
  Color colorAccent,
  Color colorPrimary,
  double hMultiplier,
  double wMultiplier,
  String walletId,
) {
  if (item.initiator_type == 'custodial_withdrawal') {
    return SvgPicture.asset(
      historySend,
      colorFilter: ColorFilter.mode(
        colorPrimary,
        BlendMode.srcIn,
      ),
      fit: BoxFit.contain,
      width: 7 * wMultiplier,
      height: 10 * hMultiplier,
    );
  } else if (item.initiator_type == 'custodial_deposit') {
    return SvgPicture.asset(
      historyDeposit,
      colorFilter: ColorFilter.mode(
        colorPrimary,
        BlendMode.srcIn,
      ),
      fit: BoxFit.contain,
      width: 12 * wMultiplier,
      height: 10 * hMultiplier,
    );
  } else if (item.initiator_type == 'move_to_advanced') {
    return SvgPicture.asset(
      transferIcon,
      colorFilter: ColorFilter.mode(
        colorPrimary,
        BlendMode.srcIn,
      ),
      fit: BoxFit.contain,
      width: 12 * wMultiplier,
      height: 10 * hMultiplier,
    );
  } else if (item.initiator_type == 'move_from_advanced') {
    return SvgPicture.asset(
      transferIcon,
      colorFilter: ColorFilter.mode(
        colorPrimary,
        BlendMode.srcIn,
      ),
      fit: BoxFit.contain,
      width: 12 * wMultiplier,
      height: 10 * hMultiplier,
    );
  } else if (item.result_currency!.id != null &&
      item.result_currency!.id == walletId) {
    return SvgPicture.asset(
      buyHistory,
      colorFilter: ColorFilter.mode(
        colorPrimary,
        BlendMode.srcIn,
      ),
      fit: BoxFit.contain,
      width: 12 * wMultiplier,
      height: 10 * hMultiplier,
    );
  } else {
    return SvgPicture.asset(
      sellHistory,
      colorFilter: ColorFilter.mode(
        colorPrimary,
        BlendMode.srcIn,
      ),
      fit: BoxFit.contain,
      width: 12 * wMultiplier,
      height: 10 * hMultiplier,
    );
  }
}

Widget checkTypeIcon(
  GGetUserHistoryByIdData_history_result item,
  Color colorAccent,
  Color colorPrimary,
  String walletId,
  PlatformTypeState platformType,
) {
  if (item.initiator_type == 'custodial_withdrawal') {
    return SvgPicture.asset(
      sendWalletIcon,
      allowDrawingOutsideViewBox: true,
      colorFilter: ColorFilter.mode(
        colorPrimary,
        BlendMode.srcIn,
      ),
      width: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 10 : 7))
          .w,
      height: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 12 : 8.5))
          .h,
    );
  } else if (item.initiator_type == 'deposit_reward' ||
      item.initiator_type == 'trade_reward') {
    return SvgPicture.asset(
      refRewardIcon,
      allowDrawingOutsideViewBox: true,
      colorFilter: ColorFilter.mode(
        colorPrimary,
        BlendMode.srcIn,
      ),
      width: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 8.6 : 6.2))
          .w,
      height: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 12.6 : 9))
          .h,
    );
  } else if (item.initiator_type == 'staking_rewards') {
    return SvgPicture.asset(
      stakeWalletIcon,
      allowDrawingOutsideViewBox: true,
      colorFilter: ColorFilter.mode(
        colorPrimary,
        BlendMode.srcIn,
      ),
      width: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 8.6 : 6.2))
          .w,
      height: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 12.6 : 9))
          .h,
    );
  } else if (item.initiator_type == 'custodial_deposit' ||
      item.initiator_type == 'deposit') {
    return SvgPicture.asset(
      receiveWalletIcon,
      allowDrawingOutsideViewBox: true,
      colorFilter: ColorFilter.mode(
        colorPrimary,
        BlendMode.srcIn,
      ),
      width: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 16.7 : 12))
          .w,
      height: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 13 : 9.2))
          .h,
    );
  } else if (item.initiator_type == 'move_to_advanced') {
    return SvgPicture.asset(
      transferIcon,
      allowDrawingOutsideViewBox: true,
      colorFilter: ColorFilter.mode(
        colorPrimary,
        BlendMode.srcIn,
      ),
      width: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 15.6 : 11))
          .w,
      height: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 13.2 : 9.4))
          .h,
    );
  } else if (item.initiator_type == 'move_from_advanced') {
    return SvgPicture.asset(
      transferIcon,
      allowDrawingOutsideViewBox: true,
      colorFilter: ColorFilter.mode(
        colorPrimary,
        BlendMode.srcIn,
      ),
      width: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 15.6 : 11))
          .w,
      height: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 13.2 : 9.4))
          .h,
    );
  } else if (item.result_currency!.id != null &&
      item.result_currency!.id == walletId) {
    return SvgPicture.asset(
      swapTab,
      allowDrawingOutsideViewBox: true,
      colorFilter: ColorFilter.mode(
        colorPrimary,
        BlendMode.srcIn,
      ),
      width: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 8.6 : 6.2))
          .w,
      height: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 12.6 : 9))
          .h,
    );
  } else {
    return SvgPicture.asset(
      swapTab,
      allowDrawingOutsideViewBox: true,
      colorFilter: ColorFilter.mode(
        colorPrimary,
        BlendMode.srcIn,
      ),
      width: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 8.6 : 6.2))
          .w,
      height: (platformType == PlatformTypeState.web
              ? 22
              : (platformType == PlatformTypeState.tablet ? 12.6 : 9))
          .h,
    );
  }
}

String checkType(GGetUserHistoryByIdData_history_result item, String walletId) {
  if (item.initiator_type == 'custodial_withdrawal') {
    return tr('wallet.withdrawal');
  } else if (item.initiator_type == 'deposit_reward' ||
      item.initiator_type == 'trade_reward') {
    return 'Referral reward';
  } else if (item.initiator_type == 'staking_rewards') {
    return 'Staking reward';
  } else if (item.initiator_type == 'custodial_deposit' ||
      item.initiator_type == 'deposit') {
    return tr('wallet.deposit');
  } else if (item.initiator_type == 'move_to_advanced') {
    return tr('wallet.transfer_to_advanced');
  } else if (item.initiator_type == 'move_from_advanced') {
    return tr('wallet.transfer_to_primary');
  } else if (item.result_currency!.id != null &&
      item.result_currency!.id == walletId) {
    return '${tr('wallet.buy')} ${item.result_currency!.id!.toUpperCase()} for ${item.initiator_currency!.id!.toUpperCase()}';
  } else if (item.result_currency!.id != null &&
      item.result_currency!.id != walletId) {
    return '${tr('wallet.sell')} ${item.initiator_currency!.id!.toUpperCase()} for ${item.result_currency!.id!.toUpperCase()}';
  } else {
    return '';
  }
}

String checkTypeOperations(
    GGetUserHistoryByIdData_history_result item, String walletId) {
  if (item.initiator_type == 'custodial_withdrawal') {
    return tr('wallet.withdrawal');
  } else if (item.initiator_type == 'deposit_reward' ||
      item.initiator_type == 'trade_reward') {
    return 'Referral reward'.hardcoded;
  } else if (item.initiator_type == 'staking_rewards') {
    return 'Staking reward'.hardcoded;
  } else if (item.initiator_type == 'custodial_deposit' ||
      item.initiator_type == 'deposit') {
    return tr('wallet.deposit');
  } else if (item.initiator_type == 'move_to_advanced') {
    return tr('wallet.transfer_to_advanced');
  } else if (item.initiator_type == 'move_from_advanced') {
    return tr('wallet.transfer_to_primary');
  } else if (item.result_currency!.id != null &&
      item.result_currency!.id == walletId) {
    return '+';
  } else if (item.result_currency!.id != null &&
      item.result_currency!.id != walletId) {
    return '-';
  } else {
    return '';
  }
}

String walletHistoryStatus(String value) {
  if (value == 'Payout' ||
      value == 'Split_Exchange' ||
      value == 'Collection_Prep' ||
      value == 'Incoming_Payment' ||
      value == 'Exchange') {
    return tr('wallet.processing');
  } else if (value == 'Collection_Canceled' ||
      value == 'Success' ||
      value == 'Payout_Success' ||
      value == 'Collection_Success' ||
      value == 'Exchange_Success' ||
      value == 'Move_To_Advanced_Success' ||
      value == 'Move_From_Advanced_Success') {
    return tr('wallet.success');
  } else if (value == 'Payout_Errored' ||
      value == 'Exchange_Canceled' ||
      value == 'Collection_Errored' ||
      value == 'Split_Exchange_Errored' ||
      value == 'Collection_Prep_Errored' ||
      value == 'Exchange_Errored' ||
      value == 'Incoming_Payment_Errored' ||
      value == 'Approve_Withdraw_Errored' ||
      value == 'Withdraw_Pending_Approval' ||
      value == 'Check_Withdraw_Payout_Amount_Errored' ||
      value == 'Check_Withdraw_Payout_Amount') {
    return tr('wallet.processing');
  } else if (value == 'Withdraw_Pending_Approval' ||
      value == 'Check_Withdraw_Payout_Amount_Errored') {
    return tr('wallet.admin_review');
  } else if (value == 'Rejected') {
    return tr('wallet.rejected');
  } else {
    return tr('wallet.unknown_status');
  }
}
