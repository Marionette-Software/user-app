import 'package:user_app/infrastructure/two_fa/two_fa_service.dart';

abstract class TwoFaActions {
  Future getTwoFaStatus();
}

class TwoFaActionsGeneral extends TwoFaActions {
  final ITwoFaService serviceTwoFa = TwoFaService();

  @override
  Future getTwoFaStatus() async {
    return serviceTwoFa.getTwoFaStatus();
  }
}
