import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/wallets/wallet_data_state_norifier_provider.dart';
import 'package:user_app/application/withdrawal/withdraw_payment_interface_state_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/wallet/fiat_recipient.dart';
import 'package:user_app/domain/wallet/recipient.dart';
import 'package:user_app/infrastructure/withdraw/__generated__/create_recipient_request.data.gql.dart';
import 'package:user_app/infrastructure/withdraw/withdraw_service.dart';
import 'package:user_app/presentation/components/buttons_mobile.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';
import 'package:user_app/presentation/helpers/wallet_color_helper.dart';

class CreateRecipientFormMobile extends StatefulHookConsumerWidget {
  const CreateRecipientFormMobile({
    required this.listFiatRecipientData,
    required this.paymentInterfaceId,
    required this.walletId,
    super.key,
  });

  final List<FiatRecipientItem> listFiatRecipientData;
  final String paymentInterfaceId;
  final String walletId;

  @override
  ConsumerState<CreateRecipientFormMobile> createState() =>
      _CreateRecipientFormMobileState();
}

class _CreateRecipientFormMobileState
    extends ConsumerState<CreateRecipientFormMobile> {
  bool isEmptyOption = false;
  final formKey = GlobalKey<FormState>();
  Map<dynamic, dynamic>? recipientReqSchema = {};
  String? selectedOption;
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loaderState = useState(LoadState.notLoading);
    final walletData = ref.watch(walletDataStateNotifierProvider);

    List<DropdownMenuItem<String>> addDividersAfterItems(List options) {
      final List<DropdownMenuItem<String>> menuItems = [];
      for (final String item in options) {
        menuItems.addAll(
          [
            DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.75.sp,
                    ),
              ),
            ),
            //If it's last item, we will not add Divider after it.
            if (item != options.last)
              DropdownMenuItem<String>(
                enabled: false,
                child: Divider(
                  height: 2..h,
                  color: isLightTheme(context)
                      ? AppColors.aboutHeaderLight.withOpacity(0.25)
                      : AppColors.whiteColor.withOpacity(0.1),
                ),
              ),
          ],
        );
      }
      return menuItems;
    }

    List<double> getCustomItemsHeights(List options) {
      final List<double> itemsHeights = [];
      for (int i = 0; i < (options.length * 2) - 1; i++) {
        if (i.isEven) {
          itemsHeights.add(58..h);
        }
        //Dividers indexes will be the odd indexes
        if (i.isOdd) {
          itemsHeights.add(2..h);
        }
      }
      return itemsHeights;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: getWalletColor(
          walletData.lightBgColor1,
          walletData.darkBgColor1,
          isLightTheme(context),
        ),
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50..h),
          child: Padding(
            padding: EdgeInsets.only(
              top: 15..h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: BackButtonMobile(
                    onTap: () => context.pop(),
                  ),
                ),
                Text(
                  'Add ${widget.walletId.toUpperCase()} Recipient'.hardcoded,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                        letterSpacing: -0.75.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: 70.w,
                  height: 25..h,
                )
              ],
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 10..h,
          ),
          decoration: BoxDecoration(
            color: isLightTheme(context)
                ? AppColors.whiteColor
                : walletBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20..h,
                left: 15.w,
                right: 15.w,
                bottom: MediaQuery.of(context).viewInsets.bottom + 50
                  ..h,
              ),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: descriptionController,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            } else {
                              return '';
                            }
                          },
                          decoration: InputDecoration(
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
                            filled: false,
                            errorStyle: const TextStyle(
                              fontSize: 0,
                              height: 0,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: isLightTheme(context)
                                      ? AppColors.mainBackgroundLightColor
                                      : AppColors.whiteColor.withOpacity(0.25),
                                  width: 5..h),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: isLightTheme(context)
                                      ? AppColors.mainBackgroundLightColor
                                      : AppColors.whiteColor.withOpacity(0.25),
                                  width: 5..h),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MainColorsApp.redColor, width: 5..h),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: isLightTheme(context)
                                      ? AppColors.mainBackgroundLightColor
                                      : AppColors.whiteColor.withOpacity(0.25),
                                  width: 5..h),
                            ),
                            contentPadding: EdgeInsets.only(
                                left: 11.w, bottom: 14..h, top: 0),
                            hintText: 'Description'.hardcoded,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.75.sp,
                                    color: isLightTheme(context)
                                        ? AppColors.aboutHeaderLight
                                        : AppColors.whiteColor
                                            .withOpacity(0.5)),
                            isCollapsed: false,
                          ),
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                            letterSpacing: -0.75.sp,
                          ),
                        ),
                        SizedBox(
                          height: 30..h,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.listFiatRecipientData.length,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 30..h,
                          ),
                          itemBuilder: (context, i) {
                            var item = widget.listFiatRecipientData[i];

                            return item.options!.isEmpty
                                ? TextFormField(
                                    controller: item.controller,
                                    onChanged: (value) {
                                      recipientReqSchema![item.key] = value;
                                    },
                                    validator: (value) {
                                      if (value!.isNotEmpty) {
                                        return null;
                                      } else {
                                        return '';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      floatingLabelAlignment:
                                          FloatingLabelAlignment.center,
                                      filled: false,
                                      errorStyle: const TextStyle(
                                        fontSize: 0,
                                        height: 0,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: isLightTheme(context)
                                              ? AppColors
                                                  .mainBackgroundLightColor
                                              : AppColors.whiteColor
                                                  .withOpacity(0.25),
                                          width: 5..h,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: isLightTheme(context)
                                                ? AppColors
                                                    .mainBackgroundLightColor
                                                : AppColors.whiteColor
                                                    .withOpacity(0.25),
                                            width: 5..h),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MainColorsApp.redColor,
                                            width: 5..h),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: isLightTheme(context)
                                                ? AppColors
                                                    .mainBackgroundLightColor
                                                : AppColors.whiteColor
                                                    .withOpacity(0.25),
                                            width: 5..h),
                                      ),
                                      contentPadding: EdgeInsets.only(
                                          left: 11.w, bottom: 14..h, top: 0),
                                      hintText: item.label,
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -0.75.sp,
                                              color: isLightTheme(context)
                                                  ? AppColors.aboutHeaderLight
                                                  : AppColors.whiteColor
                                                      .withOpacity(0.5)),
                                      isCollapsed: false,
                                    ),
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Inter',
                                      letterSpacing: -0.75.sp,
                                    ),
                                  )
                                : DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isDense: true,
                                      isExpanded: true,
                                      hint: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Select account type'.hardcoded,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                color: isLightTheme(context)
                                                    ? AppColors.aboutHeaderLight
                                                    : AppColors.whiteColor
                                                        .withOpacity(0.5),
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.75.sp,
                                              ),
                                        ),
                                      ),
                                      value: selectedOption,
                                      iconStyleData: IconStyleData(
                                        icon: Padding(
                                          padding: EdgeInsets.only(right: 25.w),
                                          child: Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            color: Theme.of(context)
                                                .textTheme
                                                .headlineMedium!
                                                .color,
                                            size: 25.w,
                                          ),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                          color: isLightTheme(context)
                                              ? cardColor
                                              : Theme.of(context)
                                                  .inputDecorationTheme
                                                  .fillColor,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        offset: Offset(0, 70.h),
                                      ),
                                      buttonStyleData: ButtonStyleData(
                                        width: double.infinity,
                                        height: 62..h,
                                        padding: EdgeInsets.only(left: 11.w),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border(
                                              bottom: BorderSide(
                                            width: 5..h,
                                            color: isEmptyOption
                                                ? MainColorsApp.redColor
                                                : isLightTheme(context)
                                                    ? AppColors
                                                        .mainBackgroundLightColor
                                                    : AppColors.whiteColor
                                                        .withOpacity(0.25),
                                          )),
                                        ),
                                      ),
                                      menuItemStyleData: MenuItemStyleData(
                                        customHeights: getCustomItemsHeights(
                                            item.options!),
                                        padding: EdgeInsets.only(
                                          left: 25.w,
                                          right: 25.w,
                                        ),
                                      ),
                                      items:
                                          addDividersAfterItems(item.options!),
                                      onChanged: (value) {
                                        recipientReqSchema![item.key] = value;

                                        setState(
                                          () {
                                            selectedOption = value;
                                            value!.isNotEmpty
                                                ? isEmptyOption = false
                                                : isEmptyOption = true;
                                          },
                                        );
                                      },
                                    ),
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30..h,
                  ),
                  loaderState.value == LoadState.loading
                      ? const CircularProgressIndicator()
                      : MainButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              loaderState.value = LoadState.loading;
                              final IWithdrawService serviceWithdraw =
                                  WithdrawService();

                              var res = await serviceWithdraw.createRecipient(
                                paymentInterfaceId: widget.paymentInterfaceId,
                                currencyId: widget.walletId,
                                data: jsonEncode(recipientReqSchema),
                                description: descriptionController.text,
                              );

                              if (res is GraphQlError) {
                                final snackBar = SnackBar(
                                  elevation: 0,
                                  padding: EdgeInsets.only(
                                    bottom:
                                        // ignore: use_build_context_synchronously
                                        MediaQuery.viewInsetsOf(context)
                                                .bottom +
                                            30
                                          ..h,
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  clipBehavior: Clip.none,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    titleFontSize: 20.sp,
                                    messageFontSize: 15.sp,
                                    title: tr('snack_bar_message.errors.error'),
                                    message: res.message,
                                    contentType: ContentType.failure,
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);
                              } else if (res
                                  is GCreateRecipientData_createRecipient) {
                                ref
                                    .read(
                                        withdrawPaymentInterfaceNotifierProvider
                                            .notifier)
                                    .updateRecipientList(
                                      Recipient(
                                        id: res.id!,
                                        data: res.data,
                                        description: res.description,
                                      ),
                                    );
                                context.pop();

                                final snackBar = SnackBar(
                                  elevation: 0,
                                  padding: EdgeInsets.only(
                                    bottom:
                                        // ignore: use_build_context_synchronously
                                        MediaQuery.viewInsetsOf(context)
                                                .bottom +
                                            30
                                          ..h,
                                  ),
                                  clipBehavior: Clip.none,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    titleFontSize: 20.sp,
                                    messageFontSize: 15.sp,
                                    title:
                                        tr('snack_bar_message.success.success'),
                                    message: 'Recipient created successfully'
                                        .hardcoded,
                                    contentType: ContentType.success,
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);
                              }
                              loaderState.value = LoadState.notLoading;
                            }

                            if (selectedOption == null) {
                              setState(() {
                                isEmptyOption = true;
                              });
                            }
                          },
                          text: tr('wallet.submit'),
                          height: 45..h,
                          fontSize: 15,
                          borderRadius: 25,
                          disableColor:
                              MainColorsApp.accentColor.withOpacity(0.5),
                          color: Theme.of(context).primaryColorLight,
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
