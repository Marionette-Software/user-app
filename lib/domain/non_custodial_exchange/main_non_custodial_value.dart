import 'package:user_app/domain/refresh/refresh_request.dart';

class MainNonCustodialValue {
  int? toCurrencyIndex;
  String? toAmount;
  int? fromCurrencyIndex;
  String? fromAmount;
  String? toCurrencyId;
  String? fromCurrencyId;

  MainNonCustodialValue({
    this.toCurrencyIndex,
    this.toAmount,
    this.fromCurrencyIndex,
    this.fromAmount,
    this.toCurrencyId,
    this.fromCurrencyId,
  });
}

class MainNonCustodialValueWithRefreshRequest {
  RefreshRequest? refreshRequest;
  MainNonCustodialValue? mainNonCustodialValue;

  MainNonCustodialValueWithRefreshRequest({
    this.mainNonCustodialValue,
    this.refreshRequest,
  });
}
