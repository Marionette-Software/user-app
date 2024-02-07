import 'package:user_app/domain/global_config/global_config_data.dart';

setErrorCode(String errorCode) async {
  GlobalConfigHelper.update(
    extensionCodeError: errorCode,
  );
}
