import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/generate_deposit_address_srare_notifier_provider.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ContainerWithAddress extends HookConsumerWidget {
  const ContainerWithAddress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generateDepositAddressWatch =
        ref.watch(generateDepositAddressStateNotifierProvider);
    final walletWatch = ref.watch(walletDataStateNotifierProvider);

    return Column(
      children: [
        Text(
          'Copy address for ${'${walletWatch.id.toUpperCase()} (${generateDepositAddressWatch.paymentInterface!.subtitle!})'} deposit',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 15.sp,
                color: isLightTheme(context)
                    ? AppColors.aboutHeaderLight
                    : AppColors.whiteColor.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                letterSpacing: -0.75.sp,
              ),
        ),
        SizedBox(
          height: 25.h,
        ),
        Container(
          width: 550.w,
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: isLightTheme(context)
                ? AppColors.separatorLightTheme
                : AppColors.whiteColor.withOpacity(0.05),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 26.w,
              right: 32.w,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Tooltip(
                    message: generateDepositAddressWatch.deposit!.address!.split(': ')[1],
                    verticalOffset: -80.h,
                    child: SizedBox(
                      width: 449.w,
                      height: 30.h,
                      child: AutoSizeText(
                        generateDepositAddressWatch
                                .deposit!.encodedAddress!.isEmpty
                            ? '${generateDepositAddressWatch.deposit!.address!.replaceRange(14, generateDepositAddressWatch.deposit!.address!.length - 14, '......')} '
                            : '${generateDepositAddressWatch.deposit!.address!.split(': ')[1].replaceRange(14, generateDepositAddressWatch.deposit!.address!.split(': ')[1].length - 14, '......')} ',
                        maxLines: 1,
                        maxFontSize: 30,
                        minFontSize: 5,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1.5.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Tooltip(
                  message: 'Copy to clipboard'.hardcoded,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(
                            text: generateDepositAddressWatch
                                    .deposit!.encodedAddress!.isEmpty
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
                          content: AwesomeSnackbarContent(
                            titleFontSize: 30.sp,
                            messageFontSize: 20.sp,
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
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
