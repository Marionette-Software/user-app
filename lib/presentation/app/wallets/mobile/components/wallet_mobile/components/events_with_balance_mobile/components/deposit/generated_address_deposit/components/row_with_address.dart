import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/generate_deposit_address_srare_notifier_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/presentation/components/user_app_image.dart';
import 'package:user_app/presentation/constants/colors.dart';

class RowWithAddressMobile extends HookConsumerWidget {
  const RowWithAddressMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(walletDataStateNotifierProvider);
    final generateDepositAddressWatch =
        ref.watch(generateDepositAddressStateNotifierProvider);

    return Row(
      children: [
        UserAppImage(
          clipBehavior: Clip.hardEdge,
          path: walletData.iconUrl,
          width: 28.w,
          height: 28..h,
          isNetwork: true,
        ),
        SizedBox(
          width: 11.w,
        ),
        Flexible(
          child: Text(
            generateDepositAddressWatch.deposit!.encodedAddress!.isEmpty
                ? '${generateDepositAddressWatch.deposit!.address!.replaceRange(11, generateDepositAddressWatch.deposit!.address!.length - 11, '......')} '
                : '${generateDepositAddressWatch.deposit!.address!.split(': ')[1].replaceRange(11, generateDepositAddressWatch.deposit!.address!.split(': ')[1].length - 11, '......')} ',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: -1.sp,
            ),
          ),
        ),
        SizedBox(
          width: 13.w,
        ),
        InkWell(
          onTap: () {
            Clipboard.setData(
              ClipboardData(
                text:
                    generateDepositAddressWatch.deposit!.encodedAddress!.isEmpty
                        ? generateDepositAddressWatch.deposit!.address!
                        : generateDepositAddressWatch.deposit!.address!
                            .split(': ')[1],
              ),
            );
            final snackBar = SnackBar(
              elevation: 0,
              clipBehavior: Clip.none,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.only(
                bottom:
                    // ignore: use_build_context_synchronously
                    MediaQuery.viewInsetsOf(context).bottom + 30
                      ..h,
              ),
              content: AwesomeSnackbarContent(
                titleFontSize: 20.sp,
                messageFontSize: 15.sp,
                title: tr('snack_bar_message.success.success'),
                message: tr('snack_bar_message.success.copied'),
                contentType: ContentType.success,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          },
          child: Icon(
            Icons.copy,
            size: 20.w,
            color: MainColorsApp.accentColor,
          ),
        )
      ],
    );
  }
}
