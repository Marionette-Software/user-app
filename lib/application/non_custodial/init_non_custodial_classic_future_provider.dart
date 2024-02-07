import 'package:ferry/ferry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/non_custodial_exchange/init_non_custodial_exchange_classic_state.dart';
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial_classic.data.gql.dart';
import 'package:user_app/infrastructure/non_custodial_exchange/graphql/__generated__/init_non_custodial_classic.var.gql.dart';
import 'package:user_app/infrastructure/non_custodial_exchange/non_custodial_exchange_service.dart';

final initNonCustodialClassicFutureProvider = FutureProvider.autoDispose.family<
    OperationResponse<GInitNonCustodialClassicData,
        GInitNonCustodialClassicVars>,
    InitNonCustodialExchangeClassicState>(
  (ref, request) async {
    INonCustodialExchangeService service = NonCustodialExchangeService();

    OperationResponse<GInitNonCustodialClassicData,
            GInitNonCustodialClassicVars> response =
        await service.initNonCustodialExchangeClassic(request);

    return response;
  },
);
