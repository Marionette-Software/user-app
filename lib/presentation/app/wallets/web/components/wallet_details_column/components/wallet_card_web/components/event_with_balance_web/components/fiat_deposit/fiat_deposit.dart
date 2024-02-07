import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class FiatDepositWeb extends StatelessWidget {
  const FiatDepositWeb({
    required this.fiatWalletDetails,
    required this.walletName,
    super.key,
  });

  final Map<String, dynamic> fiatWalletDetails;
  final String walletName;

  @override
  Widget build(BuildContext context) {
    List<FiatWalletItem> listFiatWalletDetails = [];

    fiatWalletDetails.forEach(
      (key, value) {
        listFiatWalletDetails.add(
          FiatWalletItem(key: key, value: value),
        );
      },
    );

    Widget horizontalLine() {
      return Padding(
        padding: EdgeInsets.only(
          bottom: 15.h,
          top: 15.h,
        ),
        child: Container(
          width: 430.w,
          height: 2.h,
          color: isLightTheme(context)
              ? AppColors.mainBackgroundLightColor
              : AppColors.whiteColor.withOpacity(0.05),
        ),
      );
    }

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 600.w,
        child: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            bottom: 50.h,
            left: 25.w,
            right: 25.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Instructions for ${walletName.toUpperCase()} Deposit',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: isLightTheme(context)
                          ? AppColors.darkColorText
                          : AppColors.whiteColor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1.5.sp,
                    ),
              ),
              SizedBox(
                height: 25.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: listFiatWalletDetails.length,
                separatorBuilder: (context, index) => horizontalLine(),
                itemBuilder: (context, i) {
                  FiatWalletItem item = listFiatWalletDetails[i];
                  return Row(
                    children: [
                      Text(
                        capitalize(item.key),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(0.5),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -1.sp,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        item.value,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -1.sp,
                            ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Tooltip(
                        message: 'Copy to clipboard'.hardcoded,
                        child: InkWell(
                          onTap: () {
                            Clipboard.setData(
                              ClipboardData(
                                text: item.value,
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
                                message:
                                    '${tr('snack_bar_message.success.copied')} ${capitalize(item.key)}',
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
                            size: 25.w,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FiatWalletItem extends Equatable {
  const FiatWalletItem({required this.value, required this.key});

  final String value;
  final String key;

  @override
  List<Object> get props => [value, key];
}
