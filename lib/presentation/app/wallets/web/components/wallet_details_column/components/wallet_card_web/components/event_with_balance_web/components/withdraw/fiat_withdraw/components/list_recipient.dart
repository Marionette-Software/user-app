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
import 'package:user_app/presentation/constants/assets_path.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class ListRecipient extends StatefulHookConsumerWidget {
  const ListRecipient({
    required this.selectedRecipient,
    super.key,
  });

  final ValueNotifier<Recipient> selectedRecipient;

  @override
  ConsumerState<ListRecipient> createState() => _ListRecipientState();
}

class _ListRecipientState extends ConsumerState<ListRecipient> {
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
      return Padding(
        padding: EdgeInsets.only(
          left: 25.w,
          right: 25.w,
        ),
        child: Divider(
          height: 2.h,
          color: isLightTheme(context)
              ? AppColors.aboutHeaderLight.withOpacity(0.25)
              : AppColors.whiteColor.withOpacity(0.1),
        ),
      );
    }

    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 550.w,
            minWidth: 550.w,
            maxHeight: 280.0.h,
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
                    left: 25.w,
                    right: 25.w,
                  ),
                  child: SizedBox(
                    height: 55.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Tooltip(
                          message: item.description!.length > 50
                              ? item.description!
                              : '',
                          child: SizedBox(
                            width: item.confirmDelete ? 250.w : 350.w,
                            child: Text(
                              item.description!,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -1.sp,
                                  ),
                            ),
                          ),
                        ),
                        item.confirmDelete
                            ? Row(
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(49.r),
                                    onTap: () async {
                                      var res =
                                          await serviceWithdraw.deleteRecipient(
                                        id: item.id,
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
                                            title: tr(
                                                'snack_bar_message.errors.error'),
                                            message: res.message,
                                            contentType: ContentType.failure,
                                          ),
                                        );

                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(snackBar);
                                      } else {
                                        if (widget.selectedRecipient.value.id ==
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
                                          clipBehavior: Clip.none,
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            titleFontSize: 30.sp,
                                            messageFontSize: 20.sp,
                                            title: tr(
                                                'snack_bar_message.success.success'),
                                            message:
                                                'Recipient deleted successfully'
                                                    .hardcoded,
                                            contentType: ContentType.success,
                                          ),
                                        );

                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(snackBar);

                                        setState(() {
                                          recipients =
                                              List<Recipient>.from(recipients)
                                                ..remove(
                                                  recipients.firstWhere(
                                                    (element) =>
                                                        element.id == item.id,
                                                  ),
                                                );
                                        });

                                        paymentInterfaceRead
                                            .deleteRecipient(item.id);
                                      }
                                    },
                                    child: Container(
                                      width: 101.w,
                                      height: 44.h,
                                      decoration: BoxDecoration(
                                        color: isLightTheme(context)
                                            ? AppColors.whiteColor
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(49.r),
                                        border: Border.all(
                                          width: 2.w,
                                          color: MainColorsApp.redColor,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Delete'.hardcoded,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                fontSize: 20.sp,
                                                color: MainColorsApp.redColor,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Inter',
                                                letterSpacing: -1.sp,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(49.r),
                                    onTap: () {
                                      setState(() {
                                        recipients[i].confirmDelete = false;
                                      });
                                    },
                                    child: Container(
                                      width: 101.w,
                                      height: 44.h,
                                      decoration: BoxDecoration(
                                        color: isLightTheme(context)
                                            ? AppColors.whiteColor
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(49.r),
                                        border: Border.all(
                                          width: 2.w,
                                          color: isLightTheme(context)
                                              ? AppColors.aboutHeaderLight
                                              : AppColors.whiteColor
                                                  .withOpacity(0.1),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Cancel'.hardcoded,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                fontSize: 20.sp,
                                                color: isLightTheme(context)
                                                    ? AppColors.darkColorText
                                                    : AppColors.whiteColor
                                                        .withOpacity(0.5),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Inter',
                                                letterSpacing: -1.sp,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Tooltip(
                                message: 'Delete recipient'.hardcoded,
                                child: InkWell(
                                  child: SvgPicture.asset(
                                    dumpIcon,
                                    width: 21.w,
                                    height: 23.h,
                                    colorFilter: ColorFilter.mode(
                                      isLightTheme(context)
                                          ? const Color(0xFF646977)
                                          : AppColors.whiteColor
                                              .withOpacity(0.25),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  onTap: () async {
                                    setState(() {
                                      recipients[i].confirmDelete =
                                          !recipients[i].confirmDelete;
                                      confirmDelete = !confirmDelete;
                                    });
                                  },
                                ),
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
