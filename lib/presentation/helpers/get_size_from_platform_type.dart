import 'package:user_app/domain/platform/platform_type_state.dart';

double getSizeFromPlatformType({
  required PlatformTypeState platformType,
  required double webValue,
  required double mobileValue,
  required double tabletValue,
}) {
  if (platformType == PlatformTypeState.web) {
    return webValue;
  } else if (platformType == PlatformTypeState.mobile) {
    return mobileValue;
  } else {
    return tabletValue;
  }
}
