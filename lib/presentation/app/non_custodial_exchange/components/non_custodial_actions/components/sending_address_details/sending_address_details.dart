import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/sending_address_details/components/receive_container_details.dart';
import 'package:user_app/presentation/app/non_custodial_exchange/components/non_custodial_actions/components/sending_address_details/components/send_container_details.dart';

class SendingAddressDetails extends HookConsumerWidget {
  const SendingAddressDetails({
    required this.platformType,
    super.key,
  });

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ReceiveContainerDetails(
          platformType: platformType,
        ),
        SizedBox(
          height: 25.h,
        ),
        SendContainerDetails(
          platformType: platformType,
        )
      ],
    );
  }
}
