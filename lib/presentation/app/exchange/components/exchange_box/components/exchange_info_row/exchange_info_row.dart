import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_currency.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/exchange/components/exchange_box/components/exchange_info_row/components/exchange_info.dart';
import 'package:user_app/presentation/app/exchange/components/exchange_box/components/exchange_info_row/components/rewerse_button.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';

class ExchangeInfoRow extends StatelessWidget {
  const ExchangeInfoRow({
    super.key,
    required this.fromValueController,
    required this.toValueController,
    required this.data,
    this.platformType = PlatformTypeState.web,
  });

  final TextEditingController fromValueController;
  final TextEditingController toValueController;
  final List<NonCustodialCurrency> data;
  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 13.h,
        bottom: 13.h,
        left: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 25.w,
          tabletValue: 15.w,
          mobileValue: 10.w,
        ),
        right: getSizeFromPlatformType(
          platformType: platformType,
          webValue: 25.w,
          tabletValue: 15.w,
          mobileValue: 10.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ExchangeInfo(
            platformType: platformType,
          ),
          ReverseButton(
            platformType: platformType,
            fromValueController: fromValueController,
            toValueController: toValueController,
            data: data,
          ),
        ],
      ),
    );
  }
}
