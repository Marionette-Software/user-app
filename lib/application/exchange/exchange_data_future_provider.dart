import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/infrastructure/exchange/exchange_service.dart';

final exchangeDataFutureProvider = FutureProvider.autoDispose((ref) async {
  IExchangeService service = ExchangeService();
  final userData = await service.getCurrencies();

  return userData;
});
