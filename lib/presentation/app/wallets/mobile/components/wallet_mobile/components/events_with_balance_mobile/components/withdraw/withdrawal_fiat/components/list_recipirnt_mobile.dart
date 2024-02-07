import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/withdrawal/withdraw_payment_interface_state_provider.dart';
import 'package:user_app/domain/general/extensions.dart';
import 'package:user_app/domain/graphql/local/graphql_error.dart';
import 'package:user_app/domain/wallet/recipient.dart';
import 'package:user_app/infrastructure/withdraw/withdraw_service.dart';
import 'package:user_app/presentation/components/main_button.dart';
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ListRecipientMobile extends StatefulHookConsumerWidget {
  const ListRecipientMobile({
    required this.selectedRecipient,
    super.key,
  });

  final ValueNotifier<Recipient> selectedRecipient;

  @override
  ConsumerState<ListRecipientMobile> createState() =>
      _ListRecipientMobileState();
}

class _ListRecipientMobileState extends ConsumerState<ListRecipientMobile> {
  @override
  void initState() {
    super.initState();
  }

  bool confirmDelete = false;
  @override
  Widget build(BuildContext context) {
    List<Recipient> recipients =
        ref.watch(withdrawPaymentInterfaceNotifierProvider).recipients;
    final paymentInterfaceRead =
        ref.read(withdrawPaymentInterfaceNotifierProvider.notifier);

    final IWithdrawService serviceWithdraw = WithdrawService();

    Widget divider() {
      return Divider(
        height: 2..h,
        color: isLightTheme(context)
            ? AppColors.aboutHeaderLight.withOpacity(0.25)
            : AppColors.whiteColor.withOpacity(0.1),
      );
    }

    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: double.infinity,
            minWidth: double.infinity,
            maxHeight: 200..h,
            minHeight: 10,
          ),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: recipients.length,
            separatorBuilder: (context, index) => divider(),
            itemBuilder: (context, i) {
              var item = recipients[i];

              return InkWell(
                onTap: () {
                  widget.selectedRecipient.value = Recipient(
                    id: item.id,
                    data: item.data,
                    description: item.description,
                  );
                  context.pop();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15.w,
                    right: 15.w,
                  ),
                  child: SizedBox(
                    height: 63..h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Tooltip(
                          message: item.description!.length > 50
                              ? item.description!
                              : '',
                          child: SizedBox(
                            width: item.confirmDelete ? 130.w : 150.w,
                            child: Text(
                              item.description!,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.75.sp,
                                  ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: SvgPicture.asset(
                            dumpIcon,
                            width: 21.w,
                            height: 23..h,
                            colorFilter: ColorFilter.mode(
                              isLightTheme(context)
                                  ? const Color(0xFF646977)
                                  : AppColors.whiteColor.withOpacity(0.25),
                              BlendMode.srcIn,
                            ),
                          ),
                          onTap: () async {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  width: double.infinity,
                                  height: 303..h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.r),
                                      topRight: Radius.circular(20.r),
                                    ),
                                    color: isLightTheme(context)
                                        ? AppColors.whiteColor
                                        : walletBackgroundColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 10..h,
                                      left: 15.w,
                                      right: 15.w,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 60.w,
                                          height: 5..h,
                                          decoration: BoxDecoration(
                                            color: isLightTheme(context)
                                                ? AppColors.aboutHeaderLight
                                                : AppColors.whiteColor
                                                    .withOpacity(0.25),
                                            borderRadius:
                                                BorderRadius.circular(17.r),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20..h,
                                        ),
                                        Text(
                                          'Delete Recipient'
                                              .hardcoded
                                              .hardcoded,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Inter',
                                            letterSpacing: -1.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20..h,
                                        ),
                                        Text(
                                          'Please confirm if you want to\ndelete recipient'
                                              .hardcoded,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: isLightTheme(context)
                                                ? AppColors.aboutHeaderLight
                                                : AppColors.whiteColor
                                                    .withOpacity(0.5),
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Inter',
                                            letterSpacing: -0.75.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20..h,
                                        ),
                                        MainButton(
                                          onTap: () async {
                                            var res = await serviceWithdraw
                                                .deleteRecipient(
                                              id: item.id,
                                            );

                                            if (res is GraphQlError) {
                                              final snackBar = SnackBar(
                                                elevation: 0,
                                                padding: EdgeInsets.only(
                                                  bottom:
                                                      // ignore: use_build_context_synchronously
                                                      MediaQuery.viewInsetsOf(
                                                                  context)
                                                              .bottom +
                                                          30
                                                        ..h,
                                                ),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                clipBehavior: Clip.none,
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: AwesomeSnackbarContent(
                                                  titleFontSize: 20.sp,
                                                  messageFontSize: 15.sp,
                                                  title: tr(
                                                      'snack_bar_message.errors.error'),
                                                  message: res.message,
                                                  contentType:
                                                      ContentType.failure,
                                                ),
                                              );

                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(snackBar);
                                            } else {
                                              if (widget.selectedRecipient.value
                                                      .id ==
                                                  item.id) {
                                                widget.selectedRecipient.value =
                                                    Recipient(
                                                  id: '',
                                                  data: '',
                                                  description: '',
                                                  confirmDelete: false,
                                                );
                                              }
                                              final snackBar = SnackBar(
                                                elevation: 0,
                                                padding: EdgeInsets.only(
                                                  bottom:
                                                      // ignore: use_build_context_synchronously
                                                      MediaQuery.viewInsetsOf(
                                                                  context)
                                                              .bottom +
                                                          30
                                                        ..h,
                                                ),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                clipBehavior: Clip.none,
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: AwesomeSnackbarContent(
                                                  titleFontSize: 20.sp,
                                                  messageFontSize: 15.sp,
                                                  title: tr(
                                                      'snack_bar_message.success.success'),
                                                  message:
                                                      'Recipient deleted successfully'
                                                          .hardcoded,
                                                  contentType:
                                                      ContentType.success,
                                                ),
                                              );

                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(snackBar);

                                              setState(() {
                                                recipients =
                                                    List<Recipient>.from(
                                                        recipients)
                                                      ..remove(
                                                        recipients.firstWhere(
                                                          (element) =>
                                                              element.id ==
                                                              item.id,
                                                        ),
                                                      );
                                              });

                                              paymentInterfaceRead
                                                  .deleteRecipient(item.id);
                                              context.pop();
                                            }
                                          },
                                          text: 'Confirm'.hardcoded,
                                          height: 45..h,
                                          color: MainColorsApp.accentColor,
                                          borderRadius: 25,
                                          disableColor: MainColorsApp
                                              .accentColor
                                              .withOpacity(0.5),
                                          fontSize: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
