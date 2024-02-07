import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/withdrawal/withdraw_payment_interface_state_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/local_load/load_state.dart';
import 'package:user_app/domain/wallet/fiat_recipient.dart';
import 'package:user_app/domain/wallet/recipient.dart';
import 'package:user_app/infrastructure/withdraw/__generated__/create_recipient_request.data.gql.dart';
import 'package:user_app/infrastructure/withdraw/withdraw_service.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/components/main_decoration_container_web.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class CreateRecipientForm extends StatefulHookConsumerWidget {
  const CreateRecipientForm({
    required this.listFiatRecipientData,
    required this.paymentInterfaceId,
    required this.walletId,
    super.key,
  });

  final List<FiatRecipientItem> listFiatRecipientData;
  final String paymentInterfaceId;
  final String walletId;

  @override
  ConsumerState<CreateRecipientForm> createState() =>
      _CreateRecipientFormState();
}

class _CreateRecipientFormState extends ConsumerState<CreateRecipientForm> {
  bool isEmptyOption = false;
  Map<dynamic, dynamic>? recipientReqSchema = {};
  String? selectedOption;
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final loaderState = useState(LoadState.notLoading);

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
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -1.sp,
                    ),
              ),
            ),
            //If it's last item, we will not add Divider after it.
            if (item != options.last)
              DropdownMenuItem<String>(
                enabled: false,
                child: Divider(
                  height: 2.h,
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
          itemsHeights.add(55.h);
        }
        //Dividers indexes will be the odd indexes
        if (i.isOdd) {
          itemsHeights.add(2.h);
        }
      }
      return itemsHeights;
    }

    return MainDecorationContainerWeb(
      content: SizedBox(
        width: 600.w,
        child: Padding(
          padding: EdgeInsets.only(
            left: 25.w,
            right: 25.w,
            top: 30.h,
            bottom: 50.h,
          ),
          child: Column(
            children: [
              Text(
                'Add ${widget.walletId.toUpperCase()} Recipient'.hardcoded,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1.5.sp,
                    ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: descriptionController,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        } else {
                          return '';
                        }
                      },
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        floatingLabelAlignment: FloatingLabelAlignment.center,
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
                            width: 5.h,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: isLightTheme(context)
                                ? AppColors.mainBackgroundLightColor
                                : AppColors.whiteColor.withOpacity(0.25),
                            width: 5.h,
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: MainColorsApp.redColor,
                            width: 5.h,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: isLightTheme(context)
                                ? AppColors.mainBackgroundLightColor
                                : AppColors.whiteColor.withOpacity(0.25),
                            width: 5.h,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 11.w, bottom: 0.h, top: 0),
                        hintText: 'Description'.hardcoded,
                        hintStyle: TextStyle(
                          fontSize: 20.sp,
                          color: isLightTheme(context)
                              ? AppColors.aboutHeaderLight
                              : AppColors.whiteColor.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          letterSpacing: -1.sp,
                        ),
                        isCollapsed: false,
                      ),
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                        letterSpacing: -1.sp,
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: widget.listFiatRecipientData.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 25.h,
                      ),
                      itemBuilder: (context, i) {
                        var item = widget.listFiatRecipientData[i];

                        return item.options!.isEmpty
                            ? Column(
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.text,
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
                                    textAlign: TextAlign.left,
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
                                          width: 5.h,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: isLightTheme(context)
                                              ? AppColors
                                                  .mainBackgroundLightColor
                                              : AppColors.whiteColor
                                                  .withOpacity(0.25),
                                          width: 5.h,
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: MainColorsApp.redColor,
                                          width: 5.h,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: isLightTheme(context)
                                              ? AppColors
                                                  .mainBackgroundLightColor
                                              : AppColors.whiteColor
                                                  .withOpacity(0.25),
                                          width: 5.h,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.only(
                                          left: 11.w, bottom: 0.h, top: 0),
                                      hintText: item.label,
                                      hintStyle: TextStyle(
                                        fontSize: 20.sp,
                                        color: isLightTheme(context)
                                            ? AppColors.aboutHeaderLight
                                            : AppColors.whiteColor
                                                .withOpacity(0.5),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Inter',
                                        letterSpacing: -1.sp,
                                      ),
                                      isCollapsed: false,
                                    ),
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Inter',
                                      letterSpacing: -1.5.sp,
                                    ),
                                  ),
                                ],
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
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -1.sp,
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
                                          : AppColors.mainBackgroundDarkColor,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    offset: Offset(0, 80.h),
                                  ),
                                  buttonStyleData: ButtonStyleData(
                                    width: double.infinity,
                                    height: 70.h,
                                    padding: EdgeInsets.only(left: 11.w),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 5.h,
                                          color: isEmptyOption
                                              ? MainColorsApp.redColor
                                              : isLightTheme(context)
                                                  ? AppColors
                                                      .mainBackgroundLightColor
                                                  : AppColors.whiteColor
                                                      .withOpacity(0.25),
                                        ),
                                      ),
                                    ),
                                  ),
                                  menuItemStyleData: MenuItemStyleData(
                                    customHeights:
                                        getCustomItemsHeights(item.options!),
                                    padding: EdgeInsets.only(
                                      left: 25.w,
                                      right: 25.w,
                                    ),
                                  ),
                                  items: addDividersAfterItems(item.options!),
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
                height: 50.h,
              ),
              loaderState.value == LoadState.loading
                  ? const CircularProgressIndicator()
                  : MainButton(
                      disableColor: MainColorsApp.accentColor.withOpacity(0.5),
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
                              clipBehavior: Clip.none,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                titleFontSize: 30.sp,
                                messageFontSize: 20.sp,
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
                                .read(withdrawPaymentInterfaceNotifierProvider
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
                              clipBehavior: Clip.none,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                titleFontSize: 30.sp,
                                messageFontSize: 20.sp,
                                title: tr('snack_bar_message.success.success'),
                                message:
                                    'Recipient created successfully'.hardcoded,
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
                      height: 60.h,
                      color: Theme.of(context).primaryColorLight,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
