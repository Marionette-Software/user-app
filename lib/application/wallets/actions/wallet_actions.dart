import 'dart:convert';

import 'package:ferry/ferry.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/wallet/wallet_payment_interface.dart';
import 'package:user_app/domain/wallet/withdraw_payment_interface.dart';
import 'package:user_app/infrastructure/custodian_exchange/custodial_exchange_service.dart';
import 'package:user_app/infrastructure/move/move_funds_service.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_deposit_wallet_payment_interface.data.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_deposit_wallet_payment_interface.var.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_withdraw_wallet_payment_interface.data.gql.dart';
import 'package:user_app/infrastructure/wallet/graphql/__generated__/get_withdraw_wallet_payment_interface.var.gql.dart';
import 'package:user_app/infrastructure/wallet/wallet_service.dart';
import 'package:user_app/infrastructure/withdraw/__generated__/create_recipient_request.data.gql.dart';
import 'package:user_app/infrastructure/withdraw/withdraw_service.dart';

abstract class WalletActions {
  Future swap({
    required String currencyFrom,
    required String currencyTo,
    required double amount,
  });

  Future withdraw({
    required String paymentInterfaceId,
    required String currencyId,
    required String recipientData,
    required String code,
    required double amount,
  });

  Future moveToTrading({
    required double amount,
    required String currencyId,
  });

  Future moveFromTrading({
    required double amount,
    required String currencyId,
  });

  Future generateDepositAddress({
    required String currencyId,
    required String paymentInterfaceId,
  });

  Future getWithdrawWalletPaymentInterface({
    required String currencyId,
  });

  Future getDepositWalletPaymentInterface({
    required String currencyId,
  });
}

class WalletActionsGeneral extends WalletActions {
  final CustodialExchangeService custodialExchangeService =
      CustodialExchangeService();
  final IWithdrawService serviceWithdraw = WithdrawService();
  final IWalletService walletWithdraw = WalletService();

  @override
  Future swap({
    required String currencyFrom,
    required String currencyTo,
    required double amount,
  }) async {
    return await custodialExchangeService.custodialExchange(
      currencyFrom: currencyFrom,
      currencyTo: currencyTo,
      amount: amount,
    );
  }

  @override
  Future withdraw({
    required String paymentInterfaceId,
    required String currencyId,
    required String recipientData,
    required String code,
    required double amount,
  }) async {
    var responseCreateBeneficiary = await serviceWithdraw.createRecipient(
      paymentInterfaceId: paymentInterfaceId,
      currencyId: currencyId,
      data: recipientData,
      description: '',
    );
    if (responseCreateBeneficiary is GraphQlError) {
      return responseCreateBeneficiary;
    } else if (responseCreateBeneficiary
        is GCreateRecipientData_createRecipient) {
      var responseCreateWithdraw = await serviceWithdraw.createWithdraw(
        code: code,
        recipientId: responseCreateBeneficiary.id!,
        amount: amount,
      );

      if (responseCreateWithdraw is GraphQlError) {
        return responseCreateWithdraw;
      } else {
        return responseCreateWithdraw;
      }
    }
  }

  @override
  Future moveToTrading({
    required double amount,
    required String currencyId,
  }) async {
    return await MoveToTradingService().moveToTradingFunds(
      amount: amount,
      currencyId: currencyId,
    );
  }

  @override
  Future moveFromTrading({
    required double amount,
    required String currencyId,
  }) async {
    return await MoveFromTradingService().moveFromTradingFunds(
      currencyId: currencyId,
      amount: amount,
    );
  }

  @override
  Future generateDepositAddress({
    required String currencyId,
    required String paymentInterfaceId,
  }) async {
    return await walletWithdraw.generateDepositAddress(
      currencyId: currencyId,
      paymentInterfaceId: paymentInterfaceId,
    );
  }

  @override
  Future getWithdrawWalletPaymentInterface({
    required String currencyId,
  }) async {
    var res = await walletWithdraw.getWithdrawWalletPaymentInterface(
      currencyId: currencyId,
    );

    if (res is GraphQlError) {
      return res.message;
    } else if (res is OperationResponse<GGetWithdrawWalletPaymentInterfaceData,
        GGetWithdrawWalletPaymentInterfaceVars>) {
      final jsonData =
          jsonEncode(res.data!.currency!.withdrawPaymentInterfaces!.toList());
      Iterable data = json.decode(jsonData);

      return List<WithdrawPaymentInterface>.from(
        data.map(
          (model) => WithdrawPaymentInterface.fromJson(model),
        ),
      );
    }
  }

  @override
  Future getDepositWalletPaymentInterface({
    required String currencyId,
  }) async {
    var res = await walletWithdraw.getDepositWalletPaymentInterface(
      currencyId: currencyId,
    );

    if (res is GraphQlError) {
      return res.message;
    } else if (res is OperationResponse<GGetDepositWalletPaymentInterfaceData,
        GGetDepositWalletPaymentInterfaceVars>) {
      final jsonData =
          jsonEncode(res.data!.currency!.currencyPaymentInterfaces!.toList());
      Iterable data = json.decode(jsonData);

      return List<WalletPaymentInterface>.from(
        data.map(
          (model) => WalletPaymentInterface.fromJson(model),
        ),
      );
    }
  }
}
