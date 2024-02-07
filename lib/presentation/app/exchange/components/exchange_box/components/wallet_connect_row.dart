import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class WalletConnectRow extends HookConsumerWidget {
  const WalletConnectRow({
    required this.platformType,
    Key? key,
  }) : super(key: key);

  final PlatformTypeState platformType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> pi = ['Ethereum'];

    return Padding(
      padding: EdgeInsets.only(
        top: 20.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 264.w,
              tabletValue: 205.w,
              mobileValue: 130.w,
            ),
            height: getSizeFromPlatformType(
              platformType: platformType,
              webValue: 60.h,
              tabletValue: 45.h,
              mobileValue: 35.h,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: 18,
                    ),
                hint: Text(
                  tr('non_custodial_exchange.select_network'),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 18,
                      ),
                  textAlign: TextAlign.center,
                ),
                items: pi
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item.toString(),
                        child: const Text(
                          'Ethereum',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                value: 'Ethereum',
                onChanged: (value) {},
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getSizeFromPlatformType(
                platformType: platformType,
                webValue: 10,
                tabletValue: 10,
                mobileValue: 6,
              )),
              border: Border.all(
                color: isLightTheme(context)
                    ? Colors.transparent
                    : Theme.of(context).primaryColor.withOpacity(0.25),
              ),
            ),
            child: SizedBox(
              width: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 264.w,
                tabletValue: 205.w,
                mobileValue: 130.w,
              ),
              height: getSizeFromPlatformType(
                platformType: platformType,
                webValue: 60.h,
                tabletValue: 45.h,
                mobileValue: 35.h,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    isLightTheme(context) ? cardColor : Colors.transparent,
                  ),
                ),
                onPressed: () async {
                  // final response = await service.connectToWC();
                  // if (response is GraphQlError) {
                  //   showSnackBar(
                  //     context: context,
                  //     title: tr('exception.error'),
                  //     message: response.message,
                  //     alignment: Alignment.bottomCenter,
                  //     isError: true,
                  //   );
                  // } else {
                  //   currencyStateRead.updateWCAddress(response);
                  //   Navigator.of(context).pushReplacementNamed(
                  //       NonCustodialExchangeWeb.routeName);
                  // }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      walletConnect,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.srcIn,
                      ),
                      width: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 34.w,
                        tabletValue: 30.w,
                        mobileValue: 17.w,
                      ),
                      height: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 22.h,
                        tabletValue: 18.h,
                        mobileValue: 11.h,
                      ),
                    ),
                    SizedBox(
                      width: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 10.w,
                        tabletValue: 10.w,
                        mobileValue: 3.w,
                      ),
                    ),
                    SizedBox(
                      height: getSizeFromPlatformType(
                        platformType: platformType,
                        webValue: 24.h,
                        tabletValue: 18.h,
                        mobileValue: 16.h,
                      ),
                      child: AutoSizeText(
                        'WalletConnect',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: getSizeFromPlatformType(
                                    platformType: platformType,
                                    webValue: 18,
                                    tabletValue: 15.w,
                                    mobileValue: 13.w,
                                  ),
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
